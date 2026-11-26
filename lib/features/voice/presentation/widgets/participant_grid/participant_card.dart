import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/direct_connection_failed_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_actions.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/hud_stream_status_badge.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_media.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/pip_featured_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_fullscreen_provider.dart';
import 'package:fluxer_app/features/voice/utils/audio/voice_state_audio.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';
import 'package:fluxer_app/features/voice/utils/participant/participant_semantics_label.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_fullscreen.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceParticipantCard extends ConsumerWidget {
  const VoiceParticipantCard({
    required this.tile,
    required this.slot,
    required this.call,
    required this.actions,
    super.key,
  });

  final VoiceGridTile tile;
  final VoiceGridCardSlot slot;
  final VoiceGridCallData call;
  final VoiceGridTileActions actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool featured = tile.tileId == call.featuredTileId;
    final VoiceParticipantCardData data = _watchData(ref, featured: featured);
    final bool speaking = ref.watch(
      voiceActiveSpeakersProvider.select(
        (VoiceActiveSpeakersState speakers) =>
            speakers.isParticipantSpeaking(data.participant),
      ),
    );
    final Widget card = Semantics(
      button: true,
      label: voiceParticipantSemanticsLabel(
        l10n: l10n,
        display: data.display,
        voice: data.voice,
        speaking: speaking,
      ),
      onTap: () => actions.tap(tile, slot),
      customSemanticsActions: <CustomSemanticsAction, VoidCallback>{
        CustomSemanticsAction(label: l10n.voiceParticipantOptionsAction): () =>
            _openMenuFromSemantics(context),
      },
      child: _buildTile(context, ref, data),
    );
    if (!featured) {
      return card;
    }
    return VoicePipFeaturedSlot(phase: call.pipPhase, child: card);
  }

  VoiceParticipantCardData _watchData(WidgetRef ref, {required bool featured}) {
    final database.User? user = tile.data.user;
    final GuildUserDisplay? userDisplay = watchGuildScopedUserDisplay(
      ref: ref,
      userId: tile.data.userId,
      guildId: call.guildId,
      currentUserId: call.currentUserId,
    );
    final VoiceState voice = _watchVoice(ref);
    final bool isWatching = call.isWatching(tile);
    final bool isOwnScreenShare = call.isOwnScreenShare(tile);
    final bool isFullscreen = voiceTileVideoFullscreenExpanded(
      screenShareExpanded: call.screenShareExpanded,
      source: tile.source,
      voice: tile.data.voice,
      isWatching: isWatching,
      isFocusMain: slot.isFocusMain,
      isOwnScreenShare: isOwnScreenShare,
      tileId: tile.tileId,
      expandedTileId: ref.watch(
        voiceScreenShareFullscreenProvider.select(
          (VoiceScreenShareFullscreenPrefs prefs) => prefs.expandedTileId,
        ),
      ),
    );
    final bool pausedForFullscreen =
        !tile.isScreenShare &&
        tile.data.userId != call.currentUserId &&
        !isFullscreen &&
        shouldPauseRemoteCamerasForScreenShareFullscreen(
          isWatchingScreenShare: call.watchedTileIds.isNotEmpty,
          screenShareExpanded: call.screenShareExpanded,
        );
    return VoiceParticipantCardData(
      tile: tile,
      slot: slot,
      voice: voice,
      display:
          userDisplay?.displayName ??
          user?.globalName ??
          user?.username ??
          tile.data.userId,
      userDisplay: userDisplay,
      participant: resolveVoiceParticipant(
        media: call.media,
        voice: voice,
        userId: tile.data.userId,
        currentUserId: call.currentUserId,
        localConnectionId: call.localConnectionId,
      ),
      isOwnScreenShare: isOwnScreenShare,
      isWatching: isWatching,
      isFullscreen: isFullscreen,
      omitVideoTrack:
          !call.isConnected ||
          pausedForFullscreen ||
          (featured && voicePipHostsFeatured(call.pipPhase)),
    );
  }

  VoiceState _watchVoice(WidgetRef ref) {
    final VoiceState voice = tile.data.voice;
    final String? connectionId = voice.connectionId;
    final VoiceState? liveVoice = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    if (liveVoice != null) {
      return liveVoice;
    }
    if (tile.data.userId != call.currentUserId) {
      return voice;
    }
    final (bool selfMute, bool selfDeaf) = ref.watch(
      localVoiceStateProvider.select(
        (LocalVoiceStateData local) => (local.selfMute, local.selfDeaf),
      ),
    );
    return voiceStateWithLocalAudio(
      voice,
      selfMute: selfMute,
      selfDeaf: selfDeaf,
    );
  }

  Widget _buildTile(
    BuildContext context,
    WidgetRef ref,
    VoiceParticipantCardData data,
  ) {
    final Color surfaceColor = _surfaceColor(context, data);
    final VoiceMediaParticipant? participant = data.participant;
    final Widget media = VoiceParticipantCardMedia(
      data: data,
      call: call,
      surfaceColor: surfaceColor,
    );
    final Widget? overlay = participant != null && !data.isScreenShare
        ? VoiceDirectConnectionFailedOverlay(
            participant: participant,
            display: data.display,
            channelId: call.channelId,
          )
        : null;
    final VoiceDesktopTilePresentation? desktop = slot.desktopPresentation;
    if (desktop == null) {
      return VoiceTouchTile(
        data: data,
        actions: actions,
        media: media,
        surfaceColor: surfaceColor,
        overlay: overlay,
      );
    }
    return VoiceDesktopTile(
      presentation: desktop,
      media: media,
      surfaceColor: surfaceColor,
      voice: data.voice,
      display: data.display,
      isScreenShare: data.isScreenShare,
      speakingRingEnabled: data.speakingRingEnabled,
      speakingIdentity: data.speakingIdentity,
      ringAroundAvatar: data.ringAroundAvatar,
      showConnectionId: ref.watch(
        voiceSettingsProvider.select(
          (VoiceSettingsState s) => s.showVoiceConnectionId,
        ),
      ),
      showMenuButton:
          call.localConnectionId == null ||
          data.voice.connectionId != call.localConnectionId,
      onTap: () => actions.tap(tile, slot),
      onContextMenu: (Offset position) => actions.openMenu(tile, position),
      onWatch: data.canWatch ? () => actions.watch(tile, slot) : null,
      streamBadge: data.isScreenShare
          ? VoiceHudStreamStatusBadge(
              participant: participant,
              collectQuality: data.isWatching,
            )
          : null,
      overlay: overlay,
      extraDeviceCount: tile.extraDeviceCount,
      expandedDeviceCount: tile.expandedDeviceCount,
      onToggleDevices: () => actions.toggleDevices(tile),
    );
  }

  Color _surfaceColor(BuildContext context, VoiceParticipantCardData data) {
    if (data.isScreenShare) {
      if (!slot.isDesktop) {
        return context.colors.backgroundPrimary;
      }
      return data.isWatching
          ? kVoiceDesktopTileVideoSurface
          : kVoiceDesktopTileStreamSurface;
    }
    final int? accentColor = data.accentColor;
    final Color accent = accentColor == null
        ? context.colors.brandPrimary
        : Color(0xFF000000 | accentColor);
    return slot.isDesktop ? voiceDesktopTilePlaceholderColor(accent) : accent;
  }

  void _openMenuFromSemantics(BuildContext context) {
    final RenderObject? box = context.findRenderObject();
    actions.openMenu(
      tile,
      box is RenderBox && box.hasSize
          ? box.localToGlobal(box.size.center(Offset.zero))
          : Offset.zero,
    );
  }
}
