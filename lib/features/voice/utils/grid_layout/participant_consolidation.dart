class VoiceConsolidatedTile<T> {
  const VoiceConsolidatedTile({
    required this.tile,
    this.extraDeviceCount = 0,
    this.expandedDeviceCount = 0,
  });

  final T tile;
  final int extraDeviceCount;
  final int expandedDeviceCount;
}

List<VoiceConsolidatedTile<T>> consolidateVoiceGridTiles<T>({
  required List<T> tiles,
  required String Function(T tile) userId,
  required bool Function(T tile) isScreenShare,
  required Set<String> expandedUserIds,
}) {
  final Map<String, List<T>> cameraByUser = <String, List<T>>{};
  final List<T> screenShares = <T>[];
  for (final T tile in tiles) {
    if (isScreenShare(tile)) {
      screenShares.add(tile);
      continue;
    }
    cameraByUser.putIfAbsent(userId(tile), () => <T>[]).add(tile);
  }
  final List<VoiceConsolidatedTile<T>> result = <VoiceConsolidatedTile<T>>[];
  for (final MapEntry<String, List<T>> entry in cameraByUser.entries) {
    final List<T> devices = entry.value;
    if (expandedUserIds.contains(entry.key) || devices.length == 1) {
      for (int i = 0; i < devices.length; i++) {
        result.add(
          VoiceConsolidatedTile<T>(
            tile: devices[i],
            expandedDeviceCount: i == 0 && devices.length > 1
                ? devices.length
                : 0,
          ),
        );
      }
      continue;
    }
    result.add(
      VoiceConsolidatedTile<T>(
        tile: devices.first,
        extraDeviceCount: devices.length - 1,
      ),
    );
  }
  for (final T tile in screenShares) {
    result.add(VoiceConsolidatedTile<T>(tile: tile));
  }
  return result;
}
