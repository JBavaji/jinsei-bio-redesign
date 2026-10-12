/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;

abstract class ScienceStep extends _i1.TableRow {
  ScienceStep._({
    int? id,
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.iconKey,
    required this.metricValue,
    required this.metricLabel,
    required this.imageUrl,
    required this.displayOrder,
  }) : super(id);

  factory ScienceStep({
    int? id,
    required int stepNumber,
    required String title,
    required String subtitle,
    required String description,
    required String category,
    required String iconKey,
    required String metricValue,
    required String metricLabel,
    required String imageUrl,
    required int displayOrder,
  }) = _ScienceStepImpl;

  factory ScienceStep.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScienceStep(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      stepNumber: serializationManager
          .deserialize<int>(jsonSerialization['stepNumber']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      metricValue: serializationManager
          .deserialize<String>(jsonSerialization['metricValue']),
      metricLabel: serializationManager
          .deserialize<String>(jsonSerialization['metricLabel']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = ScienceStepTable();

  static const db = ScienceStepRepository._();

  int stepNumber;

  String title;

  String subtitle;

  String description;

  String category;

  String iconKey;

  String metricValue;

  String metricLabel;

  String imageUrl;

  int displayOrder;

  @override
  _i1.Table get table => t;

  ScienceStep copyWith({
    int? id,
    int? stepNumber,
    String? title,
    String? subtitle,
    String? description,
    String? category,
    String? iconKey,
    String? metricValue,
    String? metricLabel,
    String? imageUrl,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'stepNumber': stepNumber,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'iconKey': iconKey,
      'metricValue': metricValue,
      'metricLabel': metricLabel,
      'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'stepNumber': stepNumber,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'iconKey': iconKey,
      'metricValue': metricValue,
      'metricLabel': metricLabel,
      'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'stepNumber': stepNumber,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'iconKey': iconKey,
      'metricValue': metricValue,
      'metricLabel': metricLabel,
      'imageUrl': imageUrl,
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
      case 'stepNumber':
        stepNumber = value;
        return;
      case 'title':
        title = value;
        return;
      case 'subtitle':
        subtitle = value;
        return;
      case 'description':
        description = value;
        return;
      case 'category':
        category = value;
        return;
      case 'iconKey':
        iconKey = value;
        return;
      case 'metricValue':
        metricValue = value;
        return;
      case 'metricLabel':
        metricLabel = value;
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
  static Future<List<ScienceStep>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ScienceStep>(
      where: where != null ? where(ScienceStep.t) : null,
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
  static Future<ScienceStep?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ScienceStep>(
      where: where != null ? where(ScienceStep.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ScienceStep?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ScienceStep>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ScienceStepTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ScienceStep>(
      where: where(ScienceStep.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    ScienceStep row, {
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
    ScienceStep row, {
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
    ScienceStep row, {
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
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ScienceStep>(
      where: where != null ? where(ScienceStep.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ScienceStepInclude include() {
    return ScienceStepInclude._();
  }

  static ScienceStepIncludeList includeList({
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ScienceStepTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ScienceStepTable>? orderByList,
    ScienceStepInclude? include,
  }) {
    return ScienceStepIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ScienceStep.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ScienceStep.t),
      include: include,
    );
  }
}

class _Undefined {}

class _ScienceStepImpl extends ScienceStep {
  _ScienceStepImpl({
    int? id,
    required int stepNumber,
    required String title,
    required String subtitle,
    required String description,
    required String category,
    required String iconKey,
    required String metricValue,
    required String metricLabel,
    required String imageUrl,
    required int displayOrder,
  }) : super._(
          id: id,
          stepNumber: stepNumber,
          title: title,
          subtitle: subtitle,
          description: description,
          category: category,
          iconKey: iconKey,
          metricValue: metricValue,
          metricLabel: metricLabel,
          imageUrl: imageUrl,
          displayOrder: displayOrder,
        );

  @override
  ScienceStep copyWith({
    Object? id = _Undefined,
    int? stepNumber,
    String? title,
    String? subtitle,
    String? description,
    String? category,
    String? iconKey,
    String? metricValue,
    String? metricLabel,
    String? imageUrl,
    int? displayOrder,
  }) {
    return ScienceStep(
      id: id is int? ? id : this.id,
      stepNumber: stepNumber ?? this.stepNumber,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      iconKey: iconKey ?? this.iconKey,
      metricValue: metricValue ?? this.metricValue,
      metricLabel: metricLabel ?? this.metricLabel,
      imageUrl: imageUrl ?? this.imageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class ScienceStepTable extends _i1.Table {
  ScienceStepTable({super.tableRelation}) : super(tableName: 'science_step') {
    stepNumber = _i1.ColumnInt(
      'stepNumber',
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
    description = _i1.ColumnString(
      'description',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    iconKey = _i1.ColumnString(
      'iconKey',
      this,
    );
    metricValue = _i1.ColumnString(
      'metricValue',
      this,
    );
    metricLabel = _i1.ColumnString(
      'metricLabel',
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

  late final _i1.ColumnInt stepNumber;

  late final _i1.ColumnString title;

  late final _i1.ColumnString subtitle;

  late final _i1.ColumnString description;

  late final _i1.ColumnString category;

  late final _i1.ColumnString iconKey;

  late final _i1.ColumnString metricValue;

  late final _i1.ColumnString metricLabel;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        stepNumber,
        title,
        subtitle,
        description,
        category,
        iconKey,
        metricValue,
        metricLabel,
        imageUrl,
        displayOrder,
      ];
}

@Deprecated('Use ScienceStepTable.t instead.')
ScienceStepTable tScienceStep = ScienceStepTable();

class ScienceStepInclude extends _i1.IncludeObject {
  ScienceStepInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ScienceStep.t;
}

class ScienceStepIncludeList extends _i1.IncludeList {
  ScienceStepIncludeList._({
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ScienceStep.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ScienceStep.t;
}

class ScienceStepRepository {
  const ScienceStepRepository._();

  Future<List<ScienceStep>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ScienceStepTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ScienceStepTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<ScienceStep>(
      where: where?.call(ScienceStep.t),
      orderBy: orderBy?.call(ScienceStep.t),
      orderByList: orderByList?.call(ScienceStep.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ScienceStep?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? offset,
    _i1.OrderByBuilder<ScienceStepTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ScienceStepTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ScienceStep>(
      where: where?.call(ScienceStep.t),
      orderBy: orderBy?.call(ScienceStep.t),
      orderByList: orderByList?.call(ScienceStep.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ScienceStep?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ScienceStep>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ScienceStep>> insert(
    _i1.Session session,
    List<ScienceStep> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ScienceStep>(
      rows,
      transaction: transaction,
    );
  }

  Future<ScienceStep> insertRow(
    _i1.Session session,
    ScienceStep row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ScienceStep>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ScienceStep>> update(
    _i1.Session session,
    List<ScienceStep> rows, {
    _i1.ColumnSelections<ScienceStepTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ScienceStep>(
      rows,
      columns: columns?.call(ScienceStep.t),
      transaction: transaction,
    );
  }

  Future<ScienceStep> updateRow(
    _i1.Session session,
    ScienceStep row, {
    _i1.ColumnSelections<ScienceStepTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ScienceStep>(
      row,
      columns: columns?.call(ScienceStep.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ScienceStep> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ScienceStep>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ScienceStep row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ScienceStep>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ScienceStepTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ScienceStep>(
      where: where(ScienceStep.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ScienceStepTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ScienceStep>(
      where: where?.call(ScienceStep.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
