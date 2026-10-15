import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LeadershipCredentialBox extends StatelessWidget {
  final String academicCredential;
  final bool isDark;
  final bool isHovered;

  const LeadershipCredentialBox({
    super.key,
    required this.academicCredential,
    required this.isDark,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF0C1219).withValues(alpha: 0.9)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isHovered
              ? const Color(0xFFF59E0B).withValues(alpha: 0.3)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : AppColors.primaryTeal.withValues(alpha: 0.1)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFF59E0B),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'ACADEMIC CREDENTIAL',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: Color(0xFFF59E0B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            academicCredential,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }
}
