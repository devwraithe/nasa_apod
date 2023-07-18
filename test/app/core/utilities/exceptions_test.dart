import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:test/test.dart';

void main() {
  group('ServerException', () {
    test('Has correct failure property', () {
      const failure = Failure('Server error');
      const exception = ServerException(failure);

      expect(exception.failure, equals(failure));
    });

    test('Implements Equatable', () {
      const failure = Failure('Server error');
      const exception1 = ServerException(failure);
      const exception2 = ServerException(failure);

      expect(exception1, equals(exception2));
      expect(exception1.hashCode, equals(exception2.hashCode));
    });
  });

  group('NetworkException', () {
    test('Has correct failure property', () {
      const failure = Failure('Network error');
      const exception = NetworkException(failure);

      expect(exception.failure, equals(failure));
    });

    test('Implements Equatable', () {
      const failure = Failure('Network error');
      const exception1 = NetworkException(failure);
      const exception2 = NetworkException(failure);

      expect(exception1, equals(exception2));
      expect(exception1.hashCode, equals(exception2.hashCode));
    });
  });
}
