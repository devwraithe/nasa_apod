import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              height: 240,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            "Webb's Rho Ophiuchi",
            style: AppTextTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            "13th July 2023",
            style: AppTextTheme.textTheme.bodyLarge?.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
