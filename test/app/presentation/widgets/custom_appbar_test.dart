import 'package:cloudwalk_assessment/app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders CustomAppBar correctly', (tester) async {
    String? searchText;

    await tester.pumpWidget(
      ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: CustomAppBar(
              onChanged: (value) {
                searchText = value;
              },
            ),
          ),
        );
      }),
    );

    expect(find.text("Astronomia 🚀"), findsOneWidget);

    final searchFieldFinder = find.byType(TextField);
    expect(searchFieldFinder, findsOneWidget);
    await tester.enterText(searchFieldFinder, "Test search");
    expect(searchText, "Test search");
  });
}
