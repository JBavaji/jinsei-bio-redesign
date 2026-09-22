import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_footer_bar.dart';
import 'bloc/b2b_form_bloc.dart';
import 'widgets/b2b_contact_console.dart';
import 'widgets/bioluminescent_particle_canvas.dart';
import 'widgets/commercial_verticals_grid.dart';
import 'widgets/eight_pillars_grid.dart';
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
    return BlocProvider(
      create: (context) => B2bFormBloc(),
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

              // 5. Global App Footer Bar
              const AppFooterBar(),
            ],
          ),
        ),
      ),
    );
  }
}
