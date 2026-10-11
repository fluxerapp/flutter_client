import 'package:flutter/foundation.dart';

const int kMaxSyncedFavoriteExpressionKeys = 500;
const int kMaxSyncedCollapsedPickerCategories = 200;

List<String> normalizeExpressionPickerStringList(
  Iterable<String> values, {
  int maxItems = kMaxSyncedFavoriteExpressionKeys,
}) {
  final seen = <String>{};
  final normalized = <String>[];
  for (final value in values) {
    final trimmed = value.trim();
    if (trimmed.isEmpty || seen.contains(trimmed)) {
      continue;
    }
    seen.add(trimmed);
    normalized.add(trimmed);
    if (normalized.length >= maxItems) {
      break;
    }
  }
  return normalized;
}

String normalizeCollapsedPickerCategoryId(String id) {
  const legacyGuildPrefix = 'guild-';
  final trimmed = id.trim();
  if (trimmed.startsWith(legacyGuildPrefix)) {
    return trimmed.substring(legacyGuildPrefix.length);
  }
  return trimmed;
}

List<String> normalizeCollapsedPickerCategoryIds(Iterable<String> ids) {
  return normalizeExpressionPickerStringList(
    ids.map(normalizeCollapsedPickerCategoryId),
    maxItems: kMaxSyncedCollapsedPickerCategories,
  );
}

List<String> mergeExpressionPickerListsThreeWay({
  required List<String> local,
  required List<String> remote,
  required List<String> baseline,
}) {
  final Set<String> baselineSet = baseline.toSet();
  final Set<String> remoteSet = remote.toSet();
  final Set<String> removedRemotely = baselineSet.difference(remoteSet);
  return <String>[
    ...local.where((value) => !removedRemotely.contains(value)),
    ...remote.where((value) => !baselineSet.contains(value)),
  ];
}

bool expressionPickerStringListsEqual(List<String> a, List<String> b) =>
    listEquals(a, b);

String normalizeStickerFavoriteKey(String key) {
  final trimmed = key.trim();
  const legacyPrefix = 'sticker:';
  if (trimmed.startsWith(legacyPrefix)) {
    return trimmed.substring(legacyPrefix.length);
  }
  return trimmed;
}

List<String> normalizeStickerFavoriteKeys(Iterable<String> keys) {
  return normalizeExpressionPickerStringList(
    keys.map(normalizeStickerFavoriteKey),
  );
}
