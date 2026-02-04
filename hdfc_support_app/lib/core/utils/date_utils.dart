import 'package:intl/intl.dart';

class DateUtilsHelper {
  static String formatReadableSafe(String? isoTimestamp) {
    if (isoTimestamp == null || isoTimestamp.isEmpty) return "--";

    try {
      final dateTime = DateTime.parse(isoTimestamp);
      return DateFormat("dd MMM yyyy, hh:mm a").format(dateTime);
    } catch (e) {
      return "--";
    }
  }
}
