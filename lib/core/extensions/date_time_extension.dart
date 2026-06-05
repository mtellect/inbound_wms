part of 'base_extension.dart';

extension DateTimeExtension on DateTime {
  String get formatShortDateWithTime => DateFormatter.formatShortDateWithTime(this);
  String get formatWithOrdinal => DateFormatter.formatWithOrdinal(this);
  String get formatShortDate => DateFormatter.formatShortDate(this);
}
