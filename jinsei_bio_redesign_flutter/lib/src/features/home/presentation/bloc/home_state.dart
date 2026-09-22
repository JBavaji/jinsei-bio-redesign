import 'package:equatable/equatable.dart';
import '../../data/models/executive_stat_model.dart';
import '../../data/models/pillar_item_model.dart';
import '../../data/models/product_vertical_model.dart';

enum HomeStatus { idle, loading, loaded, success, failed }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<PillarItemModel> pillars;
  final List<ExecutiveStatModel> executiveStats;
  final List<ProductVerticalModel> productVerticals;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.idle,
    this.pillars = const [],
    this.executiveStats = const [],
    this.productVerticals = const [],
    this.errorMessage,
  });

  bool get isIdle => status == HomeStatus.idle;
  bool get isLoading => status == HomeStatus.loading;
  bool get isLoaded => status == HomeStatus.loaded;
  bool get isSuccess => status == HomeStatus.success;
  bool get isFailed => status == HomeStatus.failed;

  HomeState copyWith({
    HomeStatus? status,
    List<PillarItemModel>? pillars,
    List<ExecutiveStatModel>? executiveStats,
    List<ProductVerticalModel>? productVerticals,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      pillars: pillars ?? this.pillars,
      executiveStats: executiveStats ?? this.executiveStats,
      productVerticals: productVerticals ?? this.productVerticals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pillars,
        executiveStats,
        productVerticals,
        errorMessage,
      ];
}
