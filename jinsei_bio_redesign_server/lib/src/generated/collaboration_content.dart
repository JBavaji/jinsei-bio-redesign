/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class CollaborationContent extends _i1.SerializableEntity {
  CollaborationContent._({
    required this.headlineBadge,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.tracks,
    required this.contactInfo,
    required this.governanceTitle,
    required this.governanceDescription,
  });

  factory CollaborationContent({
    required String headlineBadge,
    required String heroTitle,
    required String heroSubtitle,
    required List<_i2.CollaborationTrack> tracks,
    required _i2.CollaborationContactInfo contactInfo,
    required String governanceTitle,
    required String governanceDescription,
  }) = _CollaborationContentImpl;

  factory CollaborationContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationContent(
      headlineBadge: serializationManager
          .deserialize<String>(jsonSerialization['headlineBadge']),
      heroTitle: serializationManager
          .deserialize<String>(jsonSerialization['heroTitle']),
      heroSubtitle: serializationManager
          .deserialize<String>(jsonSerialization['heroSubtitle']),
      tracks: serializationManager.deserialize<List<_i2.CollaborationTrack>>(
          jsonSerialization['tracks']),
      contactInfo:
          serializationManager.deserialize<_i2.CollaborationContactInfo>(
              jsonSerialization['contactInfo']),
      governanceTitle: serializationManager
          .deserialize<String>(jsonSerialization['governanceTitle']),
      governanceDescription: serializationManager
          .deserialize<String>(jsonSerialization['governanceDescription']),
    );
  }

  String headlineBadge;

  String heroTitle;

  String heroSubtitle;

  List<_i2.CollaborationTrack> tracks;

  _i2.CollaborationContactInfo contactInfo;

  String governanceTitle;

  String governanceDescription;

  CollaborationContent copyWith({
    String? headlineBadge,
    String? heroTitle,
    String? heroSubtitle,
    List<_i2.CollaborationTrack>? tracks,
    _i2.CollaborationContactInfo? contactInfo,
    String? governanceTitle,
    String? governanceDescription,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'headlineBadge': headlineBadge,
      'heroTitle': heroTitle,
      'heroSubtitle': heroSubtitle,
      'tracks': tracks.toJson(valueToJson: (v) => v.toJson()),
      'contactInfo': contactInfo.toJson(),
      'governanceTitle': governanceTitle,
      'governanceDescription': governanceDescription,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'headlineBadge': headlineBadge,
      'heroTitle': heroTitle,
      'heroSubtitle': heroSubtitle,
      'tracks': tracks.toJson(valueToJson: (v) => v.allToJson()),
      'contactInfo': contactInfo.allToJson(),
      'governanceTitle': governanceTitle,
      'governanceDescription': governanceDescription,
    };
  }
}

class _CollaborationContentImpl extends CollaborationContent {
  _CollaborationContentImpl({
    required String headlineBadge,
    required String heroTitle,
    required String heroSubtitle,
    required List<_i2.CollaborationTrack> tracks,
    required _i2.CollaborationContactInfo contactInfo,
    required String governanceTitle,
    required String governanceDescription,
  }) : super._(
          headlineBadge: headlineBadge,
          heroTitle: heroTitle,
          heroSubtitle: heroSubtitle,
          tracks: tracks,
          contactInfo: contactInfo,
          governanceTitle: governanceTitle,
          governanceDescription: governanceDescription,
        );

  @override
  CollaborationContent copyWith({
    String? headlineBadge,
    String? heroTitle,
    String? heroSubtitle,
    List<_i2.CollaborationTrack>? tracks,
    _i2.CollaborationContactInfo? contactInfo,
    String? governanceTitle,
    String? governanceDescription,
  }) {
    return CollaborationContent(
      headlineBadge: headlineBadge ?? this.headlineBadge,
      heroTitle: heroTitle ?? this.heroTitle,
      heroSubtitle: heroSubtitle ?? this.heroSubtitle,
      tracks: tracks ?? this.tracks.clone(),
      contactInfo: contactInfo ?? this.contactInfo.copyWith(),
      governanceTitle: governanceTitle ?? this.governanceTitle,
      governanceDescription:
          governanceDescription ?? this.governanceDescription,
    );
  }
}
