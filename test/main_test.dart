import 'package:cloudwalk_assessment/app/app.dart';
import 'package:cloudwalk_assessment/app/core/utilities/dependency_injector.dart'
    as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should initialize the app', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    di.init();
    await ScreenUtil.ensureScreenSize();
    await tester.pumpWidget(
      const CloudwalkAssessment(),
    );
  });
}
