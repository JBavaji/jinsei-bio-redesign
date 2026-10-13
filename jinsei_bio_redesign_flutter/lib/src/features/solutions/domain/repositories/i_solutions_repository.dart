import '../models/solution_card_model.dart';
import '../models/solution_metric_model.dart';
import '../models/solutions_content_model.dart';

abstract class ISolutionsRepository {
  Future<SolutionsContentModel> getSolutionsContent();
  Future<List<SolutionCardModel>> getSolutions();
  Future<List<SolutionCardModel>> getSolutionsByCategory(String category);
  Future<List<SolutionMetricModel>> getSolutionMetrics();
}
