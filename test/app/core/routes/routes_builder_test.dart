import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/core/routes/routes_builder.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/detail_screen.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test case: should contain correct routes and widget builders
  test('should contain correct routes and widget builders', () {
    // define the expected routes and their corresponding widget builders
    final expectedRoutes = <String, WidgetBuilder>{
      Routes.home: (context) => const HomeScreen(),
      Routes.detail: (context) => const DetailScreen(),
    };

    // assert that the appRoutes map has the same number of keys as the expectedRoutes map
    expect(appRoutes.keys.length, equals(expectedRoutes.keys.length));

    // iterate through each entry in appRoutes
    for (final entry in appRoutes.entries) {
      final route = entry.key;
      final widgetBuilder = entry.value;

      // assert that the expectedRoutes contains the current route key
      expect(expectedRoutes.containsKey(route), isTrue);

      // assert that the widgetBuilder is of type WidgetBuilder
      expect(widgetBuilder, isA<WidgetBuilder>());

      // assert that the runtime types of widgetBuilder and the corresponding expectedRoutes widget builder match
      expect(
        widgetBuilder.runtimeType,
        equals(
          expectedRoutes[route]!.runtimeType,
        ),
      );

      // additional assertions specific to each route
      if (widgetBuilder == expectedRoutes[Routes.home]) {
        final homeScreen = widgetBuilder;
        expect(homeScreen, isA<HomeScreen>());
      } else if (widgetBuilder == expectedRoutes[Routes.detail]) {
        final detailScreen = widgetBuilder;
        expect(detailScreen, isA<DetailScreen>());
      }
    }
  });
}
