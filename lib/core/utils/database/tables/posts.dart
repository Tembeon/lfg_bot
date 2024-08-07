// ignore reason: this is how columns are defined in drift
// ignore_for_file: recursive_getters

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../../../const/command_exceptions.dart';
import '../../../data/models/activity_data.dart';
import '../../../data/models/taken_roles.dart';

part 'posts.g.dart';

/// `PostsTable` is a class that extends the `Table` class provided by the `drift` package.
/// It represents the structure of the `Posts` table in the database.
class PostsTable extends Table {
  /// A integer column named `postMessageId`. This stores the messageID of the post.
  IntColumn get postMessageId => integer().unique()();

  /// A text column named `title`. This stores the title of the post.
  TextColumn get title => text()();

  /// A text column named `description`. This stores the description of the post.
  TextColumn get description => text()();

  /// A integer column named `author`. This stores the author of the post.
  IntColumn get author => integer()();

  /// A integer column named `maxMembers`. This stores the max members of the post.
  IntColumn get maxMembers => integer().check(maxMembers.isBiggerThan(const Constant(0)))();

  /// A DateTime column named `date`. This stores the start date of the post.
  DateTimeColumn get date => dateTime().check(date.isBiggerThan(currentDateAndTime))();

  /// A integer column named `timezone`. This stores the timezone of the post.
  IntColumn get timezone => integer()();

  /// A DateTime column named `createdAt`. This stores the creation date of the post.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// A bool column named `isDeleted`. This stores the deletion status of the post.
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

/// Table that represents the many-to-many relationship between [PostsTable] and [MembersTable].
/// It is used to store the members of a post.
class MembersTable extends Table {
  /// A text column named `member`. This stores the userID of the member.
  IntColumn get member => integer()();

  /// A text column named `post`. This stores the post related to the member.
  IntColumn get post => integer().references(
        PostsTable,
        #postMessageId,
        onDelete: KeyAction.cascade,
      )();

  /// A text column named `role`. This stores the role of the member.
  TextColumn get role => text().nullable()();
}

@DriftDatabase(tables: [PostsTable, MembersTable])
class PostsDatabase extends _$PostsDatabase {
  PostsDatabase._internal() : super(_openConnection());

  factory PostsDatabase() => _instance;

  static final PostsDatabase _instance = PostsDatabase._internal();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  /// Inserts a new LFG info into the database.
  ///
  /// Returns the id of the inserted row.
  Future<int> insertPost(PostsTableCompanion post) => into(postsTable).insert(post);

  /// Finds a LFG info by its [id].
  ///
  /// Returns null, if no LFG info was found.
  Future<PostsTableData?> findPost(int id) =>
      (select(postsTable)..where((post) => post.postMessageId.equals(id))).getSingleOrNull();


  /// Adds a new member to a LFG.
  ///
  /// Checks if the LFG is full, if it is, it throws an error.
  Future<int> addMember(int postID, int memberID, {String? role}) async {
    final post = await findPost(postID);
    if (post == null) throw Exception('Post with id $postID not found');

    final members = await getMembersForPost(postID);
    if (members.length >= post.maxMembers) {
      throw const TooManyPlayersException();
    }

    return into(membersTable).insert(
      MembersTableCompanion.insert(
        post: postID,
        member: memberID,
        role: Value(role),
      ),
    );
  }

  /// Removes a member from a LFG.
  ///
  /// Returns the number of rows deleted.
  Future<int> removeMember(int postID, int memberID) {
    return (delete(membersTable)
          ..where(
            (member) => member.post.equals(postID) & member.member.equals(memberID),
          ))
        .go();
  }

  /// Returns a list of members of a LFG.
  Future<List<int>> getMembersForPost(int postID) async {
    final members = await (select(membersTable)..where((member) => member.post.equals(postID))).get();
    return members.map((e) => e.member).toList();
  }

  Future<List<MembersTableData>> getRawMembersForPost(int postID) async {
    return (select(membersTable)..where((member) => member.post.equals(postID))).get();
  }

  /// Returns a list of all active LFGs.
  Future<List<PostsTableData>> getAllPosts() =>
      (select(postsTable)..where((post) => post.isDeleted.equals(false))).get();

  /// Returns a int of all LFGs.
  Future<int?> getAllPostsCount() async {
    final countExpression = postsTable.postMessageId.count();
    final query = selectOnly(postsTable)..addColumns([countExpression]);
    final result = await query.map((row) => row.read(countExpression)).getSingle();
    return result;
  }

  /// Marks a LFG as deleted.
  Future<int> deletePost(int postID) {
    return (update(postsTable)..where((post) => post.postMessageId.equals(postID)))
        .write(const PostsTableCompanion(isDeleted: Value(true)));
  }

  Future<int> updatePost(int postID, PostsTableCompanion post) {
    return (update(postsTable)..where((post) => post.postMessageId.equals(postID))).write(post);
  }

  /// Returns map of taken roles.
  ///
  /// * key is a role name \
  /// * value is how much this role is taken in this Activity
  Future<List<TakenRoles>> getAllTakenRoles({
    required ActivityData activity,
    required int id,
  }) async {
    // шаги работы:
    // 1. найти активность и все роли, привязанные к ней. это будет список всех ролей. этот список также содержит максимальное кол-во игроков для каждой роли
    // 2. получить всех участников этой активности и их роли (если у активности есть роль, то у всех участников тоже должна быть роль)
    // 3. конвертировать результат в список TakenRoles

    final roles = activity.roles ?? (throw const FormatException('Activity has no roles'));

    final members = await (select(membersTable)..where((member) => member.post.equals(id))).get();

    final takenRoles = <TakenRoles>[];

    for (final role in roles) {
      final roleMembers = members.where((member) => member.role == role.role).toList();
      takenRoles.add(TakenRoles(role: role.role, taken: roleMembers.length, total: role.quantity));
    }

    return takenRoles;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File('data/db/posts.sqlite');

    return NativeDatabase.createInBackground(file);
  });
}
