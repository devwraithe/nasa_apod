import 'package:intl/intl.dart';

class Helpers {
  static String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat("dd MMMM yyyy").format(date);
    return formattedDate;
  }
}
