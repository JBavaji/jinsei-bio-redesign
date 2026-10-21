import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/failures/b2b_failure.dart';
import '../../domain/models/b2b_modal_content_model.dart';
import '../../domain/models/b2b_sample_request_model.dart';

abstract class IB2bLocalDataSource {
  Future<B2bModalContentModel> fetchModalContent();
  Future<String> saveOfflineRequest(B2bSampleRequestModel request);
}

class B2bLocalDataSource implements IB2bLocalDataSource {
  static const String _assetPath = 'assets/data/b2b_modal_content.json';
  final AssetBundle? _bundle;

  B2bLocalDataSource({AssetBundle? bundle}) : _bundle = bundle;

  AssetBundle get _activeBundle => _bundle ?? rootBundle;

  @override
  Future<B2bModalContentModel> fetchModalContent() async {
    try {
      final jsonString = await _activeBundle.loadString(_assetPath);
      final dynamic decoded = json.decode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return B2bModalContentModel.fromJson(decoded);
      }
      throw const B2bValidationFailure(
          'Invalid JSON structure in b2b_modal_content.json');
    } catch (e) {
      if (e is B2bFailure) rethrow;
      throw B2bValidationFailure(
          'Failed to load local B2B modal content asset: $e', e);
    }
  }

  @override
  Future<String> saveOfflineRequest(B2bSampleRequestModel request) async {
    final trackingId = request.trackingId.isNotEmpty
        ? request.trackingId
        : 'JIN-REQ-2026-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    return trackingId;
  }
}
