import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';
import 'desktop_tab_item.dart';

class HeaderDesktopNavRow extends StatelessWidget {
  final bool isDark;

  const HeaderDesktopNavRow({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, navState) {
        final desktopItems =
            navState.items.where((item) => item.isDesktopVisible).toList();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: desktopItems.map((item) {
            final isActive = navState.activeRoute == item.route;
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: DesktopTabItem(
                title: item.title,
                isActive: isActive,
                isDark: isDark,
                onTap: () {
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
