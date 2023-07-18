import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../../core/utilities/sizing.dart';

class ImageCard extends StatelessWidget {
  final String title, date, image;
  final Function()? onTap;

  const ImageCard({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 310,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sizing.isMobile
                ? UiHelpers.image(image, title)
                : Expanded(child: UiHelpers.image(image, title)),
            const SizedBox(height: 14),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Sizing.isMobile
                  ? textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w600)
                  : textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: Sizing.isMobile
                  ? textTheme.bodyLarge?.copyWith(color: AppColors.grey)
                  : textTheme.bodyMedium?.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
