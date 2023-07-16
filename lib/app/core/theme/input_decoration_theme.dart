import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../utilities/sizing.dart';
import '../utilities/ui_helpers.dart';
import 'colors.dart';

class AppInputDecorationTheme {
  static const gray = AppColors.grey;

  static final inputDecoration = InputDecorationTheme(
    hintStyle: Sizing.isMobile
        ? textTheme.bodyMedium?.copyWith(color: gray)
        : textTheme.bodyLarge?.copyWith(color: gray),
    contentPadding: Sizing.isMobile
        ? const EdgeInsets.fromLTRB(20, 24, 20, 14)
        : const EdgeInsets.fromLTRB(30, 36, 30, 26),
    border: UiHelpers.inputStyle(AppColors.grey),
    enabledBorder: UiHelpers.inputStyle(AppColors.grey),
    focusedBorder: UiHelpers.inputStyle(AppColors.black),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isDense: true,
  );
}
