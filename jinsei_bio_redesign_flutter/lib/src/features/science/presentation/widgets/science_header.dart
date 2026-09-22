import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/hoverable_metric_card.dart';
import '../../domain/models/science_header_metric_model.dart';
import '../bloc/science_stepper_bloc.dart';
import '../bloc/science_stepper_state.dart';

class ScienceHeader extends StatelessWidget {
  final List<ScienceHeaderMetricModel>? metrics;

  const ScienceHeader({
    super.key,
    this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.cyanInteractive,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
              fontSize: 13,
            ),
            children: const [
              TextSpan(text: 'PROPRIETARY '),
              TextSpan(
                text: '10-STEP ',
                style: TextStyle(color: AppColors.emeraldAccent),
              ),
              TextSpan(text: 'R&D PIPELINE'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            'A clinical biological discovery engine transforming indigenous microbial isolates into validated therapeutic consortia.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              height: 1.6,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(height: 28),
        BlocBuilder<ScienceStepperBloc, ScienceStepperState>(
          builder: (context, state) {
            final activeMetrics = metrics ?? state.headerMetrics;

            if (activeMetrics.isEmpty) {
              return const SizedBox.shrink();
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final isLarge = constraints.maxWidth > 750;

                if (isLarge) {
                  return Row(
                    children: activeMetrics
                        .map(
                          (m) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: HoverableMetricCard(
                                icon: m.icon,
                                value: m.value,
                                label: m.label,
                                accentColor: m.accentColor,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: activeMetrics
                      .map(
                        (m) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: HoverableMetricCard(
                            icon: m.icon,
                            value: m.value,
                            label: m.label,
                            accentColor: m.accentColor,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
