import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import 'header_actions_block.dart';
import 'header_desktop_nav_row.dart';
import 'header_logo_block.dart';

class AppHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onRequestB2bSample;

  const AppHeaderBar({
    super.key,
    this.onRequestB2bSample,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentRoute = GoRouterState.of(context).uri.path;

    context.read<NavigationBloc>().add(SyncActiveRouteEvent(currentRoute));

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              height: 72,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 24 : 12,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkObsidianBg.withValues(alpha: 0.85)
                    : Colors.white.withValues(alpha: 0.85),
                border: Border(
                  bottom: BorderSide(
                    color:
                        isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: HeaderLogoBlock(isDark: isDark),
                  ),
                  const SizedBox(width: 8),
                  if (isDesktop) ...[
                    HeaderDesktopNavRow(isDark: isDark),
                    const SizedBox(width: 24),
                  ],
                  HeaderActionsBlock(
                    isDark: isDark,
                    isDesktop: isDesktop,
                    onRequestB2bSample: onRequestB2bSample,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
