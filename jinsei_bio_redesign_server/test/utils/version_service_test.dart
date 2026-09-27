import 'package:jinsei_bio_redesign_server/src/utils/version_service.dart';
import 'package:test/test.dart';

void main() {
  group('VersionService Tests', () {
    tearDown(() {
      VersionService.resetCache();
    });

    test('version returns non-empty string parsed from pubspec.yaml', () {
      final version = VersionService.version;
      expect(version, isNotEmpty);
      expect(version.contains('.'), isTrue);
    });

    test('version caches value on subsequent calls', () {
      final v1 = VersionService.version;
      final v2 = VersionService.version;
      expect(v1, equals(v2));
    });
  });
}
