import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizing {
  static screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // check if device is mobile
  static final isMobile = ScreenUtil().screenWidth < 600;

  // text responsiveness
  static double headlineLarge() {
    return isMobile ? 26.sp : 20.sp;
  }

  static double headlineMedium() {
    return isMobile ? 20.sp : 14.sp;
  }

  static double headlineSmall() {
    return isMobile ? 18.sp : 12.sp;
  }

  static double bodyLarge() {
    return isMobile ? 16.sp : 10.sp;
  }

  static double bodyMedium() {
    return isMobile ? 14.sp : 8.sp;
  }
}
