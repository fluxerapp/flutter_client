import 'package:intl/intl.dart';

const int kOperatorPassWallNameMaxLength = 32;

enum OperatorPassWallNameProblem { required, tooLong }

bool isOperatorPassAvailable({required bool selfHosted}) => !selfHosted;

bool hasOperatorPassProfileBadge(String? operatorPassSince) {
  return operatorPassSince != null;
}

String normalizeOperatorPassWallName(String name) {
  return name.replaceAll(RegExp(r'[\r\n]+'), ' ').trim();
}

OperatorPassWallNameProblem? getOperatorPassWallNameProblem(
  String name,
  bool optOut,
) {
  if (optOut) {
    return null;
  }
  final String trimmed = normalizeOperatorPassWallName(name);
  if (trimmed.isEmpty) {
    return OperatorPassWallNameProblem.required;
  }
  if (trimmed.length > kOperatorPassWallNameMaxLength) {
    return OperatorPassWallNameProblem.tooLong;
  }
  return null;
}

String formatOperatorPassSinceMonth(String iso, String localeName) {
  final DateTime? date = DateTime.tryParse(iso);
  if (date == null) {
    return iso;
  }
  return DateFormat.yMMMM(localeName).format(date.toLocal());
}
