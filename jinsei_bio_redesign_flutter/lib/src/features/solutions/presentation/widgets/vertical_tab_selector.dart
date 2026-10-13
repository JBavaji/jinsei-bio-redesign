import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';
import '../bloc/solutions_bloc.dart';
import '../bloc/solutions_event.dart';
import '../bloc/solutions_state.dart';

class VerticalTabSelector extends StatelessWidget {
  const VerticalTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocBuilder<SolutionsBloc, SolutionsState>(
      buildWhen: (prev, curr) => prev.selectedCategory != curr.selectedCategory,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: SolutionCategory.values.map((category) {
              final isSelected = state.selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: FilterChip(
                  label: Text(category.label),
                  selected: isSelected,
                  onSelected: (_) {
                    context
                        .read<SolutionsBloc>()
                        .add(FilterSolutionsCategoryEvent(category));
                  },
                  backgroundColor: isDark
                      ? AppColors.darkSurface.withValues(alpha: 0.6)
                      : Colors.white,
                  selectedColor: isDark
                      ? AppColors.cyanInteractive.withValues(alpha: 0.25)
                      : AppColors.primaryTeal.withValues(alpha: 0.15),
                  checkmarkColor: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryTeal,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? (isDark
                            ? AppColors.cyanInteractive
                            : AppColors.primaryTeal)
                        : (isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary),
                  ),
                  side: BorderSide(
                    color: isSelected
                        ? (isDark
                            ? AppColors.cyanInteractive
                            : AppColors.primaryTeal)
                        : (isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder),
                    width: isSelected ? 1.5 : 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
