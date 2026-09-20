import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/nav_item_model.dart';

class NavigationRepository {
  final String _assetPath;

  const NavigationRepository({
    String assetPath = 'assets/config/navigation_items.json',
  }) : _assetPath = assetPath;

  Future<List<NavItemModel>> loadNavigationItems() async {
    final jsonString = await rootBundle.loadString(_assetPath);
    final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
    return jsonList
        .map((item) => NavItemModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static List<NavItemModel> get fallbackNavigationItems => const [
        NavItemModel(
          id: 'overview',
          title: 'Overview',
          route: '/',
          iconKey: 'grid_view_rounded',
          isDesktopVisible: false,
          isMobileVisible: true,
        ),
        NavItemModel(
          id: 'science',
          title: 'SCIENCE & TECH',
          route: '/science',
          iconKey: 'biotech_rounded',
        ),
        NavItemModel(
          id: 'solutions',
          title: 'SOLUTIONS',
          route: '/solutions',
          iconKey: 'hub_rounded',
        ),
        NavItemModel(
          id: 'leadership',
          title: 'LEADERSHIP',
          route: '/leadership',
          iconKey: 'people_rounded',
        ),
        NavItemModel(
          id: 'collaborations',
          title: 'COLLABORATIONS',
          route: '/collaborations',
          iconKey: 'handshake_rounded',
        ),
      ];
}
