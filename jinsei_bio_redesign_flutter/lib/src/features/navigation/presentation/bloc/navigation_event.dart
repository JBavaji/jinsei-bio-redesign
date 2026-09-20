import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object?> get props => [];
}

class LoadNavigationItemsEvent extends NavigationEvent {
  const LoadNavigationItemsEvent();
}

class SelectNavItemEvent extends NavigationEvent {
  final String route;

  const SelectNavItemEvent(this.route);

  @override
  List<Object?> get props => [route];
}

class SyncActiveRouteEvent extends NavigationEvent {
  final String route;

  const SyncActiveRouteEvent(this.route);

  @override
  List<Object?> get props => [route];
}
