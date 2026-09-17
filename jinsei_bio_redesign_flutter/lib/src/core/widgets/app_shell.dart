import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/app_theme.dart';
import '../theme/theme_bloc.dart';
import 'disclaimer_banner.dart';

class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({
    super.key,
    required this.child,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<_NavigationDestinationData> _destinations = const [
    _NavigationDestinationData(
      label: 'Home',
      icon: Icons.grid_view_rounded,
      selectedIcon: Icons.grid_view_rounded,
    ),
    _NavigationDestinationData(
      label: 'Science',
      icon: Icons.biotech_outlined,
      selectedIcon: Icons.biotech_rounded,
    ),
    _NavigationDestinationData(
      label: 'Solutions',
      icon: Icons.hub_outlined,
      selectedIcon: Icons.hub_rounded,
    ),
    _NavigationDestinationData(
      label: 'Leadership',
      icon: Icons.people_outline_rounded,
      selectedIcon: Icons.people_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      body: Row(
        children: [
          // Side Navigation Rail for Desktop/Tablet Viewports
          if (isDesktop) ...[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              backgroundColor: isDark
                  ? AppColors.darkSurfaceCard
                  : AppColors.lightSurfaceCard,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo/official_brand_logo.png',
                      height: 40,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.biotech_rounded,
                        color: AppColors.bioluminescentGreen,
                        size: 36,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: IconButton(
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        color: isDark
                            ? AppColors.bioluminescentGreen
                            : AppColors.primaryContainerTeal,
                      ),
                      tooltip: 'Toggle Theme',
                      onPressed: () => context
                          .read<ThemeBloc>()
                          .add(const ToggleThemeEvent()),
                    ),
                  ),
                ),
              ),
              destinations: _destinations
                  .map(
                    (d) => NavigationRailDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.selectedIcon,
                          color: AppColors.bioluminescentGreen),
                      label: Text(d.label),
                    ),
                  )
                  .toList(),
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ],

          // Main Content Area with Bottom Disclaimer
          Expanded(
            child: Column(
              children: [
                Expanded(child: widget.child),
                const DisclaimerBanner(),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar for Mobile Viewports
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) {
                setState(() => _selectedIndex = index);
              },
              backgroundColor: isDark
                  ? AppColors.darkSurfaceCard
                  : AppColors.lightSurfaceCard,
              indicatorColor:
                  AppColors.bioluminescentGreen.withValues(alpha: 0.2),
              destinations: _destinations
                  .map(
                    (d) => NavigationDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.selectedIcon,
                          color: AppColors.bioluminescentGreen),
                      label: d.label,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class _NavigationDestinationData {
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const _NavigationDestinationData({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });
}
