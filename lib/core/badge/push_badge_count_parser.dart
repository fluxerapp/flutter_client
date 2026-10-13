int? parsePushBadgeCount(Map<String, String> payload) {
  final String? raw = payload['badge_count'];
  if (raw == null || raw.isEmpty) {
    return null;
  }
  final int? parsed = int.tryParse(raw);
  if (parsed == null || parsed < 0) {
    return null;
  }
  return parsed;
}
