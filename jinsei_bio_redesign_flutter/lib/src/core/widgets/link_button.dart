import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Modular Link Button Widget
/// Opens official policy & external links in a new browser tab / external app.
class LinkButton extends StatelessWidget {
  final String label;
  final String url;
  final bool isDark;

  const LinkButton({
    super.key,
    required this.label,
    required this.url,
    required this.isDark,
  });

  Future<void> _handleTap() async {
    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
      if (!launched) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL ($url): $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(
            label,
            style: AppTypography.bodySmall(
              color: textColor,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
