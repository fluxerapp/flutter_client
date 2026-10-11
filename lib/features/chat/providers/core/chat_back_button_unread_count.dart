int countMentionsOutsideChannel({
  required Iterable<MapEntry<String, int>> mentionCountByChannel,
  required String currentChannelId,
}) {
  var total = 0;
  for (final MapEntry<String, int> entry in mentionCountByChannel) {
    if (entry.key != currentChannelId) {
      total += entry.value;
    }
  }
  return total;
}
