import 'dart:async';

import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/utilities/helpers.dart';
import 'package:cloudwalk_assessment/app/core/utilities/sizing.dart';
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/custom_app_bar.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/images_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/images_states.dart';
import '../widgets/images_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final searchController = TextEditingController();

  List allImages = [];
  List displayedImages = []; // for pagination
  List retrievedImages = []; // for search
  int displayedImagesCount = 5; // num of images to show at once

  @override
  Widget build(BuildContext context) {
    // handle pagination - for all images and search
    final itemCount = retrievedImages.isEmpty
        ? displayedImages.length +
            (displayedImages.length < allImages.length ? 1 : 0)
        : retrievedImages.length;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(onChanged: (value) => filterImages(value)),
          BlocConsumer<ImagesCubit, ImagesStates>(
            listener: (context, state) {
              if (state is ImagesLoaded) {
                setState(() => allImages = state.result);
                displayedImages.length < 5 ? moreImages() : null;
              }
            },
            builder: (context, state) {
              if (state is ImagesLoaded) {
                return Flexible(
                  child: RefreshIndicator(
                    key: refreshKey,
                    color: AppColors.black,
                    onRefresh: getImages,
                    child: Sizing.isMobile
                        ? ImagesListView(
                            itemCount: itemCount,
                            retrievedImages: retrievedImages,
                            allImages: allImages,
                            displayedImages: displayedImages,
                            showMoreButton: UiHelpers.filledButton(
                              "Show More",
                              displayedImages.length < allImages.length
                                  ? moreImages
                                  : null,
                            ),
                          )
                        : ImagesGridView(
                            itemCount: itemCount,
                            retrievedImages: retrievedImages,
                            allImages: allImages,
                            displayedImages: displayedImages,
                            showMoreButton: UiHelpers.filledButton(
                              "ShowMore",
                              displayedImages.length < allImages.length
                                  ? moreImages
                                  : null,
                            ),
                          ),
                  ),
                );
              } else if (state is ImagesError) {
                return UiHelpers.errorUi(() => getImages());
              } else if (state is ImagesLoading) {
                return UiHelpers.loader();
              } else {
                return UiHelpers.errorUi(() => getImages());
              }
            },
          ),
        ],
      ),
    );
  }

  // connect to the cubit and retrieve images
  Future<void> getImages() async {
    await BlocProvider.of<ImagesCubit>(context).getImages();
  }

  // filter the images for search feature
  Future<void> filterImages(String searchText) async {
    List images = [];
    if (searchText.isEmpty) {
      images = [];
    } else {
      images = allImages.where((photo) {
        final titleMatches =
            photo.title.toLowerCase().contains(searchText.toLowerCase());
        final dateMatches = Helpers.formatDate(photo.date)
            .toLowerCase()
            .contains(searchText.toLowerCase());
        return titleMatches || dateMatches;
      }).toList();
    }

    setState(() => retrievedImages = images);
  }

  // handle pagination, show 5 images at once
  Future<void> moreImages() async {
    int endIndex = displayedImages.length + displayedImagesCount;
    if (endIndex >= allImages.length) endIndex = allImages.length;

    setState(
      () => displayedImages.addAll(
        allImages.getRange(
          displayedImages.length,
          endIndex,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
