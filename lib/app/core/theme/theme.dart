import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: Constants.fontFamily,
    textTheme: AppTextTheme.textTheme,
  );
}
