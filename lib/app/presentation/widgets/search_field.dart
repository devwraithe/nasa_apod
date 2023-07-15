import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchField({
    super.key,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: AppTextTheme.textTheme.bodyLarge,
        decoration: const InputDecoration(
          hintText: "Find by title or date e.g 20 June 2023",
        ),
        onChanged: onChanged,
      ),
    );
  }
}
