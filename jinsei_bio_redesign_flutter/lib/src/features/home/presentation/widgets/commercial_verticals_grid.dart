import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/models/product_vertical_model.dart';
import 'product_vertical_card.dart';

class CommercialVerticalsGrid extends StatelessWidget {
  final List<ProductVerticalModel> verticals;
  final VoidCallback onRequestDossier;

  const CommercialVerticalsGrid({
    super.key,
    this.verticals = ProductVerticalModel.defaultVerticals,
    required this.onRequestDossier,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 36 : 48,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkObsidianBg.withValues(alpha: 0.5)
            : AppColors.lightBg,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Commercial Product Verticals',
                style: AppTypography.displayMedium(
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                  fontSize: isMobile ? 22 : 28,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 4,
                width: 64,
                decoration: BoxDecoration(
                  color: AppColors.emeraldGreen,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isLarge = constraints.maxWidth > 850;

                  if (isLarge) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: verticals
                          .map(
                            (item) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ProductVerticalCard(
                                  vertical: item,
                                  isDark: isDark,
                                  isMobile: false,
                                  onRequestDossier: onRequestDossier,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }

                  return Column(
                    children: verticals
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ProductVerticalCard(
                              vertical: item,
                              isDark: isDark,
                              isMobile: isMobile,
                              onRequestDossier: onRequestDossier,
                            ),
                          ),
                        )
                        .toList(),
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
