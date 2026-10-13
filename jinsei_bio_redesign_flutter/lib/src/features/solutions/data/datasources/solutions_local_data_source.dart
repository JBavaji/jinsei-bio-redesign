import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/failures/solutions_failure.dart';
import '../../domain/models/solutions_content_model.dart';

abstract class ISolutionsLocalDataSource {
  Future<SolutionsContentModel> fetchSolutionsContent();
}

class SolutionsLocalDataSource implements ISolutionsLocalDataSource {
  final AssetBundle _bundle;
  final String _assetPath;

  SolutionsLocalDataSource({
    AssetBundle? bundle,
    String assetPath = 'assets/data/solutions_content.json',
  })  : _bundle = bundle ?? rootBundle,
        _assetPath = assetPath;

  @override
  Future<SolutionsContentModel> fetchSolutionsContent() async {
    try {
      final jsonString = await _bundle.loadString(_assetPath);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return SolutionsContentModel.fromJson(jsonMap);
    } catch (e, stack) {
      if (e is FormatException) {
        throw SolutionsParseFailure(
            'Failed to parse solutions content JSON', e);
      }
      throw SolutionsAssetLoadFailure(
          'Failed to load asset at $_assetPath', stack);
    }
  }
}
