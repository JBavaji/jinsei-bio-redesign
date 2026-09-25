import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../domain/models/home_content_model.dart';
import '../models/executive_stat_model.dart';
import '../models/pillar_item_model.dart';
import '../models/product_vertical_model.dart';

abstract class IHomeRemoteDataSource {
  Future<HomeContentModel?> getHomeContent(
      {Duration timeout = const Duration(milliseconds: 5000)});
}

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  final Client _client;

  HomeRemoteDataSource({Client? client})
      : _client = client ?? Client('http://localhost:8080/');

  @override
  Future<HomeContentModel?> getHomeContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response = await _client.home.getHomeContent().timeout(timeout);

      final pillars = response.pillars
          .map((p) => PillarItemModel(
                iconKey: p.iconKey,
                icon: PillarItemModel.iconFromKey(p.iconKey),
                title: p.title,
                description: p.description,
              ))
          .toList();

      final stats = response.executiveStats
          .map((s) => ExecutiveStatModel(
                iconKey: s.iconKey,
                icon: ExecutiveStatModel.iconFromKey(s.iconKey),
                title: s.title,
                subtitle: s.subtitle,
              ))
          .toList();

      final verticals = response.productVerticals
          .map((v) => ProductVerticalModel(
                title: v.title,
                strainId: v.strainId,
                description: v.description,
              ))
          .toList();

      return HomeContentModel(
        pillars: pillars,
        executiveStats: stats,
        productVerticals: verticals,
      );
    } catch (_) {
      return null;
    }
  }
}
