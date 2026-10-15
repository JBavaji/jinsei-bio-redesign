import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class LeadershipAreaFooter extends StatelessWidget {
  final String areaOfExpertise;
  final bool isDark;
  final bool isHovered;

  const LeadershipAreaFooter({
    super.key,
    required this.areaOfExpertise,
    required this.isDark,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    final interactiveColor = isHovered
        ? AppColors.emeraldAccent
        : (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Area: ',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.cyanInteractive
                          : AppColors.primaryTeal,
                    ),
                  ),
                  TextSpan(
                    text: areaOfExpertise,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                  ),
                ],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bio',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: interactiveColor,
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 13,
                color: interactiveColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
