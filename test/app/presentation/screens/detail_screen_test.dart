import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders DetailScreen widget correctly', (tester) async {
    const image = ImageEntity(
      title: 'Image Title',
      date: '2023-02-01',
      explanation: 'Image Explanation',
      imgUrl: 'https://example.com/image.jpg',
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            home: Builder(
              builder: (context) {
                return MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detail,
                      arguments: image,
                    );
                  },
                  child: const Text('Go to DetailScreen'),
                );
              },
            ),
            routes: {
              Routes.detail: (context) => const DetailScreen(),
            },
          );
        },
      ),
    );

    await tester.tap(find.text('Go to DetailScreen'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailScreen), findsOneWidget);

    expect(find.byType(CachedNetworkImage), findsOneWidget);

    expect(find.text(image.title), findsOneWidget);

    expect(find.text(image.explanation), findsOneWidget);

    expect(find.text('Go Back'), findsOneWidget);
  });
}
