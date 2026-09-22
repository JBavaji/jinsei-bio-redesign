import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_error_state_view.dart';
import '../../../core/widgets/app_footer_bar.dart';
import '../../../core/widgets/app_loading_indicator.dart';
import 'bloc/b2b_form_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => B2bFormBloc()),
        BlocProvider(
          create: (context) => HomeBloc()..add(const LoadHomeContentEvent()),
        ),
      ],
      child: BioluminescentParticleCanvas(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // 1. Hero Header Section
              const HeroHeaderSection(),

              // 2. Home Content Loader from HomeBloc
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const AppLoadingIndicator();
                  }

                  if (state.isFailed) {
                    return AppErrorStateView(
                      errorMessage: state.errorMessage ??
                          'Failed to load home page content.',
                      onRetry: () {
                        context
                            .read<HomeBloc>()
                            .add(const LoadHomeContentEvent());
                      },
                    );
                  }

                  return Column(
                    children: [
                      // 2. 8-Pillar Innovation Philosophy Grid
                      EightPillarsGrid(pillars: state.pillars),

                      // 3. Commercial Product Verticals Preview
                      CommercialVerticalsGrid(
                        verticals: state.productVerticals,
                        onRequestDossier: _scrollToB2bConsole,
                      ),
                    ],
                  );
                },
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
