import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LeadershipHeader extends StatelessWidget {
  final String? badgeText;
  final String? headline;
  final String? subhead;

  const LeadershipHeader({
    super.key,
    this.badgeText,
    this.headline,
    this.subhead,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final badge = badgeText ?? 'ONE TEAM, ONE VISION';
    final title = headline ?? 'Leadership & R&D Team';
    final description = subhead ??
        'Pioneering microbiologists, computational biologists, and growth '
            'strategists translating indigenous human microbial isolates into '
            'validated therapeutic solutions.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.primaryContainerTeal.withValues(alpha: 0.15)
                : AppColors.primaryTeal.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark
                  ? AppColors.cyanInteractive.withValues(alpha: 0.35)
                  : AppColors.primaryTeal.withValues(alpha: 0.25),
            ),
          ),
          child: Text(
            badge,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.2,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: isDark ? Colors.white : AppColors.labCharcoal,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              height: 1.6,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );
  }
}
