import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/home_content_model.dart';

abstract class IHomeHiveDataSource {
  Future<HomeContentModel?> getCachedHomeContent();
  Future<void> saveHomeContent(HomeContentModel content);
  Future<void> clearCache();
}

class HomeHiveDataSource implements IHomeHiveDataSource {
  final Box? _box;
  final String _boxName;

  HomeHiveDataSource({
    Box? box,
    String boxName = 'home_content_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<HomeContentModel?> getCachedHomeContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('home_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return HomeContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveHomeContent(HomeContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('home_content', jsonString);
    } catch (_) {
      // Handle or log cache write failure silently
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('home_content');
    } catch (_) {}
  }
}
