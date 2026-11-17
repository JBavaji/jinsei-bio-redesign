import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/collaboration_content_model.dart';

abstract class ICollaborationsHiveDataSource {
  Future<CollaborationContentModel?> getCachedCollaborationsContent();
  Future<void> saveCollaborationsContent(CollaborationContentModel content);
  Future<void> clearCache();
}

class CollaborationsHiveDataSource implements ICollaborationsHiveDataSource {
  final Box? _box;
  final String _boxName;

  CollaborationsHiveDataSource({
    Box? box,
    String boxName = 'collaborations_content_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<CollaborationContentModel?> getCachedCollaborationsContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('collaborations_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return CollaborationContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveCollaborationsContent(
      CollaborationContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('collaborations_content', jsonString);
    } catch (_) {
      // Gracefully ignore local cache write errors
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('collaborations_content');
    } catch (_) {}
  }
}
