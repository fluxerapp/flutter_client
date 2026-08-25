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

List<String> mergeExpressionPickerStringLists({
  required List<String> remote,
  required List<String> local,
  int maxItems = kMaxSyncedFavoriteExpressionKeys,
}) {
  return normalizeExpressionPickerStringList([
    ...remote,
    ...local,
  ], maxItems: maxItems);
}

bool expressionPickerStringListsEqual(List<String> a, List<String> b) {
  if (a.length != b.length) {
    return false;
  }
  final setA = a.toSet();
  return setA.length == b.length && setA.containsAll(b);
}

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
