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

abstract class B2bSampleRequest extends _i1.TableRow {
  B2bSampleRequest._({
    int? id,
    required this.strainId,
    required this.fullName,
    required this.email,
    required this.company,
    required this.formulationFormat,
    this.clinicalScope,
    required this.trackingId,
    required this.submittedAt,
    required this.status,
  }) : super(id);

  factory B2bSampleRequest({
    int? id,
    required String strainId,
    required String fullName,
    required String email,
    required String company,
    required String formulationFormat,
    String? clinicalScope,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) = _B2bSampleRequestImpl;

  factory B2bSampleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return B2bSampleRequest(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      strainId: serializationManager
          .deserialize<String>(jsonSerialization['strainId']),
      fullName: serializationManager
          .deserialize<String>(jsonSerialization['fullName']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      company: serializationManager
          .deserialize<String>(jsonSerialization['company']),
      formulationFormat: serializationManager
          .deserialize<String>(jsonSerialization['formulationFormat']),
      clinicalScope: serializationManager
          .deserialize<String?>(jsonSerialization['clinicalScope']),
      trackingId: serializationManager
          .deserialize<String>(jsonSerialization['trackingId']),
      submittedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['submittedAt']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
    );
  }

  static final t = B2bSampleRequestTable();

  static const db = B2bSampleRequestRepository._();

  String strainId;

  String fullName;

  String email;

  String company;

  String formulationFormat;

  String? clinicalScope;

  String trackingId;

  DateTime submittedAt;

  String status;

  @override
  _i1.Table get table => t;

  B2bSampleRequest copyWith({
    int? id,
    String? strainId,
    String? fullName,
    String? email,
    String? company,
    String? formulationFormat,
    String? clinicalScope,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'strainId': strainId,
      'fullName': fullName,
      'email': email,
      'company': company,
      'formulationFormat': formulationFormat,
      if (clinicalScope != null) 'clinicalScope': clinicalScope,
      'trackingId': trackingId,
      'submittedAt': submittedAt.toJson(),
      'status': status,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'strainId': strainId,
      'fullName': fullName,
      'email': email,
      'company': company,
      'formulationFormat': formulationFormat,
      'clinicalScope': clinicalScope,
      'trackingId': trackingId,
      'submittedAt': submittedAt,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'strainId': strainId,
      'fullName': fullName,
      'email': email,
      'company': company,
      'formulationFormat': formulationFormat,
      if (clinicalScope != null) 'clinicalScope': clinicalScope,
      'trackingId': trackingId,
      'submittedAt': submittedAt.toJson(),
      'status': status,
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
      case 'strainId':
        strainId = value;
        return;
      case 'fullName':
        fullName = value;
        return;
      case 'email':
        email = value;
        return;
      case 'company':
        company = value;
        return;
      case 'formulationFormat':
        formulationFormat = value;
        return;
      case 'clinicalScope':
        clinicalScope = value;
        return;
      case 'trackingId':
        trackingId = value;
        return;
      case 'submittedAt':
        submittedAt = value;
        return;
      case 'status':
        status = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<B2bSampleRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<B2bSampleRequest>(
      where: where != null ? where(B2bSampleRequest.t) : null,
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
  static Future<B2bSampleRequest?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<B2bSampleRequest>(
      where: where != null ? where(B2bSampleRequest.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<B2bSampleRequest?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<B2bSampleRequest>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<B2bSampleRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<B2bSampleRequest>(
      where: where(B2bSampleRequest.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    B2bSampleRequest row, {
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
    B2bSampleRequest row, {
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
    B2bSampleRequest row, {
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
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<B2bSampleRequest>(
      where: where != null ? where(B2bSampleRequest.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static B2bSampleRequestInclude include() {
    return B2bSampleRequestInclude._();
  }

  static B2bSampleRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<B2bSampleRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<B2bSampleRequestTable>? orderByList,
    B2bSampleRequestInclude? include,
  }) {
    return B2bSampleRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(B2bSampleRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(B2bSampleRequest.t),
      include: include,
    );
  }
}

class _Undefined {}

class _B2bSampleRequestImpl extends B2bSampleRequest {
  _B2bSampleRequestImpl({
    int? id,
    required String strainId,
    required String fullName,
    required String email,
    required String company,
    required String formulationFormat,
    String? clinicalScope,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) : super._(
          id: id,
          strainId: strainId,
          fullName: fullName,
          email: email,
          company: company,
          formulationFormat: formulationFormat,
          clinicalScope: clinicalScope,
          trackingId: trackingId,
          submittedAt: submittedAt,
          status: status,
        );

  @override
  B2bSampleRequest copyWith({
    Object? id = _Undefined,
    String? strainId,
    String? fullName,
    String? email,
    String? company,
    String? formulationFormat,
    Object? clinicalScope = _Undefined,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return B2bSampleRequest(
      id: id is int? ? id : this.id,
      strainId: strainId ?? this.strainId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      company: company ?? this.company,
      formulationFormat: formulationFormat ?? this.formulationFormat,
      clinicalScope:
          clinicalScope is String? ? clinicalScope : this.clinicalScope,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }
}

class B2bSampleRequestTable extends _i1.Table {
  B2bSampleRequestTable({super.tableRelation})
      : super(tableName: 'b2b_sample_request') {
    strainId = _i1.ColumnString(
      'strainId',
      this,
    );
    fullName = _i1.ColumnString(
      'fullName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    company = _i1.ColumnString(
      'company',
      this,
    );
    formulationFormat = _i1.ColumnString(
      'formulationFormat',
      this,
    );
    clinicalScope = _i1.ColumnString(
      'clinicalScope',
      this,
    );
    trackingId = _i1.ColumnString(
      'trackingId',
      this,
    );
    submittedAt = _i1.ColumnDateTime(
      'submittedAt',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
  }

  late final _i1.ColumnString strainId;

  late final _i1.ColumnString fullName;

  late final _i1.ColumnString email;

  late final _i1.ColumnString company;

  late final _i1.ColumnString formulationFormat;

  late final _i1.ColumnString clinicalScope;

  late final _i1.ColumnString trackingId;

  late final _i1.ColumnDateTime submittedAt;

  late final _i1.ColumnString status;

  @override
  List<_i1.Column> get columns => [
        id,
        strainId,
        fullName,
        email,
        company,
        formulationFormat,
        clinicalScope,
        trackingId,
        submittedAt,
        status,
      ];
}

@Deprecated('Use B2bSampleRequestTable.t instead.')
B2bSampleRequestTable tB2bSampleRequest = B2bSampleRequestTable();

class B2bSampleRequestInclude extends _i1.IncludeObject {
  B2bSampleRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => B2bSampleRequest.t;
}

class B2bSampleRequestIncludeList extends _i1.IncludeList {
  B2bSampleRequestIncludeList._({
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(B2bSampleRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => B2bSampleRequest.t;
}

class B2bSampleRequestRepository {
  const B2bSampleRequestRepository._();

  Future<List<B2bSampleRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<B2bSampleRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<B2bSampleRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<B2bSampleRequest>(
      where: where?.call(B2bSampleRequest.t),
      orderBy: orderBy?.call(B2bSampleRequest.t),
      orderByList: orderByList?.call(B2bSampleRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<B2bSampleRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<B2bSampleRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<B2bSampleRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<B2bSampleRequest>(
      where: where?.call(B2bSampleRequest.t),
      orderBy: orderBy?.call(B2bSampleRequest.t),
      orderByList: orderByList?.call(B2bSampleRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<B2bSampleRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<B2bSampleRequest>(
      id,
      transaction: transaction,
    );
  }

  Future<List<B2bSampleRequest>> insert(
    _i1.Session session,
    List<B2bSampleRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<B2bSampleRequest>(
      rows,
      transaction: transaction,
    );
  }

  Future<B2bSampleRequest> insertRow(
    _i1.Session session,
    B2bSampleRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<B2bSampleRequest>(
      row,
      transaction: transaction,
    );
  }

  Future<List<B2bSampleRequest>> update(
    _i1.Session session,
    List<B2bSampleRequest> rows, {
    _i1.ColumnSelections<B2bSampleRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<B2bSampleRequest>(
      rows,
      columns: columns?.call(B2bSampleRequest.t),
      transaction: transaction,
    );
  }

  Future<B2bSampleRequest> updateRow(
    _i1.Session session,
    B2bSampleRequest row, {
    _i1.ColumnSelections<B2bSampleRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<B2bSampleRequest>(
      row,
      columns: columns?.call(B2bSampleRequest.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<B2bSampleRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<B2bSampleRequest>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    B2bSampleRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<B2bSampleRequest>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<B2bSampleRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<B2bSampleRequest>(
      where: where(B2bSampleRequest.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<B2bSampleRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<B2bSampleRequest>(
      where: where?.call(B2bSampleRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
