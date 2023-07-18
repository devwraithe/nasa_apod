import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders ImageCard widget correctly', (tester) async {
    const title = 'Image Title';
    const date = '2022-01-01';
    const image = 'path/to/image.jpg';

    // pump the widget tree
    await tester.pumpWidget(
      ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          home: ImageCard(
            title: title,
            date: date,
            image: image,
            onTap: () {},
          ),
        );
      }),
    );

    // verify that the image card widget is rendered
    expect(find.byType(ImageCard), findsOneWidget);

    // verify that widget displaying title text is found
    expect(find.text(title), findsOneWidget);

    // verify that widget displaying date text is found
    expect(find.text(date), findsOneWidget);

    expect(
      find.byWidgetPredicate((widget) {
        if (widget is Image) {
          final imageProvider = widget.image as CachedNetworkImageProvider;

          // check if the image URL matches the expected value
          return imageProvider.url == image;
        }
        return false;
      }),

      // verify that the widget matching the predicate is found
      findsOneWidget,
    );
  });
}
