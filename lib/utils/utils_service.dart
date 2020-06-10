import 'dart:ui';

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

/// Compare 2 dates sans les heures, minutes et secondes
/// -1 si firstDate est avant secondDate
/// 0 si les deux dates sont égales
/// 1 si firstDate est après secondDate
int compareOnlyDateTo(DateTime firstDate, DateTime secondDate) {
  DateTime firstDateParsed =
      new DateTime(firstDate.year, firstDate.month, firstDate.day);
  DateTime secondDateParsed =
      new DateTime(secondDate.year, secondDate.month, secondDate.day);

  return firstDateParsed.compareTo(secondDateParsed);
}
