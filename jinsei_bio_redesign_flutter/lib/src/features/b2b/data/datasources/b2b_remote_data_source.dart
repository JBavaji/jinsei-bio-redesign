import 'dart:async';
import 'package:jinsei_bio_redesign_client/jinsei_bio_redesign_client.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/models/b2b_modal_content_model.dart';
import '../../domain/models/b2b_sample_request_model.dart';
import '../../domain/models/formulation_format_option_model.dart';
import '../../domain/models/strain_vertical_option_model.dart';

abstract class IB2bRemoteDataSource {
  Future<B2bModalContentModel?> getModalContent({
    Duration timeout = const Duration(milliseconds: 5000),
  });
  Future<String?> submitSampleRequest(
    B2bSampleRequestModel request, {
    Duration timeout = const Duration(milliseconds: 5000),
  });
}

class B2bRemoteDataSource implements IB2bRemoteDataSource {
  final Client _client;

  B2bRemoteDataSource({Client? client})
      : _client = client ?? Client(AppConfig.serverpodUrl);

  @override
  Future<B2bModalContentModel?> getModalContent({
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final response = await _client.b2b.getModalContent().timeout(timeout);

      final strains = response.strains
          .map((s) => StrainVerticalOptionModel(
                strainId: s.strainId,
                category: s.category,
                name: s.name,
                strainCode: s.strainCode,
                highlight: s.highlight,
                defaultFormat: s.defaultFormat,
                displayOrder: s.displayOrder,
              ))
          .toList();

      final formats = response.formulationFormats
          .map((f) => FormulationFormatOptionModel(
                formatId: f.formatId,
                label: f.label,
                displayOrder: f.displayOrder,
              ))
          .toList();

      return B2bModalContentModel(
        badgeText: response.badgeText,
        title: response.title,
        subtitle: response.subtitle,
        strains: strains,
        formulationFormats: formats,
        complianceNote: response.complianceNote,
        certifications: response.certifications,
        dispatchNotice: response.dispatchNotice,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<String?> submitSampleRequest(
    B2bSampleRequestModel request, {
    Duration timeout = const Duration(milliseconds: 5000),
  }) async {
    try {
      final serverRequest = B2bSampleRequest(
        strainId: request.strainId,
        fullName: request.fullName,
        email: request.email,
        company: request.company,
        formulationFormat: request.formulationFormat,
        clinicalScope: request.clinicalScope,
        trackingId: request.trackingId,
        submittedAt: request.submittedAt ?? DateTime.now(),
        status: request.status,
      );

      final trackingId =
          await _client.b2b.submitSampleRequest(serverRequest).timeout(timeout);
      return trackingId;
    } catch (_) {
      return null;
    }
  }
}
