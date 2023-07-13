import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/photo_card.dart';
import 'package:flutter/material.dart';

import '../widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          SafeArea(
            child: Text(
              "Astronomia",
              style: AppTextTheme.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 10),
          const SearchField(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              itemBuilder: (context, index) {
                return const PhotoCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
