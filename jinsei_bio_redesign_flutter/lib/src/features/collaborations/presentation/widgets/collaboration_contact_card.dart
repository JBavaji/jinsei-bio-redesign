import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/models/collaboration_contact_info_model.dart';

class CollaborationContactCard extends StatelessWidget {
  final CollaborationContactInfoModel contactInfo;

  const CollaborationContactCard({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        _buildInfoCard(
          isDark: isDark,
          icon: Icons.mail_outline,
          iconColor: isDark
              ? AppColors.cyanInteractive
              : AppColors.primaryContainerTeal,
          title: 'Reach out to us',
          subtitle: 'Direct scientific inquiry inbox',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contactInfo.supportEmail,
                style: AppTypography.displayMedium(
                  color: isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryContainerTeal,
                ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                contactInfo.supportNotice,
                style: AppTypography.bodySmall(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ).copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          isDark: isDark,
          icon: Icons.location_on_outlined,
          iconColor: AppColors.emeraldAccent,
          title: 'Better yet, come visit us!',
          subtitle: contactInfo.facilityName,
          child: Text(
            contactInfo.facilityAddress,
            style: AppTypography.bodyMedium(
              color: isDark ? Colors.white : AppColors.lightTextPrimary,
            ).copyWith(fontSize: 13, height: 1.5, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          isDark: isDark,
          icon: Icons.schedule_outlined,
          iconColor: isDark
              ? AppColors.cyanInteractive
              : AppColors.primaryContainerTeal,
          title: 'Timings',
          subtitle: 'R&D Facility Schedule',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.emeraldAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: AppColors.emeraldAccent.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.emeraldAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  contactInfo.visitingStatus,
                  style: const TextStyle(
                    color: AppColors.emeraldAccent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTimingRow(
                  'Monday - Saturday',
                  'By Appointment',
                  isDark
                      ? AppColors.cyanInteractive
                      : AppColors.primaryContainerTeal),
              const SizedBox(height: 6),
              _buildTimingRow('Sunday', 'Closed', Colors.redAccent),
              const SizedBox(height: 6),
              Text(
                '* Closed on National Holidays. Prior appointment required.',
                style: TextStyle(
                  color: isDark ? Colors.white38 : Colors.black38,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildStandardsCard(isDark),
      ],
    );
  }

  Widget _buildTimingRow(String days, String hours, Color hoursColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            days,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          hours,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: hoursColor,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required bool isDark,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101A24) : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x3F1492A1) : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: iconColor.withValues(alpha: 0.3)),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.displayMedium(
                        color:
                            isDark ? Colors.white : AppColors.lightTextPrimary,
                      ).copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmall(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ).copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Colors.white12),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildStandardsCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101A24) : AppColors.lightSurfaceCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0x3F1492A1) : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quality & Compliance Standards',
            style: AppTypography.labelCaps(
              color: isDark
                  ? AppColors.cyanInteractive
                  : AppColors.primaryContainerTeal,
            ).copyWith(fontSize: 11, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: contactInfo.standards.map((s) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      isDark ? const Color(0xFF0A1118) : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.emeraldAccent.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  s.title,
                  style: const TextStyle(
                    color: AppColors.emeraldAccent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
