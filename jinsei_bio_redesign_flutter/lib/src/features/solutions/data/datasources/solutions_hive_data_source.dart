import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/solutions_content_model.dart';

abstract class ISolutionsHiveDataSource {
  Future<SolutionsContentModel?> getCachedSolutionsContent();
  Future<void> saveSolutionsContent(SolutionsContentModel content);
  Future<void> clearCache();
}

class SolutionsHiveDataSource implements ISolutionsHiveDataSource {
  final Box? _box;
  final String _boxName;

  SolutionsHiveDataSource({
    Box? box,
    String boxName = 'solutions_content_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<SolutionsContentModel?> getCachedSolutionsContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('solutions_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return SolutionsContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveSolutionsContent(SolutionsContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('solutions_content', jsonString);
    } catch (_) {
      // Gracefully ignore local cache write errors
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('solutions_content');
    } catch (_) {}
  }
}
