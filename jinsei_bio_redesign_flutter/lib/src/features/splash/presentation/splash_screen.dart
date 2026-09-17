import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import 'bloc/splash_bloc.dart';
import 'widgets/splash_emblem_crucible.dart';
import 'widgets/splash_footer_bar.dart';
import 'widgets/splash_header_telemetry.dart';
import 'widgets/splash_progress_tracker.dart';
import 'widgets/splash_protocol_chips.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkObsidianBg : AppColors.lightBg,
      body: Stack(
        children: [
          // Background Ambient Bioluminescent Radial Gradients
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.9,
                  colors: isDark
                      ? [
                          const Color(0x260F7D8A), // Teal ambient glow
                          const Color(0x1A10B981), // Emerald ambient glow
                          AppColors.darkObsidianBg,
                        ]
                      : [
                          const Color(0x180F7D8A), // Light teal glow
                          const Color(0x1210B981), // Light emerald glow
                          AppColors.lightBg,
                        ],
                ),
              ),
            ),
          ),

          // Main Layout Structure (Header, Center Content, Footer)
          Column(
            children: [
              // Top System Telemetry / ISO Header
              const SplashHeaderTelemetry(),

              // Central Brand & Initialization Section
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isLargeScreen = constraints.maxWidth > 600;
                          final emblemSize = isLargeScreen ? 128.0 : 100.0;
                          final verticalSpacing = isLargeScreen ? 32.0 : 20.0;

                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: isLargeScreen ? 520 : 380,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Official Brand Emblem & Crucible
                                SplashEmblemCrucible(size: emblemSize),
                                SizedBox(height: verticalSpacing),

                                // Metagenomic Progress Tracker Bar driven by SplashBloc
                                BlocBuilder<SplashBloc, SplashState>(
                                  builder: (context, splashState) {
                                    return SplashProgressTracker(
                                      progress: splashState.progress,
                                      statusText: splashState.statusText,
                                    );
                                  },
                                ),
                                SizedBox(height: verticalSpacing),

                                // Protocol & Certification Chips
                                const SplashProtocolChips(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Diagnostic Footer with Legal Links & Disclaimer
              const SplashFooterBar(),
            ],
          ),
        ],
      ),
    );
  }
}
