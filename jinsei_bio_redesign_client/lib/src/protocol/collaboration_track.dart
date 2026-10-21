/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class CollaborationTrack extends _i1.SerializableEntity {
  CollaborationTrack._({
    required this.trackId,
    required this.title,
    required this.badge,
    required this.description,
    required this.deliverables,
    required this.iconKey,
  });

  factory CollaborationTrack({
    required String trackId,
    required String title,
    required String badge,
    required String description,
    required List<String> deliverables,
    required String iconKey,
  }) = _CollaborationTrackImpl;

  factory CollaborationTrack.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CollaborationTrack(
      trackId: serializationManager
          .deserialize<String>(jsonSerialization['trackId']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      badge:
          serializationManager.deserialize<String>(jsonSerialization['badge']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      deliverables: serializationManager
          .deserialize<List<String>>(jsonSerialization['deliverables']),
      iconKey: serializationManager
          .deserialize<String>(jsonSerialization['iconKey']),
    );
  }

  String trackId;

  String title;

  String badge;

  String description;

  List<String> deliverables;

  String iconKey;

  CollaborationTrack copyWith({
    String? trackId,
    String? title,
    String? badge,
    String? description,
    List<String>? deliverables,
    String? iconKey,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'trackId': trackId,
      'title': title,
      'badge': badge,
      'description': description,
      'deliverables': deliverables.toJson(),
      'iconKey': iconKey,
    };
  }
}

class _CollaborationTrackImpl extends CollaborationTrack {
  _CollaborationTrackImpl({
    required String trackId,
    required String title,
    required String badge,
    required String description,
    required List<String> deliverables,
    required String iconKey,
  }) : super._(
          trackId: trackId,
          title: title,
          badge: badge,
          description: description,
          deliverables: deliverables,
          iconKey: iconKey,
        );

  @override
  CollaborationTrack copyWith({
    String? trackId,
    String? title,
    String? badge,
    String? description,
    List<String>? deliverables,
    String? iconKey,
  }) {
    return CollaborationTrack(
      trackId: trackId ?? this.trackId,
      title: title ?? this.title,
      badge: badge ?? this.badge,
      description: description ?? this.description,
      deliverables: deliverables ?? this.deliverables.clone(),
      iconKey: iconKey ?? this.iconKey,
    );
  }
}
