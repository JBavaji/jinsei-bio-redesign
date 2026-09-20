import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'b2b_diagnostic_form.dart';
import 'b2b_headquarters_panel.dart';

class B2bContactConsole extends StatelessWidget {
  final GlobalKey? formKey;

  const B2bContactConsole({
    super.key,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 850;
    final isMobile = screenWidth <= 600;

    return Container(
      key: formKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 36 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurfaceCard.withValues(alpha: 0.9)
                  : AppColors.lightSurfaceCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.cyanInteractive.withValues(alpha: 0.08),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: isDesktop
                ? IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: B2bHeadquartersPanel(
                            isDark: isDark,
                            isMobile: false,
                          ),
                        ),
                        Container(
                          width: 1,
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                        ),
                        Expanded(
                          child: B2bDiagnosticForm(
                            isDark: isDark,
                            isMobile: false,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      B2bHeadquartersPanel(
                        isDark: isDark,
                        isMobile: isMobile,
                      ),
                      Divider(
                        height: 1,
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                      B2bDiagnosticForm(
                        isDark: isDark,
                        isMobile: isMobile,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
