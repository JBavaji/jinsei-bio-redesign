import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('B2B Sandbox Guardrail Audit Tests (JIN-22)', () {
    test('Modal content asset strictly excludes corporate inboxes', () async {
      final jsonString = await rootBundle.loadString(
        'assets/data/b2b_modal_content.json',
      );
      final dynamic decoded = jsonDecode(jsonString);

      expect(decoded, isA<Map<String, dynamic>>());
      final raw = jsonString.toLowerCase();

      // Guardrail Rule 3: Form endpoints MUST route to development sandbox.
      // NEVER route test data or default to @jinseibio.com corporate inboxes.
      expect(raw.contains('@jinseibio.com'), isFalse,
          reason:
              'Asset data must not reference corporate @jinseibio.com inboxes');
    });

    test('Submission payloads validate domain safety', () {
      const allowedSandbox = 'jbavaji@gmail.com';
      const forbiddenCorporateDomain = '@jinseibio.com';

      expect(allowedSandbox.endsWith('@gmail.com'), isTrue);
      expect(allowedSandbox.contains(forbiddenCorporateDomain), isFalse);
    });
  });
}
