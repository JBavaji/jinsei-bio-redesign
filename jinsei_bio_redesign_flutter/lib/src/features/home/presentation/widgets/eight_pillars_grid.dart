import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/pillar_item_model.dart';

class EightPillarsGrid extends StatelessWidget {
  final List<PillarItemModel> pillars;

  const EightPillarsGrid({
    super.key,
    this.pillars = PillarItemModel.defaultPillars,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    if (screenWidth <= 600) {
      crossAxisCount = 1;
    } else if (screenWidth <= 1000) {
      crossAxisCount = 2;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Our 8-Pillar Approach',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth > 600 ? 32 : 24,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'A comprehensive methodology ensuring robust, scalable, and ecologically sound biological solutions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
              ),
              const SizedBox(height: 36),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pillars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return _PillarCard(
                    pillar: pillars[index],
                    isDark: isDark,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PillarCard extends StatelessWidget {
  final PillarItemModel pillar;
  final bool isDark;

  const _PillarCard({
    required this.pillar,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceCard.withValues(alpha: 0.8)
            : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.cyanInteractive.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.cyanInteractive.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(
              pillar.icon,
              color: AppColors.cyanInteractive,
              size: 22,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            pillar.title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              pillar.description,
              style: TextStyle(
                fontSize: 12,
                height: 1.4,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
