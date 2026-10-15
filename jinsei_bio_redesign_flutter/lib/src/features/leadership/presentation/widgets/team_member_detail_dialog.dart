import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/team_member_model.dart';
import 'leadership_credential_box.dart';

class TeamMemberDetailDialog extends StatelessWidget {
  final TeamMemberModel member;
  final VoidCallback? onCollaborate;

  const TeamMemberDetailDialog({
    super.key,
    required this.member,
    this.onCollaborate,
  });

  static Future<void> show(
    BuildContext context, {
    required TeamMemberModel member,
    VoidCallback? onCollaborate,
  }) {
    return showDialog(
      context: context,
      builder: (context) => TeamMemberDetailDialog(
        member: member,
        onCollaborate: onCollaborate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark ? const Color(0xFF101A24) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 540),
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.emeraldAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.emeraldAccent.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    member.categoryTag.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: AppColors.emeraldAccent,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              member.name,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : AppColors.labCharcoal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              member.role.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color:
                    isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
              ),
            ),
            const SizedBox(height: 16),
            LeadershipCredentialBox(
              academicCredential: member.academicCredential,
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            Text(
              'AREA OF FOCUS & EXPERTISE',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              member.areaOfExpertise,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color:
                    isDark ? const Color(0xFFCBD5E1) : const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  onCollaborate?.call();
                },
                icon: const Icon(Icons.handshake_outlined, size: 18),
                label: const Text('Connect with R&D Leadership'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.primaryContainerTeal
                      : AppColors.primaryTeal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
