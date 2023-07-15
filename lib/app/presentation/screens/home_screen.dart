import 'dart:async';

import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/constants.dart';
import 'package:cloudwalk_assessment/app/core/utilities/date_format.dart';
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/nasa_images/nasa_images_states.dart';

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
  int displayedImagesCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2.4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 28,
            ),
            child: Column(
              children: [
                SafeArea(
                  child: Text(
                    "Astronomia \u{1F680}",
                    style: AppTextTheme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SearchField(
                  onChanged: (value) => filterImages(value),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<ImagesCubit, ImagesStates>(
              listener: (context, state) {
                if (state is ImagesLoaded) {
                  setState(() => allImages = state.result);
                  displayedImages.length < 5 ? moreImages() : null;
                }
              },
              builder: (context, state) {
                if (state is ImagesLoaded) {
                  return RefreshIndicator(
                    key: refreshKey,
                    color: AppColors.black,
                    onRefresh: getImages,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: retrievedImages.isEmpty
                          ? displayedImages.length +
                              (displayedImages.length < allImages.length
                                  ? 1
                                  : 0)
                          : retrievedImages.length,
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
                              child: UiHelpers.showMoreButton(
                                displayedImages.length < allImages.length
                                    ? moreImages
                                    : null,
                              ),
                            );
                          }
                          return UiHelpers.image(image, context);
                        }
                      },
                    ),
                  );
                } else if (state is ImagesError) {
                  return Text(state.message);
                } else if (state is ImagesLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.black,
                      radius: 14,
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      Constants.unknownError,
                      style: AppTextTheme.textTheme.bodyLarge,
                    ),
                  );
                }
              },
            ),
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
  Future<void> filterImages(String enteredKeyword) async {
    List images = [];
    if (enteredKeyword.isEmpty) {
      images = []; // less potential
    } else {
      images = allImages.where((photo) {
        final titleMatches = photo.title.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            );
        final dateMatches =
            FormatDate.format(photo.date).toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                );
        return titleMatches || dateMatches;
      }).toList();
    }

    // attach images filtered to retrievedImages
    setState(() {
      retrievedImages = images;
    });
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
