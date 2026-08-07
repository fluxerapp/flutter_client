import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';

void main() {
  late FluxerLocalizations l10n;

  setUpAll(() async {
    l10n = await FluxerLocalizations.delegate.load(const Locale('en'));
  });

  group('navigationItemSemanticLabel', () {
    test('returns name alone by default', () {
      expect(
        navigationItemSemanticLabel(l10n: l10n, name: 'general'),
        'general',
      );
    });

    test('appends selected, unread, and muted suffixes', () {
      expect(
        navigationItemSemanticLabel(
          l10n: l10n,
          name: 'general',
          isSelected: true,
          hasUnread: true,
          isMuted: true,
        ),
        'general, selected, unread, muted',
      );
    });

    test('prefers mention count over unread', () {
      expect(
        navigationItemSemanticLabel(
          l10n: l10n,
          name: 'alerts',
          hasUnread: true,
          mentionCount: 2,
        ),
        'alerts, 2 mentions',
      );
    });
  });
}
