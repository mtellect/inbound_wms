import 'package:intl/intl.dart';

class DateFormatter {
  /// Formats a date to "Sat May 9th, 2025"
  static String formatWithOrdinal(DateTime date) {
    final dayOfWeek = DateFormat('E').format(date);
    final month = DateFormat('MMM').format(date);
    final day = date.day;
    final year = date.year;

    return '$dayOfWeek $month ${_getOrdinal(day)}, $year';
  }

  /// Formats a date to "May 10, 2026 (10:30 PM)"
  static String formatShortDateWithTime(DateTime date) {
    final dateStr = DateFormat('MMM d, yyyy').format(date);
    final timeStr = DateFormat('hh:mm a').format(date);
    return '$dateStr ($timeStr)';
  }

  static String formatShortDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }

  static String _getOrdinal(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}
