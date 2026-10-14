import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

Map<String, String> _messages(String locale) {
  final Map<String, dynamic> arb =
      jsonDecode(File('lib/l10n/fluxer_$locale.arb').readAsStringSync())
          as Map<String, dynamic>;
  return <String, String>{
    for (final MapEntry<String, dynamic> entry in arb.entries)
      if (!entry.key.startsWith('@') && entry.value is String)
        entry.key: entry.value as String,
  };
}

void main() {
  final Map<String, String> english = _messages('en');

  for (final String locale in <String>['en_GB', 'en_US']) {
    test('$locale keeps the sentence case of en', () {
      final List<String> mismatches = <String>[
        for (final MapEntry<String, String> entry in _messages(locale).entries)
          if (english[entry.key] case final String source
              when source != entry.value &&
                  source.toLowerCase() == entry.value.toLowerCase())
            '${entry.key}: "${entry.value}" should be "$source"',
      ];
      expect(mismatches, isEmpty);
    });
  }

  test('en_GB create channel type labels match en', () {
    final Map<String, String> british = _messages('en_GB');
    expect(
      british['guildNavbarAnnouncementChannel'],
      english['guildNavbarAnnouncementChannel'],
    );
  });

  test('en_GB favourites description uses sentence case', () {
    expect(
      _messages('en_GB')['lookAndFeelEnableFavoritesDescription'],
      isNot(contains('Favorites')),
    );
  });
}
