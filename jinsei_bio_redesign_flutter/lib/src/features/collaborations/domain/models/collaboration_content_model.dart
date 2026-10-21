import 'package:equatable/equatable.dart';
import 'collaboration_contact_info_model.dart';
import 'collaboration_track_model.dart';

class CollaborationContentModel extends Equatable {
  final String headlineBadge;
  final String heroTitle;
  final String heroSubtitle;
  final List<CollaborationTrackModel> tracks;
  final CollaborationContactInfoModel contactInfo;
  final String governanceTitle;
  final String governanceDescription;

  const CollaborationContentModel({
    required this.headlineBadge,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.tracks,
    required this.contactInfo,
    required this.governanceTitle,
    required this.governanceDescription,
  });

  factory CollaborationContentModel.fromJson(Map<String, dynamic> json) {
    return CollaborationContentModel(
      headlineBadge: json['headlineBadge'] as String? ?? '',
      heroTitle: json['heroTitle'] as String? ?? '',
      heroSubtitle: json['heroSubtitle'] as String? ?? '',
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) =>
                  CollaborationTrackModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      contactInfo: json['contactInfo'] != null
          ? CollaborationContactInfoModel.fromJson(
              json['contactInfo'] as Map<String, dynamic>)
          : const CollaborationContactInfoModel(
              supportEmail: '',
              supportNotice: '',
              facilityName: '',
              facilityAddress: '',
              facilityCoordinates: '',
              visitingTimings: '',
              visitingStatus: '',
              standards: [],
            ),
      governanceTitle: json['governanceTitle'] as String? ?? '',
      governanceDescription: json['governanceDescription'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'headlineBadge': headlineBadge,
      'heroTitle': heroTitle,
      'heroSubtitle': heroSubtitle,
      'tracks': tracks.map((e) => e.toJson()).toList(),
      'contactInfo': contactInfo.toJson(),
      'governanceTitle': governanceTitle,
      'governanceDescription': governanceDescription,
    };
  }

  @override
  List<Object?> get props => [
        headlineBadge,
        heroTitle,
        heroSubtitle,
        tracks,
        contactInfo,
        governanceTitle,
        governanceDescription,
      ];
}
