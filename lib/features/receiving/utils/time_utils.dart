import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String formatSessionTime(DateTime time) {
  final now = DateTime.now();
  final difference = now.difference(time);

  if (difference.inHours < 24 && difference.inHours >= 0) {
    return timeago.format(time);
  } else {
    String day = DateFormat('d').format(time);
    String suffix = 'th';
    if (day.endsWith('1') && day != '11') suffix = 'st';
    else if (day.endsWith('2') && day != '12') suffix = 'nd';
    else if (day.endsWith('3') && day != '13') suffix = 'rd';
    
    String monthYear = DateFormat('MMMM, yyyy').format(time).toLowerCase();
    String timeStr = DateFormat('h:mma').format(time);
    return '$day$suffix $monthYear @ $timeStr';
  }
}
