import 'package:equatable/equatable.dart';
import '../../data/models/nav_item_model.dart';

abstract class NavigationState extends Equatable {
  final String activeRoute;
  final List<NavItemModel> items;

  const NavigationState({
    this.activeRoute = '/',
    this.items = const [],
  });

  @override
  List<Object?> get props => [activeRoute, items];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(activeRoute: '/', items: const []);
}

class NavigationLoading extends NavigationState {
  const NavigationLoading({super.activeRoute, super.items});
}

class NavigationLoaded extends NavigationState {
  const NavigationLoaded({
    required super.activeRoute,
    required super.items,
  });

  NavigationLoaded copyWith({
    String? activeRoute,
    List<NavItemModel>? items,
  }) {
    return NavigationLoaded(
      activeRoute: activeRoute ?? this.activeRoute,
      items: items ?? this.items,
    );
  }
}
