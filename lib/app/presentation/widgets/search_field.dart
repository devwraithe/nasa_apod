import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: AppTextTheme.textTheme.bodyLarge,
        decoration: const InputDecoration(
          hintText: "Find by title or date",
        ),
      ),
    );
  }
}
