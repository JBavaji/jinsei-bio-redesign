/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TeamMember extends _i1.SerializableEntity {
  TeamMember._({
    this.id,
    required this.memberId,
    required this.name,
    required this.role,
    required this.categoryTag,
    required this.category,
    required this.academicCredential,
    required this.areaOfExpertise,
    this.imageUrl,
    required this.displayOrder,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String memberId;

  String name;

  String role;

  String categoryTag;

  String category;

  String academicCredential;

  String areaOfExpertise;

  String? imageUrl;

  int displayOrder;

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
