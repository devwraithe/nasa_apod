import 'package:cloudwalk_assessment/app/core/theme/input_decoration_theme.dart';
import 'package:cloudwalk_assessment/app/core/theme/theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('should have correct theme', () {
      final theme = AppTheme.theme;

      expect(
        theme.inputDecorationTheme,
        equals(AppInputDecorationTheme.inputDecoration),
      );
    });
  });
}
