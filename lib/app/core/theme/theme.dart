import 'package:cloudwalk_assessment/app/core/theme/input_decoration_theme.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: Constants.fontFamily,
    textTheme: AppTextTheme.textTheme,
    inputDecorationTheme: AppInputDecorationTheme.inputDecoration,
  );
}
