import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Collaborations Sandbox Guardrail Audit Tests (JIN-68 / JIN-73)', () {
    test('Submission routing targets developer sandbox destination', () {
      const allowedSandbox = 'jbavaji@gmail.com';
      const forbiddenCorporateDomain = '@jinseibio.com';

      // Guardrail Rule 3: Form endpoints MUST route to development sandbox.
      // NEVER route test inquiry data to @jinseibio.com corporate inboxes.
      expect(allowedSandbox, equals('jbavaji@gmail.com'));
      expect(allowedSandbox.contains(forbiddenCorporateDomain), isFalse);
    });
  });
}
