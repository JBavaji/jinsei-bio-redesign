/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class ExecutiveStat extends _i1.TableRow {
  ExecutiveStat._({
    int? id,
    required this.iconKey,
    required this.title,
    required this.subtitle,
    required this.displayOrder,
  }) : super(id);

  factory ExecutiveStat({
    int? id,
    required String iconKey,
    required String title,
    required String subtitle,
    required int displayOrder,
  }) = _ExecutiveStatImpl;

  factory ExecutiveStat.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ExecutiveStat(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = ExecutiveStatTable();

  static const db = ExecutiveStatRepository._();

  String iconKey;

  String title;

  String subtitle;

  int displayOrder;

  @override
  _i1.Table get table => t;

  ExecutiveStat copyWith({
    int? id,
    String? iconKey,
    String? title,
    String? subtitle,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'subtitle': subtitle,
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
      'subtitle': subtitle,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'title': title,
      'subtitle': subtitle,
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
      case 'subtitle':
        subtitle = value;
        return;
      case 'displayOrder':
        displayOrder = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<ExecutiveStat>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ExecutiveStat>(
      where: where != null ? where(ExecutiveStat.t) : null,
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
  static Future<ExecutiveStat?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ExecutiveStat>(
      where: where != null ? where(ExecutiveStat.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ExecutiveStat?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ExecutiveStat>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExecutiveStatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ExecutiveStat>(
      where: where(ExecutiveStat.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    ExecutiveStat row, {
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
    ExecutiveStat row, {
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
    ExecutiveStat row, {
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
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ExecutiveStat>(
      where: where != null ? where(ExecutiveStat.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ExecutiveStatInclude include() {
    return ExecutiveStatInclude._();
  }

  static ExecutiveStatIncludeList includeList({
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExecutiveStatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExecutiveStatTable>? orderByList,
    ExecutiveStatInclude? include,
  }) {
    return ExecutiveStatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ExecutiveStat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ExecutiveStat.t),
      include: include,
    );
  }
}

class _Undefined {}

class _ExecutiveStatImpl extends ExecutiveStat {
  _ExecutiveStatImpl({
    int? id,
    required String iconKey,
    required String title,
    required String subtitle,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          title: title,
          subtitle: subtitle,
          displayOrder: displayOrder,
        );

  @override
  ExecutiveStat copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? title,
    String? subtitle,
    int? displayOrder,
  }) {
    return ExecutiveStat(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class ExecutiveStatTable extends _i1.Table {
  ExecutiveStatTable({super.tableRelation})
      : super(tableName: 'executive_stat') {
    iconKey = _i1.ColumnString(
      'iconKey',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    subtitle = _i1.ColumnString(
      'subtitle',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
    );
  }

  late final _i1.ColumnString iconKey;

  late final _i1.ColumnString title;

  late final _i1.ColumnString subtitle;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        iconKey,
        title,
        subtitle,
        displayOrder,
      ];
}

@Deprecated('Use ExecutiveStatTable.t instead.')
ExecutiveStatTable tExecutiveStat = ExecutiveStatTable();

class ExecutiveStatInclude extends _i1.IncludeObject {
  ExecutiveStatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ExecutiveStat.t;
}

class ExecutiveStatIncludeList extends _i1.IncludeList {
  ExecutiveStatIncludeList._({
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ExecutiveStat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ExecutiveStat.t;
}

class ExecutiveStatRepository {
  const ExecutiveStatRepository._();

  Future<List<ExecutiveStat>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExecutiveStatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExecutiveStatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<ExecutiveStat>(
      where: where?.call(ExecutiveStat.t),
      orderBy: orderBy?.call(ExecutiveStat.t),
      orderByList: orderByList?.call(ExecutiveStat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ExecutiveStat?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExecutiveStatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExecutiveStatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ExecutiveStat>(
      where: where?.call(ExecutiveStat.t),
      orderBy: orderBy?.call(ExecutiveStat.t),
      orderByList: orderByList?.call(ExecutiveStat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ExecutiveStat?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ExecutiveStat>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ExecutiveStat>> insert(
    _i1.Session session,
    List<ExecutiveStat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ExecutiveStat>(
      rows,
      transaction: transaction,
    );
  }

  Future<ExecutiveStat> insertRow(
    _i1.Session session,
    ExecutiveStat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ExecutiveStat>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ExecutiveStat>> update(
    _i1.Session session,
    List<ExecutiveStat> rows, {
    _i1.ColumnSelections<ExecutiveStatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ExecutiveStat>(
      rows,
      columns: columns?.call(ExecutiveStat.t),
      transaction: transaction,
    );
  }

  Future<ExecutiveStat> updateRow(
    _i1.Session session,
    ExecutiveStat row, {
    _i1.ColumnSelections<ExecutiveStatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ExecutiveStat>(
      row,
      columns: columns?.call(ExecutiveStat.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ExecutiveStat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ExecutiveStat>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ExecutiveStat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ExecutiveStat>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExecutiveStatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ExecutiveStat>(
      where: where(ExecutiveStat.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExecutiveStatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ExecutiveStat>(
      where: where?.call(ExecutiveStat.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
