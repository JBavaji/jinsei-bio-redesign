import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final double progress;
  final String statusText;
  final bool isCompleted;

  const SplashState({
    this.progress = 0.0,
    this.statusText = 'Initializing Executive Gateway...',
    this.isCompleted = false,
  });

  SplashState copyWith({
    double? progress,
    String? statusText,
    bool? isCompleted,
  }) {
    return SplashState(
      progress: progress ?? this.progress,
      statusText: statusText ?? this.statusText,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [progress, statusText, isCompleted];
}
