class DateUtils {
  static toBRTime(DateTime date) {
    final year = date.year;
    final month = date.month;
    final day = date.day;
    return '$day/$month/$year';
  }
}
