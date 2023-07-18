import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should have correct color values', () {
    expect(AppColors.black, const Color(0xFF000000));
    expect(AppColors.white, const Color(0xFFFFFFFF));
    expect(AppColors.grey, const Color(0xFFB7B7B7));
  });
}
