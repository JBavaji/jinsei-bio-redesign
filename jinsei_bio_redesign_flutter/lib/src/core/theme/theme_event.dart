import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

final class LoadThemeEvent extends ThemeEvent {
  const LoadThemeEvent();
}

final class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent();
}

final class SetThemeEvent extends ThemeEvent {
  final ThemeMode mode;

  const SetThemeEvent(this.mode);

  @override
  List<Object?> get props => [mode];
}
