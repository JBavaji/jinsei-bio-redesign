/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class SolutionMetric extends _i1.TableRow {
  SolutionMetric._({
    int? id,
    required this.iconKey,
    required this.value,
    required this.label,
    required this.accentColorHex,
    required this.displayOrder,
  }) : super(id);

  factory SolutionMetric({
    int? id,
    required String iconKey,
    required String value,
    required String label,
    required String accentColorHex,
    required int displayOrder,
  }) = _SolutionMetricImpl;

  factory SolutionMetric.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SolutionMetric(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      value:
          serializationManager.deserialize<String>(jsonSerialization['value']),
      label:
          serializationManager.deserialize<String>(jsonSerialization['label']),
      accentColorHex: serializationManager
          .deserialize<String>(jsonSerialization['accentColorHex']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = SolutionMetricTable();

  static const db = SolutionMetricRepository._();

  String iconKey;

  String value;

  String label;

  String accentColorHex;

  int displayOrder;

  @override
  _i1.Table get table => t;

  SolutionMetric copyWith({
    int? id,
    String? iconKey,
    String? value,
    String? label,
    String? accentColorHex,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'iconKey': iconKey,
      'value': value,
      'label': label,
      'accentColorHex': accentColorHex,
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
      case 'value':
        value = value;
        return;
      case 'label':
        label = value;
        return;
      case 'accentColorHex':
        accentColorHex = value;
        return;
      case 'displayOrder':
        displayOrder = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<SolutionMetric>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SolutionMetric>(
      where: where != null ? where(SolutionMetric.t) : null,
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
  static Future<SolutionMetric?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<SolutionMetric>(
      where: where != null ? where(SolutionMetric.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<SolutionMetric?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<SolutionMetric>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SolutionMetricTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SolutionMetric>(
      where: where(SolutionMetric.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    SolutionMetric row, {
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
    SolutionMetric row, {
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
    SolutionMetric row, {
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
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SolutionMetric>(
      where: where != null ? where(SolutionMetric.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static SolutionMetricInclude include() {
    return SolutionMetricInclude._();
  }

  static SolutionMetricIncludeList includeList({
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SolutionMetricTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionMetricTable>? orderByList,
    SolutionMetricInclude? include,
  }) {
    return SolutionMetricIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SolutionMetric.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SolutionMetric.t),
      include: include,
    );
  }
}

class _Undefined {}

class _SolutionMetricImpl extends SolutionMetric {
  _SolutionMetricImpl({
    int? id,
    required String iconKey,
    required String value,
    required String label,
    required String accentColorHex,
    required int displayOrder,
  }) : super._(
          id: id,
          iconKey: iconKey,
          value: value,
          label: label,
          accentColorHex: accentColorHex,
          displayOrder: displayOrder,
        );

  @override
  SolutionMetric copyWith({
    Object? id = _Undefined,
    String? iconKey,
    String? value,
    String? label,
    String? accentColorHex,
    int? displayOrder,
  }) {
    return SolutionMetric(
      id: id is int? ? id : this.id,
      iconKey: iconKey ?? this.iconKey,
      value: value ?? this.value,
      label: label ?? this.label,
      accentColorHex: accentColorHex ?? this.accentColorHex,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class SolutionMetricTable extends _i1.Table {
  SolutionMetricTable({super.tableRelation})
      : super(tableName: 'solution_metric') {
    iconKey = _i1.ColumnString(
      'iconKey',
      this,
    );
    value = _i1.ColumnString(
      'value',
      this,
    );
    label = _i1.ColumnString(
      'label',
      this,
    );
    accentColorHex = _i1.ColumnString(
      'accentColorHex',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
    );
  }

  late final _i1.ColumnString iconKey;

  late final _i1.ColumnString value;

  late final _i1.ColumnString label;

  late final _i1.ColumnString accentColorHex;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        iconKey,
        value,
        label,
        accentColorHex,
        displayOrder,
      ];
}

@Deprecated('Use SolutionMetricTable.t instead.')
SolutionMetricTable tSolutionMetric = SolutionMetricTable();

class SolutionMetricInclude extends _i1.IncludeObject {
  SolutionMetricInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SolutionMetric.t;
}

class SolutionMetricIncludeList extends _i1.IncludeList {
  SolutionMetricIncludeList._({
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SolutionMetric.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SolutionMetric.t;
}

class SolutionMetricRepository {
  const SolutionMetricRepository._();

  Future<List<SolutionMetric>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SolutionMetricTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionMetricTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<SolutionMetric>(
      where: where?.call(SolutionMetric.t),
      orderBy: orderBy?.call(SolutionMetric.t),
      orderByList: orderByList?.call(SolutionMetric.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SolutionMetric?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? offset,
    _i1.OrderByBuilder<SolutionMetricTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionMetricTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<SolutionMetric>(
      where: where?.call(SolutionMetric.t),
      orderBy: orderBy?.call(SolutionMetric.t),
      orderByList: orderByList?.call(SolutionMetric.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SolutionMetric?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<SolutionMetric>(
      id,
      transaction: transaction,
    );
  }

  Future<List<SolutionMetric>> insert(
    _i1.Session session,
    List<SolutionMetric> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<SolutionMetric>(
      rows,
      transaction: transaction,
    );
  }

  Future<SolutionMetric> insertRow(
    _i1.Session session,
    SolutionMetric row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<SolutionMetric>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SolutionMetric>> update(
    _i1.Session session,
    List<SolutionMetric> rows, {
    _i1.ColumnSelections<SolutionMetricTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<SolutionMetric>(
      rows,
      columns: columns?.call(SolutionMetric.t),
      transaction: transaction,
    );
  }

  Future<SolutionMetric> updateRow(
    _i1.Session session,
    SolutionMetric row, {
    _i1.ColumnSelections<SolutionMetricTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<SolutionMetric>(
      row,
      columns: columns?.call(SolutionMetric.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<SolutionMetric> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<SolutionMetric>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    SolutionMetric row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<SolutionMetric>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SolutionMetricTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<SolutionMetric>(
      where: where(SolutionMetric.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionMetricTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<SolutionMetric>(
      where: where?.call(SolutionMetric.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
