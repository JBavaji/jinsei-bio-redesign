import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/science_content_model.dart';

abstract class IScienceHiveDataSource {
  Future<ScienceContentModel?> getCachedScienceContent();
  Future<void> saveScienceContent(ScienceContentModel content);
  Future<void> clearCache();
}

class ScienceHiveDataSource implements IScienceHiveDataSource {
  final Box? _box;
  final String _boxName;

  ScienceHiveDataSource({
    Box? box,
    String boxName = 'science_content_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<ScienceContentModel?> getCachedScienceContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('science_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return ScienceContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveScienceContent(ScienceContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('science_content', jsonString);
    } catch (_) {
      // Gracefully ignore local cache write errors
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('science_content');
    } catch (_) {}
  }
}
