import 'dart:convert';

Set<String> parseCollapsedCategoryIdsFromGuildSettingsJson(
  Map<String, dynamic> data,
) {
  final overrides = data['channel_overrides'] as Map<String, dynamic>?;
  if (overrides == null || overrides.isEmpty) {
    return {};
  }
  final collapsed = <String>{};
  for (final entry in overrides.entries) {
    final override = entry.value;
    if (override is Map<String, dynamic> && override['collapsed'] == true) {
      collapsed.add(entry.key);
    }
  }
  return collapsed;
}

Set<String> parseCollapsedCategoryIdsFromGuildSettingsData(String? data) {
  if (data == null) {
    return {};
  }
  return parseCollapsedCategoryIdsFromGuildSettingsJson(
    jsonDecode(data) as Map<String, dynamic>,
  );
}
