import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jinsei_bio_redesign/src/core/widgets/app_error_state_view.dart';

void main() {
  testWidgets('AppErrorStateView renders error message and triggers onRetry',
      (WidgetTester tester) async {
    bool retryClicked = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppErrorStateView(
            errorMessage: 'Network error occurred',
            onRetry: () {
              retryClicked = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Network error occurred'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    await tester.tap(find.text('Retry'));
    await tester.pump();

    expect(retryClicked, isTrue);
  });
}
