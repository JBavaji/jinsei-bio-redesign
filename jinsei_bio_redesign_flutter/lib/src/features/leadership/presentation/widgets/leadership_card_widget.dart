import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/team_member_model.dart';
import 'leadership_area_footer.dart';
import 'leadership_card_image.dart';
import 'leadership_credential_box.dart';

class LeadershipCardWidget extends StatefulWidget {
  final TeamMemberModel member;
  final VoidCallback? onTap;

  const LeadershipCardWidget({
    super.key,
    required this.member,
    this.onTap,
  });

  @override
  State<LeadershipCardWidget> createState() => _LeadershipCardWidgetState();
}

class _LeadershipCardWidgetState extends State<LeadershipCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Semantics(
      button: true,
      label: 'View leadership profile for ${widget.member.name}',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isDark
                  ? (_isHovered
                      ? const Color(0xFF14202D).withValues(alpha: 0.95)
                      : const Color(0xFF101A24).withValues(alpha: 0.85))
                  : (_isHovered ? Colors.white : const Color(0xFFFAFCFD)),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: _isHovered
                    ? AppColors.emeraldAccent
                    : (isDark
                        ? AppColors.cyanInteractive.withValues(alpha: 0.25)
                        : AppColors.primaryTeal.withValues(alpha: 0.20)),
                width: _isHovered ? 1.5 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? AppColors.emeraldAccent.withValues(alpha: 0.25)
                      : (isDark
                          ? Colors.black.withValues(alpha: 0.3)
                          : AppColors.primaryTeal.withValues(alpha: 0.06)),
                  blurRadius: _isHovered ? 24 : 12,
                  offset: Offset(0, _isHovered ? 8 : 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LeadershipCardImage(
                  member: widget.member,
                  isDark: isDark,
                ),
                const SizedBox(height: 14),
                Text(
                  widget.member.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: isDark ? Colors.white : AppColors.labCharcoal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.member.role.toUpperCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: AppColors.emeraldAccent,
                  ),
                ),
                const SizedBox(height: 12),
                LeadershipCredentialBox(
                  academicCredential: widget.member.academicCredential,
                  isDark: isDark,
                  isHovered: _isHovered,
                ),
                const SizedBox(height: 12),
                LeadershipAreaFooter(
                  areaOfExpertise: widget.member.areaOfExpertise,
                  isDark: isDark,
                  isHovered: _isHovered,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
