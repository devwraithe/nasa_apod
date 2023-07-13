import 'package:intl/intl.dart';

class FormatDate {
  static String format(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat("dd MMMM yyyy").format(date);
    return formattedDate;
  }
}
