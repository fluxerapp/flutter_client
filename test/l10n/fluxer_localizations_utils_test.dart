import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;

void main() {
  test('flutterLocaleFromSdkLocale maps regional tags', () {
    expect(
      flutterLocaleFromSdkLocale(sdk.Locale.enUs),
      const Locale('en', 'US'),
    );
    expect(
      flutterLocaleFromSdkLocale(sdk.Locale.enGb),
      const Locale('en', 'GB'),
    );
    expect(
      flutterLocaleFromSdkLocale(sdk.Locale.es419),
      const Locale('es', '419'),
    );
    expect(
      flutterLocaleFromSdkLocale(sdk.Locale.zhTw),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    );
    expect(flutterLocaleFromSdkLocale(sdk.Locale.de), const Locale('de'));
  });
}
