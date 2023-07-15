import 'package:flutter/material.dart';

import '../../core/utilities/ui_helpers.dart';

class ImagesListView extends StatelessWidget {
  final int itemCount;
  final List retrievedImages, allImages, displayedImages;
  final Widget showMoreButton;
  const ImagesListView(this.itemCount, this.retrievedImages, this.allImages,
      this.displayedImages, this.showMoreButton,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 28,
      ),
      itemBuilder: (context, index) {
        if (retrievedImages.isNotEmpty) {
          final image = retrievedImages[index];
          return UiHelpers.image(image, context);
        } else {
          final image = allImages[index];
          if (index == displayedImages.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: showMoreButton,
            );
          }
          return UiHelpers.image(image, context);
        }
      },
    );
  }
}
