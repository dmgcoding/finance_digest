import 'package:intl/intl.dart';

String getFormattedDateFromTimestamp(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      timestamp * 1000); // Convert to DateTime
  return DateFormat('d MMMM yyyy').format(dateTime);
}
