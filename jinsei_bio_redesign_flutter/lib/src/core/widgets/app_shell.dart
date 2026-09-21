import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/navigation/presentation/bloc/navigation_bloc.dart';
import '../../features/navigation/presentation/bloc/navigation_event.dart';
import '../../features/navigation/presentation/widgets/app_header_bar.dart';
import '../../features/navigation/presentation/widgets/app_mobile_nav_drawer.dart';
import '../theme/app_theme.dart';
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

    return BlocProvider<NavigationBloc>(
      create: (context) =>
          NavigationBloc()..add(const LoadNavigationItemsEvent()),
      child: Scaffold(
        backgroundColor: isDark ? AppColors.darkObsidianBg : AppColors.lightBg,
        appBar: const AppHeaderBar(),
        endDrawer: const AppMobileNavDrawer(),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(child: child),
              const DisclaimerBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
