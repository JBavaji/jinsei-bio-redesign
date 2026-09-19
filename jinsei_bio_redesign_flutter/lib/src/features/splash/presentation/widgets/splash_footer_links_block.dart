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
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 6,
      children: [
        LinkButton(
          label: 'Privacy Policy',
          url: 'https://policies.google.com/privacy',
          isDark: isDark,
        ),
        LinkButton(
          label: 'Terms of Service',
          url: 'https://policies.google.com/terms',
          isDark: isDark,
        ),
        LinkButton(
          label: 'Scientific Disclosure',
          url: 'https://policies.google.com/technologies',
          isDark: isDark,
        ),
      ],
    );
  }
}
