import 'package:cloudwalk_assessment/app/core/utilities/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Returns formatted date string', () {
    const dateString = '2022-01-01';
    const expectedFormattedDate = '01 January 2022';

    final formattedDate = Helpers.formatDate(dateString);

    expect(formattedDate, equals(expectedFormattedDate));
  });
}
