import 'package:flutter/material.dart';

import '../../core/theme/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomAppBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Text(
              "Astronomia \u{1F680}",
              style: AppTextTheme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            style: AppTextTheme.textTheme.bodyMedium,
            decoration: const InputDecoration(
              hintText: "Find by title or date e.g 20 June 2023",
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
