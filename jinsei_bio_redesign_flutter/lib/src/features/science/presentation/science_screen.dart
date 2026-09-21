import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jinsei_bio_redesign/src/core/theme/app_theme.dart';
import 'bloc/science_stepper_bloc.dart';
import 'bloc/science_stepper_event.dart';
import 'bloc/science_stepper_state.dart';
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
                  if (state.status == ScienceStepperStatus.loading) {
                    return const Padding(
                      padding: EdgeInsets.all(60.0),
                      child: CircularProgressIndicator(
                        color: AppColors.cyanInteractive,
                      ),
                    );
                  }

                  if (state.status == ScienceStepperStatus.error) {
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Failed to load science steps.',
                        style: const TextStyle(color: Colors.redAccent),
                      ),
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
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
