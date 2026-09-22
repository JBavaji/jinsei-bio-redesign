import '../models/science_content_model.dart';

abstract class IScienceRepository {
  Future<ScienceContentModel> getScienceContent();
}
