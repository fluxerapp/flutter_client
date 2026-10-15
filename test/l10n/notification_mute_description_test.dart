import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  test('community mute copy does not promise mention notifications', () {
    for (final Locale locale in const <Locale>[
      Locale('en'),
      Locale('en', 'US'),
    ]) {
      expect(
        lookupFluxerLocalizations(locale).notificationMuteDescription,
        'Muting a community hides its unread badge and prevents '
        'notifications from appearing',
      );
    }
  });
}
