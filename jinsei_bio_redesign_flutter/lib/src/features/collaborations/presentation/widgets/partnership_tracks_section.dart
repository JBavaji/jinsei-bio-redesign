import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/models/collaboration_track_model.dart';

class PartnershipTracksSection extends StatelessWidget {
  final List<CollaborationTrackModel> tracks;

  const PartnershipTracksSection({
    super.key,
    required this.tracks,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.hub_outlined,
              color: isDark
                  ? AppColors.cyanInteractive
                  : AppColors.primaryContainerTeal,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Partnership Tracks',
              style: AppTypography.displayMedium(
                color: isDark ? Colors.white : AppColors.lightTextPrimary,
              ).copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (isDesktop)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: tracks.map((track) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: _TrackCard(track: track, isDark: isDark),
                ),
              );
            }).toList(),
          )
        else
          Column(
            children: tracks.map((track) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _TrackCard(track: track, isDark: isDark),
              );
            }).toList(),
          ),
      ],
    );
  }
}

class _TrackCard extends StatelessWidget {
  final CollaborationTrackModel track;
  final bool isDark;

  const _TrackCard({required this.track, required this.isDark});

  IconData _resolveIcon(String iconKey) {
    switch (iconKey) {
      case 'sanitizer':
        return Icons.sanitizer_outlined;
      case 'science':
        return Icons.science_outlined;
      case 'biotech':
      default:
        return Icons.biotech_outlined;
    }
  }

  Color _resolveColor(String iconKey) {
    if (iconKey == 'science') {
      return AppColors.emeraldAccent;
    }
    return isDark ? AppColors.cyanInteractive : AppColors.primaryContainerTeal;
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = _resolveColor(track.iconKey);

    return Container(
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
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: accentColor.withOpacity(0.3)),
            ),
            child:
                Icon(_resolveIcon(track.iconKey), color: accentColor, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            track.title,
            style: AppTypography.displayMedium(
              color: isDark ? Colors.white : AppColors.lightTextPrimary,
            ).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            track.description,
            style: AppTypography.bodySmall(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ).copyWith(fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}
