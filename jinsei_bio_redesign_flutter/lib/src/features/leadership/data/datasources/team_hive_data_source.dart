import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/leadership_content_model.dart';

abstract class ITeamHiveDataSource {
  Future<LeadershipContentModel?> getCachedLeadershipContent();
  Future<void> saveLeadershipContent(LeadershipContentModel content);
  Future<void> clearCache();
}

class TeamHiveDataSource implements ITeamHiveDataSource {
  final Box? _box;
  final String _boxName;

  TeamHiveDataSource({
    Box? box,
    String boxName = 'team_content_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<LeadershipContentModel?> getCachedLeadershipContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('leadership_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return LeadershipContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveLeadershipContent(LeadershipContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('leadership_content', jsonString);
    } catch (_) {
      // Gracefully ignore local cache write errors
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('leadership_content');
    } catch (_) {}
  }
}
