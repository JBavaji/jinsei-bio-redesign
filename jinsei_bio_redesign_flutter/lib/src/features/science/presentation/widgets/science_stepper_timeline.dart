import 'package:flutter/material.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import '../../domain/models/science_step_model.dart';
import 'science_step_card.dart';
import 'step_image_card.dart';
import 'step_number_badge.dart';

/// Clean Timeline Orchestration Widget for 10-Step Science Stepper.
/// Handles responsive desktop timeline stack vs mobile column list.
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
                  StepImageCard(
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
                            : StepImageCard(
                                imageUrl: step.imageUrl,
                                title: step.title,
                                isSelected: isSelected,
                              ),
                      ),
                      StepNumberBadge(
                        stepNumber: step.stepNumber,
                        isSelected: isSelected,
                      ),
                      Expanded(
                        child: !isEven
                            ? ScienceStepCard(
                                step: step,
                                isSelected: isSelected,
                                onTap: () => onStepSelected(index),
                              )
                            : StepImageCard(
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
