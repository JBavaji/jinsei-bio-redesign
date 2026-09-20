import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/disclaimer_banner.dart';
import '../../splash/presentation/widgets/splash_footer_bar.dart';
import 'bloc/b2b_form_bloc.dart';
import 'widgets/b2b_contact_console.dart';
import 'widgets/bioluminescent_particle_canvas.dart';
import 'widgets/commercial_verticals_grid.dart';
import 'widgets/eight_pillars_grid.dart';
import 'widgets/glassmorphic_navbar.dart';
import 'widgets/hero_header_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _b2bConsoleKey = GlobalKey();

  void _scrollToB2bConsole() {
    final context = _b2bConsoleKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => B2bFormBloc(),
      child: Scaffold(
        backgroundColor:
            isDark ? AppColors.darkObsidianBg : AppColors.lightBg,
        body: SafeArea(
          child: Column(
            children: [
              // Glassmorphic Navbar Overlay
              GlassmorphicNavbar(
                onRequestB2bSample: _scrollToB2bConsole,
              ),

              // Scrollable Body Content with Ambient Particle Canvas
              Expanded(
                child: BioluminescentParticleCanvas(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        // 1. Hero Header Section
                        const HeroHeaderSection(),

                        // 2. 8-Pillar Innovation Philosophy Grid
                        const EightPillarsGrid(),

                        // 3. Commercial Product Verticals Preview
                        CommercialVerticalsGrid(
                          onRequestDossier: _scrollToB2bConsole,
                        ),

                        // 4. Executive B2B Contact Console
                        B2bContactConsole(
                          formKey: _b2bConsoleKey,
                        ),

                        // 5. Diagnostic Footer Bar
                        const SplashFooterBar(),

                        // 6. Unofficial Redesign Disclaimer Guardrail Banner
                        const DisclaimerBanner(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
