import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'app/core/utilities/adapter.dart';
import 'app/core/utilities/dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize dependency injectors
  di.init();
  // initialize hive and register adapters - for offline support
  await Hive.initFlutter();
  Hive.registerAdapter(ImageEntityAdapter());
  // initialize screen utils - for responsiveness
  await ScreenUtil.ensureScreenSize();
  runApp(const CloudwalkAssessment());
}
