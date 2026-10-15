import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/failures/team_failure.dart';
import '../../domain/models/leadership_content_model.dart';

abstract class ITeamLocalDataSource {
  Future<LeadershipContentModel> fetchLeadershipContent();
}

class TeamLocalDataSource implements ITeamLocalDataSource {
  final AssetBundle _bundle;
  final String _assetPath;

  TeamLocalDataSource({
    AssetBundle? bundle,
    String assetPath = 'assets/data/leadership_content.json',
  })  : _bundle = bundle ?? rootBundle,
        _assetPath = assetPath;

  @override
  Future<LeadershipContentModel> fetchLeadershipContent() async {
    try {
      final jsonString = await _bundle.loadString(_assetPath);
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return LeadershipContentModel.fromJson(jsonMap);
    } catch (e, stack) {
      if (e is FormatException) {
        throw TeamParseFailure('Failed to parse leadership content JSON', e);
      }
      throw TeamAssetLoadFailure('Failed to load asset at $_assetPath', stack);
    }
  }
}
