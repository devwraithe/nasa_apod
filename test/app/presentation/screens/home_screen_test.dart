import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/custom_app_bar.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/images_grid_view.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/images_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  // ensure the test environment is initialized
  TestWidgetsFlutterBinding.ensureInitialized();

  // initialize the dependency injector
  di.init();

  testWidgets('renders CustomAppBar and ImagesListView', (tester) async {
    // render the widget tree
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ImagesCubit>(
            create: (_) => di.sl<ImagesCubit>(),
          ),
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return const MaterialApp(
              home: HomeScreen(),
            );
          },
        ),
      ),
    );

    // verify the CustomAppBar widget is rendered
    expect(find.byType(CustomAppBar), findsOneWidget);
  });

  testWidgets('renders RefreshIndicator with child widget based on isMobile',
      (tester) async {
    final images = [
      const ImageEntity(
        title: 'Image Title',
        date: '2023-02-01',
        explanation: 'Image Explanation',
        imgUrl: 'https://example.com/image.jpg',
      ),
      const ImageEntity(
        title: 'Image Title',
        date: '2023-02-01',
        explanation: 'Image Explanation',
        imgUrl: 'https://example.com/image.jpg',
      ),
    ];

    // render the widget tree with ImageListView and it's dependencies
    await tester.pumpWidget(
      ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    key: const Key('refreshIndicator'),
                    color: AppColors.black,
                    onRefresh: () async {},
                    child: ImagesListView(
                      itemCount: images.length,
                      retrievedImages: images,
                      allImages: images,
                      displayedImages: images,
                      showMoreButton: UiHelpers.filledButton(
                        "Show More",
                        () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );

    // verify that the RefreshIndicator and ImagesListView widgets are rendered
    expect(find.byKey(const Key('refreshIndicator')), findsOneWidget);
    // verify that the ImagesListView widget is rendered
    expect(find.byType(ImagesListView), findsOneWidget);
    // verify that the ImagesGridView widget is not rendered
    expect(find.byType(ImagesGridView), findsNothing);
  });

  testWidgets('renders RefreshIndicator with child widget based on isMobile',
      (tester) async {
    final images = [
      const ImageEntity(
        title: 'Image Title',
        date: '2023-02-01',
        explanation: 'Image Explanation',
        imgUrl: 'https://example.com/image.jpg',
      ),
      const ImageEntity(
        title: 'Image Title',
        date: '2023-02-01',
        explanation: 'Image Explanation',
        imgUrl: 'https://example.com/image.jpg',
      ),
    ];

    // render the widget tree with the ImagesGridView widget and its dependencies
    await tester.pumpWidget(
      ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    key: const Key('refreshIndicator'),
                    color: AppColors.black,
                    onRefresh: () async {},
                    child: ImagesGridView(
                      itemCount: images.length,
                      retrievedImages: images,
                      allImages: images,
                      displayedImages: images,
                      showMoreButton: UiHelpers.filledButton(
                        "Show More",
                        () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );

    // verify that the RefreshIndicator widget is rendered
    expect(find.byKey(const Key('refreshIndicator')), findsOneWidget);
    // verify that the ImagesListView widget is not rendered
    expect(find.byType(ImagesListView), findsNothing);
    // verify that the ImagesGridView widget is rendered
    expect(find.byType(ImagesGridView), findsOneWidget);
  });
}
