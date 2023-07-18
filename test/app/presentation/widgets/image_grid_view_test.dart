import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/images_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // list of mock images
  final images = [
    const ImageEntity(
      title: "Image 1",
      date: "2022-01-01",
      explanation: "Explanation 1",
      imgUrl: "imgUrl1",
    ),
    const ImageEntity(
      title: "Image 2",
      date: "2022-01-02",
      explanation: "Explanation 2",
      imgUrl: "imgUrl2",
    ),
  ];

  testWidgets(
    'renders GridView with correct item count and widgets',
    (tester) async {
      final showMoreButton = ElevatedButton(
        onPressed: () {},
        child: const Text('Show More'),
      );

      // pump the widget tree
      await tester.pumpWidget(
        ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              home: Scaffold(
                body: ImagesGridView(
                  itemCount: 2,
                  retrievedImages: images,
                  allImages: images,
                  displayedImages: images,
                  showMoreButton: showMoreButton,
                ),
              ),
            );
          },
        ),
      );

      // verify the GridView widget is rendered
      expect(find.byType(GridView), findsOneWidget);
    },
  );
}
