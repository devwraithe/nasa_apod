import 'package:cloudwalk_assessment/app/core/utilities/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test case: returns formatted date string
  test('Returns formatted date string', () {
    // define the input date string and the expected formatted date
    const dateString = '2022-01-01';
    const expectedFormattedDate = '01 January 2022';

    // call the formatDate function with the input date string
    final formattedDate = Helpers.formatDate(dateString);

    // verify that the returned formatted date matches the expected formatted date
    expect(formattedDate, equals(expectedFormattedDate));
  });
}
