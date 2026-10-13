import 'package:flutter/material.dart';
import '../../domain/models/solution_card_model.dart';
import 'solution_card_widget.dart';

class SolutionsGridLayout extends StatelessWidget {
  final List<SolutionCardModel> solutions;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final ValueChanged<SolutionCardModel> onExplore;

  const SolutionsGridLayout({
    super.key,
    required this.solutions,
    required this.selectedIndex,
    required this.onSelect,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    if (solutions.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text('No solution verticals found for selected category.'),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;
        final crossAxisCount = isWide ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: isWide ? 650 : 680,
          ),
          itemCount: solutions.length,
          itemBuilder: (context, index) {
            final solution = solutions[index];
            final isSelected = selectedIndex == index;

            return SolutionCardWidget(
              solution: solution,
              isSelected: isSelected,
              onTap: () => onSelect(index),
              onExplore: () => onExplore(solution),
            );
          },
        );
      },
    );
  }
}
