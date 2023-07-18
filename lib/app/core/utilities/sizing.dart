import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizing {
  // static bool isMobile = false;
  // static double _screenWidth = 0;
  //
  // static void initialize(BuildContext context) {
  //   _screenWidth = MediaQuery.of(context).size.width;
  //   isMobile = _screenWidth < 600;
  // }

  static bool isMobile = ScreenUtil().screenWidth < 600;

  static double headlineLarge = isMobile ? 26.sp : 20.sp;

  static double headlineMedium = isMobile ? 20.sp : 14.sp;

  static double headlineSmall = isMobile ? 18.sp : 12.sp;

  static double bodyLarge = isMobile ? 16.sp : 10.sp;

  static double bodyMedium = isMobile ? 14.sp : 8.sp;
}
