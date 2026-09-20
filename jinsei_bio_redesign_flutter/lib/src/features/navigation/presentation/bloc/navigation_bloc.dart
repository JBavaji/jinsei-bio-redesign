import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/navigation_repository.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationRepository _repository;

  NavigationBloc({
    NavigationRepository repository = const NavigationRepository(),
  })  : _repository = repository,
        super(const NavigationInitial()) {
    on<LoadNavigationItemsEvent>(_onLoadNavigationItems);
    on<SelectNavItemEvent>(_onSelectNavItem);
    on<SyncActiveRouteEvent>(_onSyncActiveRoute);
  }

  Future<void> _onLoadNavigationItems(
    LoadNavigationItemsEvent event,
    Emitter<NavigationState> emit,
  ) async {
    emit(NavigationLoading(activeRoute: state.activeRoute, items: state.items));
    try {
      final items = await _repository.loadNavigationItems();
      emit(NavigationLoaded(activeRoute: state.activeRoute, items: items));
    } catch (_) {
      emit(NavigationLoaded(
        activeRoute: state.activeRoute,
        items: NavigationRepository.fallbackNavigationItems,
      ));
    }
  }

  void _onSelectNavItem(
    SelectNavItemEvent event,
    Emitter<NavigationState> emit,
  ) {
    if (state is NavigationLoaded) {
      emit((state as NavigationLoaded).copyWith(activeRoute: event.route));
    } else {
      emit(NavigationLoaded(
        activeRoute: event.route,
        items: state.items.isNotEmpty
            ? state.items
            : NavigationRepository.fallbackNavigationItems,
      ));
    }
  }

  void _onSyncActiveRoute(
    SyncActiveRouteEvent event,
    Emitter<NavigationState> emit,
  ) {
    if (state.activeRoute != event.route) {
      if (state is NavigationLoaded) {
        emit((state as NavigationLoaded).copyWith(activeRoute: event.route));
      } else {
        emit(NavigationLoaded(
          activeRoute: event.route,
          items: state.items.isNotEmpty
              ? state.items
              : NavigationRepository.fallbackNavigationItems,
        ));
      }
    }
  }
}
