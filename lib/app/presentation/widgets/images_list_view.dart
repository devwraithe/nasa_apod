import 'package:flutter/material.dart';

import '../../core/utilities/ui_helpers.dart';

class ImagesListView extends StatelessWidget {
  final int itemCount;
  final List retrievedImages, allImages, displayedImages;
  final Widget showMoreButton;

  const ImagesListView({
    super.key,
    required this.itemCount,
    required this.retrievedImages,
    required this.allImages,
    required this.displayedImages,
    required this.showMoreButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      itemBuilder: (context, index) {
        if (retrievedImages.isNotEmpty) {
          final image = retrievedImages[index];
          return UiHelpers.imageCard(image, context);
        } else {
          final image = allImages[index];
          if (index == displayedImages.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: showMoreButton,
            );
          }
          return UiHelpers.imageCard(image, context);
        }
      },
    );
  }
}
