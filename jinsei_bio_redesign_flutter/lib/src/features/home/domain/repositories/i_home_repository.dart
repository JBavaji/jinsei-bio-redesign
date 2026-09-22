import '../models/home_content_model.dart';

abstract class IHomeRepository {
  Future<HomeContentModel> getHomeContent();
}
