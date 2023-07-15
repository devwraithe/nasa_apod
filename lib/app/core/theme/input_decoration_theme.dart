import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/ui_helpers.dart';
import 'colors.dart';

class AppInputDecorationTheme {
  static final inputDecoration = InputDecorationTheme(
    hintStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(
      color: AppColors.grey,
    ),
    contentPadding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isDense: true,
    border: UiHelpers.inputStyle(AppColors.grey),
    enabledBorder: UiHelpers.inputStyle(AppColors.grey),
    focusedBorder: UiHelpers.inputStyle(AppColors.black),
  );
}
