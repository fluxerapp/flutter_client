import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_menu_capabilities.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

VoiceParticipantMenuLabels _labels() {
  return const VoiceParticipantMenuLabels(
    viewProfile: 'View profile',
    focus: 'Focus',
    unfocus: 'Unfocus',
    mute: 'Mute',
    deafen: 'Deafen',
    communityMute: 'Community mute',
    communityDeafen: 'Community deafen',
    disconnect: 'Disconnect',
    userVolume: 'User volume',
    streamVolume: 'Stream volume',
    prioritizeSpeakers: 'Prioritize speakers',
    watchStream: 'Watch Stream',
    stopWatching: 'Stop Watching',
    stopStreaming: 'Stop streaming',
  );
}

VoiceParticipantMenuCapabilities _capabilities({
  required bool showDisplayPreferences,
  bool prioritizeSpeakingParticipants = false,
  bool isScreenShareTile = false,
  bool isOwnScreenShare = false,
  bool isWatching = false,
  bool showVolume = false,
  bool isLocallyMuted = false,
  bool showStreamControls = false,
  bool isCurrentUser = true,
  bool showSelfMute = true,
  bool showDisconnect = true,
}) {
  return VoiceParticipantMenuCapabilities(
    isCurrentUser: isCurrentUser,
    canFocus: true,
    isFocused: false,
    showSelfMute: showSelfMute,
    showSelfDeafen: showSelfMute,
    showCommunityMute: false,
    showCommunityDeafen: false,
    showDisconnect: showDisconnect,
    isSelfMuted: false,
    isSelfDeafened: false,
    isCommunityMuted: false,
    isCommunityDeafened: false,
    isScreenShareTile: isScreenShareTile,
    isOwnScreenShare: isOwnScreenShare,
    isWatching: isWatching,
    showVolume: showVolume,
    volumePercent: 100,
    isLocallyMuted: isLocallyMuted,
    showStreamControls: showStreamControls,
    streamVolumePercent: 100,
    isStreamMuted: false,
    showDisplayPreferences: showDisplayPreferences,
    prioritizeSpeakingParticipants: prioritizeSpeakingParticipants,
  );
}

List<VoiceParticipantMenuGroup> _buildGroups({
  required VoiceParticipantMenuCapabilities capabilities,
}) {
  return buildVoiceParticipantMenuGroups(
    capabilities: capabilities,
    labels: _labels(),
    onViewProfile: () {},
    onToggleFocus: () {},
    onToggleSelfMute: () {},
    onToggleSelfDeafen: () {},
    onToggleCommunityMute: (_) {},
    onToggleCommunityDeafen: (_) {},
    onDisconnect: () {},
    onVolumeChanged: (_) {},
    onStreamVolumeChanged: (_) {},
    onToggleStreamMute: (_) {},
    onToggleLocalMute: (_) {},
    onTogglePrioritizeSpeakers: (_) {},
    onWatchStream: () {},
    onStopWatching: () {},
    onStopStreaming: () {},
  );
}

VoiceParticipantMenuCheckboxEntry? _findPrioritizeSpeakersEntry(
  List<VoiceParticipantMenuGroup> groups,
) {
  return _findCheckbox(groups, 'Prioritize speakers');
}

VoiceParticipantMenuCheckboxEntry? _findCheckbox(
  List<VoiceParticipantMenuGroup> groups,
  String label,
) {
  for (final VoiceParticipantMenuGroup group in groups) {
    for (final VoiceParticipantMenuEntry entry in group.entries) {
      if (entry is VoiceParticipantMenuCheckboxEntry && entry.label == label) {
        return entry;
      }
    }
  }
  return null;
}

VoiceParticipantMenuActionEntry? _findAction(
  List<VoiceParticipantMenuGroup> groups,
  String label,
) {
  for (final VoiceParticipantMenuGroup group in groups) {
    for (final VoiceParticipantMenuEntry entry in group.entries) {
      if (entry is VoiceParticipantMenuActionEntry && entry.label == label) {
        return entry;
      }
    }
  }
  return null;
}

VoiceParticipantMenuVolumeEntry? _findVolume(
  List<VoiceParticipantMenuGroup> groups,
  String label,
) {
  for (final VoiceParticipantMenuGroup group in groups) {
    for (final VoiceParticipantMenuEntry entry in group.entries) {
      if (entry is VoiceParticipantMenuVolumeEntry && entry.label == label) {
        return entry;
      }
    }
  }
  return null;
}

bool _hasLabel(List<VoiceParticipantMenuGroup> groups, String label) {
  return _findAction(groups, label) != null ||
      _findCheckbox(groups, label) != null ||
      _findVolume(groups, label) != null;
}

void main() {
  test(
    'includes prioritize speakers checkbox for self display preferences',
    () {
      final VoiceParticipantMenuCheckboxEntry? entry =
          _findPrioritizeSpeakersEntry(
            _buildGroups(
              capabilities: _capabilities(showDisplayPreferences: true),
            ),
          );

      expect(entry, isNotNull);
      expect(entry!.icon, PhosphorIconsFill.handTap);
      expect(entry.isChecked, isFalse);
    },
  );

  test(
    'omits prioritize speakers checkbox when display preferences are hidden',
    () {
      final VoiceParticipantMenuCheckboxEntry? entry =
          _findPrioritizeSpeakersEntry(
            _buildGroups(
              capabilities: _capabilities(showDisplayPreferences: false),
            ),
          );

      expect(entry, isNull);
    },
  );

  test('includes user volume and local mute for other participants', () {
    final List<VoiceParticipantMenuGroup> groups = _buildGroups(
      capabilities: _capabilities(
        showDisplayPreferences: false,
        isCurrentUser: false,
        showSelfMute: false,
        showDisconnect: false,
        showVolume: true,
        isLocallyMuted: true,
      ),
    );

    expect(_findVolume(groups, 'User volume'), isNotNull);
    expect(_findCheckbox(groups, 'Mute')?.isChecked, isTrue);
    expect(_hasLabel(groups, 'View profile'), isTrue);
  });

  test('stream menu omits profile and uses watch action', () {
    final List<VoiceParticipantMenuGroup> groups = _buildGroups(
      capabilities: _capabilities(
        showDisplayPreferences: false,
        isCurrentUser: false,
        showSelfMute: false,
        showDisconnect: false,
        isScreenShareTile: true,
      ),
    );

    expect(_hasLabel(groups, 'View profile'), isFalse);
    expect(_findAction(groups, 'Watch Stream'), isNotNull);
    expect(_findVolume(groups, 'User volume'), isNull);
  });

  test('watched stream menu includes mute and stream volume', () {
    final List<VoiceParticipantMenuGroup> groups = _buildGroups(
      capabilities: _capabilities(
        showDisplayPreferences: false,
        isCurrentUser: false,
        showSelfMute: false,
        showDisconnect: false,
        isScreenShareTile: true,
        isWatching: true,
        showStreamControls: true,
      ),
    );

    expect(_findAction(groups, 'Stop Watching'), isNotNull);
    expect(_findCheckbox(groups, 'Mute'), isNotNull);
    expect(_findVolume(groups, 'Stream volume'), isNotNull);
    expect(_hasLabel(groups, 'View profile'), isFalse);
  });

  test('own stream menu only offers stop streaming', () {
    final List<VoiceParticipantMenuGroup> groups = _buildGroups(
      capabilities: _capabilities(
        showDisplayPreferences: false,
        isScreenShareTile: true,
        isOwnScreenShare: true,
      ),
    );

    expect(_findAction(groups, 'Stop streaming'), isNotNull);
    expect(_hasLabel(groups, 'View profile'), isFalse);
    expect(_findVolume(groups, 'Stream volume'), isNull);
  });
}
