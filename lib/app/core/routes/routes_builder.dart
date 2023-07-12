import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/detail_screen.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

final appRoutes = <String, WidgetBuilder>{
  Routes.home: (context) => const HomeScreen(),
  Routes.detail: (context) => const DetailScreen(),
};
