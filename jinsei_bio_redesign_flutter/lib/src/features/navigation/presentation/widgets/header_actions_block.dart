import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_bloc.dart';
import 'sample_button.dart';

class HeaderActionsBlock extends StatelessWidget {
  final bool isDark;
  final bool isDesktop;
  final VoidCallback? onRequestB2bSample;

  const HeaderActionsBlock({
    super.key,
    required this.isDark,
    required this.isDesktop,
    this.onRequestB2bSample,
  });

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: isDark
                  ? const Color(0xFF101A24).withValues(alpha: 0.8)
                  : AppColors.lightBg,
              side: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
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
          SampleButton(
            onPressed: onRequestB2bSample,
            label: 'Request B2B Sample',
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            fontSize: 13,
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SampleButton(
            onPressed: onRequestB2bSample,
            label: 'Request B2B Sample',
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 4),
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
    );
  }
}
