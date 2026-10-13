import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_error_state_view.dart';
import '../../../core/widgets/app_footer_bar.dart';
import '../../../core/widgets/app_loading_indicator.dart';
import '../domain/models/solution_card_model.dart';
import 'bloc/solutions_bloc.dart';
import 'bloc/solutions_event.dart';
import 'bloc/solutions_state.dart';
import 'widgets/solution_detail_dialog.dart';
import 'widgets/solutions_grid_layout.dart';
import 'widgets/solutions_header.dart';
import 'widgets/solutions_metrics_row.dart';
import 'widgets/solutions_qa_banner.dart';
import 'widgets/vertical_tab_selector.dart';

class SolutionsScreen extends StatelessWidget {
  final SolutionsBloc? bloc;

  const SolutionsScreen({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    if (bloc != null) {
      return BlocProvider.value(
        value: bloc!,
        child: const _SolutionsScreenView(),
      );
    }
    return BlocProvider(
      create: (context) => SolutionsBloc()..add(const LoadSolutionsEvent()),
      child: const _SolutionsScreenView(),
    );
  }
}

class _SolutionsScreenView extends StatelessWidget {
  const _SolutionsScreenView();

  void _onExplore(BuildContext context, SolutionCardModel solution) {
    SolutionDetailDialog.show(
      context,
      solution: solution,
      onRequestSample: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Sample formulation request logged for ${solution.title}',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SolutionsHeader(),
                    const SizedBox(height: 24),
                    BlocBuilder<SolutionsBloc, SolutionsState>(
                      buildWhen: (prev, curr) => prev.metrics != curr.metrics,
                      builder: (context, state) =>
                          SolutionsMetricsRow(metrics: state.metrics),
                    ),
                    const SizedBox(height: 32),
                    const VerticalTabSelector(),
                    const SizedBox(height: 32),
                    BlocBuilder<SolutionsBloc, SolutionsState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const AppLoadingIndicator();
                        }
                        if (state.isFailed) {
                          return AppErrorStateView(
                            errorMessage: state.errorMessage ??
                                'Failed to load commercial solutions.',
                            onRetry: () {
                              context
                                  .read<SolutionsBloc>()
                                  .add(const LoadSolutionsEvent());
                            },
                          );
                        }
                        return SolutionsGridLayout(
                          solutions: state.filteredSolutions,
                          selectedIndex: state.selectedCardIndex,
                          onSelect: (index) {
                            context
                                .read<SolutionsBloc>()
                                .add(SelectSolutionCardEvent(index));
                          },
                          onExplore: (sol) => _onExplore(context, sol),
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                    BlocBuilder<SolutionsBloc, SolutionsState>(
                      buildWhen: (prev, curr) =>
                          prev.qualityAssurance != curr.qualityAssurance,
                      builder: (context, state) =>
                          SolutionsQaBanner(qa: state.qualityAssurance),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const AppFooterBar(),
        ],
      ),
    );
  }
}
