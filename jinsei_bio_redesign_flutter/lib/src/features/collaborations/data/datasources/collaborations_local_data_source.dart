import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/failures/collaborations_failure.dart';
import '../../domain/models/collaboration_content_model.dart';
import '../../domain/models/collaboration_inquiry_model.dart';

abstract class ICollaborationsLocalDataSource {
  Future<CollaborationContentModel> fetchCollaborationsContent();
  Future<String> saveOfflineInquiry(CollaborationInquiryModel inquiry);
}

class CollaborationsLocalDataSource implements ICollaborationsLocalDataSource {
  static const String _assetPath = 'assets/data/collaborations_content.json';
  final AssetBundle? _bundle;

  CollaborationsLocalDataSource({AssetBundle? bundle}) : _bundle = bundle;

  AssetBundle get _activeBundle => _bundle ?? rootBundle;

  @override
  Future<CollaborationContentModel> fetchCollaborationsContent() async {
    try {
      final jsonString = await _activeBundle.loadString(_assetPath);
      final dynamic decoded = json.decode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return CollaborationContentModel.fromJson(decoded);
      }
      throw const CollaborationsValidationFailure(
          'Invalid JSON structure in collaborations_content.json');
    } catch (e) {
      if (e is CollaborationsFailure) rethrow;
      throw CollaborationsValidationFailure(
          'Failed to load local collaborations content asset: $e', e);
    }
  }

  @override
  Future<String> saveOfflineInquiry(CollaborationInquiryModel inquiry) async {
    final trackingId = inquiry.trackingId.isNotEmpty
        ? inquiry.trackingId
        : 'JIN-COL-2026-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    return trackingId;
  }
}
