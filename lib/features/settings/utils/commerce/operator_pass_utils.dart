import 'package:intl/intl.dart';

bool hasOperatorPassProfileBadge(String? operatorPassSince) {
  return operatorPassSince != null;
}

String formatOperatorPassSinceMonth(String iso, String localeName) {
  final DateTime? date = DateTime.tryParse(iso);
  if (date == null) {
    return iso;
  }
  return DateFormat.yMMMM(localeName).format(date.toLocal());
}
