import 'package:cloudwalk_assessment/app/app.dart';
import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should initialize the app', (tester) async {
    // ensure the test environment is initialized
    TestWidgetsFlutterBinding.ensureInitialized();

    // initialize the dependency injector
    di.init();

    // ensure the screen size is available for responsive UI testing
    await ScreenUtil.ensureScreenSize();

    // pump the widget tree
    await tester.pumpWidget(
      // build the cloudwalk assessment app
      const CloudwalkAssessment(),
    );
  });
}
