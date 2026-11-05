import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/notification/localization.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  group('parsePushNotificationLocaleTag', () {
    test('parses language only', () {
      expect(parsePushNotificationLocaleTag('de'), const Locale('de'));
    });

    test('parses language and region', () {
      expect(parsePushNotificationLocaleTag('pt-BR'), const Locale('pt', 'BR'));
    });

    test('parses language and script', () {
      final Locale locale = parsePushNotificationLocaleTag('zh-Hant');
      expect(locale.languageCode, 'zh');
      expect(locale.scriptCode, 'Hant');
    });

    test('every parsed tag resolves to generated strings', () {
      for (final String tag in <String>['de', 'pt-BR', 'zh-Hant', 'es-419']) {
        expect(
          lookupFluxerLocalizations(
            parsePushNotificationLocaleTag(tag),
          ).notificationChannelMessages,
          isNotEmpty,
        );
      }
    });
  });

  group('resolvePushCommunityName', () {
    test('reads the community from a guild title', () {
      expect(
        resolvePushCommunityName(const <String, String>{
          'guild_id': '1',
        }, title: 'Alice (#general, My, Server)'),
        'My, Server',
      );
    });

    test('is empty for threads because the title already includes it', () {
      expect(
        resolvePushCommunityName(const <String, String>{
          'guild_id': '1',
          'parent_id': '5',
        }, title: 'Alice (#plan, #general, My Server)'),
        isNull,
      );
    });

    test('is empty for direct messages', () {
      expect(
        resolvePushCommunityName(const <String, String>{}, title: 'Alice'),
        isNull,
      );
    });
  });
}
