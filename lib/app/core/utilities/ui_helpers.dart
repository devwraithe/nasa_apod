import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/photo_card.dart';
import '../routes/routes.dart';
import '../theme/colors.dart';
import '../theme/text_theme.dart';
import 'date_format.dart';

class UiHelpers {
  // style the input field
  static inputStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.2,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  // show the image widget
  static image(ImageEntity image, BuildContext context) {
    return PhotoCard(
      title: image.title,
      date: FormatDate.format(image.date),
      image: image.hdUrl,
      onTap: () => Navigator.pushNamed(
        context,
        Routes.detail,
        arguments: image,
      ),
    );
  }

  // show more button widget
  static showMoreButton(void Function()? onPressed) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.black,
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Text(
        'Show More',
        style: AppTextTheme.textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

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
}
