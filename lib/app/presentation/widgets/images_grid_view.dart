import 'package:flutter/material.dart';

import '../../core/utilities/ui_helpers.dart';

class ImagesGridView extends StatelessWidget {
  final int itemCount;
  final List retrievedImages, allImages, displayedImages;
  final Widget showMoreButton;
  const ImagesGridView(this.itemCount, this.retrievedImages, this.allImages,
      this.displayedImages, this.showMoreButton,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              itemCount: itemCount,
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
            ),
          ),
        ],
      ),
    );
  }
}
