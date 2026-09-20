import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'app_header_bar.dart';
import 'app_mobile_nav_drawer.dart';
import 'disclaimer_banner.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkObsidianBg : AppColors.lightBg,
      appBar: const AppHeaderBar(),
      endDrawer: const AppMobileNavDrawer(),
      body: Column(
        children: [
          Expanded(child: child),
          const DisclaimerBanner(),
        ],
      ),
    );
  }
}
