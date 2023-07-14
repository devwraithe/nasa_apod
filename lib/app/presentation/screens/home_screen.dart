import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/date_format.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/photo_card.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/search_field.dart';
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
  List displayedImages = [];
  List foundImages = []; // for search
  int displayedImagesCount = 5;

  // method to retrieve image cubit
  Future<void> getImages() async {
    try {
      await BlocProvider.of<ImagesCubit>(context).getImages();
    } catch (e) {
      debugPrint("An error occurred: $e");
    }
  }

  Future<void> filterImages(String enteredKeyword) async {
    // foundImages = allImages; // most likely useless

    List results = [];
    if (enteredKeyword.isEmpty) {
      results = []; // less potential
    } else {
      results = allImages.where((photo) {
        final titleMatches =
            photo.title.toLowerCase().contains(enteredKeyword.toLowerCase());
        final dateMatches = FormatDate.format(photo.date)
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase());
        return titleMatches || dateMatches;
      }).toList();
    }

    setState(() {
      foundImages = results;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          SafeArea(
            child: Text(
              "Astronomia",
              style: AppTextTheme.textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 10),
          SearchField(
            onChanged: (value) => filterImages(value),
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
                    onRefresh: getImages,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: foundImages.isEmpty
                          ? displayedImages.length +
                              (displayedImages.length < allImages.length
                                  ? 1
                                  : 0)
                          : foundImages.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      itemBuilder: (context, index) {
                        if (foundImages.isNotEmpty) {
                          final image = foundImages[index];

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
                        } else {
                          final image = allImages[index];
                          if (index == displayedImages.length) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed:
                                    displayedImages.length < allImages.length
                                        ? moreImages
                                        : null,
                                child: const Text('Load More'),
                              ),
                            );
                          }
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
                        // final image = searchController.text.isNotEmpty ?  allImages[index];
                        // if (index == displayedImages.length) {
                        //   return Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: ElevatedButton(
                        //       onPressed:
                        //           displayedImages.length < allImages.length
                        //               ? moreImages
                        //               : null,
                        //       child: const Text('Load More'),
                        //     ),
                        //   );
                        // }
                        // return PhotoCard(
                        //   title: image.title,
                        //   date: FormatDate.format(image.date),
                        //   image: image.hdUrl,
                        //   onTap: () => Navigator.pushNamed(
                        //     context,
                        //     Routes.detail,
                        //     arguments: image,
                        //   ),
                        // );
                      },
                    ),
                  );
                } else if (state is ImagesError) {
                  return const Text("Error");
                } else if (state is ImagesLoading) {
                  return const Text("Loading");
                } else {
                  return const Text("Something went wrong");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
