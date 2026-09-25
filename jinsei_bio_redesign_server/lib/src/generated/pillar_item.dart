/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class PillarItem extends _i1.TableRow {
  PillarItem._({
    int? id,
    required this.iconKey,
    required this.title,
    required this.description,
    required this.displayOrder,
  }) : super(id);

  factory PillarItem({
    int? id,
    required String iconKey,
    required String title,
    required String description,
    required int displayOrder,
  }) = _PillarItemImpl;

  factory PillarItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PillarItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = PillarItemTable();

  static const db = PillarItemRepository._();

  String iconKey;

  String title;

  String description;

  int displayOrder;

  @override
  _i1.Table get table => t;

  PillarItem copyWith({
    int? id,
    String? iconKey,
    String? title,
    String? description,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'description': description,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'iconKey': iconKey,
      'title': title,
      'description': description,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'description': description,
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
      case 'iconKey':
        iconKey = value;
        return;
      case 'title':
        title = value;
        return;
      case 'description':
        description = value;
        return;
      case 'displayOrder':
        displayOrder = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<PillarItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PillarItem>(
      where: where != null ? where(PillarItem.t) : null,
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
  static Future<PillarItem?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<PillarItem>(
      where: where != null ? where(PillarItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<PillarItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<PillarItem>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PillarItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PillarItem>(
      where: where(PillarItem.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    PillarItem row, {
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
    PillarItem row, {
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
    PillarItem row, {
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
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PillarItem>(
      where: where != null ? where(PillarItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static PillarItemInclude include() {
    return PillarItemInclude._();
  }

  static PillarItemIncludeList includeList({
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PillarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PillarItemTable>? orderByList,
    PillarItemInclude? include,
  }) {
    return PillarItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PillarItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PillarItem.t),
      include: include,
    );
  }
}

class _Undefined {}

class _PillarItemImpl extends PillarItem {
  _PillarItemImpl({
    int? id,
    required String iconKey,
    required String title,
    required String description,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          title: title,
          description: description,
          displayOrder: displayOrder,
        );

  @override
  PillarItem copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? title,
    String? description,
    int? displayOrder,
  }) {
    return PillarItem(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      description: description ?? this.description,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class PillarItemTable extends _i1.Table {
  PillarItemTable({super.tableRelation}) : super(tableName: 'pillar_item') {
    iconKey = _i1.ColumnString(
      'iconKey',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
    );
  }

  late final _i1.ColumnString iconKey;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        iconKey,
        title,
        description,
        displayOrder,
      ];
}

@Deprecated('Use PillarItemTable.t instead.')
PillarItemTable tPillarItem = PillarItemTable();

class PillarItemInclude extends _i1.IncludeObject {
  PillarItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => PillarItem.t;
}

class PillarItemIncludeList extends _i1.IncludeList {
  PillarItemIncludeList._({
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PillarItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PillarItem.t;
}

class PillarItemRepository {
  const PillarItemRepository._();

  Future<List<PillarItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PillarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PillarItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<PillarItem>(
      where: where?.call(PillarItem.t),
      orderBy: orderBy?.call(PillarItem.t),
      orderByList: orderByList?.call(PillarItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PillarItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<PillarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PillarItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<PillarItem>(
      where: where?.call(PillarItem.t),
      orderBy: orderBy?.call(PillarItem.t),
      orderByList: orderByList?.call(PillarItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PillarItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<PillarItem>(
      id,
      transaction: transaction,
    );
  }

  Future<List<PillarItem>> insert(
    _i1.Session session,
    List<PillarItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<PillarItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<PillarItem> insertRow(
    _i1.Session session,
    PillarItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<PillarItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PillarItem>> update(
    _i1.Session session,
    List<PillarItem> rows, {
    _i1.ColumnSelections<PillarItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<PillarItem>(
      rows,
      columns: columns?.call(PillarItem.t),
      transaction: transaction,
    );
  }

  Future<PillarItem> updateRow(
    _i1.Session session,
    PillarItem row, {
    _i1.ColumnSelections<PillarItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<PillarItem>(
      row,
      columns: columns?.call(PillarItem.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<PillarItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<PillarItem>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    PillarItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<PillarItem>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PillarItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<PillarItem>(
      where: where(PillarItem.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PillarItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<PillarItem>(
      where: where?.call(PillarItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
