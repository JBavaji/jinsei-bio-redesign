class AppConfig {
  /// Base URL for Serverpod Backend API instance.
  /// Overridden dynamically during Staging/Production build via `--dart-define=SERVERPOD_URL=https://...`
  static const String serverpodUrl = String.fromEnvironment(
    'SERVERPOD_URL',
    defaultValue: 'http://localhost:8080/',
  );

  /// App Environment Mode flag (`UNOFFICIAL_DEMO`)
  static const String appMode = String.fromEnvironment(
    'APP_MODE',
    defaultValue: 'UNOFFICIAL_DEMO',
  );
}
