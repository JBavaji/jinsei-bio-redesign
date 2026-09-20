import 'package:equatable/equatable.dart';

class NavItemModel extends Equatable {
  final String id;
  final String title;
  final String route;
  final String iconKey;
  final bool isDesktopVisible;
  final bool isMobileVisible;

  const NavItemModel({
    required this.id,
    required this.title,
    required this.route,
    required this.iconKey,
    this.isDesktopVisible = true,
    this.isMobileVisible = true,
  });

  factory NavItemModel.fromJson(Map<String, dynamic> json) {
    return NavItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      route: json['route'] as String,
      iconKey: json['iconKey'] as String,
      isDesktopVisible: json['isDesktopVisible'] as bool? ?? true,
      isMobileVisible: json['isMobileVisible'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'route': route,
      'iconKey': iconKey,
      'isDesktopVisible': isDesktopVisible,
      'isMobileVisible': isMobileVisible,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        route,
        iconKey,
        isDesktopVisible,
        isMobileVisible,
      ];
}
