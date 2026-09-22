import '../../data/models/executive_stat_model.dart';
import '../../data/models/pillar_item_model.dart';
import '../../data/models/product_vertical_model.dart';

class HomeContentModel {
  final List<PillarItemModel> pillars;
  final List<ExecutiveStatModel> executiveStats;
  final List<ProductVerticalModel> productVerticals;

  const HomeContentModel({
    required this.pillars,
    required this.executiveStats,
    required this.productVerticals,
  });

  factory HomeContentModel.fromJson(Map<String, dynamic> json) {
    final pillarsRaw = json['pillars'] as List<dynamic>? ?? [];
    final statsRaw = json['executive_stats'] as List<dynamic>? ?? [];
    final verticalsRaw = json['product_verticals'] as List<dynamic>? ?? [];

    final pillars = pillarsRaw
        .map((e) => PillarItemModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final stats = statsRaw
        .map((e) => ExecutiveStatModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final verticals = verticalsRaw
        .map((e) => ProductVerticalModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return HomeContentModel(
      pillars: pillars,
      executiveStats: stats,
      productVerticals: verticals,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pillars': pillars.map((p) => p.toJson()).toList(),
      'executive_stats': executiveStats.map((s) => s.toJson()).toList(),
      'product_verticals': productVerticals.map((v) => v.toJson()).toList(),
    };
  }
}
