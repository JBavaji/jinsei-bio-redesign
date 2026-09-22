import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double padding;
  final String? message;

  const AppLoadingIndicator({
    super.key,
    this.padding = 60.0,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: AppColors.cyanInteractive,
            ),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: const TextStyle(
                  color: AppColors.darkTextSecondary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
