import 'package:flutter/foundation.dart';

class AppConfig {
  static const String _envServerpodUrl =
      String.fromEnvironment('SERVERPOD_URL');

  /// Base URL for Serverpod Backend API instance.
  /// Overridden dynamically during Staging/Production build via `--dart-define=SERVERPOD_URL=https://...`
  static String get serverpodUrl {
    if (_envServerpodUrl.isNotEmpty) {
      return _envServerpodUrl;
    }
    // Prevent web release/staging builds from calling http://localhost:8080/
    if (kIsWeb && !kDebugMode) {
      return 'https://staging-api.jinseibioscience.com/';
    }
    return 'http://localhost:8080/';
  }

  /// App Environment Mode flag (`UNOFFICIAL_DEMO`)
  static const String appMode = String.fromEnvironment(
    'APP_MODE',
    defaultValue: 'UNOFFICIAL_DEMO',
  );
}
