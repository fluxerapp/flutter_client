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
  );
}

VoiceParticipantMenuCapabilities _capabilities({
  required bool showDisplayPreferences,
  bool prioritizeSpeakingParticipants = false,
}) {
  return VoiceParticipantMenuCapabilities(
    isCurrentUser: true,
    canFocus: true,
    isFocused: false,
    showSelfMute: true,
    showSelfDeafen: true,
    showCommunityMute: false,
    showCommunityDeafen: false,
    showDisconnect: true,
    isSelfMuted: false,
    isSelfDeafened: false,
    isCommunityMuted: false,
    isCommunityDeafened: false,
    showVolume: false,
    volumePercent: 100,
    showStreamControls: false,
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
    onTogglePrioritizeSpeakers: (_) {},
  );
}

VoiceParticipantMenuCheckboxEntry? _findPrioritizeSpeakersEntry(
  List<VoiceParticipantMenuGroup> groups,
) {
  for (final VoiceParticipantMenuGroup group in groups) {
    for (final VoiceParticipantMenuEntry entry in group.entries) {
      if (entry is VoiceParticipantMenuCheckboxEntry &&
          entry.label == 'Prioritize speakers') {
        return entry;
      }
    }
  }
  return null;
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
}
