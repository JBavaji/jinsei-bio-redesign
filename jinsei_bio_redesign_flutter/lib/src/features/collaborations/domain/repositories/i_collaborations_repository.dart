import '../models/collaboration_content_model.dart';
import '../models/collaboration_inquiry_model.dart';

abstract class ICollaborationsRepository {
  Future<CollaborationContentModel> getCollaborationsContent();
  Future<String> submitCollaborationInquiry(CollaborationInquiryModel inquiry);
}
