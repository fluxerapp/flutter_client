import 'package:fluxer_app/material_ui.dart';

const Map<String, String> _greekTonos = <String, String>{
  'Ά': 'Α',
  'Έ': 'Ε',
  'Ή': 'Η',
  'Ί': 'Ι',
  'Ό': 'Ο',
  'Ύ': 'Υ',
  'Ώ': 'Ω',
};

String localeUpperCase(BuildContext context, String value) {
  final String language = Localizations.localeOf(context).languageCode;
  if (language == 'tr' || language == 'az') {
    return value.replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();
  }
  final String upper = value.toUpperCase();
  if (language == 'el') {
    return upper.split('').map((String c) => _greekTonos[c] ?? c).join();
  }
  return upper;
}
