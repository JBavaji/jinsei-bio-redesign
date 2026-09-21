import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';
import 'mobile_nav_item.dart';

class DrawerNavMatrix extends StatelessWidget {
  final bool isDark;

  const DrawerNavMatrix({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        final mobileItems =
            navState.items.where((item) => item.isMobileVisible).toList();

        return Column(
          children: mobileItems.map((item) {
            final isActive = navState.activeRoute == item.route ||
                (item.route == '/' && navState.activeRoute == '/home');

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: MobileNavItem(
                title: item.title,
                isActive: isActive,
                isDark: isDark,
                onTap: () {
                  Navigator.of(context).pop();
                  context.read<NavigationBloc>().add(
                        SelectNavItemEvent(item.route),
                      );
                  context.go(item.route);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
