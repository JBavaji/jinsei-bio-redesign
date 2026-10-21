import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class CollaborationGovernanceBanner extends StatelessWidget {
  final String title;
  final String description;

  const CollaborationGovernanceBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101A24) : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x4C1492A1) : AppColors.lightBorder,
        ),
      ),
      child: isDesktop
          ? Row(
              children: [
                _buildLeadingIcon(),
                const SizedBox(width: 16),
                Expanded(child: _buildTextContent(isDark)),
                const SizedBox(width: 16),
                _buildTrailingBadge(isDark),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildLeadingIcon(),
                    const SizedBox(width: 12),
                    Expanded(child: _buildTextContent(isDark)),
                  ],
                ),
                const SizedBox(height: 12),
                _buildTrailingBadge(isDark),
              ],
            ),
    );
  }

  Widget _buildLeadingIcon() {
    return const Icon(
      Icons.verified,
      color: AppColors.emeraldAccent,
      size: 32,
    );
  }

  Widget _buildTextContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.displayMedium(
            color: isDark ? Colors.white : AppColors.lightTextPrimary,
          ).copyWith(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 2),
        Text(
          description,
          style: AppTypography.bodySmall(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ).copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildTrailingBadge(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Pune NCL Innovation Park',
          style: TextStyle(
            color: isDark
                ? AppColors.cyanInteractive
                : AppColors.primaryContainerTeal,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Bio-Prospecting Ethics Compliant',
          style: TextStyle(
            color: isDark ? Colors.white38 : Colors.black38,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
