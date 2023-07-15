import 'package:cloudwalk_assessment/app/core/routes/routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Routes', () {
    test('should have correct route paths', () {
      expect(Routes.home, '/home');
      expect(Routes.detail, '/detail');
    });
  });
}
