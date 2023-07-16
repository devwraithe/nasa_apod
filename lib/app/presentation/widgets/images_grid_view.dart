import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:flutter/material.dart';

class ImagesGridView extends StatelessWidget {
  final int itemCount;
  final List retrievedImages, allImages, displayedImages;
  final Widget showMoreButton;
  const ImagesGridView(this.itemCount, this.retrievedImages, this.allImages,
      this.displayedImages, this.showMoreButton,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 34,
        mainAxisSpacing: 34,
      ),
      shrinkWrap: true,
      primary: true,
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      padding: const EdgeInsets.fromLTRB(34, 8, 34, 28),
      itemBuilder: (context, index) {
        if (retrievedImages.isNotEmpty) {
          final image = retrievedImages[index];
          return UiHelpers.imageCard(image, context);
        } else {
          final image = allImages[index];
          if (index == displayedImages.length) {
            return showMoreButton;
          }
          return UiHelpers.imageCard(image, context);
        }
      },
    );
  }
}
