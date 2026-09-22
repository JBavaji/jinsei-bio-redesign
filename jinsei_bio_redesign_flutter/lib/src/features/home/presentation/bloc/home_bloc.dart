import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/home_local_data_source.dart';
import '../../data/repositories/home_repository_impl.dart';
import '../../domain/repositories/i_home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _repository;

  HomeBloc({
    IHomeRepository? repository,
  })  : _repository = repository ??
            HomeRepositoryImpl(
              localDataSource: HomeLocalDataSource(),
            ),
        super(const HomeState()) {
    on<LoadHomeContentEvent>(_onLoadHomeContent);
  }

  Future<void> _onLoadHomeContent(
    LoadHomeContentEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final content = await _repository.getHomeContent();
      emit(state.copyWith(
        status: HomeStatus.success,
        pillars: content.pillars,
        executiveStats: content.executiveStats,
        productVerticals: content.productVerticals,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failed,
        errorMessage: e.toString(),
      ));
    }
  }
}
