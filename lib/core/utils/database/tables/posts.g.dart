// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// ignore_for_file: type=lint
class $PostsTableTable extends PostsTable
    with TableInfo<$PostsTableTable, PostsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _postMessageIdMeta =
      const VerificationMeta('postMessageId');
  @override
  late final GeneratedColumn<int> postMessageId = GeneratedColumn<int>(
      'post_message_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<int> author = GeneratedColumn<int>(
      'author', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxMembersMeta =
      const VerificationMeta('maxMembers');
  @override
  late final GeneratedColumn<int> maxMembers = GeneratedColumn<int>(
      'max_members', aliasedName, false,
      check: () => maxMembers.isBiggerThan(const Constant(0)),
      type: DriftSqlType.int,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      check: () => date.isBiggerThan(currentDateAndTime),
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true);
  static const VerificationMeta _timezoneMeta =
      const VerificationMeta('timezone');
  @override
  late final GeneratedColumn<int> timezone = GeneratedColumn<int>(
      'timezone', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        postMessageId,
        title,
        description,
        author,
        maxMembers,
        date,
        timezone,
        createdAt,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'posts_table';
  @override
  VerificationContext validateIntegrity(Insertable<PostsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('post_message_id')) {
      context.handle(
          _postMessageIdMeta,
          postMessageId.isAcceptableOrUnknown(
              data['post_message_id']!, _postMessageIdMeta));
    } else if (isInserting) {
      context.missing(_postMessageIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('max_members')) {
      context.handle(
          _maxMembersMeta,
          maxMembers.isAcceptableOrUnknown(
              data['max_members']!, _maxMembersMeta));
    } else if (isInserting) {
      context.missing(_maxMembersMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta));
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PostsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostsTableData(
      postMessageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}post_message_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author'])!,
      maxMembers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_members'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      timezone: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timezone'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $PostsTableTable createAlias(String alias) {
    return $PostsTableTable(attachedDatabase, alias);
  }
}

class PostsTableData extends DataClass implements Insertable<PostsTableData> {
  /// A integer column named `postMessageId`. This stores the messageID of the post.
  final int postMessageId;

  /// A text column named `title`. This stores the title of the post.
  final String title;

  /// A text column named `description`. This stores the description of the post.
  final String description;

  /// A integer column named `author`. This stores the author of the post.
  final int author;

  /// A integer column named `maxMembers`. This stores the max members of the post.
  final int maxMembers;

  /// A DateTime column named `date`. This stores the start date of the post.
  final DateTime date;

  /// A integer column named `timezone`. This stores the timezone of the post.
  final int timezone;

  /// A DateTime column named `createdAt`. This stores the creation date of the post.
  final DateTime createdAt;

  /// A bool column named `isDeleted`. This stores the deletion status of the post.
  final bool isDeleted;
  const PostsTableData(
      {required this.postMessageId,
      required this.title,
      required this.description,
      required this.author,
      required this.maxMembers,
      required this.date,
      required this.timezone,
      required this.createdAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['post_message_id'] = Variable<int>(postMessageId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['author'] = Variable<int>(author);
    map['max_members'] = Variable<int>(maxMembers);
    map['date'] = Variable<DateTime>(date);
    map['timezone'] = Variable<int>(timezone);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  PostsTableCompanion toCompanion(bool nullToAbsent) {
    return PostsTableCompanion(
      postMessageId: Value(postMessageId),
      title: Value(title),
      description: Value(description),
      author: Value(author),
      maxMembers: Value(maxMembers),
      date: Value(date),
      timezone: Value(timezone),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory PostsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostsTableData(
      postMessageId: serializer.fromJson<int>(json['postMessageId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      author: serializer.fromJson<int>(json['author']),
      maxMembers: serializer.fromJson<int>(json['maxMembers']),
      date: serializer.fromJson<DateTime>(json['date']),
      timezone: serializer.fromJson<int>(json['timezone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'postMessageId': serializer.toJson<int>(postMessageId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'author': serializer.toJson<int>(author),
      'maxMembers': serializer.toJson<int>(maxMembers),
      'date': serializer.toJson<DateTime>(date),
      'timezone': serializer.toJson<int>(timezone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  PostsTableData copyWith(
          {int? postMessageId,
          String? title,
          String? description,
          int? author,
          int? maxMembers,
          DateTime? date,
          int? timezone,
          DateTime? createdAt,
          bool? isDeleted}) =>
      PostsTableData(
        postMessageId: postMessageId ?? this.postMessageId,
        title: title ?? this.title,
        description: description ?? this.description,
        author: author ?? this.author,
        maxMembers: maxMembers ?? this.maxMembers,
        date: date ?? this.date,
        timezone: timezone ?? this.timezone,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  @override
  String toString() {
    return (StringBuffer('PostsTableData(')
          ..write('postMessageId: $postMessageId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('maxMembers: $maxMembers, ')
          ..write('date: $date, ')
          ..write('timezone: $timezone, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(postMessageId, title, description, author,
      maxMembers, date, timezone, createdAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostsTableData &&
          other.postMessageId == this.postMessageId &&
          other.title == this.title &&
          other.description == this.description &&
          other.author == this.author &&
          other.maxMembers == this.maxMembers &&
          other.date == this.date &&
          other.timezone == this.timezone &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted);
}

class PostsTableCompanion extends UpdateCompanion<PostsTableData> {
  final Value<int> postMessageId;
  final Value<String> title;
  final Value<String> description;
  final Value<int> author;
  final Value<int> maxMembers;
  final Value<DateTime> date;
  final Value<int> timezone;
  final Value<DateTime> createdAt;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const PostsTableCompanion({
    this.postMessageId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.maxMembers = const Value.absent(),
    this.date = const Value.absent(),
    this.timezone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PostsTableCompanion.insert({
    required int postMessageId,
    required String title,
    required String description,
    required int author,
    required int maxMembers,
    required DateTime date,
    required int timezone,
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : postMessageId = Value(postMessageId),
        title = Value(title),
        description = Value(description),
        author = Value(author),
        maxMembers = Value(maxMembers),
        date = Value(date),
        timezone = Value(timezone);
  static Insertable<PostsTableData> custom({
    Expression<int>? postMessageId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? author,
    Expression<int>? maxMembers,
    Expression<DateTime>? date,
    Expression<int>? timezone,
    Expression<DateTime>? createdAt,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (postMessageId != null) 'post_message_id': postMessageId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (author != null) 'author': author,
      if (maxMembers != null) 'max_members': maxMembers,
      if (date != null) 'date': date,
      if (timezone != null) 'timezone': timezone,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PostsTableCompanion copyWith(
      {Value<int>? postMessageId,
      Value<String>? title,
      Value<String>? description,
      Value<int>? author,
      Value<int>? maxMembers,
      Value<DateTime>? date,
      Value<int>? timezone,
      Value<DateTime>? createdAt,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return PostsTableCompanion(
      postMessageId: postMessageId ?? this.postMessageId,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      maxMembers: maxMembers ?? this.maxMembers,
      date: date ?? this.date,
      timezone: timezone ?? this.timezone,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (postMessageId.present) {
      map['post_message_id'] = Variable<int>(postMessageId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (author.present) {
      map['author'] = Variable<int>(author.value);
    }
    if (maxMembers.present) {
      map['max_members'] = Variable<int>(maxMembers.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<int>(timezone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostsTableCompanion(')
          ..write('postMessageId: $postMessageId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('maxMembers: $maxMembers, ')
          ..write('date: $date, ')
          ..write('timezone: $timezone, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MembersTableTable extends MembersTable
    with TableInfo<$MembersTableTable, MembersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _memberMeta = const VerificationMeta('member');
  @override
  late final GeneratedColumn<int> member = GeneratedColumn<int>(
      'member', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _postMeta = const VerificationMeta('post');
  @override
  late final GeneratedColumn<int> post = GeneratedColumn<int>(
      'post', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES posts_table (post_message_id) ON DELETE CASCADE'));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [member, post, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'members_table';
  @override
  VerificationContext validateIntegrity(Insertable<MembersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('member')) {
      context.handle(_memberMeta,
          member.isAcceptableOrUnknown(data['member']!, _memberMeta));
    } else if (isInserting) {
      context.missing(_memberMeta);
    }
    if (data.containsKey('post')) {
      context.handle(
          _postMeta, post.isAcceptableOrUnknown(data['post']!, _postMeta));
    } else if (isInserting) {
      context.missing(_postMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MembersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MembersTableData(
      member: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member'])!,
      post: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}post'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role']),
    );
  }

  @override
  $MembersTableTable createAlias(String alias) {
    return $MembersTableTable(attachedDatabase, alias);
  }
}

class MembersTableData extends DataClass
    implements Insertable<MembersTableData> {
  /// A text column named `member`. This stores the userID of the member.
  final int member;

  /// A text column named `post`. This stores the post related to the member.
  final int post;

  /// A text column named `role`. This stores the role of the member.
  final String? role;
  const MembersTableData({required this.member, required this.post, this.role});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['member'] = Variable<int>(member);
    map['post'] = Variable<int>(post);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    return map;
  }

  MembersTableCompanion toCompanion(bool nullToAbsent) {
    return MembersTableCompanion(
      member: Value(member),
      post: Value(post),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  factory MembersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MembersTableData(
      member: serializer.fromJson<int>(json['member']),
      post: serializer.fromJson<int>(json['post']),
      role: serializer.fromJson<String?>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'member': serializer.toJson<int>(member),
      'post': serializer.toJson<int>(post),
      'role': serializer.toJson<String?>(role),
    };
  }

  MembersTableData copyWith(
          {int? member,
          int? post,
          Value<String?> role = const Value.absent()}) =>
      MembersTableData(
        member: member ?? this.member,
        post: post ?? this.post,
        role: role.present ? role.value : this.role,
      );
  @override
  String toString() {
    return (StringBuffer('MembersTableData(')
          ..write('member: $member, ')
          ..write('post: $post, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(member, post, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MembersTableData &&
          other.member == this.member &&
          other.post == this.post &&
          other.role == this.role);
}

class MembersTableCompanion extends UpdateCompanion<MembersTableData> {
  final Value<int> member;
  final Value<int> post;
  final Value<String?> role;
  final Value<int> rowid;
  const MembersTableCompanion({
    this.member = const Value.absent(),
    this.post = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MembersTableCompanion.insert({
    required int member,
    required int post,
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : member = Value(member),
        post = Value(post);
  static Insertable<MembersTableData> custom({
    Expression<int>? member,
    Expression<int>? post,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (member != null) 'member': member,
      if (post != null) 'post': post,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MembersTableCompanion copyWith(
      {Value<int>? member,
      Value<int>? post,
      Value<String?>? role,
      Value<int>? rowid}) {
    return MembersTableCompanion(
      member: member ?? this.member,
      post: post ?? this.post,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (member.present) {
      map['member'] = Variable<int>(member.value);
    }
    if (post.present) {
      map['post'] = Variable<int>(post.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersTableCompanion(')
          ..write('member: $member, ')
          ..write('post: $post, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PostsDatabase extends GeneratedDatabase {
  _$PostsDatabase(QueryExecutor e) : super(e);
  _$PostsDatabaseManager get managers => _$PostsDatabaseManager(this);
  late final $PostsTableTable postsTable = $PostsTableTable(this);
  late final $MembersTableTable membersTable = $MembersTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [postsTable, membersTable];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('posts_table',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('members_table', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$PostsTableTableInsertCompanionBuilder = PostsTableCompanion Function({
  required int postMessageId,
  required String title,
  required String description,
  required int author,
  required int maxMembers,
  required DateTime date,
  required int timezone,
  Value<DateTime> createdAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$PostsTableTableUpdateCompanionBuilder = PostsTableCompanion Function({
  Value<int> postMessageId,
  Value<String> title,
  Value<String> description,
  Value<int> author,
  Value<int> maxMembers,
  Value<DateTime> date,
  Value<int> timezone,
  Value<DateTime> createdAt,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$PostsTableTableTableManager extends RootTableManager<
    _$PostsDatabase,
    $PostsTableTable,
    PostsTableData,
    $$PostsTableTableFilterComposer,
    $$PostsTableTableOrderingComposer,
    $$PostsTableTableProcessedTableManager,
    $$PostsTableTableInsertCompanionBuilder,
    $$PostsTableTableUpdateCompanionBuilder> {
  $$PostsTableTableTableManager(_$PostsDatabase db, $PostsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PostsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PostsTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PostsTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> postMessageId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> author = const Value.absent(),
            Value<int> maxMembers = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> timezone = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PostsTableCompanion(
            postMessageId: postMessageId,
            title: title,
            description: description,
            author: author,
            maxMembers: maxMembers,
            date: date,
            timezone: timezone,
            createdAt: createdAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int postMessageId,
            required String title,
            required String description,
            required int author,
            required int maxMembers,
            required DateTime date,
            required int timezone,
            Value<DateTime> createdAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PostsTableCompanion.insert(
            postMessageId: postMessageId,
            title: title,
            description: description,
            author: author,
            maxMembers: maxMembers,
            date: date,
            timezone: timezone,
            createdAt: createdAt,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
        ));
}

class $$PostsTableTableProcessedTableManager extends ProcessedTableManager<
    _$PostsDatabase,
    $PostsTableTable,
    PostsTableData,
    $$PostsTableTableFilterComposer,
    $$PostsTableTableOrderingComposer,
    $$PostsTableTableProcessedTableManager,
    $$PostsTableTableInsertCompanionBuilder,
    $$PostsTableTableUpdateCompanionBuilder> {
  $$PostsTableTableProcessedTableManager(super.$state);
}

class $$PostsTableTableFilterComposer
    extends FilterComposer<_$PostsDatabase, $PostsTableTable> {
  $$PostsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get postMessageId => $state.composableBuilder(
      column: $state.table.postMessageId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get maxMembers => $state.composableBuilder(
      column: $state.table.maxMembers,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timezone => $state.composableBuilder(
      column: $state.table.timezone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDeleted => $state.composableBuilder(
      column: $state.table.isDeleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter membersTableRefs(
      ComposableFilter Function($$MembersTableTableFilterComposer f) f) {
    final $$MembersTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.postMessageId,
        referencedTable: $state.db.membersTable,
        getReferencedColumn: (t) => t.post,
        builder: (joinBuilder, parentComposers) =>
            $$MembersTableTableFilterComposer(ComposerState($state.db,
                $state.db.membersTable, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PostsTableTableOrderingComposer
    extends OrderingComposer<_$PostsDatabase, $PostsTableTable> {
  $$PostsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get postMessageId => $state.composableBuilder(
      column: $state.table.postMessageId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get maxMembers => $state.composableBuilder(
      column: $state.table.maxMembers,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timezone => $state.composableBuilder(
      column: $state.table.timezone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDeleted => $state.composableBuilder(
      column: $state.table.isDeleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MembersTableTableInsertCompanionBuilder = MembersTableCompanion
    Function({
  required int member,
  required int post,
  Value<String?> role,
  Value<int> rowid,
});
typedef $$MembersTableTableUpdateCompanionBuilder = MembersTableCompanion
    Function({
  Value<int> member,
  Value<int> post,
  Value<String?> role,
  Value<int> rowid,
});

class $$MembersTableTableTableManager extends RootTableManager<
    _$PostsDatabase,
    $MembersTableTable,
    MembersTableData,
    $$MembersTableTableFilterComposer,
    $$MembersTableTableOrderingComposer,
    $$MembersTableTableProcessedTableManager,
    $$MembersTableTableInsertCompanionBuilder,
    $$MembersTableTableUpdateCompanionBuilder> {
  $$MembersTableTableTableManager(_$PostsDatabase db, $MembersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MembersTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MembersTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MembersTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> member = const Value.absent(),
            Value<int> post = const Value.absent(),
            Value<String?> role = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MembersTableCompanion(
            member: member,
            post: post,
            role: role,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int member,
            required int post,
            Value<String?> role = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MembersTableCompanion.insert(
            member: member,
            post: post,
            role: role,
            rowid: rowid,
          ),
        ));
}

class $$MembersTableTableProcessedTableManager extends ProcessedTableManager<
    _$PostsDatabase,
    $MembersTableTable,
    MembersTableData,
    $$MembersTableTableFilterComposer,
    $$MembersTableTableOrderingComposer,
    $$MembersTableTableProcessedTableManager,
    $$MembersTableTableInsertCompanionBuilder,
    $$MembersTableTableUpdateCompanionBuilder> {
  $$MembersTableTableProcessedTableManager(super.$state);
}

class $$MembersTableTableFilterComposer
    extends FilterComposer<_$PostsDatabase, $MembersTableTable> {
  $$MembersTableTableFilterComposer(super.$state);
  ColumnFilters<int> get member => $state.composableBuilder(
      column: $state.table.member,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PostsTableTableFilterComposer get post {
    final $$PostsTableTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.post,
        referencedTable: $state.db.postsTable,
        getReferencedColumn: (t) => t.postMessageId,
        builder: (joinBuilder, parentComposers) =>
            $$PostsTableTableFilterComposer(ComposerState($state.db,
                $state.db.postsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MembersTableTableOrderingComposer
    extends OrderingComposer<_$PostsDatabase, $MembersTableTable> {
  $$MembersTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get member => $state.composableBuilder(
      column: $state.table.member,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get role => $state.composableBuilder(
      column: $state.table.role,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PostsTableTableOrderingComposer get post {
    final $$PostsTableTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.post,
        referencedTable: $state.db.postsTable,
        getReferencedColumn: (t) => t.postMessageId,
        builder: (joinBuilder, parentComposers) =>
            $$PostsTableTableOrderingComposer(ComposerState($state.db,
                $state.db.postsTable, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$PostsDatabaseManager {
  final _$PostsDatabase _db;
  _$PostsDatabaseManager(this._db);
  $$PostsTableTableTableManager get postsTable =>
      $$PostsTableTableTableManager(_db, _db.postsTable);
  $$MembersTableTableTableManager get membersTable =>
      $$MembersTableTableTableManager(_db, _db.membersTable);
}
