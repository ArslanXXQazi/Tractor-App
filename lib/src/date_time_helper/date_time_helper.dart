import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTime(String dateTimeString) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeString);
      return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
    } catch (e) {
      return dateTimeString; // Agar parsing fail ho jaye to original string return kar do
    }
  }
}
