import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class B2bModalActionsBar extends StatelessWidget {
  final String dispatchNotice;
  final bool isLoading;
  final bool isFormValid;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const B2bModalActionsBar({
    super.key,
    required this.dispatchNotice,
    required this.isLoading,
    required this.isFormValid,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 620;

        if (isCompact) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildNotice(isDark),
              const SizedBox(height: 14),
              _buildSubmitButton(),
              const SizedBox(height: 8),
              _buildCancelButton(isDark),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: _buildNotice(isDark)),
            const SizedBox(width: 16),
            _buildCancelButton(isDark),
            const SizedBox(width: 10),
            _buildSubmitButton(),
          ],
        );
      },
    );
  }

  Widget _buildNotice(bool isDark) {
    return Row(
      children: [
        const Icon(
          Icons.lock_outline_rounded,
          size: 15,
          color: AppColors.cyanInteractive,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            dispatchNotice,
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCancelButton(bool isDark) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor:
            isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        side: BorderSide(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading ? null : onCancel,
      child: const Text('Cancel', style: TextStyle(fontSize: 12)),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.emeraldGreen,
        foregroundColor: const Color(0xFF003919),
        disabledBackgroundColor: AppColors.emeraldGreen.withValues(alpha: 0.4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading || !isFormValid ? null : onSubmit,
      child: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(0xFF003919),
              ),
            )
          : const FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.send_rounded, size: 14),
                  SizedBox(width: 6),
                  Text(
                    'Submit Sample Request',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
    );
  }
}
