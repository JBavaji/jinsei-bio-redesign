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

abstract class CollaborationInquiry extends _i1.TableRow {
  CollaborationInquiry._({
    int? id,
    required this.name,
    required this.email,
    this.organization,
    required this.partnershipTrack,
    required this.message,
    required this.trackingId,
    required this.submittedAt,
    required this.status,
  }) : super(id);

  factory CollaborationInquiry({
    int? id,
    required String name,
    required String email,
    String? organization,
    required String partnershipTrack,
    required String message,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) = _CollaborationInquiryImpl;

  factory CollaborationInquiry.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationInquiry(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      organization: serializationManager
          .deserialize<String?>(jsonSerialization['organization']),
      partnershipTrack: serializationManager
          .deserialize<String>(jsonSerialization['partnershipTrack']),
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      trackingId: serializationManager
          .deserialize<String>(jsonSerialization['trackingId']),
      submittedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['submittedAt']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
    );
  }

  static final t = CollaborationInquiryTable();

  static const db = CollaborationInquiryRepository._();

  String name;

  String email;

  String? organization;

  String partnershipTrack;

  String message;

  String trackingId;

  DateTime submittedAt;

  String status;

  @override
  _i1.Table get table => t;

  CollaborationInquiry copyWith({
    int? id,
    String? name,
    String? email,
    String? organization,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      if (organization != null) 'organization': organization,
      'partnershipTrack': partnershipTrack,
      'message': message,
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
      'name': name,
      'email': email,
      'organization': organization,
      'partnershipTrack': partnershipTrack,
      'message': message,
      'trackingId': trackingId,
      'submittedAt': submittedAt,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      if (organization != null) 'organization': organization,
      'partnershipTrack': partnershipTrack,
      'message': message,
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
      case 'name':
        name = value;
        return;
      case 'email':
        email = value;
        return;
      case 'organization':
        organization = value;
        return;
      case 'partnershipTrack':
        partnershipTrack = value;
        return;
      case 'message':
        message = value;
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
  static Future<List<CollaborationInquiry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CollaborationInquiry>(
      where: where != null ? where(CollaborationInquiry.t) : null,
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
  static Future<CollaborationInquiry?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<CollaborationInquiry>(
      where: where != null ? where(CollaborationInquiry.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<CollaborationInquiry?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<CollaborationInquiry>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CollaborationInquiryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CollaborationInquiry>(
      where: where(CollaborationInquiry.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    CollaborationInquiry row, {
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
    CollaborationInquiry row, {
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
    CollaborationInquiry row, {
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
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CollaborationInquiry>(
      where: where != null ? where(CollaborationInquiry.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static CollaborationInquiryInclude include() {
    return CollaborationInquiryInclude._();
  }

  static CollaborationInquiryIncludeList includeList({
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollaborationInquiryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollaborationInquiryTable>? orderByList,
    CollaborationInquiryInclude? include,
  }) {
    return CollaborationInquiryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CollaborationInquiry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CollaborationInquiry.t),
      include: include,
    );
  }
}

class _Undefined {}

class _CollaborationInquiryImpl extends CollaborationInquiry {
  _CollaborationInquiryImpl({
    int? id,
    required String name,
    required String email,
    String? organization,
    required String partnershipTrack,
    required String message,
    required String trackingId,
    required DateTime submittedAt,
    required String status,
  }) : super._(
          id: id,
          name: name,
          email: email,
          organization: organization,
          partnershipTrack: partnershipTrack,
          message: message,
          trackingId: trackingId,
          submittedAt: submittedAt,
          status: status,
        );

  @override
  CollaborationInquiry copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    Object? organization = _Undefined,
    String? partnershipTrack,
    String? message,
    String? trackingId,
    DateTime? submittedAt,
    String? status,
  }) {
    return CollaborationInquiry(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      organization: organization is String? ? organization : this.organization,
      partnershipTrack: partnershipTrack ?? this.partnershipTrack,
      message: message ?? this.message,
      trackingId: trackingId ?? this.trackingId,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
    );
  }
}

class CollaborationInquiryTable extends _i1.Table {
  CollaborationInquiryTable({super.tableRelation})
      : super(tableName: 'collaboration_inquiry') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    organization = _i1.ColumnString(
      'organization',
      this,
    );
    partnershipTrack = _i1.ColumnString(
      'partnershipTrack',
      this,
    );
    message = _i1.ColumnString(
      'message',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnString email;

  late final _i1.ColumnString organization;

  late final _i1.ColumnString partnershipTrack;

  late final _i1.ColumnString message;

  late final _i1.ColumnString trackingId;

  late final _i1.ColumnDateTime submittedAt;

  late final _i1.ColumnString status;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        email,
        organization,
        partnershipTrack,
        message,
        trackingId,
        submittedAt,
        status,
      ];
}

@Deprecated('Use CollaborationInquiryTable.t instead.')
CollaborationInquiryTable tCollaborationInquiry = CollaborationInquiryTable();

class CollaborationInquiryInclude extends _i1.IncludeObject {
  CollaborationInquiryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => CollaborationInquiry.t;
}

class CollaborationInquiryIncludeList extends _i1.IncludeList {
  CollaborationInquiryIncludeList._({
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CollaborationInquiry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => CollaborationInquiry.t;
}

class CollaborationInquiryRepository {
  const CollaborationInquiryRepository._();

  Future<List<CollaborationInquiry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollaborationInquiryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollaborationInquiryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<CollaborationInquiry>(
      where: where?.call(CollaborationInquiry.t),
      orderBy: orderBy?.call(CollaborationInquiry.t),
      orderByList: orderByList?.call(CollaborationInquiry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<CollaborationInquiry?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? offset,
    _i1.OrderByBuilder<CollaborationInquiryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollaborationInquiryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<CollaborationInquiry>(
      where: where?.call(CollaborationInquiry.t),
      orderBy: orderBy?.call(CollaborationInquiry.t),
      orderByList: orderByList?.call(CollaborationInquiry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<CollaborationInquiry?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<CollaborationInquiry>(
      id,
      transaction: transaction,
    );
  }

  Future<List<CollaborationInquiry>> insert(
    _i1.Session session,
    List<CollaborationInquiry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<CollaborationInquiry>(
      rows,
      transaction: transaction,
    );
  }

  Future<CollaborationInquiry> insertRow(
    _i1.Session session,
    CollaborationInquiry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<CollaborationInquiry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<CollaborationInquiry>> update(
    _i1.Session session,
    List<CollaborationInquiry> rows, {
    _i1.ColumnSelections<CollaborationInquiryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<CollaborationInquiry>(
      rows,
      columns: columns?.call(CollaborationInquiry.t),
      transaction: transaction,
    );
  }

  Future<CollaborationInquiry> updateRow(
    _i1.Session session,
    CollaborationInquiry row, {
    _i1.ColumnSelections<CollaborationInquiryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<CollaborationInquiry>(
      row,
      columns: columns?.call(CollaborationInquiry.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<CollaborationInquiry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<CollaborationInquiry>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    CollaborationInquiry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<CollaborationInquiry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CollaborationInquiryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<CollaborationInquiry>(
      where: where(CollaborationInquiry.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollaborationInquiryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<CollaborationInquiry>(
      where: where?.call(CollaborationInquiry.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
