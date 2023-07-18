import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:cloudwalk_assessment/app/core/routes/routes_builder.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/detail_screen.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should contain correct routes and widget builders', () {
    final expectedRoutes = <String, WidgetBuilder>{
      Routes.home: (context) => const HomeScreen(),
      Routes.detail: (context) => const DetailScreen(),
    };

    expect(appRoutes.keys.length, equals(expectedRoutes.keys.length));

    for (final entry in appRoutes.entries) {
      final route = entry.key;
      final widgetBuilder = entry.value;

      expect(expectedRoutes.containsKey(route), isTrue);
      expect(widgetBuilder, isA<WidgetBuilder>());
      expect(
        widgetBuilder.runtimeType,
        equals(
          expectedRoutes[route]!.runtimeType,
        ),
      );

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
