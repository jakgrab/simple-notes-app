import 'package:intl/intl.dart';

extension Format on DateTime {
  String formatDate(String pattern) {
    return DateFormat(pattern).format(this);
  }
}
