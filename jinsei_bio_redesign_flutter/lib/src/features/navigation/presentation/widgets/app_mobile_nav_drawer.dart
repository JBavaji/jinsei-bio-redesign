import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'drawer_header_block.dart';
import 'drawer_info_section.dart';
import 'drawer_nav_matrix.dart';
import 'drawer_theme_switcher.dart';

class AppMobileNavDrawer extends StatelessWidget {
  final VoidCallback? onRequestB2bSample;

  const AppMobileNavDrawer({
    super.key,
    this.onRequestB2bSample,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.88,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0F1722).withValues(alpha: 0.95)
                  : Colors.white.withValues(alpha: 0.95),
              border: Border(
                left: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  DrawerHeaderBlock(
                    isDark: isDark,
                    onClose: () => Navigator.of(context).pop(),
                  ),
                  Divider(
                    height: 1,
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DrawerNavMatrix(isDark: isDark),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 44,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onRequestB2bSample?.call();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.emeraldGreen,
                                foregroundColor: AppColors.darkObsidianBg,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Request B2B Sample',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Divider(
                            height: 1,
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                          const SizedBox(height: 20),
                          DrawerInfoSection(isDark: isDark),
                        ],
                      ),
                    ),
                  ),
                  DrawerThemeSwitcher(isDark: isDark),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
