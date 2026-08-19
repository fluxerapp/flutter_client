import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_nav.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_search.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<FluxerLocalizations> _loadL10n() {
  WidgetsFlutterBinding.ensureInitialized();
  return FluxerLocalizations.delegate.load(const Locale('en'));
}

void main() {
  group('normalizeUserSettingsSearchQuery', () {
    test('trims and collapses whitespace', () {
      expect(
        normalizeUserSettingsSearchQuery('  Theme   Mode  '),
        'theme mode',
      );
    });

    test('returns empty for blank input', () {
      expect(normalizeUserSettingsSearchQuery('   '), isEmpty);
    });
  });

  group('scoreUserSettingsSearchMatch', () {
    test('scores exact label higher than prefix or contains', () {
      const List<String> queryWords = ['theme'];
      final int exact = scoreUserSettingsSearchMatch(
        label: 'Theme',
        keywords: const [],
        queryWords: queryWords,
      );
      final int prefix = scoreUserSettingsSearchMatch(
        label: 'Theme color',
        keywords: const [],
        queryWords: queryWords,
      );
      final int contains = scoreUserSettingsSearchMatch(
        label: 'Color theme',
        keywords: const [],
        queryWords: queryWords,
      );
      expect(exact, 100);
      expect(prefix, 50);
      expect(contains, 25);
      expect(exact, greaterThan(prefix));
      expect(prefix, greaterThan(contains));
    });

    test('scores keyword matches lower than label matches', () {
      const List<String> queryWords = ['dark'];
      final int labelScore = scoreUserSettingsSearchMatch(
        label: 'Dark',
        keywords: const [],
        queryWords: queryWords,
      );
      final int keywordScore = scoreUserSettingsSearchMatch(
        label: 'Theme',
        keywords: const ['Dark'],
        queryWords: queryWords,
      );
      expect(labelScore, 100);
      expect(keywordScore, 80);
    });

    test('adds description contains score', () {
      final int score = scoreUserSettingsSearchMatch(
        label: 'Theme',
        keywords: const [],
        description: 'Choose between dark, coal, or light appearance.',
        queryWords: const ['dark'],
      );
      expect(score, 10);
    });
  });

  group('searchUserSettings', () {
    late FluxerLocalizations l10n;

    setUpAll(() async {
      l10n = await _loadL10n();
    });

    test('returns no hits for a blank query', () {
      expect(
        searchUserSettings(
          l10n: l10n,
          query: '   ',
          visibleSections: UserSettingsSection.values.toSet(),
          isTouchPrimary: true,
        ),
        isEmpty,
      );
    });

    test('finds individual notification toggle from enable query', () {
      final List<UserSettingsSearchHit> hits = searchUserSettings(
        l10n: l10n,
        query: 'enable notifications',
        visibleSections: {UserSettingsSection.notifications},
        isTouchPrimary: true,
      );
      expect(
        hits.any(
          (hit) =>
              hit.id == 'notifications:enable' &&
              hit.fieldId == 'notifications',
        ),
        isTrue,
      );
    });

    test('finds sync theme setting', () {
      final List<UserSettingsSearchHit> hits = searchUserSettings(
        l10n: l10n,
        query: 'sync theme',
        visibleSections: {UserSettingsSection.lookAndFeel},
        isTouchPrimary: true,
      );
      expect(hits.any((hit) => hit.id == 'look-and-feel:sync-theme'), isTrue);
    });

    test('hides keyboard field on touch-primary', () {
      final List<UserSettingsSearchHit> touchHits = searchUserSettings(
        l10n: l10n,
        query: 'keyboard',
        visibleSections: {
          UserSettingsSection.accessibility,
          UserSettingsSection.shortcuts,
        },
        isTouchPrimary: true,
      );
      expect(touchHits.any((hit) => hit.fieldId == 'keyboard'), isFalse);

      final List<UserSettingsSearchHit> pointerHits = searchUserSettings(
        l10n: l10n,
        query: 'keyboard',
        visibleSections: {UserSettingsSection.accessibility},
        isTouchPrimary: false,
      );
      expect(pointerHits.any((hit) => hit.fieldId == 'keyboard'), isTrue);
    });

    test('omits sections that are not visible', () {
      final List<UserSettingsSearchHit> hits = searchUserSettings(
        l10n: l10n,
        query: 'plutonium',
        visibleSections: {UserSettingsSection.lookAndFeel},
        isTouchPrimary: true,
      );
      expect(
        hits.any((hit) => hit.section == UserSettingsSection.fluxerPlutonium),
        isFalse,
      );
    });
  });

  group('visibleUserSettingsSearchSections', () {
    test('hides billing sections when billing nav is off', () {
      final Set<UserSettingsSection> visible =
          visibleUserSettingsSearchSections(
            showBilling: false,
            isTouchPrimary: true,
          );
      expect(visible, isNot(contains(UserSettingsSection.fluxerPlutonium)));
      expect(visible, contains(UserSettingsSection.lookAndFeel));
    });

    test('hides shortcuts section on touch-primary devices', () {
      final Set<UserSettingsSection> touchVisible =
          visibleUserSettingsSearchSections(
            showBilling: false,
            isTouchPrimary: true,
          );
      expect(touchVisible, isNot(contains(UserSettingsSection.shortcuts)));

      final Set<UserSettingsSection> pointerVisible =
          visibleUserSettingsSearchSections(
            showBilling: false,
            isTouchPrimary: false,
          );
      expect(pointerVisible, contains(UserSettingsSection.shortcuts));
    });
  });

  group('buildUserSettingsSearchSidebar', () {
    late FluxerLocalizations l10n;

    setUpAll(() async {
      l10n = await _loadL10n();
    });

    test('inserts a section separator for field hits', () {
      const UserSettingsSearchHit themeHit = UserSettingsSearchHit(
        id: 'appearance:theme',
        section: UserSettingsSection.lookAndFeel,
        fieldId: 'theme',
        label: 'Theme',
        score: 100,
      );
      final UserSettingsSearchSidebar sidebar = buildUserSettingsSearchSidebar(
        l10n: l10n,
        hits: const [themeHit],
        showBilling: true,
        isTouchPrimary: false,
      );
      expect(sidebar.items, hasLength(2));
      expect(sidebar.items.first.isSeparator, isTrue);
      expect(sidebar.hitAtIndex.first, isNull);
      expect(sidebar.hitAtIndex.last, themeHit);
    });

    test('skips separator when the only hit is the section itself', () {
      const UserSettingsSearchHit sectionHit = UserSettingsSearchHit(
        id: 'section:lookAndFeel',
        section: UserSettingsSection.lookAndFeel,
        label: 'Look & Feel',
        score: 80,
      );
      final UserSettingsSearchSidebar sidebar = buildUserSettingsSearchSidebar(
        l10n: l10n,
        hits: const [sectionHit],
        showBilling: true,
        isTouchPrimary: false,
      );
      expect(sidebar.items, hasLength(1));
      expect(sidebar.items.first.isSeparator, isFalse);
      expect(sidebar.hitAtIndex.single, sectionHit);
    });
  });
}
