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
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final step = steps[index];
              return ScienceStepCard(
                step: step,
                isSelected: index == selectedIndex,
                onTap: () => onStepSelected(index),
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
                            : const SizedBox.shrink(),
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
                            : const SizedBox.shrink(),
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
