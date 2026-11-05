import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kPushNotificationLocaleKey = 'push_notification_locale';

FluxerLocalizations? _mirrored;

FluxerLocalizations pushNotificationLocalizations() {
  return _mirrored ?? _lookup(PlatformDispatcher.instance.locale);
}

Future<void> loadPushNotificationLocale() async {
  try {
    final String? tag = await SharedPreferencesAsync().getString(
      _kPushNotificationLocaleKey,
    );
    if (tag != null && tag.isNotEmpty) {
      _mirrored = _lookup(parsePushNotificationLocaleTag(tag));
    }
  } on Object {
    return;
  }
}

Future<void> writePushNotificationLocale(String tag) async {
  _mirrored = _lookup(parsePushNotificationLocaleTag(tag));
  try {
    await SharedPreferencesAsync().setString(_kPushNotificationLocaleKey, tag);
  } on Object {
    return;
  }
}

Locale parsePushNotificationLocaleTag(String tag) {
  final List<String> parts = tag.split('-');
  String? script;
  String? country;
  for (final String part in parts.skip(1)) {
    if (part.length == 4) {
      script = part;
    } else {
      country = part;
    }
  }
  return Locale.fromSubtags(
    languageCode: parts.first,
    scriptCode: script,
    countryCode: country,
  );
}

FluxerLocalizations _lookup(Locale locale) {
  try {
    return lookupFluxerLocalizations(locale);
  } on Object {
    return lookupFluxerLocalizations(const Locale('en'));
  }
}
