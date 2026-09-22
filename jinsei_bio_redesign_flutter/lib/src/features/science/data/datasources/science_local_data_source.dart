import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/failures/science_failure.dart';
import '../../domain/models/science_content_model.dart';

abstract class IScienceLocalDataSource {
  Future<ScienceContentModel> fetchScienceContent();
}

class ScienceLocalDataSource implements IScienceLocalDataSource {
  final AssetBundle _bundle;
  final String _assetPath;

  ScienceLocalDataSource({
    AssetBundle? bundle,
    String assetPath = 'assets/data/science_content.json',
  })  : _bundle = bundle ?? rootBundle,
        _assetPath = assetPath;

  @override
  Future<ScienceContentModel> fetchScienceContent() async {
    try {
      final jsonString = await _bundle.loadString(_assetPath);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return ScienceContentModel.fromJson(jsonMap);
    } catch (e, stack) {
      if (e is FormatException) {
        throw ScienceParseFailure('Failed to parse science content JSON', e);
      }
      throw ScienceAssetLoadFailure(
          'Failed to load asset at $_assetPath', stack);
    }
  }
}
