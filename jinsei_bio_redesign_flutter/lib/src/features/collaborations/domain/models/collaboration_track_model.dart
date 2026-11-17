import 'package:equatable/equatable.dart';

class CollaborationTrackModel extends Equatable {
  final String trackId;
  final String title;
  final String badge;
  final String description;
  final List<String> deliverables;
  final String iconKey;

  const CollaborationTrackModel({
    required this.trackId,
    required this.title,
    required this.badge,
    required this.description,
    required this.deliverables,
    required this.iconKey,
  });

  factory CollaborationTrackModel.fromJson(Map<String, dynamic> json) {
    return CollaborationTrackModel(
      trackId: json['trackId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      badge: json['badge'] as String? ?? '',
      description: json['description'] as String? ?? '',
      deliverables: (json['deliverables'] is List
          ? (json['deliverables'] as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : const <String>[]),
      iconKey: json['iconKey'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trackId': trackId,
      'title': title,
      'badge': badge,
      'description': description,
      'deliverables': deliverables,
      'iconKey': iconKey,
    };
  }

  @override
  List<Object?> get props => [
        trackId,
        title,
        badge,
        description,
        deliverables,
        iconKey,
      ];
}
