import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class B2bComplianceTrustBar extends StatelessWidget {
  final String complianceNote;
  final List<String> certifications;

  const B2bComplianceTrustBar({
    super.key,
    required this.complianceNote,
    required this.certifications,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : Colors.black.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 620;

          if (isCompact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNoteSection(isDark),
                const SizedBox(height: 8),
                _buildBadges(isDark),
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: _buildNoteSection(isDark)),
              const SizedBox(width: 12),
              _buildBadges(isDark),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNoteSection(bool isDark) {
    return Row(
      children: [
        const Icon(
          Icons.verified_rounded,
          size: 16,
          color: AppColors.emeraldGreen,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            complianceNote,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              fontSize: 11,
              height: 1.35,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadges(bool isDark) {
    return Wrap(
      spacing: 6,
      children: certifications.map((cert) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.black.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
          ),
          child: Text(
            cert,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }
}
