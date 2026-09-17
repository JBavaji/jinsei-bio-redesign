import 'package:flutter/material.dart';
import '../../../../core/widgets/link_button.dart';

/// Modular Splash Footer Links Block Component
/// Renders official Google policy link buttons (Privacy, Terms, Scientific Disclosure).
class SplashFooterLinksBlock extends StatelessWidget {
  final bool isDark;

  const SplashFooterLinksBlock({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LinkButton(
          label: 'Privacy Policy',
          url: 'https://policies.google.com/privacy',
          isDark: isDark,
        ),
        const SizedBox(width: 16),
        LinkButton(
          label: 'Terms of Service',
          url: 'https://policies.google.com/terms',
          isDark: isDark,
        ),
        const SizedBox(width: 16),
        LinkButton(
          label: 'Scientific Disclosure',
          url: 'https://policies.google.com/technologies',
          isDark: isDark,
        ),
      ],
    );
  }
}
