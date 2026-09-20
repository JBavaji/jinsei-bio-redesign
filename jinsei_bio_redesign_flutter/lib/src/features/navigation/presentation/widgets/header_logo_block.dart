import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';

class HeaderLogoBlock extends StatelessWidget {
  final bool isDark;

  const HeaderLogoBlock({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor =
        isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;

    return InkWell(
      onTap: () {
        context.read<NavigationBloc>().add(const SelectNavItemEvent('/'));
        context.go('/');
      },
      borderRadius: BorderRadius.circular(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JINSEI',
                style: AppTypography.brandLogoTitle(color: titleColor),
              ),
              Text(
                'BIOSCIENCE',
                style: AppTypography.brandLogoSubtitle(
                  color: AppColors.cyanInteractive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
