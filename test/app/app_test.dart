import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // initialize the dependency injector
  di.init();

  testWidgets('should build the app', (WidgetTester tester) async {
    // pump the widget tree
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ImagesCubit>(
            // create the ImagesCubit using the dependency injector
            create: (_) => di.sl<ImagesCubit>(),
          ),
        ],
        child: ScreenUtilInit(builder: (context, child) {
          return const MaterialApp(
            // build the cloudwalk assessment app
            home: HomeScreen(),
          );
        }),
      ),
    );

    // verify that the home screen widget is built
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
