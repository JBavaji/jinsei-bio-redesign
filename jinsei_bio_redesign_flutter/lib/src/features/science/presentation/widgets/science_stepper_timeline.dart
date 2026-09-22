import 'package:flutter/material.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import '../../domain/models/science_step_model.dart';
import 'science_step_card.dart';

class ScienceStepperTimeline extends StatelessWidget {
  final List<ScienceStepModel> steps;
  final int selectedIndex;
  final ValueChanged<int> onStepSelected;

  const ScienceStepperTimeline({
    super.key,
    required this.steps,
    required this.selectedIndex,
    required this.onStepSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 768;

        if (!isWide) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final step = steps[index];
              final isSelected = index == selectedIndex;
              return Column(
                children: [
                  _StepImageCard(
                    imageUrl: step.imageUrl,
                    title: step.title,
                    isSelected: isSelected,
                  ),
                  const SizedBox(height: 12),
                  ScienceStepCard(
                    step: step,
                    isSelected: isSelected,
                    onTap: () => onStepSelected(index),
                  ),
                ],
              );
            },
          );
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20,
              bottom: 20,
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.cyanInteractive,
                      AppColors.emeraldAccent,
                      AppColors.cyanInteractive,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyanInteractive.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate(steps.length, (index) {
                final step = steps[index];
                final isEven = index.isEven;
                final isSelected = index == selectedIndex;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: isEven
                            ? ScienceStepCard(
                                step: step,
                                isSelected: isSelected,
                                onTap: () => onStepSelected(index),
                              )
                            : _StepImageCard(
                                imageUrl: step.imageUrl,
                                title: step.title,
                                isSelected: isSelected,
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.emeraldAccent
                              : AppColors.darkObsidianBg,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.emeraldAccent
                                : AppColors.cyanInteractive,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (isSelected
                                      ? AppColors.emeraldAccent
                                      : AppColors.cyanInteractive)
                                  .withOpacity(0.4),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            step.stepNumber.toString().padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: !isEven
                            ? ScienceStepCard(
                                step: step,
                                isSelected: isSelected,
                                onTap: () => onStepSelected(index),
                              )
                            : _StepImageCard(
                                imageUrl: step.imageUrl,
                                title: step.title,
                                isSelected: isSelected,
                              ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}

class _StepImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isSelected;

  const _StepImageCard({
    required this.imageUrl,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColor =
        isSelected ? AppColors.emeraldAccent : AppColors.cyanInteractive;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 190,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurface.withOpacity(0.85)
            : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? accentColor
              : (isDark
                  ? AppColors.cyanInteractive.withOpacity(0.25)
                  : AppColors.lightBorder),
          width: isSelected ? 2 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(isSelected ? 0.20 : 0.05),
            blurRadius: 16,
            spreadRadius: isSelected ? 1 : 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: isDark
                  ? AppColors.darkSurfaceCard
                  : AppColors.lightSurfaceCard,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.biotech_rounded,
                      size: 44,
                      color: accentColor.withOpacity(0.7),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
