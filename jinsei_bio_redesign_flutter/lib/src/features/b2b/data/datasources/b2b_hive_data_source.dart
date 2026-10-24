import 'dart:convert';
import 'package:hive_ce/hive.dart';
import '../../domain/models/b2b_modal_content_model.dart';

abstract class IB2bHiveDataSource {
  Future<B2bModalContentModel?> getCachedModalContent();
  Future<void> saveModalContent(B2bModalContentModel content);
  Future<void> clearCache();
}

class B2bHiveDataSource implements IB2bHiveDataSource {
  final Box? _box;
  final String _boxName;

  B2bHiveDataSource({
    Box? box,
    String boxName = 'b2b_modal_box',
  })  : _box = box,
        _boxName = boxName;

  Future<Box> _getBox() async {
    final box = _box;
    if (box != null && box.isOpen) return box;
    if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);
    return await Hive.openBox(_boxName);
  }

  @override
  Future<B2bModalContentModel?> getCachedModalContent() async {
    try {
      final box = await _getBox();
      final jsonString = box.get('b2b_modal_content') as String?;
      if (jsonString == null || jsonString.isEmpty) return null;
      final map = jsonDecode(jsonString) as Map<String, dynamic>;
      return B2bModalContentModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> saveModalContent(B2bModalContentModel content) async {
    try {
      final box = await _getBox();
      final jsonString = jsonEncode(content.toJson());
      await box.put('b2b_modal_content', jsonString);
    } catch (_) {
      // Gracefully ignore local cache write errors
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final box = await _getBox();
      await box.delete('b2b_modal_content');
    } catch (_) {}
  }
}
