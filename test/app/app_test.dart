import 'package:cloudwalk_assessment/app/app.dart';
import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  di.init();

  testWidgets('should build the app', (WidgetTester tester) async {
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

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
