import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextTheme', () {
    test('should have correct text styles', () {
      const textTheme = AppTextTheme.textTheme;

      expect(textTheme.displayLarge?.fontSize, 56);
      expect(textTheme.displayLarge?.color, AppColors.black);
      expect(textTheme.displayLarge?.fontWeight, FontWeight.w700);

      expect(textTheme.displayMedium?.fontSize, 40);
      expect(textTheme.displayMedium?.color, AppColors.black);
      expect(textTheme.displayMedium?.fontWeight, FontWeight.w700);

      // Add assertions for other text styles...
    });
  });
}
