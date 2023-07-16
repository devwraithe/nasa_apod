import 'package:cloudwalk_assessment/app/app.dart';
import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should initialize the app', (WidgetTester tester) async {
    // Ensure Flutter is initialized.
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the dependency injector.
    di.init();

    // Build the app and trigger a frame.
    await tester.pumpWidget(const CloudwalkAssessment());

    // Perform any additional assertions or verifications if needed.
    // For example, you can use `find` to locate widgets and verify their presence.

    // ...
  });
}
