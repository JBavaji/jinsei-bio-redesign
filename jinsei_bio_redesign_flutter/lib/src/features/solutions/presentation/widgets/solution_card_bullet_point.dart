import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SolutionCardBulletPoint extends StatelessWidget {
  final String text;
  final bool isDark;

  const SolutionCardBulletPoint({
    super.key,
    required this.text,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, right: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.emeraldAccent,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                height: 1.35,
                color:
                    isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
