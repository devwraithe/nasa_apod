import 'package:cloudwalk_assessment/app/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should call onChanged callback when text changes',
      (tester) async {
    String? changedText;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchField(
            onChanged: (text) {
              changedText = text;
            },
          ),
        ),
      ),
    );

    // Find the TextField widget
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Enter text into the TextField
    await tester.enterText(textFieldFinder, 'Test');

    // Verify that onChanged callback is called with the correct text
    expect(changedText, 'Test');
  });
}
