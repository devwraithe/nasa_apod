import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/input_decoration_theme.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppInputDecorationTheme', () {
    test('should have correct input decoration theme', () {
      final inputDecorationTheme = AppInputDecorationTheme.inputDecoration;

      expect(
        inputDecorationTheme.hintStyle,
        equals(AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.grey,
        )),
      );
      expect(
        inputDecorationTheme.contentPadding,
        equals(const EdgeInsets.fromLTRB(20, 26, 20, 18)),
      );
      expect(
        inputDecorationTheme.floatingLabelBehavior,
        equals(FloatingLabelBehavior.never),
      );
      expect(
        inputDecorationTheme.isDense,
        equals(true),
      );
      expect(
        inputDecorationTheme.border,
        equals(UiHelpers.inputStyle(AppColors.grey)),
      );
      expect(
        inputDecorationTheme.enabledBorder,
        equals(UiHelpers.inputStyle(AppColors.grey)),
      );
      expect(
        inputDecorationTheme.focusedBorder,
        equals(UiHelpers.inputStyle(AppColors.black)),
      );
    });
  });
}
