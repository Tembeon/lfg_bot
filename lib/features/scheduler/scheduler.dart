import 'dart:async';

import 'package:collection/collection.dart';
import 'package:l/l.dart';
import 'package:nyxx/nyxx.dart';

import '../../core/utils/database/tables/posts.dart';
import '../../core/utils/services.dart';
import '../lfg_manager/lfg_manager.dart';

/// {@template PostScheduler}
///
/// Scheduler for LFG posts.
/// It is used to schedule notifications for members about LFG posts. \
/// It also schedules deletion of LFG posts after some time.
///
/// {@endtemplate}
final class PostScheduler {
  /// {@macro PostScheduler}
  PostScheduler({
    required final PostsDatabase database,
    required final NyxxGateway bot,
    required final LFGManager lfgManager,
  })  : _database = database,
        _bot = bot,
        _lfgManager = lfgManager {
    _restorePosts();
    _startScheduler();
  }

  /// Database used for storing LFG posts and members.
  final PostsDatabase _database;

  /// Core of the bot.
  final NyxxGateway _bot;

  /// LFG manager, used to manage LFG,
  final LFGManager _lfgManager;

  /// Map of all scheduled posts.
  ///
  /// Value is the date of the post. \
  /// Key is the ID of the post in database.
  final Map<int, DateTime> _posts = {};

  /// Timer used to check posts.
  Timer? _timer;

  /// Restores active posts from database to [_posts]. \
  /// If bot was restarted, it will restore all posts that were active before restart only
  /// if they are not older than 2 hours.
  ///
  /// Note: if members was notified about post before restarting, and discord post wasn't deleted,
  /// all members will be notified again and post will be scheduled to be deleted after 15 minutes regardless of time. \
  /// This is intended behavior.
  Future<void> _restorePosts() async {
    final now = DateTime.now();
    final posts = await _database.getAllPosts();
    for (final post in posts) {
      // skip post if difference between now and post time is more than 1 hour
      if (now.difference(post.date).inHours > 1) {
        l.i('[Scheduler] Schedule post with id ${post.postMessageId} will be deleted because it is too old');
        await _deleteLFGPostAfter(postID: post.postMessageId, duration: Duration.zero);
      }

      _posts[post.postMessageId] = post.date;
    }
  }

  /// Starts checking posts every 30 seconds.
  void _startScheduler() {
    _timer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => _checkPosts(),
    );
  }

  /// Checks if any post is ready to be posted.
  ///
  /// If post is ready, post members are notified and post is scheduled to be deleted. \
  /// Removes post from [_posts] if it is ready.
  void _checkPosts() {
    // skip if there are no posts
    if (_posts.isEmpty) {
      return;
    }

    final now = DateTime.now();
    l.i('[Scheduler] Checking posts...');

    final toDelete = <int>[];

    for (final post in _posts.entries) {
      if (post.value.isBefore(now)) {
        final postID = post.key;
        toDelete.add(postID);

        l.i('[Scheduler] Post with id $postID is ready to be posted');
        _notifyMembers(postID: postID);
      }
    }

    for (final postID in toDelete) {
      _posts.removeWhere((key, _) => key == postID);
    }

    l.i('[Scheduler] ${_posts.length} post(s) checked');
  }

  /// Notifies all members of post with [postID] that it is time to play.
  ///
  /// Schedules post to be deleted using [_deleteLFGPostAfter].
  Future<void> _notifyMembers({
    required final int postID,
  }) async {
    final post = await _database.findPost(postID);
    if (post == null) throw Exception('Cannot find post with id $postID');

    final members = await _database.getMembersForPost(postID);
    String? authorName;

    try {
      final authorMember = await _bot.guilds[Services.i.config.server].members.get(Snowflake(post.author));
      authorName = authorMember.nick ?? authorMember.user?.globalName ?? authorMember.user?.username;
    } on Object {
      authorName = null;
    }

    if (authorName == null) {
      final author = await _bot.users.get(Snowflake(post.author));
      authorName = author.globalName ?? author.username;
    }

    for (final member in members) {
      try {
        final dm = await _bot.users.createDm(Snowflake(member));
        l.i('[Scheduler] Notifying ${dm.recipient.username} about ${post.title}');

        await dm.sendMessage(
          MessageBuilder(
            content: 'Время сбора для ${post.title} от $authorName наступило!',
          ),
        );

        // wait 1 second to prevent rate limit
        await Future<void>.delayed(const Duration(seconds: 1));
      } on Object {
        l.w('[Scheduler] User with id $member is not available for DM');
        continue;
      }
    }

    l.i('[Scheduler] All members notified, scheduling deleting post with id $postID');
    await _deleteLFGPostAfter(postID: postID);
  }

  /// Deletes post after some [duration].
  ///
  /// It is used to prevent deleting post too early.
  Future<void> _deleteLFGPostAfter({
    final Duration duration = const Duration(minutes: 15),
    required final int postID,
  }) async =>
      Future<void>.delayed(duration, () => _lfgManager.delete(postID));

  /// Schedules post to be posted at [startTime].
  /// [postID] is ID of post in database.
  void schedulePost({
    required final DateTime startTime,
    required final int postID,
  }) {
    _posts[postID] = startTime;
    _checkPosts();
  }

  /// Cancels post with [postID].
  void cancelPost({
    required final int postID,
  }) {
    final post = _posts.entries.firstWhereOrNull((e) => e.key == postID);
    if (post == null) {
      l.i('[Scheduler] Post with id $postID was not found in scheduler, maybe it was already posted or stale');
      return;
    }
    final value = _posts.remove(post.key);

    if (value != null) {
      l.i('[Scheduler] Post with id $postID was removed from scheduler');
    } else {
      l.i('[Scheduler] Post with id $postID was not found in scheduler');
    }
  }

  /// Edits time of post with [postID] to [newTime].
  void editTime({
    required final int postID,
    required final DateTime newTime,
  }) {
    final post = _posts.entries.firstWhere((e) => e.key == postID);
    _posts.remove(post.key);
    _posts[postID] = newTime;
    _checkPosts();
  }

  /// Return quantity of scheduled posts
  int getScheduledPostsCount() {
    return _posts.length;
  }

  /// Disposes post scheduler and cancels all scheduled posts.
  void dispose() {
    _posts.clear();
    _timer?.cancel();
  }
}
