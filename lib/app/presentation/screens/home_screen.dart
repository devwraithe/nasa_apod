import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/core/utilities/date_format.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/nasa_images/nasa_images_states.dart';
import '../widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _getImages() async {
    try {
      await BlocProvider.of<ImagesCubit>(context).getImages();
    } catch (e) {
      debugPrint("An error occurred: $e");
    }
  }

  List images = [];
  List displayedImages = [];
  int displayedImagesCount = 5;

  void loadMoreImages() {
    int endIndex = displayedImages.length + displayedImagesCount;
    if (endIndex >= images.length) {
      endIndex = images.length;
    }
    setState(() {
      displayedImages.addAll(
        images.getRange(displayedImages.length, endIndex),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getImages();
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
          const SearchField(),
          Expanded(
            child: BlocConsumer<ImagesCubit, ImagesStates>(
              listener: (context, state) {
                if (state is ImagesLoaded) {
                  setState(() => images = state.result);
                  loadMoreImages();
                }
              },
              builder: (context, state) {
                if (state is ImagesLoaded) {
                  return RefreshIndicator(
                    key: refreshKey,
                    onRefresh: () => _getImages(),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: displayedImages.length +
                          (displayedImages.length < images.length ? 1 : 0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      itemBuilder: (context, index) {
                        final photo = images[index];
                        if (index == displayedImages.length) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              // onPressed: () {
                              //   loadMoreImages();
                              // },
                              onPressed: displayedImages.length < images.length
                                  ? loadMoreImages
                                  : null,
                              child: Text('Load More'),
                            ),
                          );
                        }
                        return PhotoCard(
                          title: photo.title,
                          date: FormatDate.format(photo.date),
                          image: photo.hdUrl,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.detail,
                              arguments: photo,
                            );
                          },
                        );
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
