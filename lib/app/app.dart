import 'package:cloudwalk_assessment/app/core/routes/routes_builder.dart';
import 'package:cloudwalk_assessment/app/core/theme/theme.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CloudwalkAssessment extends StatelessWidget {
  const CloudwalkAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudwalk Assessment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
      routes: appRoutes,
    );
  }
}
