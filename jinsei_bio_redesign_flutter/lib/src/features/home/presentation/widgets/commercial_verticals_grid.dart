import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/product_vertical_model.dart';

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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
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
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth > 600 ? 28 : 22,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
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
              const SizedBox(height: 36),
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
                                child: _VerticalCard(
                                  vertical: item,
                                  isDark: isDark,
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
                            child: _VerticalCard(
                              vertical: item,
                              isDark: isDark,
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

class _VerticalCard extends StatelessWidget {
  final ProductVerticalModel vertical;
  final bool isDark;
  final VoidCallback onRequestDossier;

  const _VerticalCard({
    required this.vertical,
    required this.isDark,
    required this.onRequestDossier,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurfaceCard.withValues(alpha: 0.8)
              : AppColors.lightSurfaceCard,
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cyan Accent Strip on Left
              Container(
                width: 4,
                color: AppColors.cyanInteractive,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vertical.title,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.cyanInteractive.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.cyanInteractive.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          vertical.strainId,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cyanInteractive,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        vertical.description,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: onRequestDossier,
                        borderRadius: BorderRadius.circular(4),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                'REQUEST FORMULATION DOSSIER',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                  color: AppColors.cyanInteractive,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 14,
                              color: AppColors.cyanInteractive,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
