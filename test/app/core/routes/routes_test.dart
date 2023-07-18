import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test group: Routes
  group('Routes', () {
    // test case: should have correct route paths
    test('should have correct route paths', () {
      // assert that the route paths are as expected
      expect(Routes.home, '/home');
      expect(Routes.detail, '/detail');
    });
  });
}
