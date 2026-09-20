import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
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
    );
  }
}
