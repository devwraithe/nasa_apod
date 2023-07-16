import 'package:cloudwalk_assessment/app/core/utilities/sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/text_theme.dart';

class CustomAppBar extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomAppBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets contentPadding = Sizing.isMobile
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 24)
        : const EdgeInsets.symmetric(horizontal: 34, vertical: 40);

    return Padding(
      padding: contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Text(
              "Astronomia \u{1F680}",
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: Sizing.isMobile ? 18 : 18.h),
          TextField(
            style: textTheme.bodyMedium,
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
