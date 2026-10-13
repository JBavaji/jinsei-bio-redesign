/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class SolutionCard extends _i1.TableRow {
  SolutionCard._({
    int? id,
    required this.solutionId,
    required this.categoryTag,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconKey,
    required this.category,
    required this.formulationCount,
    required this.keyBenefit,
    required this.efficacyMetric,
    required this.bulletPoints,
    required this.actionCtaText,
    required this.caseStudyUrl,
    this.imageUrl,
    this.darkImageUrl,
    this.lightImageUrl,
    required this.displayOrder,
  }) : super(id);

  factory SolutionCard({
    int? id,
    required String solutionId,
    required String categoryTag,
    required String title,
    required String subtitle,
    required String description,
    required String iconKey,
    required String category,
    required String formulationCount,
    required String keyBenefit,
    required String efficacyMetric,
    required List<String> bulletPoints,
    required String actionCtaText,
    required String caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    required int displayOrder,
  }) = _SolutionCardImpl;

  factory SolutionCard.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SolutionCard(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      solutionId: serializationManager
          .deserialize<String>(jsonSerialization['solutionId']),
      categoryTag: serializationManager
          .deserialize<String>(jsonSerialization['categoryTag']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      subtitle: serializationManager
          .deserialize<String>(jsonSerialization['subtitle']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
      category: serializationManager
          .deserialize<String>(jsonSerialization['category']),
      formulationCount: serializationManager
          .deserialize<String>(jsonSerialization['formulationCount']),
      keyBenefit: serializationManager
          .deserialize<String>(jsonSerialization['keyBenefit']),
      efficacyMetric: serializationManager
          .deserialize<String>(jsonSerialization['efficacyMetric']),
      bulletPoints: serializationManager
          .deserialize<List<String>>(jsonSerialization['bulletPoints']),
      actionCtaText: serializationManager
          .deserialize<String>(jsonSerialization['actionCtaText']),
      caseStudyUrl: serializationManager
          .deserialize<String>(jsonSerialization['caseStudyUrl']),
      imageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['imageUrl']),
      darkImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['darkImageUrl']),
      lightImageUrl: serializationManager
          .deserialize<String?>(jsonSerialization['lightImageUrl']),
      displayOrder: serializationManager
          .deserialize<int>(jsonSerialization['displayOrder']),
    );
  }

  static final t = SolutionCardTable();

  static const db = SolutionCardRepository._();

  String solutionId;

  String categoryTag;

  String title;

  String subtitle;

  String description;

  String iconKey;

  String category;

  String formulationCount;

  String keyBenefit;

  String efficacyMetric;

  List<String> bulletPoints;

  String actionCtaText;

  String caseStudyUrl;

  String? imageUrl;

  String? darkImageUrl;

  String? lightImageUrl;

  int displayOrder;

  @override
  _i1.Table get table => t;

  SolutionCard copyWith({
    int? id,
    String? solutionId,
    String? categoryTag,
    String? title,
    String? subtitle,
    String? description,
    String? iconKey,
    String? category,
    String? formulationCount,
    String? keyBenefit,
    String? efficacyMetric,
    List<String>? bulletPoints,
    String? actionCtaText,
    String? caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    int? displayOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'solutionId': solutionId,
      'categoryTag': categoryTag,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'iconKey': iconKey,
      'category': category,
      'formulationCount': formulationCount,
      'keyBenefit': keyBenefit,
      'efficacyMetric': efficacyMetric,
      'bulletPoints': bulletPoints.toJson(),
      'actionCtaText': actionCtaText,
      'caseStudyUrl': caseStudyUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (darkImageUrl != null) 'darkImageUrl': darkImageUrl,
      if (lightImageUrl != null) 'lightImageUrl': lightImageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'solutionId': solutionId,
      'categoryTag': categoryTag,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'iconKey': iconKey,
      'category': category,
      'formulationCount': formulationCount,
      'keyBenefit': keyBenefit,
      'efficacyMetric': efficacyMetric,
      'bulletPoints': bulletPoints,
      'actionCtaText': actionCtaText,
      'caseStudyUrl': caseStudyUrl,
      'imageUrl': imageUrl,
      'darkImageUrl': darkImageUrl,
      'lightImageUrl': lightImageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'solutionId': solutionId,
      'categoryTag': categoryTag,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'iconKey': iconKey,
      'category': category,
      'formulationCount': formulationCount,
      'keyBenefit': keyBenefit,
      'efficacyMetric': efficacyMetric,
      'bulletPoints': bulletPoints.toJson(),
      'actionCtaText': actionCtaText,
      'caseStudyUrl': caseStudyUrl,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (darkImageUrl != null) 'darkImageUrl': darkImageUrl,
      if (lightImageUrl != null) 'lightImageUrl': lightImageUrl,
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
      case 'solutionId':
        solutionId = value;
        return;
      case 'categoryTag':
        categoryTag = value;
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
      case 'iconKey':
        iconKey = value;
        return;
      case 'category':
        category = value;
        return;
      case 'formulationCount':
        formulationCount = value;
        return;
      case 'keyBenefit':
        keyBenefit = value;
        return;
      case 'efficacyMetric':
        efficacyMetric = value;
        return;
      case 'bulletPoints':
        bulletPoints = value;
        return;
      case 'actionCtaText':
        actionCtaText = value;
        return;
      case 'caseStudyUrl':
        caseStudyUrl = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'darkImageUrl':
        darkImageUrl = value;
        return;
      case 'lightImageUrl':
        lightImageUrl = value;
        return;
      case 'displayOrder':
        displayOrder = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<SolutionCard>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SolutionCard>(
      where: where != null ? where(SolutionCard.t) : null,
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
  static Future<SolutionCard?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<SolutionCard>(
      where: where != null ? where(SolutionCard.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<SolutionCard?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<SolutionCard>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SolutionCardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SolutionCard>(
      where: where(SolutionCard.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    SolutionCard row, {
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
    SolutionCard row, {
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
    SolutionCard row, {
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
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SolutionCard>(
      where: where != null ? where(SolutionCard.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static SolutionCardInclude include() {
    return SolutionCardInclude._();
  }

  static SolutionCardIncludeList includeList({
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SolutionCardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionCardTable>? orderByList,
    SolutionCardInclude? include,
  }) {
    return SolutionCardIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SolutionCard.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SolutionCard.t),
      include: include,
    );
  }
}

class _Undefined {}

class _SolutionCardImpl extends SolutionCard {
  _SolutionCardImpl({
    int? id,
    required String solutionId,
    required String categoryTag,
    required String title,
    required String subtitle,
    required String description,
    required String iconKey,
    required String category,
    required String formulationCount,
    required String keyBenefit,
    required String efficacyMetric,
    required List<String> bulletPoints,
    required String actionCtaText,
    required String caseStudyUrl,
    String? imageUrl,
    String? darkImageUrl,
    String? lightImageUrl,
    required int displayOrder,
  }) : super._(
          id: id,
          solutionId: solutionId,
          categoryTag: categoryTag,
          title: title,
          subtitle: subtitle,
          description: description,
          iconKey: iconKey,
          category: category,
          formulationCount: formulationCount,
          keyBenefit: keyBenefit,
          efficacyMetric: efficacyMetric,
          bulletPoints: bulletPoints,
          actionCtaText: actionCtaText,
          caseStudyUrl: caseStudyUrl,
          imageUrl: imageUrl,
          darkImageUrl: darkImageUrl,
          lightImageUrl: lightImageUrl,
          displayOrder: displayOrder,
        );

  @override
  SolutionCard copyWith({
    Object? id = _Undefined,
    String? solutionId,
    String? categoryTag,
    String? title,
    String? subtitle,
    String? description,
    String? iconKey,
    String? category,
    String? formulationCount,
    String? keyBenefit,
    String? efficacyMetric,
    List<String>? bulletPoints,
    String? actionCtaText,
    String? caseStudyUrl,
    Object? imageUrl = _Undefined,
    Object? darkImageUrl = _Undefined,
    Object? lightImageUrl = _Undefined,
    int? displayOrder,
  }) {
    return SolutionCard(
      id: id is int? ? id : this.id,
      solutionId: solutionId ?? this.solutionId,
      categoryTag: categoryTag ?? this.categoryTag,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      iconKey: iconKey ?? this.iconKey,
      category: category ?? this.category,
      formulationCount: formulationCount ?? this.formulationCount,
      keyBenefit: keyBenefit ?? this.keyBenefit,
      efficacyMetric: efficacyMetric ?? this.efficacyMetric,
      bulletPoints: bulletPoints ?? this.bulletPoints.clone(),
      actionCtaText: actionCtaText ?? this.actionCtaText,
      caseStudyUrl: caseStudyUrl ?? this.caseStudyUrl,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      darkImageUrl: darkImageUrl is String? ? darkImageUrl : this.darkImageUrl,
      lightImageUrl:
          lightImageUrl is String? ? lightImageUrl : this.lightImageUrl,
      displayOrder: displayOrder ?? this.displayOrder,
    );
  }
}

class SolutionCardTable extends _i1.Table {
  SolutionCardTable({super.tableRelation}) : super(tableName: 'solution_card') {
    solutionId = _i1.ColumnString(
      'solutionId',
      this,
    );
    categoryTag = _i1.ColumnString(
      'categoryTag',
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
    iconKey = _i1.ColumnString(
      'iconKey',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    formulationCount = _i1.ColumnString(
      'formulationCount',
      this,
    );
    keyBenefit = _i1.ColumnString(
      'keyBenefit',
      this,
    );
    efficacyMetric = _i1.ColumnString(
      'efficacyMetric',
      this,
    );
    bulletPoints = _i1.ColumnSerializable(
      'bulletPoints',
      this,
    );
    actionCtaText = _i1.ColumnString(
      'actionCtaText',
      this,
    );
    caseStudyUrl = _i1.ColumnString(
      'caseStudyUrl',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    darkImageUrl = _i1.ColumnString(
      'darkImageUrl',
      this,
    );
    lightImageUrl = _i1.ColumnString(
      'lightImageUrl',
      this,
    );
    displayOrder = _i1.ColumnInt(
      'displayOrder',
      this,
    );
  }

  late final _i1.ColumnString solutionId;

  late final _i1.ColumnString categoryTag;

  late final _i1.ColumnString title;

  late final _i1.ColumnString subtitle;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconKey;

  late final _i1.ColumnString category;

  late final _i1.ColumnString formulationCount;

  late final _i1.ColumnString keyBenefit;

  late final _i1.ColumnString efficacyMetric;

  late final _i1.ColumnSerializable bulletPoints;

  late final _i1.ColumnString actionCtaText;

  late final _i1.ColumnString caseStudyUrl;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnString darkImageUrl;

  late final _i1.ColumnString lightImageUrl;

  late final _i1.ColumnInt displayOrder;

  @override
  List<_i1.Column> get columns => [
        id,
        solutionId,
        categoryTag,
        title,
        subtitle,
        description,
        iconKey,
        category,
        formulationCount,
        keyBenefit,
        efficacyMetric,
        bulletPoints,
        actionCtaText,
        caseStudyUrl,
        imageUrl,
        darkImageUrl,
        lightImageUrl,
        displayOrder,
      ];
}

@Deprecated('Use SolutionCardTable.t instead.')
SolutionCardTable tSolutionCard = SolutionCardTable();

class SolutionCardInclude extends _i1.IncludeObject {
  SolutionCardInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SolutionCard.t;
}

class SolutionCardIncludeList extends _i1.IncludeList {
  SolutionCardIncludeList._({
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SolutionCard.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SolutionCard.t;
}

class SolutionCardRepository {
  const SolutionCardRepository._();

  Future<List<SolutionCard>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SolutionCardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionCardTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<SolutionCard>(
      where: where?.call(SolutionCard.t),
      orderBy: orderBy?.call(SolutionCard.t),
      orderByList: orderByList?.call(SolutionCard.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SolutionCard?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? offset,
    _i1.OrderByBuilder<SolutionCardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SolutionCardTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<SolutionCard>(
      where: where?.call(SolutionCard.t),
      orderBy: orderBy?.call(SolutionCard.t),
      orderByList: orderByList?.call(SolutionCard.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<SolutionCard?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<SolutionCard>(
      id,
      transaction: transaction,
    );
  }

  Future<List<SolutionCard>> insert(
    _i1.Session session,
    List<SolutionCard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<SolutionCard>(
      rows,
      transaction: transaction,
    );
  }

  Future<SolutionCard> insertRow(
    _i1.Session session,
    SolutionCard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<SolutionCard>(
      row,
      transaction: transaction,
    );
  }

  Future<List<SolutionCard>> update(
    _i1.Session session,
    List<SolutionCard> rows, {
    _i1.ColumnSelections<SolutionCardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<SolutionCard>(
      rows,
      columns: columns?.call(SolutionCard.t),
      transaction: transaction,
    );
  }

  Future<SolutionCard> updateRow(
    _i1.Session session,
    SolutionCard row, {
    _i1.ColumnSelections<SolutionCardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<SolutionCard>(
      row,
      columns: columns?.call(SolutionCard.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<SolutionCard> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<SolutionCard>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    SolutionCard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<SolutionCard>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SolutionCardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<SolutionCard>(
      where: where(SolutionCard.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SolutionCardTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<SolutionCard>(
      where: where?.call(SolutionCard.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
