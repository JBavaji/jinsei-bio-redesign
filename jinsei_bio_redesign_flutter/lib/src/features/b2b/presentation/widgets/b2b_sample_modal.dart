import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/repositories/b2b_repository_impl.dart';
import '../../domain/repositories/i_b2b_repository.dart';
import '../bloc/b2b_request_bloc.dart';
import '../bloc/b2b_request_event.dart';
import '../bloc/b2b_request_state.dart';
import 'b2b_modal_form_body.dart';
import 'b2b_request_success_view.dart';

class B2bSampleModal extends StatelessWidget {
  final String? initialStrainId;
  final IB2bRepository? repository;

  const B2bSampleModal({
    super.key,
    this.initialStrainId,
    this.repository,
  });

  static Future<void> show(
    BuildContext context, {
    String? initialStrainId,
    IB2bRepository? repository,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xFF05090E).withValues(alpha: 0.8),
      builder: (_) => B2bSampleModal(
        initialStrainId: initialStrainId,
        repository: repository,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final repo = repository ?? B2bRepositoryImpl();
    return BlocProvider<B2bRequestBloc>(
      create: (_) => B2bRequestBloc(repository: repo)
        ..add(LoadB2bModalContentEvent(initialStrainId: initialStrainId)),
      child: const _B2bModalView(),
    );
  }
}

class _B2bModalView extends StatelessWidget {
  const _B2bModalView();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 860),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xF0101A26)
                    : Colors.white.withValues(alpha: 0.96),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color:
                      isDark ? const Color(0x591492A1) : AppColors.lightBorder,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF0F7D8A),
                          Color(0xFF06B6D4),
                          AppColors.emeraldGreen,
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: BlocBuilder<B2bRequestBloc, B2bRequestState>(
                      builder: (context, state) {
                        if (state.isSuccess) {
                          return B2bRequestSuccessView(
                            trackingId: state.trackingId ?? 'JIN-REQ-2026',
                            onClose: () => Navigator.of(context).pop(),
                          );
                        }
                        if (state.isLoading && state.content == null) {
                          return const Padding(
                            padding: EdgeInsets.all(48),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.cyanInteractive,
                              ),
                            ),
                          );
                        }
                        return B2bModalFormBody(
                          content: state.content,
                          state: state,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
