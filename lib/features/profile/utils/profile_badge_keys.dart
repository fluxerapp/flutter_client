const String kCustomProfileBadgeKeyPrefix = 'custom:';

const Set<String> kProfileBadgeKinds = <String>{
  'staff',
  'partner',
  'bug_hunter',
  'operator_pass',
  'visionary',
  'visionary_number',
  'plutonium',
  'premium',
};

bool isProfileBadgeKey(String key) {
  return kProfileBadgeKinds.contains(key) ||
      customBadgeIdFromProfileBadgeKey(key) != null;
}

String? customBadgeIdFromProfileBadgeKey(String key) {
  if (!key.startsWith(kCustomProfileBadgeKeyPrefix)) {
    return null;
  }
  final String id = key.substring(kCustomProfileBadgeKeyPrefix.length);
  if (!RegExp(r'^[0-9]{1,20}$').hasMatch(id)) {
    return null;
  }
  return id;
}

List<String> sortedProfileBadgeKeys(List<String> keys) {
  return keys.where(isProfileBadgeKey).toList()..sort();
}

bool profileBadgeKeyListsEqual(List<String> a, List<String> b) {
  if (a.length != b.length) {
    return false;
  }
  final List<String> left = sortedProfileBadgeKeys(a);
  final List<String> right = sortedProfileBadgeKeys(b);
  for (var i = 0; i < left.length; i++) {
    if (left[i] != right[i]) {
      return false;
    }
  }
  return true;
}

List<String> profileBadgeKeysWithHidden({
  required List<String> current,
  required String key,
  required bool hidden,
}) {
  final Set<String> next = current.where(isProfileBadgeKey).toSet();
  if (hidden) {
    next.add(key);
  } else {
    next.remove(key);
  }
  return sortedProfileBadgeKeys(next.toList(growable: false));
}
