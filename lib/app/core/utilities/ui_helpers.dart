import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/sizing.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/image_card.dart';
import '../routes/routes.dart';
import '../theme/colors.dart';
import '../theme/text_theme.dart';
import 'helpers.dart';

class UiHelpers {
  // input field styling - search
  static inputStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(Sizing.isMobile ? 10 : 14),
    );
  }

  // image card for lists
  static imageCard(ImageEntity image, BuildContext context) {
    return ImageCard(
      title: image.title,
      date: Helpers.formatDate(image.date),
      image: image.hdUrl,
      onTap: () => Navigator.pushNamed(
        context,
        Routes.detail,
        arguments: image,
      ),
    );
  }

  // more button widget for pagination
  static showMoreButton(void Function()? onPressed) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.black,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Show More',
        style: textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  // mock component for image preload
  static imagePreload() {
    return Container(
      height: Constants.imageHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.grey,
            AppColors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  // image for imageCard
  static image(String image, Object title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Hero(
        tag: title,
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) => UiHelpers.imagePreload(),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          height: Sizing.isMobile ? Constants.imageHeight : null,
          width: double.infinity,
        ),
      ),
    );
  }
}
