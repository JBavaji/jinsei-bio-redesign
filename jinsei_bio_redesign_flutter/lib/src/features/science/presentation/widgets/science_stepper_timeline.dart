import 'package:flutter/material.dart';
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
        final isWide = constraints.maxWidth > 800;

        if (isWide) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
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

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final step = steps[index];
            return ScienceStepCard(
              step: step,
              isSelected: index == selectedIndex,
              onTap: () => onStepSelected(index),
            );
          },
        );
      },
    );
  }
}
