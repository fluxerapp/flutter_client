import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_menu_capabilities.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceParticipantMenuTarget {
  const VoiceParticipantMenuTarget({
    required this.participant,
    required this.tileId,
    required this.channelId,
    required this.tileSource,
    this.guildId,
  });

  final VoiceChannelParticipantData participant;
  final String tileId;
  final String? guildId;
  final String channelId;
  final VoiceParticipantTileSource tileSource;

  bool get isScreenShareTile =>
      tileSource == VoiceParticipantTileSource.screenShare;
}

sealed class VoiceParticipantMenuEntry {}

class VoiceParticipantMenuActionEntry extends VoiceParticipantMenuEntry {
  VoiceParticipantMenuActionEntry({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isDanger = false,
    this.enabled = true,
  });

  final String label;
  final VoidCallback onPressed;
  final PhosphorIconData? icon;
  final bool isDanger;
  final bool enabled;
}

class VoiceParticipantMenuCheckboxEntry extends VoiceParticipantMenuEntry {
  VoiceParticipantMenuCheckboxEntry({
    required this.label,
    required this.isChecked,
    required this.onChanged,
    this.icon,
  });

  final String label;
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final PhosphorIconData? icon;
}

class VoiceParticipantMenuVolumeEntry extends VoiceParticipantMenuEntry {
  VoiceParticipantMenuVolumeEntry({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;
}

class VoiceParticipantMenuGroup {
  const VoiceParticipantMenuGroup({required this.entries});

  final List<VoiceParticipantMenuEntry> entries;
}

class VoiceParticipantMenuLabels {
  const VoiceParticipantMenuLabels({
    required this.viewProfile,
    required this.focus,
    required this.unfocus,
    required this.mute,
    required this.deafen,
    required this.communityMute,
    required this.communityDeafen,
    required this.disconnect,
    required this.userVolume,
    required this.streamVolume,
  });

  final String viewProfile;
  final String focus;
  final String unfocus;
  final String mute;
  final String deafen;
  final String communityMute;
  final String communityDeafen;
  final String disconnect;
  final String userVolume;
  final String streamVolume;
}

void _addMenuGroupIfNotEmpty(
  List<VoiceParticipantMenuGroup> groups,
  List<VoiceParticipantMenuEntry> entries,
) {
  if (entries.isEmpty) {
    return;
  }
  groups.add(VoiceParticipantMenuGroup(entries: entries));
}

List<VoiceParticipantMenuGroup> buildVoiceParticipantMenuGroups({
  required VoiceParticipantMenuCapabilities capabilities,
  required VoiceParticipantMenuLabels labels,
  required VoidCallback onViewProfile,
  required VoidCallback onToggleFocus,
  required VoidCallback onToggleSelfMute,
  required VoidCallback onToggleSelfDeafen,
  required ValueChanged<bool> onToggleCommunityMute,
  required ValueChanged<bool> onToggleCommunityDeafen,
  required VoidCallback onDisconnect,
  required ValueChanged<int> onVolumeChanged,
  required ValueChanged<int> onStreamVolumeChanged,
  required ValueChanged<bool> onToggleStreamMute,
}) {
  final List<VoiceParticipantMenuGroup> groups = <VoiceParticipantMenuGroup>[];
  final List<VoiceParticipantMenuEntry> primaryEntries =
      <VoiceParticipantMenuEntry>[
        VoiceParticipantMenuActionEntry(
          label: labels.viewProfile,
          icon: PhosphorIconsFill.user,
          onPressed: onViewProfile,
        ),
      ];
  if (capabilities.canFocus) {
    primaryEntries.add(
      VoiceParticipantMenuActionEntry(
        label: capabilities.isFocused ? labels.unfocus : labels.focus,
        icon: capabilities.isFocused
            ? PhosphorIconsFill.eyeSlash
            : PhosphorIconsFill.eye,
        onPressed: onToggleFocus,
      ),
    );
  }
  groups.add(VoiceParticipantMenuGroup(entries: primaryEntries));
  final List<VoiceParticipantMenuEntry> controlEntries =
      <VoiceParticipantMenuEntry>[];
  if (capabilities.showSelfMute) {
    controlEntries.add(
      VoiceParticipantMenuCheckboxEntry(
        label: labels.mute,
        icon: PhosphorIconsFill.microphoneSlash,
        isChecked: capabilities.isSelfMuted,
        onChanged: (_) => onToggleSelfMute(),
      ),
    );
  }
  if (capabilities.showSelfDeafen) {
    controlEntries.add(
      VoiceParticipantMenuCheckboxEntry(
        label: labels.deafen,
        icon: PhosphorIconsFill.speakerSlash,
        isChecked: capabilities.isSelfDeafened,
        onChanged: (_) => onToggleSelfDeafen(),
      ),
    );
  }
  if (capabilities.showCommunityMute) {
    controlEntries.add(
      VoiceParticipantMenuCheckboxEntry(
        label: labels.communityMute,
        icon: PhosphorIconsFill.microphoneSlash,
        isChecked: capabilities.isCommunityMuted,
        onChanged: onToggleCommunityMute,
      ),
    );
  }
  if (capabilities.showCommunityDeafen) {
    controlEntries.add(
      VoiceParticipantMenuCheckboxEntry(
        label: labels.communityDeafen,
        icon: PhosphorIconsFill.speakerSlash,
        isChecked: capabilities.isCommunityDeafened,
        onChanged: onToggleCommunityDeafen,
      ),
    );
  }
  if (controlEntries.isNotEmpty) {
    _addMenuGroupIfNotEmpty(groups, controlEntries);
  }
  final List<VoiceParticipantMenuEntry> streamControlEntries =
      <VoiceParticipantMenuEntry>[];
  if (capabilities.showStreamControls) {
    streamControlEntries.addAll(<VoiceParticipantMenuEntry>[
      VoiceParticipantMenuVolumeEntry(
        label: labels.streamVolume,
        value: capabilities.streamVolumePercent,
        onChanged: onStreamVolumeChanged,
      ),
      VoiceParticipantMenuCheckboxEntry(
        label: labels.mute,
        icon: PhosphorIconsFill.speakerSlash,
        isChecked: capabilities.isStreamMuted,
        onChanged: onToggleStreamMute,
      ),
    ]);
  }
  _addMenuGroupIfNotEmpty(groups, streamControlEntries);
  if (capabilities.showDisconnect) {
    groups.add(
      VoiceParticipantMenuGroup(
        entries: <VoiceParticipantMenuEntry>[
          VoiceParticipantMenuActionEntry(
            label: labels.disconnect,
            icon: PhosphorIconsFill.phoneDisconnect,
            isDanger: true,
            onPressed: onDisconnect,
          ),
        ],
      ),
    );
  }
  if (capabilities.showVolume) {
    groups.add(
      VoiceParticipantMenuGroup(
        entries: <VoiceParticipantMenuEntry>[
          VoiceParticipantMenuVolumeEntry(
            label: labels.userVolume,
            value: capabilities.volumePercent,
            onChanged: onVolumeChanged,
          ),
        ],
      ),
    );
  }
  return groups;
}
