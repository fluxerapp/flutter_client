import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_layout.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_tile_actions.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/speaking_ordered_tiles.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/viewer_stream_sync.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_fullscreen_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile_builder.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';

class VoiceParticipantGrid extends ConsumerStatefulWidget {
  const VoiceParticipantGrid({
    required this.channelId,
    this.guildId,
    this.compact = false,
    super.key,
  });

  final String? guildId;
  final String channelId;
  final bool compact;

  @override
  ConsumerState<VoiceParticipantGrid> createState() =>
      _VoiceParticipantGridState();
}

class _VoiceParticipantGridState extends ConsumerState<VoiceParticipantGrid> {
  late final VoiceViewerStreamSync _viewerStreams = VoiceViewerStreamSync(ref);
  String? _featuredTileId;
  bool _stalePinScheduled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(voiceCallOverlayProvider.notifier).scheduleAutoHide();
      }
    });
  }

  void _onPointerHover(PointerHoverEvent event) {
    ref
        .read(voiceCallOverlayProvider.notifier)
        .notePointerActivity(kind: event.kind);
  }

  void _clearStalePin(String? pinnedTileId, List<VoiceGridTile> tiles) {
    if (pinnedTileId == null ||
        tiles.byId(pinnedTileId) != null ||
        _stalePinScheduled) {
      return;
    }
    _stalePinScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _stalePinScheduled = false;
      if (mounted) {
        ref.read(voiceCallLayoutProvider.notifier).clearStalePin();
      }
    });
  }

  ({List<VoiceChannelParticipantData> participants, String? connectingUserId})
  _watchParticipants({
    required String? currentUserId,
    required String? localConnectionId,
  }) {
    final String? guildId = widget.guildId;
    final String channelId = widget.channelId;
    final String participantKey = guildId == null
        ? voiceDmChannelParticipantsFamilyKey(channelId)
        : voiceChannelParticipantsFamilyKey(guildId, channelId);
    final bool inThisCall = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) =>
            s.isInCall(channelId: channelId, guildId: guildId),
      ),
    );
    database.User? selfUser;
    if (currentUserId != null && inThisCall) {
      ref.watch(
        userRowProvider(currentUserId).select(
          (AsyncValue<database.User?> async) => async.value == null
              ? null
              : guildUserProfileSignature(async.value!),
        ),
      );
      selfUser = ref.read(userRowProvider(currentUserId)).value;
    }
    ref.watch(voiceChannelGridStructureProvider(participantKey));
    final List<VoiceChannelParticipantData> joined = ref.read(
      voiceChannelParticipantsProvider(participantKey),
    );
    final bool missingSelf = !joined.any(
      (VoiceChannelParticipantData p) => p.userId == currentUserId,
    );
    final String? connectingUserId = inThisCall && missingSelf
        ? currentUserId
        : null;
    return (
      participants: voiceParticipantsWithSelfProfile(
        participants: <VoiceChannelParticipantData>[
          if (connectingUserId != null)
            connectingSelfVoiceParticipant(
              currentUserId: connectingUserId,
              channelId: channelId,
              guildId: guildId,
              connectionId: localConnectionId,
              user: selfUser,
            ),
          ...joined,
        ],
        currentUserId: currentUserId,
        selfUser: selfUser,
      ),
      connectingUserId: connectingUserId,
    );
  }

  VoiceGridCallData _watchCall({required bool handheld}) {
    final Set<String> watchedTileIds = ref.watch(
      voiceScreenShareWatchTileProvider,
    );
    final VoicePipOverlayPhase pipPhase = ref.watch(
      voicePipOverlayPhaseProvider,
    );
    if (voicePipHostsFeatured(pipPhase)) {
      _featuredTileId = ref.watch(voicePipFeaturedTileIdProvider);
    }
    return VoiceGridCallData(
      guildId: widget.guildId,
      channelId: widget.channelId,
      media: ref.watch(
        voiceSessionProvider.select((VoiceSessionState s) => s.media),
      ),
      currentUserId: ref.watch(currentUserIdProvider),
      localConnectionId: ref.watch(
        voiceSessionProvider.select(
          (VoiceSessionState s) => s.activeConnectionId,
        ),
      ),
      baseUrl: ref.watch(fluxerBaseUrlProvider),
      isConnected: ref.watch(
        voiceSessionProvider.select((VoiceSessionState s) => s.isConnected),
      ),
      watchedTileIds: watchedTileIds,
      screenShareExpanded:
          handheld &&
          resolveVoiceScreenShareExpanded(
            watchedTileIds: watchedTileIds,
            landscape:
                MediaQuery.orientationOf(context) == Orientation.landscape,
            prefs: ref.watch(voiceScreenShareFullscreenProvider),
          ),
      featuredTileId: _featuredTileId,
      pipPhase: pipPhase,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool handheld = isHandheldVoiceOverlay(context);
    final VoiceGridCallData call = _watchCall(handheld: handheld);
    final VoiceCallLayoutState layout = ref.watch(voiceCallLayoutProvider);
    final VoiceCallDisplayPreferencesState displayPreferences = ref.watch(
      voiceCallDisplayPreferencesProvider,
    );
    final bool prioritizeSpeakingParticipants = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState settings) =>
            settings.prioritizeSpeakingParticipants,
      ),
    );
    final (
      :List<VoiceChannelParticipantData> participants,
      :String? connectingUserId,
    ) = _watchParticipants(
      currentUserId: call.currentUserId,
      localConnectionId: call.localConnectionId,
    );
    if (participants.isEmpty) {
      return Center(
        child: Text(
          FluxerLocalizations.of(context).voiceChannelStatusConnecting,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      );
    }
    return VoiceSpeakingOrderedTiles(
      prioritizeSpeakingParticipants: prioritizeSpeakingParticipants,
      tiles: buildVoiceGridTiles(
        participants: participants,
        media: call.media,
        currentUserId: call.currentUserId,
        localConnectionId: call.localConnectionId,
        onlyShowVideos: displayPreferences.onlyShowVideos,
        showOwnCamera: displayPreferences.showOwnCamera,
        expandedUserIds: layout.expandedUserIds,
        forceShowUserId: connectingUserId,
      ),
      call: call,
      builder: (BuildContext _, List<VoiceGridTile> tiles) {
        _clearStalePin(layout.pinnedTileId, tiles);
        _viewerStreams.sync(tiles: tiles, watchedTileIds: call.watchedTileIds);
        return Listener(
          onPointerHover: _onPointerHover,
          child: LayoutBuilder(
            builder: (BuildContext _, BoxConstraints constraints) =>
                _buildLayout(
                  size: constraints.biggest,
                  handheld: handheld,
                  tiles: tiles,
                  layout: layout,
                  call: call,
                ),
          ),
        );
      },
    );
  }

  Widget _buildLayout({
    required Size size,
    required bool handheld,
    required List<VoiceGridTile> tiles,
    required VoiceCallLayoutState layout,
    required VoiceGridCallData call,
  }) {
    final VoiceGridTileActions actions = VoiceGridTileActions(
      ref: ref,
      guildId: widget.guildId,
      channelId: widget.channelId,
    );
    Widget cardBuilder(VoiceGridTile tile, VoiceGridCardSlot slot) =>
        VoiceParticipantCard(
          tile: tile,
          slot: slot,
          call: call,
          actions: actions,
        );
    if (handheld) {
      return VoiceTouchLayout(
        size: size,
        tiles: tiles,
        layout: layout,
        call: call,
        cardBuilder: cardBuilder,
        onBackgroundTap: actions.toggleOverlay,
      );
    }
    return VoiceDesktopLayout(
      size: size,
      compact: widget.compact,
      tiles: tiles,
      layout: layout,
      call: call,
      cardBuilder: cardBuilder,
    );
  }
}
