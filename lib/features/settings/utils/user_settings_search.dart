import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_billing_utils.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_field_registry.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_search_index.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_staff_only_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

final class UserSettingsSearchHit {
  const UserSettingsSearchHit({
    required this.id,
    required this.section,
    required this.label,
    required this.score,
    this.fieldId,
  });

  final String id;
  final UserSettingsSection section;
  final String? fieldId;
  final String label;
  final int score;
}

String normalizeUserSettingsSearchQuery(String query) {
  return query.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}

List<String> userSettingsSearchQueryWords(String query) {
  final String normalized = normalizeUserSettingsSearchQuery(query);
  if (normalized.isEmpty) {
    return const [];
  }
  return normalized.split(' ');
}

int scoreUserSettingsSearchMatch({
  required String label,
  required List<String> keywords,
  required List<String> queryWords,
  String? description,
}) {
  if (queryWords.isEmpty) {
    return 0;
  }
  final String labelLower = label.toLowerCase();
  final String descriptionLower = description?.toLowerCase() ?? '';
  final List<String> keywordsLower = [
    for (final String keyword in keywords) keyword.toLowerCase(),
  ];
  var score = 0;
  for (final String word in queryWords) {
    score += _textMatchScore(labelLower, word, 100, 50, 25);
    score += _keywordMatchScore(keywordsLower, word);
    if (descriptionLower.contains(word)) {
      score += 10;
    }
  }
  return score;
}

int _textMatchScore(
  String text,
  String word,
  int exactScore,
  int prefixScore,
  int containsScore,
) {
  if (text == word) {
    return exactScore;
  }
  if (text.startsWith(word)) {
    return prefixScore;
  }
  if (text.contains(word)) {
    return containsScore;
  }
  return 0;
}

int _keywordMatchScore(List<String> keywords, String word) {
  var score = 0;
  for (final String keyword in keywords) {
    score += _textMatchScore(keyword, word, 80, 40, 20);
  }
  return score;
}

Set<UserSettingsSection> visibleUserSettingsSearchSections({
  required bool showBilling,
}) {
  return {
    for (final UserSettingsSection section in UserSettingsSection.values)
      if (isUserSettingsStaffOnlySectionAvailable(section) &&
          isUserSettingsBillingSectionAvailable(
            section,
            showBilling: showBilling,
          ) &&
          (section != UserSettingsSection.defaultApps ||
              isFluxerNativeMobileOs))
        section,
  };
}

List<UserSettingsSearchHit> searchVisibleUserSettings({
  required FluxerLocalizations l10n,
  required String query,
  required bool showBilling,
  required bool isTouchPrimary,
}) {
  if (query.trim().isEmpty) {
    return const [];
  }
  return searchUserSettings(
    l10n: l10n,
    query: query,
    visibleSections: visibleUserSettingsSearchSections(
      showBilling: showBilling,
    ),
    isTouchPrimary: isTouchPrimary,
  );
}

List<UserSettingsSearchHit> searchUserSettings({
  required FluxerLocalizations l10n,
  required String query,
  required Set<UserSettingsSection> visibleSections,
  required bool isTouchPrimary,
}) {
  final List<String> queryWords = userSettingsSearchQueryWords(query);
  if (queryWords.isEmpty) {
    return const [];
  }

  final List<UserSettingsSearchHit> hits = [];
  for (final UserSettingsSearchDescriptor descriptor
      in userSettingsSearchDescriptors()) {
    if (!visibleSections.contains(descriptor.section)) {
      continue;
    }
    final String? fieldId = descriptor.fieldId;
    if (fieldId != null &&
        !isUserSettingsScrollFieldVisible(
          isTouchPrimary: isTouchPrimary,
          section: descriptor.section,
          scrollFieldId: fieldId,
        )) {
      continue;
    }
    final String label = descriptor.label(l10n);
    if (label.isEmpty) {
      continue;
    }
    final List<String> keywords = [
      for (final UserSettingsSearchLabel keyword in descriptor.keywords)
        keyword(l10n),
    ];
    final int score = scoreUserSettingsSearchMatch(
      label: label,
      keywords: keywords,
      queryWords: queryWords,
      description: descriptor.description?.call(l10n),
    );
    if (score <= 0) {
      continue;
    }
    hits.add(
      UserSettingsSearchHit(
        id: descriptor.id,
        section: descriptor.section,
        fieldId: fieldId,
        label: label,
        score: score,
      ),
    );
  }
  hits.sort((a, b) {
    final int byScore = b.score.compareTo(a.score);
    if (byScore != 0) {
      return byScore;
    }
    return a.label.toLowerCase().compareTo(b.label.toLowerCase());
  });
  return hits;
}

List<MapEntry<UserSettingsSection, List<UserSettingsSearchHit>>>
groupUserSettingsSearchHits(List<UserSettingsSearchHit> hits) {
  final List<UserSettingsSection> sectionOrder = [];
  final Map<UserSettingsSection, List<UserSettingsSearchHit>> bySection = {};
  for (final UserSettingsSearchHit hit in hits) {
    final List<UserSettingsSearchHit>? existing = bySection[hit.section];
    if (existing == null) {
      sectionOrder.add(hit.section);
      bySection[hit.section] = [hit];
    } else {
      existing.add(hit);
    }
  }
  return [
    for (final UserSettingsSection section in sectionOrder)
      MapEntry(section, bySection[section]!),
  ];
}
