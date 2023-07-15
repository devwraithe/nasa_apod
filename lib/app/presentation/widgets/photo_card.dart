import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String title, date, image;
  final Function()? onTap;

  const PhotoCard({
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
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: title,
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => UiHelpers.imagePreload(),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: Constants.imageHeight,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: AppTextTheme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
