/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class TeamMember extends _i1.TableRow {
  TeamMember._({
    int? id,
    required this.memberId,
    required this.name,
    required this.role,
    required this.categoryTag,
    required this.category,
    required this.academicCredential,
    required this.areaOfExpertise,
    this.imageUrl,
    required this.displayOrder,
  }) : super(id);

  factory TeamMember({
    int? id,
    required String memberId,
    required String name,
    required String role,
    required String categoryTag,
    required String category,
    required String academicCredential,
    required String areaOfExpertise,
    String? imageUrl,
    required int displayOrder,
  }) = _TeamMemberImpl;

  factory TeamMember.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TeamMember(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      memberId: serializationManager
          .deserialize<String>(jsonSerialization['memberId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      role: serializationManager.deserialize<String>(jsonSerialization['role']),
      categoryTag: serializationManager
          .deserialize<String>(jsonSerialization['categoryTag']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      academicCredential: serializationManager
          .deserialize<String>(jsonSerialization['academicCredential']),
      areaOfExpertise: serializationManager
          .deserialize<String>(jsonSerialization['areaOfExpertise']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = TeamMemberTable();

  static const db = TeamMemberRepository._();

  String memberId;

  String name;

  String role;

  String categoryTag;

  String category;

  String academicCredential;

  String areaOfExpertise;

  String? imageUrl;

  int displayOrder;

  @override
  _i1.Table get table => t;

  TeamMember copyWith({
    int? id,
    String? memberId,
    String? name,
    String? role,
    String? categoryTag,
    String? category,
    String? academicCredential,
    String? areaOfExpertise,
    String? imageUrl,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'memberId': memberId,
      'name': name,
      'role': role,
      'categoryTag': categoryTag,
      'category': category,
      'academicCredential': academicCredential,
      'areaOfExpertise': areaOfExpertise,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'memberId': memberId,
      'name': name,
      'role': role,
      'categoryTag': categoryTag,
      'category': category,
      'academicCredential': academicCredential,
      'areaOfExpertise': areaOfExpertise,
      'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'memberId': memberId,
      'name': name,
      'role': role,
      'categoryTag': categoryTag,
      'category': category,
      'academicCredential': academicCredential,
      'areaOfExpertise': areaOfExpertise,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'memberId':
        memberId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'role':
        role = value;
        return;
      case 'categoryTag':
        categoryTag = value;
        return;
      case 'category':
        category = value;
        return;
      case 'academicCredential':
        academicCredential = value;
        return;
      case 'areaOfExpertise':
        areaOfExpertise = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'displayOrder':
        displayOrder = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<TeamMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TeamMember>(
      where: where != null ? where(TeamMember.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<TeamMember?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TeamMember>(
      where: where != null ? where(TeamMember.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<TeamMember?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TeamMember>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeamMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TeamMember>(
      where: where(TeamMember.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TeamMember>(
      where: where != null ? where(TeamMember.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static TeamMemberInclude include() {
    return TeamMemberInclude._();
  }

  static TeamMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    TeamMemberInclude? include,
  }) {
    return TeamMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeamMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TeamMember.t),
      include: include,
    );
  }
}

class _Undefined {}

class _TeamMemberImpl extends TeamMember {
  _TeamMemberImpl({
    int? id,
    required String memberId,
    required String name,
    required String role,
    required String categoryTag,
    required String category,
    required String academicCredential,
    required String areaOfExpertise,
    String? imageUrl,
    required int displayOrder,
  }) : super._(
          id: id,
          memberId: memberId,
          name: name,
          role: role,
          categoryTag: categoryTag,
          category: category,
          academicCredential: academicCredential,
          areaOfExpertise: areaOfExpertise,
          imageUrl: imageUrl,
          displayOrder: displayOrder,
        );

  @override
  TeamMember copyWith({
    Object? id = _Undefined,
    String? memberId,
    String? name,
    String? role,
    String? categoryTag,
    String? category,
    String? academicCredential,
    String? areaOfExpertise,
    Object? imageUrl = _Undefined,
    int? displayOrder,
  }) {
    return TeamMember(
      id: id is int? ? id : this.id,
      memberId: memberId ?? this.memberId,
      name: name ?? this.name,
      role: role ?? this.role,
      categoryTag: categoryTag ?? this.categoryTag,
      category: category ?? this.category,
      academicCredential: academicCredential ?? this.academicCredential,
      areaOfExpertise: areaOfExpertise ?? this.areaOfExpertise,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class TeamMemberTable extends _i1.Table {
  TeamMemberTable({super.tableRelation}) : super(tableName: 'team_member') {
    memberId = _i1.ColumnString(
      'memberId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    role = _i1.ColumnString(
      'role',
      this,
    );
    categoryTag = _i1.ColumnString(
      'categoryTag',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    academicCredential = _i1.ColumnString(
      'academicCredential',
      this,
    );
    areaOfExpertise = _i1.ColumnString(
      'areaOfExpertise',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
    );
  }

  late final _i1.ColumnString memberId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString role;

  late final _i1.ColumnString categoryTag;

  late final _i1.ColumnString category;

  late final _i1.ColumnString academicCredential;

  late final _i1.ColumnString areaOfExpertise;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        memberId,
        name,
        role,
        categoryTag,
        category,
        academicCredential,
        areaOfExpertise,
        imageUrl,
        displayOrder,
      ];
}

@Deprecated('Use TeamMemberTable.t instead.')
TeamMemberTable tTeamMember = TeamMemberTable();

class TeamMemberInclude extends _i1.IncludeObject {
  TeamMemberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => TeamMember.t;
}

class TeamMemberIncludeList extends _i1.IncludeList {
  TeamMemberIncludeList._({
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TeamMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TeamMember.t;
}

class TeamMemberRepository {
  const TeamMemberRepository._();

  Future<List<TeamMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<TeamMember>(
      where: where?.call(TeamMember.t),
      orderBy: orderBy?.call(TeamMember.t),
      orderByList: orderByList?.call(TeamMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TeamMember?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<TeamMember>(
      where: where?.call(TeamMember.t),
      orderBy: orderBy?.call(TeamMember.t),
      orderByList: orderByList?.call(TeamMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<TeamMember?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<TeamMember>(
      id,
      transaction: transaction,
    );
  }

  Future<List<TeamMember>> insert(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<TeamMember>(
      rows,
      transaction: transaction,
    );
  }

  Future<TeamMember> insertRow(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<TeamMember>(
      row,
      transaction: transaction,
    );
  }

  Future<List<TeamMember>> update(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.ColumnSelections<TeamMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<TeamMember>(
      rows,
      columns: columns?.call(TeamMember.t),
      transaction: transaction,
    );
  }

  Future<TeamMember> updateRow(
    _i1.Session session,
    TeamMember row, {
    _i1.ColumnSelections<TeamMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<TeamMember>(
      row,
      columns: columns?.call(TeamMember.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<TeamMember>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<TeamMember>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeamMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<TeamMember>(
      where: where(TeamMember.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<TeamMember>(
      where: where?.call(TeamMember.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
