import 'package:cloudwalk_assessment/app/core/utilities/ui_helpers.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test case: Builds ImageCard widget with correct data
  testWidgets(
    'Builds ImageCard widget with correct data',
    (tester) async {
      // define the image entity
      const image = ImageEntity(
        title: 'Image Title',
        date: '2022-01-01',
        explanation: 'Image Explanation',
        imgUrl: 'https://example.com/image.jpg',
      );

      // pump the ImageCard widget using ScreenUtilInit and MaterialApp
      await tester.pumpWidget(
        ScreenUtilInit(builder: (context, child) {
          return MaterialApp(
            home: Material(
              child: Builder(
                builder: (context) => UiHelpers.imageCard(image, context),
              ),
            ),
          );
        }),
      );

      // verify that the ImageCard widget is built correctly
      expect(find.byType(ImageCard), findsOneWidget);
      expect(find.text('Image Title'), findsOneWidget);
      expect(find.text('01 January 2022'), findsOneWidget);
    },
  );

  // test case: Builds the FilledButton widget
  testWidgets(
    'Build the FilledButton',
    (tester) async {
      // pump the FilledButton widget using ScreenUtilInit and MaterialApp
      await tester.pumpWidget(
        ScreenUtilInit(builder: (context, child) {
          return MaterialApp(
            home: Material(
              child: UiHelpers.filledButton("", () {}),
            ),
          );
        }),
      );

      // verify that the FilledButton widget is built correctly
      expect(find.byType(FilledButton), findsOneWidget);
    },
  );

  // test case: Builds the ActivityIndicator widget
  testWidgets(
    'Build the ActivityIndicator',
    (tester) async {
      // pump the ActivityIndicator widget using ScreenUtilInit and MaterialApp
      await tester.pumpWidget(
        ScreenUtilInit(builder: (context, child) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: UiHelpers.loader(),
              ),
            ),
          );
        }),
      );

      // verify that the ActivityIndicator is built correctly
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
    },
  );
}
