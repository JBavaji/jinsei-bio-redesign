import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/failures/home_failure.dart';
import '../../domain/models/home_content_model.dart';

abstract class IHomeLocalDataSource {
  Future<HomeContentModel> fetchHomeContent();
}

class HomeLocalDataSource implements IHomeLocalDataSource {
  final AssetBundle _bundle;
  final String _assetPath;

  HomeLocalDataSource({
    AssetBundle? bundle,
    String assetPath = 'assets/data/home_content.json',
  })  : _bundle = bundle ?? rootBundle,
        _assetPath = assetPath;

  @override
  Future<HomeContentModel> fetchHomeContent() async {
    try {
      final jsonString = await _bundle.loadString(_assetPath);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return HomeContentModel.fromJson(jsonMap);
    } catch (e, stack) {
      if (e is FormatException) {
        throw HomeParseFailure('Failed to parse home content JSON', e);
      }
      throw HomeAssetLoadFailure(
          'Failed to load asset at $_assetPath', stack);
    }
  }
}
