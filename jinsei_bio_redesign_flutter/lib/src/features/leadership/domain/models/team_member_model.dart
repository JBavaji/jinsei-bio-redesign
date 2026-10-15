import 'package:equatable/equatable.dart';

import 'team_category.dart';

class TeamMemberModel extends Equatable {
  final String memberId;
  final String name;
  final String role;
  final String categoryTag;
  final String category;
  final String academicCredential;
  final String areaOfExpertise;
  final String? imageUrl;
  final int displayOrder;

  const TeamMemberModel({
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

  TeamCategory get teamCategory => TeamCategory.fromId(category);

  bool get isExecutive => category.toLowerCase() == 'executive';

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      memberId: json['memberId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      categoryTag: json['categoryTag'] as String? ?? '',
      category: json['category'] as String? ?? '',
      academicCredential: json['academicCredential'] as String? ?? '',
      areaOfExpertise: json['areaOfExpertise'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      displayOrder: json['displayOrder'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberId': memberId,
      'name': name,
      'role': role,
      'categoryTag': categoryTag,
      'category': category,
      'academicCredential': academicCredential,
      'areaOfExpertise': areaOfExpertise,
      'imageUrl': imageUrl,
      'displayOrder': displayOrder,
    };
  }

  @override
  List<Object?> get props => [
        memberId,
        name,
        role,
        categoryTag,
        category,
        academicCredential,
        areaOfExpertise,
        imageUrl,
        displayOrder,
      ];
}
