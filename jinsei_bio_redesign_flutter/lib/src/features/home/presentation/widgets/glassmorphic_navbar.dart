import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_bloc.dart';

class GlassmorphicNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onRequestB2bSample;

  const GlassmorphicNavbar({
    super.key,
    required this.onRequestB2bSample,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 900;

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
          child: Row(
            children: [
              // Official Brand Logo Emblem
              Image.asset(
                'assets/images/logo/official_brand_logo.png',
                height: 38,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.biotech_rounded,
                  color: AppColors.bioluminescentGreen,
                  size: 32,
                ),
              ),
              const SizedBox(width: 12),

              // Brand Title Block
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

              const Spacer(),

              // Desktop Navigation Links
              if (isLargeScreen) ...[
                _NavLink(
                    title: 'SCIENCE & TECH', isActive: true, isDark: isDark),
                const SizedBox(width: 24),
                _NavLink(title: 'SOLUTIONS', isActive: false, isDark: isDark),
                const SizedBox(width: 24),
                _NavLink(title: 'LEADERSHIP', isActive: false, isDark: isDark),
                const SizedBox(width: 24),
                _NavLink(
                    title: 'COLLABORATIONS', isActive: false, isDark: isDark),
                const SizedBox(width: 32),
              ],

              // Theme Toggle Button
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: isDark
                      ? const Color(0xFF101A24).withValues(alpha: 0.8)
                      : AppColors.lightBg,
                  side: BorderSide(
                    color:
                        isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: AppColors.cyanInteractive,
                  size: 20,
                ),
                tooltip: 'Toggle Theme',
                onPressed: () {
                  context.read<ThemeBloc>().add(const ToggleThemeEvent());
                },
              ),
              const SizedBox(width: 12),

              // B2B Sample CTA Button
              ElevatedButton(
                onPressed: onRequestB2bSample,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.emeraldGreen,
                  foregroundColor: AppColors.darkObsidianBg,
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 20 : 14,
                    vertical: 12,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isDark;

  const _NavLink({
    required this.title,
    required this.isActive,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
