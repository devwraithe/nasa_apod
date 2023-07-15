import 'package:cloudwalk_assessment/app/app.dart';
import 'package:cloudwalk_assessment/app/core/utilities/injectors/dependency_injector.dart'
    as di;
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Initialize the dependencies before running the test.
  di.init();

  testWidgets('should build the app', (WidgetTester tester) async {
    // Build the widget tree.
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ImagesCubit>(
            create: (_) => di.sl<ImagesCubit>(),
          ),
        ],
        child: const MaterialApp(
          home: CloudwalkAssessment(),
        ),
      ),
    );

    // Verify that the `HomeScreen` widget is present.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
