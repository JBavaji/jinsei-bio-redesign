import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/team_member_model.dart';

class LeadershipCardImage extends StatelessWidget {
  final TeamMemberModel member;
  final bool isDark;

  const LeadershipCardImage({
    super.key,
    required this.member,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = member.imageUrl ?? '';

    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0A1118) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
              .withValues(alpha: 0.25),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(imageUrl),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 70,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: _buildBadge(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
    final badgeBg = isDark
        ? const Color(0xFF0A1118).withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.95);
    final textColor =
        isDark ? AppColors.emeraldAccent : AppColors.primaryContainerTeal;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: badgeBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.emeraldAccent.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.emeraldAccent.withValues(alpha: 0.2),
            blurRadius: 6,
          ),
        ],
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
            member.categoryTag.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return _buildFallback();
    }
    return Image.network(
      url,
      semanticLabel: '${member.name} portrait',
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (_, __, ___) => _buildFallback(),
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isDark ? AppColors.cyanInteractive : AppColors.primaryTeal,
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildFallback() {
    return Container(
      color: isDark ? const Color(0xFF0C1A24) : const Color(0xFFE2E8F0),
      child: Center(
        child: Icon(
          Icons.biotech_rounded,
          size: 48,
          color: (isDark ? AppColors.cyanInteractive : AppColors.primaryTeal)
              .withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
