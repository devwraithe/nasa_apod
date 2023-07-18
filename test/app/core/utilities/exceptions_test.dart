import 'package:cloudwalk_assessment/app/core/utilities/errors/exceptions.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test group for ServerException
  group('ServerException', () {
    // test case: Has correct failure property
    test('Has correct failure property', () {
      // create a Failure instance
      const failure = Failure('Server error');

      // create a ServerException instance with the Failure
      const exception = ServerException(failure);

      // verify that the failure property is correct
      expect(exception.failure, equals(failure));
    });

    // test case: Implements Equatable
    test('Implements Equatable', () {
      // create a Failure instance
      const failure = Failure('Server error');

      // create two ServerException instances with the same Failure
      const exception1 = ServerException(failure);
      const exception2 = ServerException(failure);

      // verify that the two instances are considered equal and have the same hashCode
      expect(exception1, equals(exception2));
      expect(exception1.hashCode, equals(exception2.hashCode));
    });
  });

  // test group for NetworkException
  group('NetworkException', () {
    // test case: Has correct failure property
    test('Has correct failure property', () {
      // create a Failure instance
      const failure = Failure('Network error');

      // create a NetworkException instance with the Failure
      const exception = NetworkException(failure);

      // verify that the failure property is correct
      expect(exception.failure, equals(failure));
    });

    // test case: Implements Equatable
    test('Implements Equatable', () {
      // create a Failure instance
      const failure = Failure('Network error');

      // create two NetworkException instances with the same Failure
      const exception1 = NetworkException(failure);
      const exception2 = NetworkException(failure);

      // verify that the two instances are considered equal and have the same hashCode
      expect(exception1, equals(exception2));
      expect(exception1.hashCode, equals(exception2.hashCode));
    });
  });
}
