import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_error_state_view.dart';
import '../../../core/widgets/app_footer_bar.dart';
import '../../../core/widgets/app_loading_indicator.dart';
import 'bloc/science_stepper_bloc.dart';
import 'bloc/science_stepper_event.dart';
import 'bloc/science_stepper_state.dart';
import 'widgets/clinical_quality_banner.dart';
import 'widgets/science_header.dart';
import 'widgets/science_stepper_timeline.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ScienceStepperBloc()..add(const LoadScienceStepsEvent()),
      child: const _ScienceScreenView(),
    );
  }
}

class _ScienceScreenView extends StatelessWidget {
  const _ScienceScreenView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ScienceHeader(),
                    const SizedBox(height: 48),
                    BlocBuilder<ScienceStepperBloc, ScienceStepperState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const AppLoadingIndicator();
                        }

                        if (state.isFailed) {
                          return AppErrorStateView(
                            errorMessage: state.errorMessage ??
                                'Failed to load science steps.',
                            onRetry: () {
                              context
                                  .read<ScienceStepperBloc>()
                                  .add(const LoadScienceStepsEvent());
                            },
                          );
                        }

                        return ScienceStepperTimeline(
                          steps: state.filteredSteps,
                          selectedIndex: state.selectedStepIndex,
                          onStepSelected: (index) {
                            context
                                .read<ScienceStepperBloc>()
                                .add(SelectScienceStepEvent(index));
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                    const ClinicalQualityBanner(),
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
