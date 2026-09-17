import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/disclaimer_banner.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Glow Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  Color(0x1F66DD8B), // Subtle green bioluminescent glow
                  AppColors.darkObsidianBg,
                ],
              ),
            ),
          ),

          // Centered Redesigned Logomark & Title
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Official Brand Logo Image from Stitch Assets
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.bioluminescentGreen.withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo/official_brand_logo.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    .animate()
                    .scale(duration: 800.ms, curve: Curves.easeOutBack)
                    .fadeIn(duration: 600.ms),

                const SizedBox(height: 24),

                // Brand Title Text
                Text(
                  'JINSEI BIO',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 32,
                        letterSpacing: 4.0,
                        color: AppColors.darkTextPrimary,
                      ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),

                const SizedBox(height: 8),

                // Tagline
                Text(
                  'Microbiome & Bioscience Redesign',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.2,
                    color: AppColors.bioluminescentGreen,
                    fontWeight: FontWeight.w500,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 700.ms, duration: 600.ms),

                const SizedBox(height: 48),

                // Loading Indicator
                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.bioluminescentGreen,
                    ),
                  ),
                ).animate().fadeIn(delay: 1000.ms),
              ],
            ),
          ),

          // Bottom Disclaimer Footer
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: DisclaimerBanner(),
          ),
        ],
      ),
    );
  }
}
