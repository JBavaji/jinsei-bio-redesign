/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class ProductVertical extends _i1.TableRow {
  ProductVertical._({
    int? id,
    required this.title,
    required this.strainId,
    required this.description,
    required this.displayOrder,
  }) : super(id);

  factory ProductVertical({
    int? id,
    required String title,
    required String strainId,
    required String description,
    required int displayOrder,
  }) = _ProductVerticalImpl;

  factory ProductVertical.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ProductVertical(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      strainId: serializationManager
          .deserialize<String>(jsonSerialization['strainId']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = ProductVerticalTable();

  static const db = ProductVerticalRepository._();

  String title;

  String strainId;

  String description;

  int displayOrder;

  @override
  _i1.Table get table => t;

  ProductVertical copyWith({
    int? id,
    String? title,
    String? strainId,
    String? description,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'strainId': strainId,
      'description': description,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'strainId': strainId,
      'description': description,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'strainId': strainId,
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
      case 'title':
        title = value;
        return;
      case 'strainId':
        strainId = value;
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
  static Future<List<ProductVertical>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProductVertical>(
      where: where != null ? where(ProductVertical.t) : null,
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
  static Future<ProductVertical?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ProductVertical>(
      where: where != null ? where(ProductVertical.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ProductVertical?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ProductVertical>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductVerticalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductVertical>(
      where: where(ProductVertical.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    ProductVertical row, {
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
    ProductVertical row, {
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
    ProductVertical row, {
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
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductVertical>(
      where: where != null ? where(ProductVertical.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ProductVerticalInclude include() {
    return ProductVerticalInclude._();
  }

  static ProductVerticalIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductVerticalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVerticalTable>? orderByList,
    ProductVerticalInclude? include,
  }) {
    return ProductVerticalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductVertical.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductVertical.t),
      include: include,
    );
  }
}

class _Undefined {}

class _ProductVerticalImpl extends ProductVertical {
  _ProductVerticalImpl({
    int? id,
    required String title,
    required String strainId,
    required String description,
    required int displayOrder,
  }) : super._(
          id: id,
          title: title,
          strainId: strainId,
          description: description,
          displayOrder: displayOrder,
        );

  @override
  ProductVertical copyWith({
    Object? id = _Undefined,
    String? title,
    String? strainId,
    String? description,
    int? displayOrder,
  }) {
    return ProductVertical(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      strainId: strainId ?? this.strainId,
      description: description ?? this.description,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class ProductVerticalTable extends _i1.Table {
  ProductVerticalTable({super.tableRelation})
      : super(tableName: 'product_vertical') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    strainId = _i1.ColumnString(
      'strainId',
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

  late final _i1.ColumnString title;

  late final _i1.ColumnString strainId;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        strainId,
        description,
        displayOrder,
      ];
}

@Deprecated('Use ProductVerticalTable.t instead.')
ProductVerticalTable tProductVertical = ProductVerticalTable();

class ProductVerticalInclude extends _i1.IncludeObject {
  ProductVerticalInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ProductVertical.t;
}

class ProductVerticalIncludeList extends _i1.IncludeList {
  ProductVerticalIncludeList._({
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductVertical.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ProductVertical.t;
}

class ProductVerticalRepository {
  const ProductVerticalRepository._();

  Future<List<ProductVertical>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductVerticalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVerticalTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<ProductVertical>(
      where: where?.call(ProductVertical.t),
      orderBy: orderBy?.call(ProductVertical.t),
      orderByList: orderByList?.call(ProductVertical.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ProductVertical?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductVerticalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductVerticalTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ProductVertical>(
      where: where?.call(ProductVertical.t),
      orderBy: orderBy?.call(ProductVertical.t),
      orderByList: orderByList?.call(ProductVertical.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ProductVertical?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ProductVertical>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ProductVertical>> insert(
    _i1.Session session,
    List<ProductVertical> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ProductVertical>(
      rows,
      transaction: transaction,
    );
  }

  Future<ProductVertical> insertRow(
    _i1.Session session,
    ProductVertical row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ProductVertical>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ProductVertical>> update(
    _i1.Session session,
    List<ProductVertical> rows, {
    _i1.ColumnSelections<ProductVerticalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ProductVertical>(
      rows,
      columns: columns?.call(ProductVertical.t),
      transaction: transaction,
    );
  }

  Future<ProductVertical> updateRow(
    _i1.Session session,
    ProductVertical row, {
    _i1.ColumnSelections<ProductVerticalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ProductVertical>(
      row,
      columns: columns?.call(ProductVertical.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ProductVertical> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ProductVertical>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ProductVertical row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ProductVertical>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductVerticalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ProductVertical>(
      where: where(ProductVertical.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductVerticalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ProductVertical>(
      where: where?.call(ProductVertical.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
