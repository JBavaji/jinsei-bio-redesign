import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppErrorStateView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;
  final double padding;

  const AppErrorStateView({
    super.key,
    required this.errorMessage,
    this.onRetry,
    this.padding = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: Colors.redAccent,
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Retry'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.cyanInteractive,
                  side: const BorderSide(color: AppColors.cyanInteractive),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
