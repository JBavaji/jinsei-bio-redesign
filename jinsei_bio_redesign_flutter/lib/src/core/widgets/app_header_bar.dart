import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../theme/theme_bloc.dart';

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

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkObsidianBg.withValues(alpha: 0.85)
                : Colors.white.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return Row(
                children: [
                  // Brand Emblem & Logo
                  InkWell(
                    onTap: () => context.go('/'),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logo/official_brand_logo.png',
                          height: 38,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.biotech_rounded,
                            color: AppColors.bioluminescentGreen,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'JINSEI',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 2.0,
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                            ),
                            const Text(
                              'BIOSCIENCE',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                letterSpacing: 2.5,
                                color: AppColors.cyanInteractive,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Desktop Navigation Tabs
                  if (isDesktop) ...[
                    _HeaderTab(
                      title: 'SCIENCE & TECH',
                      isActive: currentRoute == '/science',
                      onTap: () => context.go('/science'),
                      isDark: isDark,
                    ),
                    const SizedBox(width: 20),
                    _HeaderTab(
                      title: 'SOLUTIONS',
                      isActive: currentRoute == '/solutions',
                      onTap: () => context.go('/solutions'),
                      isDark: isDark,
                    ),
                    const SizedBox(width: 20),
                    _HeaderTab(
                      title: 'LEADERSHIP',
                      isActive: currentRoute == '/leadership',
                      onTap: () => context.go('/leadership'),
                      isDark: isDark,
                    ),
                    const SizedBox(width: 20),
                    _HeaderTab(
                      title: 'COLLABORATIONS',
                      isActive: currentRoute == '/collaborations',
                      onTap: () => context.go('/collaborations'),
                      isDark: isDark,
                    ),
                    const SizedBox(width: 24),

                    // Theme Toggle Icon
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: isDark
                            ? const Color(0xFF101A24).withValues(alpha: 0.8)
                            : AppColors.lightBg,
                        side: BorderSide(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                        ),
                      ),
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: AppColors.cyanInteractive,
                        size: 20,
                      ),
                      tooltip: 'Toggle Theme',
                      onPressed: () {
                        context.read<ThemeBloc>().add(const ToggleThemeEvent());
                      },
                    ),
                    const SizedBox(width: 12),

                    // Request B2B Sample Button
                    ElevatedButton(
                      onPressed: onRequestB2bSample ?? () => context.go('/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        foregroundColor: AppColors.darkObsidianBg,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 0.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Request B2B Sample'),
                    ),
                  ] else ...[
                    // Mobile Viewport Actions: Compact Sample button + Drawer Hamburger icon
                    ElevatedButton(
                      onPressed: onRequestB2bSample ?? () => context.go('/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        foregroundColor: AppColors.darkObsidianBg,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Sample'),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: AppColors.cyanInteractive,
                        size: 26,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeaderTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const _HeaderTab({
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: isActive
                    ? AppColors.cyanInteractive
                    : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary),
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 24,
                color: AppColors.cyanInteractive,
              ),
          ],
        ),
      ),
    );
  }
}
