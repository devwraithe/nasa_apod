import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CloudwalkAssessment extends StatelessWidget {
  const CloudwalkAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cloudwalk Assessment',
      home: HomeScreen(),
    );
  }
}
