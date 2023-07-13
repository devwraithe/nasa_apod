import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/ui_helpers.dart';
import 'colors.dart';

class AppInputDecorationTheme {
  static final inputDecoration = InputDecorationTheme(
    hintStyle: AppTextTheme.textTheme.bodyLarge?.copyWith(
      color: AppColors.grey,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 26, 20, 18),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isDense: true,
    border: UiHelpers.inputStyle(AppColors.grey),
    enabledBorder: UiHelpers.inputStyle(AppColors.grey),
    focusedBorder: UiHelpers.inputStyle(AppColors.black),
  );
}
