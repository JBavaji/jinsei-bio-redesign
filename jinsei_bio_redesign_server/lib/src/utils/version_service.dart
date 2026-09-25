import 'dart:io';

/// Production-Grade Dynamic Version Service
/// Dynamically reads and caches package version from pubspec.yaml
class VersionService {
  static String? _cachedVersion;
  static const String fallbackVersion = '1.2.2+14';

  /// Returns the current package version dynamically parsed from pubspec.yaml
  static String get version {
    if (_cachedVersion != null) return _cachedVersion!;
    _cachedVersion = _readVersionFromPubspec();
    return _cachedVersion!;
  }

  /// Locate and parse 'version:' from pubspec.yaml
  static String _readVersionFromPubspec() {
    try {
      final candidates = [
        File('pubspec.yaml'),
        File('jinsei_bio_redesign_server/pubspec.yaml'),
        File('../jinsei_bio_redesign_server/pubspec.yaml'),
      ];

      for (final file in candidates) {
        if (file.existsSync()) {
          final lines = file.readAsLinesSync();
          for (final line in lines) {
            final trimmed = line.trim();
            if (trimmed.startsWith('version:')) {
              final parts = trimmed.split(':');
              if (parts.length > 1) {
                final value = parts[1].trim().replaceAll("'", '').replaceAll('"', '');
                if (value.isNotEmpty) {
                  return value;
                }
              }
            }
          }
        }
      }
    } catch (_) {
      // Graceful fallback if filesystem access is restricted in container sandbox
    }
    return fallbackVersion;
  }

  /// Reset cache for testing purposes
  static void resetCache() {
    _cachedVersion = null;
  }
}
