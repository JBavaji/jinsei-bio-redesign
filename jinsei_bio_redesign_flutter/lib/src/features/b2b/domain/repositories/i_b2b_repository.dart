import '../models/b2b_modal_content_model.dart';
import '../models/b2b_sample_request_model.dart';

abstract class IB2bRepository {
  Future<B2bModalContentModel> getModalContent();
  Future<String> submitSampleRequest(B2bSampleRequestModel request);
}
