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

    expect(find.byType(ImageCard), findsOneWidget);

    expect(find.text(title), findsOneWidget);

    expect(find.text(date), findsOneWidget);

    expect(
      find.byWidgetPredicate((widget) {
        if (widget is Image) {
          final imageProvider = widget.image as CachedNetworkImageProvider;
          return imageProvider.url == image;
        }
        return false;
      }),
      findsOneWidget,
    );
  });
}
