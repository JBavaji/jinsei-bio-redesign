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

abstract class LeadershipContent extends _i1.SerializableEntity {
  LeadershipContent._({
    required this.headerBadge,
    required this.headline,
    required this.subhead,
    required this.emblemTitle,
    required this.emblemSubtitle,
    required this.members,
    this.governanceAssurance,
  });

  factory LeadershipContent({
    required String headerBadge,
    required String headline,
    required String subhead,
    required String emblemTitle,
    required String emblemSubtitle,
    required List<_i2.TeamMember> members,
    _i2.ClinicalQualityAssurance? governanceAssurance,
  }) = _LeadershipContentImpl;

  factory LeadershipContent.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return LeadershipContent(
      headerBadge: serializationManager
          .deserialize<String>(jsonSerialization['headerBadge']),
      headline: serializationManager
          .deserialize<String>(jsonSerialization['headline']),
      subhead: serializationManager
          .deserialize<String>(jsonSerialization['subhead']),
      emblemTitle: serializationManager
          .deserialize<String>(jsonSerialization['emblemTitle']),
      emblemSubtitle: serializationManager
          .deserialize<String>(jsonSerialization['emblemSubtitle']),
      members: serializationManager
          .deserialize<List<_i2.TeamMember>>(jsonSerialization['members']),
      governanceAssurance:
          serializationManager.deserialize<_i2.ClinicalQualityAssurance?>(
              jsonSerialization['governanceAssurance']),
    );
  }

  String headerBadge;

  String headline;

  String subhead;

  String emblemTitle;

  String emblemSubtitle;

  List<_i2.TeamMember> members;

  _i2.ClinicalQualityAssurance? governanceAssurance;

  LeadershipContent copyWith({
    String? headerBadge,
    String? headline,
    String? subhead,
    String? emblemTitle,
    String? emblemSubtitle,
    List<_i2.TeamMember>? members,
    _i2.ClinicalQualityAssurance? governanceAssurance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'headerBadge': headerBadge,
      'headline': headline,
      'subhead': subhead,
      'emblemTitle': emblemTitle,
      'emblemSubtitle': emblemSubtitle,
      'members': members.toJson(valueToJson: (v) => v.toJson()),
      if (governanceAssurance != null)
        'governanceAssurance': governanceAssurance?.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'headerBadge': headerBadge,
      'headline': headline,
      'subhead': subhead,
      'emblemTitle': emblemTitle,
      'emblemSubtitle': emblemSubtitle,
      'members': members.toJson(valueToJson: (v) => v.allToJson()),
      if (governanceAssurance != null)
        'governanceAssurance': governanceAssurance?.allToJson(),
    };
  }
}

class _Undefined {}

class _LeadershipContentImpl extends LeadershipContent {
  _LeadershipContentImpl({
    required String headerBadge,
    required String headline,
    required String subhead,
    required String emblemTitle,
    required String emblemSubtitle,
    required List<_i2.TeamMember> members,
    _i2.ClinicalQualityAssurance? governanceAssurance,
  }) : super._(
          headerBadge: headerBadge,
          headline: headline,
          subhead: subhead,
          emblemTitle: emblemTitle,
          emblemSubtitle: emblemSubtitle,
          members: members,
          governanceAssurance: governanceAssurance,
        );

  @override
  LeadershipContent copyWith({
    String? headerBadge,
    String? headline,
    String? subhead,
    String? emblemTitle,
    String? emblemSubtitle,
    List<_i2.TeamMember>? members,
    Object? governanceAssurance = _Undefined,
  }) {
    return LeadershipContent(
      headerBadge: headerBadge ?? this.headerBadge,
      headline: headline ?? this.headline,
      subhead: subhead ?? this.subhead,
      emblemTitle: emblemTitle ?? this.emblemTitle,
      emblemSubtitle: emblemSubtitle ?? this.emblemSubtitle,
      members: members ?? this.members.clone(),
      governanceAssurance: governanceAssurance is _i2.ClinicalQualityAssurance?
          ? governanceAssurance
          : this.governanceAssurance?.copyWith(),
    );
  }
}
