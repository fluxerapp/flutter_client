import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';

const Duration kVoicePipSpeakerHysteresis = Duration(milliseconds: 550);

class VoicePipCandidate {
  const VoicePipCandidate({
    required this.tileId,
    required this.speakingKey,
    required this.source,
    required this.hasVideo,
    required this.isLocal,
    required this.isMuted,
  });

  final String tileId;
  final String speakingKey;
  final VoiceParticipantTileSource source;
  final bool hasVideo;
  final bool isLocal;
  final bool isMuted;

  bool get isScreenShare => source == VoiceParticipantTileSource.screenShare;
}

class VoicePipFeaturedResult {
  const VoicePipFeaturedResult({
    this.tileId,
    this.pendingSwitchAt,
    this.speakingSince = const <String, DateTime>{},
  });

  final String? tileId;
  final DateTime? pendingSwitchAt;
  final Map<String, DateTime> speakingSince;
}

bool _isSpeaking(VoicePipCandidate candidate, Set<String> speakingKeys) {
  return speakingKeys.contains(candidate.speakingKey);
}

bool _spokeRecently(
  VoicePipCandidate candidate,
  Set<String> speakingKeys,
  Set<String> recentlySpokeKeys,
) {
  if (_isSpeaking(candidate, speakingKeys)) {
    return true;
  }
  return recentlySpokeKeys.contains(candidate.speakingKey);
}

int _cameraRank(
  VoicePipCandidate candidate,
  Set<String> speakingKeys,
  Set<String> recentlySpokeKeys,
) {
  if (!candidate.hasVideo || candidate.isMuted) {
    return 0;
  }
  if (_isSpeaking(candidate, speakingKeys)) {
    return 3;
  }
  if (_spokeRecently(candidate, speakingKeys, recentlySpokeKeys)) {
    return 2;
  }
  return 1;
}

VoicePipCandidate? _byId(List<VoicePipCandidate> tiles, String? tileId) {
  if (tileId == null) {
    return null;
  }
  for (final VoicePipCandidate tile in tiles) {
    if (tile.tileId == tileId) {
      return tile;
    }
  }
  return null;
}

VoicePipCandidate? _preferredCamera({
  required List<VoicePipCandidate> tiles,
  required Set<String> speakingKeys,
  required Set<String> recentlySpokeKeys,
}) {
  VoicePipCandidate? bestRemote;
  int bestRemoteRank = 0;
  VoicePipCandidate? bestLocal;
  int bestLocalRank = 0;
  for (final VoicePipCandidate tile in tiles) {
    if (tile.isScreenShare || !tile.hasVideo) {
      continue;
    }
    final int rank = _cameraRank(tile, speakingKeys, recentlySpokeKeys);
    if (rank <= 0) {
      continue;
    }
    if (tile.isLocal) {
      if (rank > bestLocalRank) {
        bestLocalRank = rank;
        bestLocal = tile;
      }
    } else if (rank > bestRemoteRank) {
      bestRemoteRank = rank;
      bestRemote = tile;
    }
  }
  return bestRemote ?? bestLocal;
}

VoicePipCandidate? _fallbackTile({
  required List<VoicePipCandidate> tiles,
  required Set<String> speakingKeys,
}) {
  VoicePipCandidate? speaking;
  VoicePipCandidate? screen;
  VoicePipCandidate? remote;
  VoicePipCandidate? local;
  for (final VoicePipCandidate tile in tiles) {
    if (tile.isScreenShare) {
      screen ??= tile;
      continue;
    }
    if (_isSpeaking(tile, speakingKeys)) {
      speaking ??= tile;
    }
    if (tile.isLocal) {
      local ??= tile;
    } else {
      remote ??= tile;
    }
  }
  return speaking ?? screen ?? remote ?? local;
}

Map<String, DateTime> _nextSpeakingSince({
  required Map<String, DateTime> previous,
  required DateTime now,
  required List<VoicePipCandidate> tiles,
  required Set<String> speakingKeys,
}) {
  final Map<String, DateTime> next = <String, DateTime>{};
  for (final VoicePipCandidate tile in tiles) {
    if (!_isSpeaking(tile, speakingKeys) || !tile.hasVideo || tile.isMuted) {
      continue;
    }
    next[tile.tileId] = previous[tile.tileId] ?? now;
  }
  return next;
}

/// Picks the PiP featured tile. Watched stream and pin win immediately.
/// Speaking cameras switch only after [hysteresis], unless the current tile
/// is gone or no longer speaking/recent.
VoicePipFeaturedResult selectVoicePipFeatured({
  required VoicePipFeaturedResult previous,
  required DateTime now,
  required List<VoicePipCandidate> tiles,
  required String? watchedTileId,
  required String? pinnedTileId,
  required Set<String> speakingKeys,
  required Set<String> recentlySpokeKeys,
  Duration hysteresis = kVoicePipSpeakerHysteresis,
}) {
  final Map<String, DateTime> speakingSince = _nextSpeakingSince(
    previous: previous.speakingSince,
    now: now,
    tiles: tiles,
    speakingKeys: speakingKeys,
  );
  final VoicePipCandidate? watched = _byId(tiles, watchedTileId);
  if (watched != null && watched.isScreenShare) {
    return VoicePipFeaturedResult(
      tileId: watched.tileId,
      speakingSince: speakingSince,
    );
  }
  final VoicePipCandidate? pinned = _byId(tiles, pinnedTileId);
  if (pinned != null) {
    return VoicePipFeaturedResult(
      tileId: pinned.tileId,
      speakingSince: speakingSince,
    );
  }

  if (tiles.isEmpty) {
    return VoicePipFeaturedResult(speakingSince: speakingSince);
  }

  final VoicePipCandidate? preferred =
      _preferredCamera(
        tiles: tiles,
        speakingKeys: speakingKeys,
        recentlySpokeKeys: recentlySpokeKeys,
      ) ??
      _fallbackTile(tiles: tiles, speakingKeys: speakingKeys);
  final VoicePipCandidate? current = _byId(tiles, previous.tileId);

  if (current == null) {
    return VoicePipFeaturedResult(
      tileId: preferred?.tileId,
      speakingSince: speakingSince,
    );
  }

  final bool currentStillHeld = _spokeRecently(
    current,
    speakingKeys,
    recentlySpokeKeys,
  );
  if (!currentStillHeld) {
    return VoicePipFeaturedResult(
      tileId: preferred?.tileId ?? current.tileId,
      speakingSince: speakingSince,
    );
  }

  final VoicePipCandidate? challenger = _challengerCamera(
    tiles: tiles,
    currentTileId: current.tileId,
    speakingKeys: speakingKeys,
    speakingSince: speakingSince,
  );
  if (challenger == null) {
    return VoicePipFeaturedResult(
      tileId: current.tileId,
      speakingSince: speakingSince,
    );
  }

  final DateTime speakingFrom = speakingSince[challenger.tileId] ?? now;
  final DateTime switchAt = speakingFrom.add(hysteresis);
  if (!now.isBefore(switchAt)) {
    return VoicePipFeaturedResult(
      tileId: challenger.tileId,
      speakingSince: speakingSince,
    );
  }
  return VoicePipFeaturedResult(
    tileId: current.tileId,
    pendingSwitchAt: switchAt,
    speakingSince: speakingSince,
  );
}

VoicePipCandidate? _challengerCamera({
  required List<VoicePipCandidate> tiles,
  required String currentTileId,
  required Set<String> speakingKeys,
  required Map<String, DateTime> speakingSince,
}) {
  VoicePipCandidate? newest;
  DateTime? newestSince;
  for (final VoicePipCandidate tile in tiles) {
    if (tile.tileId == currentTileId ||
        tile.isScreenShare ||
        !tile.hasVideo ||
        tile.isMuted ||
        !_isSpeaking(tile, speakingKeys)) {
      continue;
    }
    final DateTime since =
        speakingSince[tile.tileId] ?? DateTime.fromMillisecondsSinceEpoch(0);
    if (newest == null || since.isAfter(newestSince!)) {
      newest = tile;
      newestSince = since;
    }
  }
  return newest;
}
