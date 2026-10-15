import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/solution_card_model.dart';
import 'solution_card_bullet_point.dart';
import 'solution_card_cta_button.dart';
import 'solution_card_image.dart';
import 'solution_card_metadata_row.dart';

class SolutionCardWidget extends StatefulWidget {
  final SolutionCardModel solution;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onExplore;

  const SolutionCardWidget({
    super.key,
    required this.solution,
    required this.isSelected,
    required this.onTap,
    required this.onExplore,
  });

  @override
  State<SolutionCardWidget> createState() => _SolutionCardWidgetState();
}

class _SolutionCardWidgetState extends State<SolutionCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final borderColor = widget.isSelected
        ? (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
        : (_isHovered
            ? AppColors.emeraldAccent
            : (isDark ? AppColors.darkBorder : AppColors.lightBorder));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Semantics(
        button: true,
        selected: widget.isSelected,
        label: '${widget.solution.title}, ${widget.solution.subtitle}',
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurface.withValues(alpha: 0.90)
                  : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: borderColor,
                width: widget.isSelected || _isHovered ? 2.0 : 1.0,
              ),
              boxShadow: [
                if (_isHovered || widget.isSelected)
                  BoxShadow(
                    color: (widget.isSelected
                            ? AppColors.cyanInteractive
                            : AppColors.emeraldAccent)
                        .withValues(alpha: 0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SolutionCardImage(
                  solution: widget.solution,
                  isDark: isDark,
                ),
                const SizedBox(height: 10),
                SolutionCardMetadataRow(
                  solution: widget.solution,
                  isDark: isDark,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.solution.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.labCharcoal,
                  ),
                ),
                if (widget.solution.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    widget.solution.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: isDark
                          ? AppColors.cyanInteractive
                          : AppColors.primaryTeal,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  widget.solution.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                ...widget.solution.bulletPoints.map(
                  (b) => SolutionCardBulletPoint(text: b, isDark: isDark),
                ),
                const Spacer(),
                const SizedBox(height: 6),
                SolutionCardCtaButton(
                  solution: widget.solution,
                  isDark: isDark,
                  isHovered: _isHovered,
                  isSelected: widget.isSelected,
                  onExplore: widget.onExplore,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
