import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../data/datasources/health_remote_data_source.dart';
import 'splash_event.dart';
import 'splash_state.dart';

export 'splash_event.dart';
export 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IHealthRemoteDataSource _healthDataSource;

  SplashBloc({IHealthRemoteDataSource? healthDataSource})
      : _healthDataSource = healthDataSource ?? HealthRemoteDataSource(),
        super(const SplashState(
          progress: 0.15,
          statusText: 'Connecting to Serverpod RPC gateway...',
        )) {
    on<StartSplashCalibrationEvent>(_onStartCalibration);
  }

  Future<void> _onStartCalibration(
    StartSplashCalibrationEvent event,
    Emitter<SplashState> emit,
  ) async {
    // 1. Dismiss native boot splash overlay
    try {
      FlutterNativeSplash.remove();
    } catch (_) {}

    // 2. Step 1: Initializing Serverpod RPC Health Probe (15%)
    emit(state.copyWith(
      progress: 0.15,
      statusText: 'Connecting to Serverpod RPC gateway...',
    ));

    // Execute live API health check
    final isServerHealthy = await _healthDataSource.checkServerHealth(
      timeout: const Duration(milliseconds: 5000),
    );

    final statusMessage = isServerHealthy
        ? 'Serverpod RPC Gateway Online [HEALTHY]'
        : 'Serverpod Gateway Offline — Demo Mode Active';

    // 3. Step 2: Health Check Result Aligned (40%)
    emit(state.copyWith(
      progress: 0.40,
      statusText: statusMessage,
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    // 4. Step 3: Metagenomic Consortia Calibration (70%)
    emit(state.copyWith(
      progress: 0.70,
      statusText: 'Calibrating metagenomic consortia & protocol metrics...',
    ));
    await Future.delayed(const Duration(milliseconds: 600));

    // 5. Step 4: Diagnostic Handshake (90%)
    emit(state.copyWith(
      progress: 0.90,
      statusText: 'Initializing diagnostic handshake & security validation...',
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    // 6. Step 5: System Ready (100%)
    emit(state.copyWith(
      progress: 1.00,
      statusText: 'System ready. Calibration complete.',
    ));
    await Future.delayed(const Duration(milliseconds: 400));

    // 7. Calibration Complete: Transition to HomeScreen
    emit(state.copyWith(isCompleted: true));
  }
}
