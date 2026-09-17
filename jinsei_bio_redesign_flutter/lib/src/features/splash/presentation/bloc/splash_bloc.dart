import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'splash_event.dart';
import 'splash_state.dart';

export 'splash_event.dart';
export 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
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

    // 2. Step 1 Calibration: RPC & Serverpod (30%)
    emit(state.copyWith(
      progress: 0.30,
      statusText: 'Connecting to Serverpod RPC gateway...',
    ));
    await Future.delayed(const Duration(milliseconds: 700));

    // 3. Step 2 Calibration: Metagenomic Consortia (65%)
    emit(state.copyWith(
      progress: 0.65,
      statusText: 'Calibrating metagenomic consortia...',
    ));
    await Future.delayed(const Duration(milliseconds: 800));

    // 4. Step 3 Calibration: Diagnostic Handshake (88%)
    emit(state.copyWith(
      progress: 0.88,
      statusText: 'Initializing diagnostic handshake...',
    ));
    await Future.delayed(const Duration(milliseconds: 700));

    // 5. Step 4 Calibration: System Ready (100%)
    emit(state.copyWith(
      progress: 1.00,
      statusText: 'System ready. Calibration complete.',
    ));
    await Future.delayed(const Duration(milliseconds: 400));

    // 6. Calibration Complete: Transition to HomeScreen
    emit(state.copyWith(isCompleted: true));
  }
}
