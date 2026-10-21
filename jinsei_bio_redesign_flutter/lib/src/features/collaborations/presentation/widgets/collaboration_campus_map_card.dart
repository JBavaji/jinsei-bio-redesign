import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';

class CollaborationCampusMapCard extends StatelessWidget {
  const CollaborationCampusMapCard({super.key});

  static const String _mapsUrl =
      'https://maps.google.com/?q=NCL+Innovation+Park+Pashan+Pune';

  Future<void> _launchDirections() async {
    final uri = Uri.parse(_mapsUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NCL Innovation Park Campus Map',
                    style: AppTypography.displayMedium(
                      color: isDark ? Colors.white : AppColors.lightTextPrimary,
                    ).copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Pashan Road, Pune, Maharashtra 411008',
                    style: AppTypography.bodySmall(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ).copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              key: const Key('get_directions_button'),
              onPressed: _launchDirections,
              icon: const Icon(Icons.near_me_outlined, size: 16),
              label: const Text('GET DIRECTIONS'),
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark
                    ? AppColors.cyanInteractive
                    : AppColors.primaryContainerTeal,
                side: BorderSide(
                  color: isDark
                      ? AppColors.cyanInteractive.withOpacity(0.4)
                      : AppColors.primaryContainerTeal.withOpacity(0.4),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0C141D) : const Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark ? const Color(0x4C1492A1) : AppColors.lightBorder,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(double.infinity, 240),
                painter: _MapGridPainter(isDark: isDark),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF101A24).withOpacity(0.95)
                      : Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isDark
                        ? AppColors.cyanInteractive.withOpacity(0.4)
                        : AppColors.primaryContainerTeal.withOpacity(0.3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.cyanInteractive,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Color(0xFF0A1118),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Jinsei Bioscience Pvt. Ltd.',
                          style: AppTypography.displayMedium(
                            color: isDark
                                ? Colors.white
                                : AppColors.lightTextPrimary,
                          ).copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'NCL Innovation Park, Dr. Homi Bhabha Rd, Pune',
                          style: AppTypography.bodySmall(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ).copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final bool isDark;
  const _MapGridPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = isDark ? const Color(0xFF162534) : const Color(0xFFCBD5E1)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.4, size.height * 0.2, size.width, size.height * 0.4);
    canvas.drawPath(path1, linePaint);

    final path2 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..quadraticBezierTo(
          size.width * 0.3, size.height * 0.6, size.width * 0.25, size.height);
    canvas.drawPath(path2, linePaint);

    final circlePaint = Paint()
      ..color = AppColors.cyanInteractive.withOpacity(isDark ? 0.08 : 0.05)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width * 0.5, size.height * 0.5), 90, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
