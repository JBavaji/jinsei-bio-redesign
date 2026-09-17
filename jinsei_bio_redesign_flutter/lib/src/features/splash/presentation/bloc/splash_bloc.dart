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

    // 3. Step 2 Calibration: Metagenomic Consortia (78%)
    emit(state.copyWith(
      progress: 0.78,
      statusText: 'Calibrating metagenomic consortia...',
    ));
    await Future.delayed(const Duration(milliseconds: 1000));

    // 4. Step 3 Calibration: Diagnostic Handshake (100%)
    emit(state.copyWith(
      progress: 1.0,
      statusText: 'Diagnostic gateway ready.',
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    // 5. Signal boot completion for seamless Gateway transition
    emit(state.copyWith(isCompleted: true));
  }
}
