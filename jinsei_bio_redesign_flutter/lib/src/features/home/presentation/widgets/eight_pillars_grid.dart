import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/models/pillar_item_model.dart';
import 'pillar_card.dart';

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
    final isMobile = screenWidth <= 600;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    int crossAxisCount = 4;
    double mainAxisExtent = 220;
    if (isMobile) {
      crossAxisCount = 1;
      mainAxisExtent = 115;
    } else if (isTablet) {
      crossAxisCount = 2;
      mainAxisExtent = 190;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 36 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                pillars.isNotEmpty
                    ? 'Our ${pillars.length}-Pillar Approach'
                    : 'Our Core Pillars',
                textAlign: TextAlign.center,
                style: AppTypography.displayMedium(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                  fontSize: isMobile ? 24 : 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'A comprehensive methodology ensuring robust, scalable, and ecologically sound biological solutions.',
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pillars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  mainAxisExtent: mainAxisExtent,
                ),
                itemBuilder: (context, index) {
                  return PillarCard(
                    pillar: pillars[index],
                    isDark: isDark,
                    isMobile: isMobile,
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
