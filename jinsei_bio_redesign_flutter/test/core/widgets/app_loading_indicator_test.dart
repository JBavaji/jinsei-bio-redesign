import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_loading_indicator.dart';

void main() {
  testWidgets('AppLoadingIndicator renders CircularProgressIndicator correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppLoadingIndicator(message: 'Loading test content...'),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading test content...'), findsOneWidget);
  });
}
