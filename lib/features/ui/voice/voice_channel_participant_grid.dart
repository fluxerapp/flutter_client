import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_layouts.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/ui/voice/voice_speaking_ring.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_context_menu.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_focus_layout_metrics.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_hangout_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_participant_consolidation.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_speaking_order.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/voice_video_subscription.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kTileMoveDuration = Duration(milliseconds: 260);
const Curve _kTileMoveCurve = Curves.easeOutCubic;

Duration _tileMoveDuration(BuildContext context) {
  if (MediaQuery.disableAnimationsOf(context)) {
    return Duration.zero;
  }
  return _kTileMoveDuration;
}

class _VoiceGridTileItem {
  const _VoiceGridTileItem({
    required this.data,
    required this.source,
    this.extraDeviceCount = 0,
  });
  final VoiceChannelParticipantData data;
  final VoiceParticipantTileSource source;
  final int extraDeviceCount;
  String get tileId => voiceParticipantTileId(
    voice: data.voice,
    userId: data.userId,
    source: source,
  );
}

List<_VoiceGridTileItem> _buildTileItems({
  required List<VoiceChannelParticipantData> participants,
  required Room? room,
  required String? currentUserId,
  required String? localConnectionId,
  required bool onlyShowVideos,
  required bool showOwnCamera,
  String? forceShowUserId,
}) {
  final List<_VoiceGridTileItem> tileItems = <_VoiceGridTileItem>[];
  for (final VoiceChannelParticipantData participant in participants) {
    final bool isOwnParticipant =
        currentUserId != null && participant.userId == currentUserId;
    final bool includeCameraTile = showOwnCamera || !isOwnParticipant;
    final bool includeVideoParticipant =
        !onlyShowVideos ||
        participant.voice.selfVideo ||
        participant.userId == forceShowUserId;
    if (includeCameraTile && includeVideoParticipant) {
      tileItems.add(
        _VoiceGridTileItem(
          data: participant,
          source: VoiceParticipantTileSource.camera,
        ),
      );
    }
    final Participant? liveKitParticipant = resolveVoiceParticipant(
      room: room,
      voice: participant.voice,
      userId: participant.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final bool hasLiveKitScreenSharePublication =
        liveKitParticipant != null &&
        hasUnmutedScreenSharePublication(liveKitParticipant);
    final bool shouldShowScreenShareTile =
        hasLiveKitScreenSharePublication ||
        (participant.voice.selfStream && room == null);
    if (!shouldShowScreenShareTile) {
      continue;
    }
    tileItems.add(
      _VoiceGridTileItem(
        data: participant,
        source: VoiceParticipantTileSource.screenShare,
      ),
    );
  }
  return tileItems;
}

bool _isVoiceMuted(VoiceState voice) =>
    voice.selfMute || voice.mute || voice.suppress;

VoiceState _withLocalAudio(
  VoiceState voice, {
  required bool selfMute,
  required bool selfDeaf,
}) {
  if (voice.selfMute == selfMute && voice.selfDeaf == selfDeaf) {
    return voice;
  }
  return VoiceState(
    userId: voice.userId,
    channelId: voice.channelId,
    guildId: voice.guildId,
    sessionId: voice.sessionId,
    connectionId: voice.connectionId,
    selfMute: selfMute,
    selfDeaf: selfDeaf,
    selfVideo: voice.selfVideo,
    selfStream: voice.selfStream,
    mute: voice.mute,
    deaf: voice.deaf,
    suppress: voice.suppress,
    isMobile: voice.isMobile,
    e2eeCapable: voice.e2eeCapable,
  );
}

class VoiceChannelParticipantGrid extends ConsumerStatefulWidget {
  const VoiceChannelParticipantGrid({
    required this.channelId,
    this.guildId,
    super.key,
  });

  /// Null for DM / private voice.
  final String? guildId;
  final String channelId;

  @override
  ConsumerState<VoiceChannelParticipantGrid> createState() =>
      _VoiceChannelParticipantGridState();
}

class _VoiceChannelParticipantGridState
    extends ConsumerState<VoiceChannelParticipantGrid> {
  String? lastViewerStreamKey;
  late final PageController _galleryPageController;
  late final ValueNotifier<int> _galleryPageIndex;
  String? _featuredTileId;
  VoicePipOverlayPhase _pipPhase = VoicePipOverlayPhase.hidden;
  bool _isConnected = false;
  bool _disableStreamPreviews = false;

  VoiceGridPackedLayoutMetrics? _cachedLayoutMetrics;
  int? _cachedLayoutKey;

  @override
  void initState() {
    super.initState();
    _galleryPageController = PageController();
    _galleryPageIndex = ValueNotifier<int>(0);
    _galleryPageController.addListener(_onGalleryPageChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(voiceCallOverlayProvider.notifier).scheduleAutoHide();
    });
  }

  void _onGalleryPageChanged() {
    final int? page = _galleryPageController.page?.round();
    if (page != null && page != _galleryPageIndex.value) {
      _galleryPageIndex.value = page;
    }
  }

  @override
  void dispose() {
    _galleryPageController
      ..removeListener(_onGalleryPageChanged)
      ..dispose();
    _galleryPageIndex.dispose();
    super.dispose();
  }

  VoiceGridPackedLayoutMetrics _resolveLayoutMetrics({
    required int tileCount,
    required double containerWidth,
    required double containerHeight,
    required bool compact,
  }) {
    final int layoutCacheKey = Object.hash(
      tileCount,
      containerWidth,
      containerHeight,
      compact,
    );
    if (_cachedLayoutKey == layoutCacheKey && _cachedLayoutMetrics != null) {
      return _cachedLayoutMetrics!;
    }
    _cachedLayoutKey = layoutCacheKey;
    _cachedLayoutMetrics = resolveVoiceGridPackedLayoutMetrics(
      tileCount: tileCount,
      containerWidth: containerWidth,
      containerHeight: containerHeight,
      compact: compact,
    );
    return _cachedLayoutMetrics!;
  }

  void _revealOverlay() {
    ref.read(voiceCallOverlayProvider.notifier).reveal();
  }

  void _onPointerHover(PointerHoverEvent event) {
    ref
        .read(voiceCallOverlayProvider.notifier)
        .notePointerActivity(kind: event.kind);
  }

  void _toggleCallOverlay() {
    ref.read(voiceCallOverlayProvider.notifier).toggle();
  }

  void _onBackgroundTap() {
    if (!isPhoneVoiceOverlay(context)) {
      return;
    }
    _toggleCallOverlay();
  }

  Participant? _resolveParticipant(
    _VoiceGridTileItem item,
    Room? room,
    String? me,
    String? localConnectionId,
  ) {
    return resolveVoiceParticipant(
      room: room,
      voice: item.data.voice,
      userId: item.data.userId,
      currentUserId: me,
      localConnectionId: localConnectionId,
    );
  }

  int _tilePriority(
    _VoiceGridTileItem item,
    Room? room,
    String? me,
    String? localConnectionId,
    VoiceActiveSpeakersState speakers,
  ) {
    if (item.source == VoiceParticipantTileSource.screenShare) {
      return 3;
    }
    if (_isVoiceMuted(item.data.voice)) {
      return 0;
    }
    final Participant? participant = _resolveParticipant(
      item,
      room,
      me,
      localConnectionId,
    );
    if (speakers.isParticipantSpeaking(participant)) {
      return 2;
    }
    if (speakers.participantSpokeRecently(participant)) {
      return 1;
    }
    return 0;
  }

  List<_VoiceGridTileItem> _orderTiles(
    List<_VoiceGridTileItem> items,
    Room? room,
    String? me,
    String? localConnectionId,
    VoiceActiveSpeakersState speakers,
  ) {
    final List<MapEntry<int, _VoiceGridTileItem>> indexed =
        items.asMap().entries.toList()..sort((
          MapEntry<int, _VoiceGridTileItem> a,
          MapEntry<int, _VoiceGridTileItem> b,
        ) {
          final int priorityA = _tilePriority(
            a.value,
            room,
            me,
            localConnectionId,
            speakers,
          );
          final int priorityB = _tilePriority(
            b.value,
            room,
            me,
            localConnectionId,
            speakers,
          );
          if (priorityA != priorityB) {
            return priorityB.compareTo(priorityA);
          }
          return a.key.compareTo(b.key);
        });
    return indexed
        .map((MapEntry<int, _VoiceGridTileItem> e) => e.value)
        .toList();
  }

  void _syncWatch(
    String? activeScreenShareTileId,
    List<_VoiceGridTileItem> tiles,
  ) {
    final String? current = ref.read(voiceScreenShareWatchTileProvider);
    if (current != activeScreenShareTileId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref
            .read(voiceScreenShareWatchTileProvider.notifier)
            .setActiveTileId(activeScreenShareTileId);
      });
    }
    String? nextKey;
    if (activeScreenShareTileId != null) {
      for (final _VoiceGridTileItem tile in tiles) {
        if (tile.tileId == activeScreenShareTileId) {
          nextKey = buildViewerStreamKey(
            voice: tile.data.voice,
            isScreenShareTile:
                tile.source == VoiceParticipantTileSource.screenShare,
          );
          break;
        }
      }
    }
    if (nextKey == lastViewerStreamKey) {
      return;
    }
    lastViewerStreamKey = nextKey;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref
          .read(voiceSessionProvider.notifier)
          .updateViewerStreamKeys(
            nextKey == null ? const <String>[] : <String>[nextKey],
          );
    });
  }

  void _stopWatching() {
    ref.read(voiceCallLayoutProvider.notifier).unpin();
  }

  void _onTileTap(_VoiceGridTileItem item, bool isFocusMain) {
    if (isFocusMain) {
      _toggleCallOverlay();
      return;
    }
    ref.read(voiceCallLayoutProvider.notifier).pin(item.tileId);
    _revealOverlay();
  }

  _VoiceGridTileItem? _findSelfTile(
    List<_VoiceGridTileItem> tiles,
    String? me,
  ) {
    if (me == null) {
      return null;
    }
    for (final _VoiceGridTileItem tile in tiles) {
      if (tile.data.userId == me &&
          tile.source == VoiceParticipantTileSource.camera) {
        return tile;
      }
    }
    return null;
  }

  List<_VoiceGridTileItem> _tilesWithoutSelf(
    List<_VoiceGridTileItem> tiles,
    _VoiceGridTileItem? selfTile,
  ) {
    if (selfTile == null) {
      return tiles;
    }
    return tiles
        .where((_VoiceGridTileItem tile) => tile.tileId != selfTile.tileId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final String participantKey = widget.guildId == null
        ? voiceDmChannelParticipantsFamilyKey(widget.channelId)
        : voiceChannelParticipantsFamilyKey(widget.guildId!, widget.channelId);
    final Room? liveKit = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.liveKitRoom),
    );
    final String? me = ref.watch(currentUserIdProvider);
    final String? localConnectionId = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => s.activeConnectionId,
      ),
    );
    final bool onThisChannel = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) =>
            s.isInVoice &&
            s.channelId == widget.channelId &&
            (widget.guildId == null
                ? s.guildId == null || s.guildId!.isEmpty
                : s.guildId == widget.guildId),
      ),
    );
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
    final String? watchedTileId = ref.watch(voiceScreenShareWatchTileProvider);
    ref.watch(voiceChannelGridStructureProvider(participantKey));
    final List<VoiceChannelParticipantData> list = ref.read(
      voiceChannelParticipantsProvider(participantKey),
    );
    final bool missingSelf =
        me != null &&
        !list.any((VoiceChannelParticipantData p) => p.userId == me);
    final List<VoiceChannelParticipantData> participants =
        onThisChannel && me != null && missingSelf
        ? <VoiceChannelParticipantData>[
            connectingSelfVoiceParticipant(
              currentUserId: me,
              channelId: widget.channelId,
              guildId: widget.guildId,
              connectionId: localConnectionId,
            ),
            ...list,
          ]
        : list;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (participants.isEmpty) {
      return Center(
        child: Text(
          l10n.voiceChannelStatusConnecting,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      );
    }
    final List<_VoiceGridTileItem> builtTiles = _buildTileItems(
      participants: participants,
      room: liveKit,
      currentUserId: me,
      localConnectionId: localConnectionId,
      onlyShowVideos: displayPreferences.onlyShowVideos,
      showOwnCamera: displayPreferences.showOwnCamera,
      forceShowUserId: onThisChannel && missingSelf ? me : null,
    );
    final List<VoiceConsolidatedTile<_VoiceGridTileItem>> consolidated =
        consolidateVoiceGridTiles<_VoiceGridTileItem>(
          tiles: builtTiles,
          userId: (_VoiceGridTileItem tile) => tile.data.userId,
          isScreenShare: (_VoiceGridTileItem tile) =>
              tile.source == VoiceParticipantTileSource.screenShare,
          expandedUserIds: layout.expandedUserIds,
        );
    final List<_VoiceGridTileItem> consolidatedTiles = consolidated
        .map(
          (VoiceConsolidatedTile<_VoiceGridTileItem> entry) =>
              _VoiceGridTileItem(
                data: entry.tile.data,
                source: entry.tile.source,
                extraDeviceCount: entry.extraDeviceCount,
              ),
        )
        .toList();
    final List<_VoiceGridTileItem> tileItems;
    if (prioritizeSpeakingParticipants) {
      ref.watch(
        voiceActiveSpeakersProvider.select((VoiceActiveSpeakersState speakers) {
          return voiceGridOrderSignature(
            _orderTiles(
              consolidatedTiles,
              liveKit,
              me,
              localConnectionId,
              speakers,
            ).map((_VoiceGridTileItem tile) => tile.tileId),
          );
        }),
      );
      tileItems = voiceGridTilesForDisplay(
        prioritizeSpeakingParticipants: true,
        tiles: consolidatedTiles,
        orderBySpeaking: (List<_VoiceGridTileItem> tiles) => _orderTiles(
          tiles,
          liveKit,
          me,
          localConnectionId,
          ref.read(voiceActiveSpeakersProvider),
        ),
      );
    } else {
      tileItems = consolidatedTiles;
    }
    final String? authToken = ref.watch(fluxerAuthTokenProvider);
    final String? baseUrl = ref.watch(fluxerBaseUrlProvider);
    final bool disableStreamPreviews = ref.watch(
      advancedPreferencesProvider.select(
        (AdvancedPreferencesState value) => value.disableStreamPreviews,
      ),
    );
    final String? featuredTileId = ref.watch(voicePipFeaturedTileIdProvider);
    final VoicePipOverlayPhase pipPhase = ref.watch(
      voicePipOverlayPhaseProvider,
    );
    final bool isConnected = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.isConnected),
    );
    _featuredTileId = featuredTileId;
    _pipPhase = pipPhase;
    _isConnected = isConnected;
    _disableStreamPreviews = disableStreamPreviews;
    return Listener(
      onPointerHover: _onPointerHover,
      child: LayoutBuilder(
        builder: (BuildContext c, BoxConstraints cons) {
          return _buildLayout(
            context: context,
            constraints: cons,
            tiles: tileItems,
            layout: layout,
            displayPreferences: displayPreferences,
            watchedTileId: watchedTileId,
            room: liveKit,
            me: me,
            localConnectionId: localConnectionId,
            authToken: authToken,
            baseUrl: baseUrl,
            l10n: l10n,
          );
        },
      ),
    );
  }

  Widget _buildLayout({
    required BuildContext context,
    required BoxConstraints constraints,
    required List<_VoiceGridTileItem> tiles,
    required VoiceCallLayoutState layout,
    required VoiceCallDisplayPreferencesState displayPreferences,
    required String? watchedTileId,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final double maxWidth = constraints.maxWidth;
    final double maxHeight = constraints.maxHeight;
    final bool compact = maxWidth < 520 || maxHeight < 360;
    final int count = tiles.length;
    final bool isPinned = layout.pinnedTileId != null;
    final bool isWatchingScreenShare = watchedTileId != null;
    final _VoiceGridTileItem? selfTile = displayPreferences.showOwnCamera
        ? _findSelfTile(tiles, me)
        : null;
    // Float self only when there is at least one other tile to keep primary.
    final bool canFloatSelf = selfTile != null && count > 1;

    final VoiceGridPackedLayoutMetrics packed = _resolveLayoutMetrics(
      tileCount: count,
      containerWidth: maxWidth,
      containerHeight: maxHeight,
      compact: compact,
    );
    final bool gridOverflow = packed.visibleTileCount < count;

    _VoiceGridTileItem? pinned;
    if (layout.pinnedTileId != null) {
      for (final _VoiceGridTileItem tile in tiles) {
        if (tile.tileId == layout.pinnedTileId) {
          pinned = tile;
          break;
        }
      }
    }

    final bool useHangout =
        !isPinned &&
        !isWatchingScreenShare &&
        layout.mode != VoiceCallLayoutMode.focus &&
        count <= 4 &&
        count > 0;
    final bool useFocus =
        isPinned ||
        isWatchingScreenShare ||
        layout.mode == VoiceCallLayoutMode.focus;

    if (useHangout) {
      _syncWatch(null, tiles);
      final List<_VoiceGridTileItem> hangoutTiles = canFloatSelf
          ? _tilesWithoutSelf(tiles, selfTile)
          : tiles;
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: _buildHangout(
          context: context,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          tiles: hangoutTiles,
          selfTile: canFloatSelf ? selfTile : null,
          compact: compact,
          displayPreferences: displayPreferences,
          room: room,
          me: me,
          localConnectionId: localConnectionId,
          authToken: authToken,
          baseUrl: baseUrl,
          l10n: l10n,
        ),
      );
    }

    if (!useFocus && !gridOverflow) {
      _syncWatch(null, tiles);
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: _buildGrid(
          context: context,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          metrics: packed.metrics,
          tiles: tiles,
          room: room,
          me: me,
          localConnectionId: localConnectionId,
          authToken: authToken,
          baseUrl: baseUrl,
          l10n: l10n,
        ),
      );
    }

    if (!useFocus && gridOverflow) {
      _syncWatch(null, tiles);
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: _buildPaginatedGrid(
          context: context,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          tiles: tiles,
          tilesPerPage: packed.visibleTileCount,
          compact: compact,
          room: room,
          me: me,
          localConnectionId: localConnectionId,
          authToken: authToken,
          baseUrl: baseUrl,
          l10n: l10n,
        ),
      );
    }

    final _VoiceGridTileItem mainTile = pinned ?? _autoMainTile(tiles);
    final List<_VoiceGridTileItem> secondary = tiles
        .where((_VoiceGridTileItem t) => t.tileId != mainTile.tileId)
        .toList();
    final bool isActiveScreenShareMain =
        mainTile.source == VoiceParticipantTileSource.screenShare;
    final String? activeScreenShareTileId = isActiveScreenShareMain
        ? mainTile.tileId
        : null;
    _syncWatch(activeScreenShareTileId, tiles);

    return _wrapLayoutSurface(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: _buildFocus(
        context: context,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        mainTile: mainTile,
        secondary: secondary,
        compact: compact,
        expandMiniGrid: layout.isFocusMiniGridExpanded,
        isFilmstripCollapsed:
            layout.isFilmstripCollapsed || isActiveScreenShareMain,
        room: room,
        me: me,
        localConnectionId: localConnectionId,
        authToken: authToken,
        baseUrl: baseUrl,
        l10n: l10n,
      ),
    );
  }

  Widget _wrapLayoutSurface({
    required double maxWidth,
    required double maxHeight,
    required Widget child,
  }) {
    return SizedBox(
      width: maxWidth,
      height: maxHeight,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _onBackgroundTap,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            child,
            _VoiceCallStatusOverlay(
              channelId: widget.channelId,
              guildId: widget.guildId,
            ),
          ],
        ),
      ),
    );
  }

  _VoiceGridTileItem _autoMainTile(List<_VoiceGridTileItem> tiles) {
    // Default to the highest-priority non-screen-share tile so that watching a
    // stream stays an explicit choice (tap to watch / stop watching). A
    // screen-share only becomes the main tile when there is nothing else to
    // show, or when the user explicitly pins it.
    for (final _VoiceGridTileItem tile in tiles) {
      if (tile.source != VoiceParticipantTileSource.screenShare) {
        return tile;
      }
    }
    return tiles.first;
  }

  double? _resolveTileAspectRatio(
    _VoiceGridTileItem tile,
    Room? room,
    String? me,
    String? localConnectionId,
  ) {
    final Participant? participant = _resolveParticipant(
      tile,
      room,
      me,
      localConnectionId,
    );
    if (participant == null) {
      return null;
    }
    final TrackPublication? publication =
        tile.source == VoiceParticipantTileSource.screenShare
        ? resolveScreenShareVideoPublication(
            participant: participant,
            requireTrack: false,
          )
        : resolveCameraPublicationAllowingNoTrack(participant);
    final VideoDimensions? dimensions = publication?.dimensions;
    if (dimensions == null || dimensions.width <= 0 || dimensions.height <= 0) {
      return null;
    }
    return dimensions.width / dimensions.height;
  }

  Widget _buildHangout({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required List<_VoiceGridTileItem> tiles,
    required _VoiceGridTileItem? selfTile,
    required bool compact,
    required VoiceCallDisplayPreferencesState displayPreferences,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final bool landscape = maxWidth > maxHeight;
    const EdgeInsets padding = EdgeInsets.all(voiceGridEdgePaddingPx);
    final double innerWidth = maxWidth - padding.horizontal;
    final double innerHeight = maxHeight - padding.vertical;
    final double? singleAspect = tiles.length == 1
        ? _resolveTileAspectRatio(tiles.first, room, me, localConnectionId)
        : null;
    final List<Rect> rects = tiles.length == 1
        ? <Rect>[
            voiceHangoutCenteredAspectRect(
              width: innerWidth,
              height: innerHeight,
              aspectRatio: singleAspect ?? voiceGridTileAspectRatio,
            ),
          ]
        : voiceHangoutTileRects(
            tileCount: tiles.length,
            width: innerWidth,
            height: innerHeight,
            landscape: landscape,
          );
    final List<Widget> positioned = <Widget>[];
    final Duration moveDuration = _tileMoveDuration(context);
    for (int i = 0; i < tiles.length; i++) {
      final Rect rect = rects[i];
      positioned.add(
        AnimatedPositioned(
          key: ValueKey<String>(tiles[i].tileId),
          duration: moveDuration,
          curve: _kTileMoveCurve,
          left: padding.left + rect.left,
          top: padding.top + rect.top,
          width: rect.width,
          height: rect.height,
          child: RepaintBoundary(
            child: _TileEnterAnimation(
              child: _buildCard(
                context: context,
                tile: tiles[i],
                room: room,
                me: me,
                localConnectionId: localConnectionId,
                authToken: authToken,
                baseUrl: baseUrl,
                l10n: l10n,
                isFocusMain: tiles.length == 1,
                isActiveScreenShare: false,
                fillContainer: true,
              ),
            ),
          ),
        ),
      );
    }
    if (selfTile != null) {
      positioned.add(
        _buildFloatingSelfTile(
          context: context,
          tile: selfTile,
          compact: compact,
          isMinimized: displayPreferences.isSelfViewMinimized,
          room: room,
          me: me,
          localConnectionId: localConnectionId,
          authToken: authToken,
          baseUrl: baseUrl,
          l10n: l10n,
        ),
      );
    }
    return Stack(children: positioned);
  }

  Widget _buildFloatingSelfTile({
    required BuildContext context,
    required _VoiceGridTileItem tile,
    required bool compact,
    required bool isMinimized,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
    if (isMinimized) {
      return AnimatedPositioned(
        key: ValueKey<String>('float-${tile.tileId}'),
        duration: _tileMoveDuration(context),
        curve: _kTileMoveCurve,
        right: 8 + viewPadding.right,
        bottom: 8 + viewPadding.bottom,
        child: Material(
          color: context.colors.backgroundFloating,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(14),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(14),
            ),
            onTap: () {
              ref
                  .read(voiceCallDisplayPreferencesProvider.notifier)
                  .setSelfViewMinimized(value: false);
            },
            child: SizedBox(
              width: 28,
              height: 56,
              child: Center(
                child: PhosphorIcon(
                  PhosphorIconsBold.caretLeft,
                  color: context.colors.textSecondary,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      );
    }
    final double width = voiceHangoutFloatingSelfWidth(compact: compact);
    final double height = voiceHangoutFloatingSelfHeight(compact: compact);
    return AnimatedPositioned(
      key: ValueKey<String>('float-${tile.tileId}'),
      duration: _tileMoveDuration(context),
      curve: _kTileMoveCurve,
      right: 12 + viewPadding.right,
      bottom: 12 + viewPadding.bottom,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            _buildCard(
              context: context,
              tile: tile,
              room: room,
              me: me,
              localConnectionId: localConnectionId,
              authToken: authToken,
              baseUrl: baseUrl,
              l10n: l10n,
              isFocusMain: false,
              isActiveScreenShare: false,
              isFilmstrip: true,
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Material(
                color: context.colors.backgroundFloating.withValues(alpha: 0.9),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    ref
                        .read(voiceCallDisplayPreferencesProvider.notifier)
                        .setSelfViewMinimized(value: true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: PhosphorIcon(
                      PhosphorIconsBold.minus,
                      size: 14,
                      color: context.colors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaginatedGrid({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required List<_VoiceGridTileItem> tiles,
    required int tilesPerPage,
    required bool compact,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final int perPage = math.max(1, tilesPerPage);
    final List<List<_VoiceGridTileItem>> pages = voiceGridPaginateTiles(
      tiles: tiles,
      tilesPerPage: perPage,
    );
    final int pageCount = pages.length;
    if (_galleryPageIndex.value >= pageCount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || pageCount <= 0) {
          return;
        }
        final int clamped = pageCount - 1;
        _galleryPageIndex.value = clamped;
        if (_galleryPageController.hasClients) {
          _galleryPageController.jumpToPage(clamped);
        }
      });
    }
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: _galleryPageController,
            itemCount: pageCount,
            itemBuilder: (BuildContext context, int pageIndex) {
              final VoiceGridPackedLayoutMetrics packed = _resolveLayoutMetrics(
                tileCount: pages[pageIndex].length,
                containerWidth: maxWidth,
                containerHeight: maxHeight - 24,
                compact: compact,
              );
              return KeyedSubtree(
                key: ValueKey<int>(pageIndex),
                child: _buildGrid(
                  context: context,
                  maxWidth: maxWidth,
                  maxHeight: maxHeight - 24,
                  metrics: packed.metrics,
                  tiles: pages[pageIndex],
                  room: room,
                  me: me,
                  localConnectionId: localConnectionId,
                  authToken: authToken,
                  baseUrl: baseUrl,
                  l10n: l10n,
                ),
              );
            },
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _galleryPageIndex,
          builder: (BuildContext context, int currentPage, Widget? _) {
            return VoiceGalleryPageDots(
              pageCount: pageCount,
              currentPage: currentPage,
            );
          },
        ),
      ],
    );
  }

  Widget _buildGrid({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required VoiceGridLayoutMetrics metrics,
    required List<_VoiceGridTileItem> tiles,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final int columns = math.max(1, metrics.columns);
    final double tileW = metrics.tileWidth;
    final double tileH = metrics.tileHeight;
    final double gap = metrics.gap;
    final double availableWidth = metrics.availableWidth;
    final double availableHeight = metrics.availableHeight;
    final int rows = math.max(1, (tiles.length / columns).ceil());
    final double blockHeight = rows * tileH + (rows - 1) * gap;
    final double startY =
        metrics.verticalPadding +
        math.max(0, (availableHeight - blockHeight) / 2);

    final List<Widget> positioned = <Widget>[];
    for (int i = 0; i < tiles.length; i++) {
      final _VoiceGridTileItem tile = tiles[i];
      final int row = i ~/ columns;
      final int itemsInRow = (row == rows - 1)
          ? tiles.length - row * columns
          : columns;
      final double rowWidth = itemsInRow * tileW + (itemsInRow - 1) * gap;
      final double startX =
          metrics.sidePadding + math.max(0, (availableWidth - rowWidth) / 2);
      final int colInRow = i - row * columns;
      final double x = startX + colInRow * (tileW + gap);
      final double y = startY + row * (tileH + gap);
      positioned.add(
        AnimatedPositioned(
          key: ValueKey<String>(tile.tileId),
          duration: _tileMoveDuration(context),
          curve: _kTileMoveCurve,
          left: x,
          top: y,
          width: tileW,
          height: tileH,
          child: RepaintBoundary(
            child: _TileEnterAnimation(
              child: _buildCard(
                context: context,
                tile: tile,
                room: room,
                me: me,
                localConnectionId: localConnectionId,
                authToken: authToken,
                baseUrl: baseUrl,
                l10n: l10n,
                isFocusMain: false,
                isActiveScreenShare: false,
              ),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      width: maxWidth,
      height: maxHeight,
      child: Stack(children: positioned),
    );
  }

  Widget _buildFocus({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required _VoiceGridTileItem mainTile,
    required List<_VoiceGridTileItem> secondary,
    required bool compact,
    required bool expandMiniGrid,
    required bool isFilmstripCollapsed,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final bool landscape = maxWidth > maxHeight;
    final bool hasSecondary = secondary.isNotEmpty && !isFilmstripCollapsed;
    final double filmstripCrossAxis = voiceFocusFilmstripCrossAxis(
      compact: compact,
      landscape: landscape,
    );
    final bool isActiveScreenShareMain =
        mainTile.source == VoiceParticipantTileSource.screenShare;
    final double? trackAspect = _resolveTileAspectRatio(
      mainTile,
      room,
      me,
      localConnectionId,
    );
    final Widget mainStage = RepaintBoundary(
      child: _buildCard(
        context: context,
        tile: mainTile,
        room: room,
        me: me,
        localConnectionId: localConnectionId,
        authToken: authToken,
        baseUrl: baseUrl,
        l10n: l10n,
        isFocusMain: true,
        isActiveScreenShare: isActiveScreenShareMain,
        fillContainer: true,
      ),
    );
    final Widget mainExpanded = isActiveScreenShareMain
        ? mainStage
        : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final Rect rect = voiceHangoutCenteredAspectRect(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                aspectRatio: trackAspect ?? voiceGridTileAspectRatio,
              );
              return Align(
                child: SizedBox(
                  width: rect.width,
                  height: rect.height,
                  child: mainStage,
                ),
              );
            },
          );
    Widget filmstripTile(_VoiceGridTileItem tile) {
      final bool isFocusedMirror = tile.tileId == mainTile.tileId;
      return KeyedSubtree(
        key: ValueKey<String>(tile.tileId),
        child: RepaintBoundary(
          child: _buildCard(
            context: context,
            tile: tile,
            room: room,
            me: me,
            localConnectionId: localConnectionId,
            authToken: authToken,
            baseUrl: baseUrl,
            l10n: l10n,
            isFocusMain: false,
            isActiveScreenShare: false,
            isFilmstrip: true,
            omitVideoTrack: isFocusedMirror,
          ),
        ),
      );
    }

    final bool useMiniGrid =
        expandMiniGrid ||
        voiceFocusShouldUseMiniGrid(
          compact: compact,
          containerWidth: maxWidth,
          secondaryCount: secondary.length,
        );

    if (landscape) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                voiceGridEdgePaddingPx,
                voiceGridEdgePaddingPx,
                hasSecondary ? 0 : voiceGridEdgePaddingPx,
                voiceGridEdgePaddingPx,
              ),
              child: mainExpanded,
            ),
          ),
          if (hasSecondary) ...<Widget>[
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: voiceGridEdgePaddingPx),
              child: SizedBox(
                width: filmstripCrossAxis,
                child: ListView.separated(
                  cacheExtent: 0,
                  addAutomaticKeepAlives: false,
                  padding: const EdgeInsets.symmetric(
                    vertical: voiceGridEdgePaddingPx,
                  ),
                  itemCount: secondary.length,
                  separatorBuilder: (BuildContext _, int _) =>
                      const SizedBox(height: 8),
                  itemBuilder: (BuildContext _, int index) {
                    return AspectRatio(
                      aspectRatio: voiceGridTileAspectRatio,
                      child: filmstripTile(secondary[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              voiceGridEdgePaddingPx,
              voiceGridEdgePaddingPx,
              voiceGridEdgePaddingPx,
              hasSecondary ? 0 : voiceGridEdgePaddingPx,
            ),
            child: mainExpanded,
          ),
        ),
        if (hasSecondary) ...<Widget>[
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: voiceGridEdgePaddingPx),
            child: useMiniGrid
                ? _buildFocusMiniGrid(
                    secondary: secondary,
                    maxWidth: maxWidth,
                    filmstripTile: filmstripTile,
                  )
                : SizedBox(
                    height: filmstripCrossAxis,
                    child: ListView.separated(
                      cacheExtent: 0,
                      addAutomaticKeepAlives: false,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: voiceGridEdgePaddingPx,
                      ),
                      itemCount: secondary.length,
                      separatorBuilder: (BuildContext _, int _) =>
                          const SizedBox(width: 8),
                      itemBuilder: (BuildContext _, int index) {
                        return AspectRatio(
                          aspectRatio: voiceGridTileAspectRatio,
                          child: filmstripTile(secondary[index]),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ],
    );
  }

  Widget _buildFocusMiniGrid({
    required List<_VoiceGridTileItem> secondary,
    required double maxWidth,
    required Widget Function(_VoiceGridTileItem tile) filmstripTile,
  }) {
    final int columns = voiceFocusMiniGridColumnCount(maxWidth);
    return GridView.builder(
      shrinkWrap: true,
      cacheExtent: 0,
      addAutomaticKeepAlives: false,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: voiceGridEdgePaddingPx),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: voiceGridTileAspectRatio,
      ),
      itemCount: secondary.length,
      itemBuilder: (BuildContext _, int index) {
        return filmstripTile(secondary[index]);
      },
    );
  }

  void _showParticipantMenu(
    BuildContext context,
    WidgetRef ref,
    _VoiceGridTileItem tile, {
    required Offset position,
  }) {
    unawaited(() async {
      ref.read(voiceCallOverlayProvider.notifier).setMenuPinned(value: true);
      try {
        await VoiceParticipantContextMenu.show(
          context,
          ref,
          target: VoiceParticipantMenuTarget(
            participant: tile.data,
            tileId: tile.tileId,
            tileSource: tile.source,
            guildId: widget.guildId,
            channelId: widget.channelId,
          ),
          position: position,
        );
      } finally {
        if (context.mounted) {
          ref
              .read(voiceCallOverlayProvider.notifier)
              .setMenuPinned(value: false);
        }
      }
    }());
  }

  Widget _buildCard({
    required BuildContext context,
    required _VoiceGridTileItem tile,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
    required bool isFocusMain,
    required bool isActiveScreenShare,
    bool isFilmstrip = false,
    bool fillContainer = false,
    bool omitVideoTrack = false,
  }) {
    final bool featured = tile.tileId == _featuredTileId;
    final bool hostFeatured = featured && voicePipHostsFeatured(_pipPhase);
    final bool hideFeatured = featured && voicePipHidesFeaturedTile(_pipPhase);
    final Widget card = _VoiceParticipantCard(
      data: tile.data,
      guildId: widget.guildId,
      channelId: widget.channelId,
      tileId: tile.tileId,
      tileSource: tile.source,
      room: room,
      currentUserId: me,
      localConnectionId: localConnectionId,
      isActiveScreenShare: isActiveScreenShare,
      isFocusMain: isFocusMain,
      isFilmstrip: isFilmstrip,
      fillContainer: fillContainer,
      extraDeviceCount: tile.extraDeviceCount,
      streamPreviewUrl: _disableStreamPreviews
          ? null
          : buildViewerStreamPreviewUrl(
              baseUrl: baseUrl,
              voice: tile.data.voice,
              isScreenShareTile:
                  tile.source == VoiceParticipantTileSource.screenShare,
            ),
      authToken: authToken,
      onTap: () => _onTileTap(tile, isFocusMain),
      onStopWatching: _stopWatching,
      onContextMenu: (Offset position) =>
          _showParticipantMenu(context, ref, tile, position: position),
      l10n: l10n,
      omitVideoTrack: omitVideoTrack || hostFeatured || !_isConnected,
    );
    Widget wrapped = card;
    if (hideFeatured) {
      wrapped = Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: card,
      );
    }
    if (featured && (hostFeatured || voicePipIsInFlight(_pipPhase))) {
      return KeyedSubtree(key: kVoicePipExpandSlotKey, child: wrapped);
    }
    return wrapped;
  }
}

/// Fades a tile in on first appearance, then stays put while
/// [AnimatedPositioned] handles subsequent movement.
class _TileEnterAnimation extends StatelessWidget {
  const _TileEnterAnimation({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      return child;
    }
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: context.motion.panel,
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, double value, Widget? animatedChild) {
        return Opacity(opacity: value.clamp(0, 1), child: animatedChild);
      },
      child: child,
    );
  }
}

class _VoiceParticipantCard extends ConsumerWidget {
  const _VoiceParticipantCard({
    required this.data,
    required this.guildId,
    required this.channelId,
    required this.tileId,
    required this.room,
    required this.currentUserId,
    required this.localConnectionId,
    required this.tileSource,
    required this.isActiveScreenShare,
    required this.isFocusMain,
    required this.isFilmstrip,
    required this.fillContainer,
    required this.streamPreviewUrl,
    required this.authToken,
    required this.onTap,
    required this.onStopWatching,
    required this.onContextMenu,
    required this.l10n,
    this.omitVideoTrack = false,
    this.extraDeviceCount = 0,
  });

  final VoiceChannelParticipantData data;
  final String? guildId;
  final String channelId;
  final String tileId;
  final Room? room;
  final String? currentUserId;
  final String? localConnectionId;
  final VoiceParticipantTileSource tileSource;
  final bool isActiveScreenShare;
  final bool isFocusMain;
  final bool isFilmstrip;
  final bool fillContainer;
  final int extraDeviceCount;
  final String? streamPreviewUrl;
  final String? authToken;
  final VoidCallback onTap;
  final VoidCallback onStopWatching;
  final void Function(Offset position) onContextMenu;
  final FluxerLocalizations l10n;
  final bool omitVideoTrack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database.User? user = data.user;
    final GuildUserDisplay? resolvedDisplay = ref
        .watch(guildUserDisplayFromDbProvider((data.userId, guildId)))
        .value;
    final String fallbackDisplay = user != null
        ? (user.globalName ?? user.username)
        : data.userId;
    final String display = resolvedDisplay?.displayName ?? fallbackDisplay;
    final String? connectionId = data.voice.connectionId;
    final VoiceState? liveVoice = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    VoiceState voice = liveVoice ?? data.voice;
    if (liveVoice == null && data.userId == currentUserId) {
      final (bool selfMute, bool selfDeaf) = ref.watch(
        localVoiceStateProvider.select(
          (LocalVoiceStateData local) => (local.selfMute, local.selfDeaf),
        ),
      );
      voice = _withLocalAudio(voice, selfMute: selfMute, selfDeaf: selfDeaf);
    }
    final int? avatarArgb = user?.avatarColor;
    final Color cardColor = avatarArgb == null
        ? context.colors.brandPrimary
        : Color(0xFF000000 | avatarArgb);
    final Participant? participant = resolveVoiceParticipant(
      room: room,
      voice: voice,
      userId: data.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final bool ringEnabled =
        tileSource == VoiceParticipantTileSource.camera &&
        !_isVoiceMuted(voice);
    final bool isOwnScreenShareTile =
        tileSource == VoiceParticipantTileSource.screenShare &&
        localConnectionId != null &&
        voice.connectionId == localConnectionId;
    final bool pauseOwnPreview = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState s) => s.pauseOwnScreenSharePreviewOnUnfocus,
      ),
    );
    final bool mirrorCamera = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState s) => s.shouldMirrorOwnCamera,
      ),
    );
    final String speakingIdentity = participant?.identity ?? data.userId;
    final String? speakingSid = participant?.sid;
    final BorderRadius radius = BorderRadius.circular(12);
    final Widget media = VoiceParticipantMediaTile(
      room: room,
      userId: data.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
      voice: voice,
      display: display,
      backgroundColor: cardColor,
      user: user,
      tileSource: tileSource,
      isActiveScreenShare: isActiveScreenShare,
      isFilmstrip: isFilmstrip,
      fillContainer: fillContainer,
      streamPreviewUrl: streamPreviewUrl,
      authToken: authToken,
      isTileFocused: isFocusMain,
      pauseOwnScreenSharePreviewOnUnfocus: pauseOwnPreview,
      mirrorCamera: mirrorCamera,
      omitVideoTrack: omitVideoTrack,
      subscribeQuality: voiceCameraSubscribeQuality(
        isFilmstrip: isFilmstrip,
        isFocusMain: isFocusMain,
        tileWidth: fillContainer ? 800 : 0,
        tileHeight: fillContainer ? 450 : 0,
      ),
    );
    final StringBuffer semantics = StringBuffer(display);
    if (voice.selfMute || voice.mute || voice.suppress) {
      semantics.write(' ${l10n.voiceParticipantTooltipMuted}');
    }
    if (voice.selfDeaf || voice.deaf) {
      semantics.write(' ${l10n.voiceParticipantTooltipDeafened}');
    }
    return Semantics(
      button: true,
      label: semantics.toString(),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: cardColor, borderRadius: radius),
        child: ClipRRect(
          borderRadius: radius,
          child: FluxerGestureDetector(
            onTap: onTap,
            onSecondaryTapUp: (TapUpDetails details) =>
                onContextMenu(details.globalPosition),
            onLongPressStart: isTouchPrimaryInput(ref)
                ? (LongPressStartDetails details) =>
                      onContextMenu(details.globalPosition)
                : null,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                media,
                Positioned.fill(
                  child: VoiceSpeakingRingLayer(
                    enabled: ringEnabled,
                    identity: speakingIdentity,
                    sid: speakingSid,
                    aroundAvatar: omitVideoTrack || !voice.selfVideo,
                  ),
                ),
                if (tileSource == VoiceParticipantTileSource.screenShare &&
                    !isOwnScreenShareTile &&
                    !isActiveScreenShare &&
                    !isFilmstrip)
                  Positioned.fill(child: _WatchStreamOverlay(onWatch: onTap)),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final VoiceTileMetrics metrics = voiceTileMetricsForSize(
                      Size(constraints.maxWidth, constraints.maxHeight),
                    );
                    return Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        if (tileSource ==
                                VoiceParticipantTileSource.screenShare &&
                            !isOwnScreenShareTile &&
                            isActiveScreenShare)
                          Positioned(
                            top: metrics.inset,
                            left: metrics.inset,
                            child: _TileHudVisibility(
                              child: _StopWatchingButton(
                                onStopWatching: onStopWatching,
                              ),
                            ),
                          ),
                        if (tileSource ==
                            VoiceParticipantTileSource.screenShare)
                          Positioned(
                            top: metrics.inset,
                            right: metrics.inset,
                            child: _StreamStatusBadge(
                              l10n: l10n,
                              participant: participant,
                            ),
                          ),
                        if (extraDeviceCount > 0)
                          Positioned(
                            top: metrics.inset,
                            left: metrics.inset,
                            child: FluxerGestureDetector(
                              onTap: () {
                                ref
                                    .read(voiceCallLayoutProvider.notifier)
                                    .toggleExpandedUser(data.userId);
                              },
                              child: _TileHudVisibility(
                                child: _ExtraDevicesChip(
                                  count: extraDeviceCount,
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          left: 8,
                          right: 8,
                          bottom: 8,
                          child: _TileHudVisibility(
                            child: _VoiceParticipantNameplate(
                              l10n: l10n,
                              voice: voice,
                              display: display,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StreamTrackInfo {
  const _StreamTrackInfo({required this.height, required this.fps});

  final int height;
  final int fps;
}

class _StreamStatusBadge extends StatelessWidget {
  const _StreamStatusBadge({required this.l10n, required this.participant});

  final FluxerLocalizations l10n;
  final Participant? participant;

  static const List<int> _kResolutionHeights = <int>[
    480,
    720,
    1080,
    1440,
    2160,
  ];

  int _closestResolutionHeight(int height) {
    var closest = _kResolutionHeights.first;
    var smallestDiff = (height - closest).abs();
    for (final int value in _kResolutionHeights) {
      final int diff = (height - value).abs();
      if (diff < smallestDiff) {
        closest = value;
        smallestDiff = diff;
      }
    }
    return closest;
  }

  String _buildResolutionLabel(int height) {
    final int target = _closestResolutionHeight(height);
    if (target == 2160) {
      return '4K';
    }
    return '${target}p';
  }

  int _extractFps(TrackPublication publication) {
    final Track? publicationTrack = publication.track;
    if (publicationTrack is! VideoTrack) {
      return 0;
    }
    try {
      final Map<String, dynamic> settings = publicationTrack.mediaStreamTrack
          .getSettings();
      final Object? rawFrameRate =
          settings['frameRate'] ?? settings['framerate'];
      if (rawFrameRate is num && rawFrameRate.isFinite) {
        return rawFrameRate.round();
      }
      if (rawFrameRate is String) {
        return double.tryParse(rawFrameRate)?.round() ?? 0;
      }
    } on Object {
      return 0;
    }
    return 0;
  }

  _StreamTrackInfo? _resolveInfo() {
    final Participant? p = participant;
    if (p == null) {
      return null;
    }
    final TrackPublication? publication = resolveScreenShareVideoPublication(
      participant: p,
      requireTrack: false,
    );
    if (publication == null) {
      return null;
    }
    final VideoDimensions? dimensions = publication.dimensions;
    if (dimensions == null || dimensions.width <= 0 || dimensions.height <= 0) {
      return null;
    }
    return _StreamTrackInfo(
      height: math.min(dimensions.width, dimensions.height),
      fps: _extractFps(publication),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Participant? p = participant;
    if (p == null) {
      return const FluxerLiveBadge();
    }
    return ListenableBuilder(
      listenable: p,
      builder: (BuildContext context, Widget? child) {
        final _StreamTrackInfo? info = _resolveInfo();
        if (info == null) {
          return const FluxerLiveBadge();
        }
        final String resolutionText = _buildResolutionLabel(info.height);
        final String fpsText = info.fps > 0 ? '${info.fps} FPS' : '';
        final String label = fpsText.isEmpty
            ? resolutionText
            : '$resolutionText $fpsText';
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondary,
                borderRadius: BorderRadius.circular(9999),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  label,
                  style: context.textStyles.timestamp.copyWith(
                    color: context.colors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
            const FluxerLiveBadge(),
          ],
        );
      },
    );
  }
}

class _WatchStreamOverlay extends StatelessWidget {
  const _WatchStreamOverlay({required this.onWatch});

  final VoidCallback onWatch;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const Positioned.fill(
          child: IgnorePointer(child: ColoredBox(color: Color(0x66000000))),
        ),
        Center(
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.colors.backgroundSecondary,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.18),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: onWatch,
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          PhosphorIcon(
                            PhosphorIconsFill.monitorPlay,
                            size: 18,
                            color: context.colors.textPrimary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.voiceWatchStream,
                            style: context.textStyles.categoryName.copyWith(
                              color: context.colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StopWatchingButton extends StatelessWidget {
  const _StopWatchingButton({required this.onStopWatching});

  final VoidCallback onStopWatching;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Tooltip(
      message: l10n.voiceStopWatchingCurrentStreamTooltip,
      child: Material(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          onTap: onStopWatching,
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PhosphorIcon(
                  PhosphorIconsFill.eyeSlash,
                  size: 18,
                  color: context.colors.textPrimary,
                ),
                const SizedBox(width: 6),
                Text(
                  l10n.voiceStopWatching,
                  style: context.textStyles.smallText.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TileHudVisibility extends ConsumerWidget {
  const _TileHudVisibility({required this.child}) : visible = true;

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool overlayVisible = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
    final bool show = visible && overlayVisible;
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : context.motion.panel;
    return IgnorePointer(
      ignoring: !show,
      child: AnimatedOpacity(
        opacity: show ? 1 : 0,
        duration: duration,
        curve: Curves.easeOutCubic,
        child: child,
      ),
    );
  }
}

class _VoiceParticipantNameplate extends StatelessWidget {
  const _VoiceParticipantNameplate({
    required this.l10n,
    required this.voice,
    required this.display,
  });

  final FluxerLocalizations l10n;
  final VoiceState voice;
  final String display;

  @override
  Widget build(BuildContext context) {
    final bool showMute = voice.selfMute || voice.mute || voice.suppress;
    final bool showDeaf = voice.selfDeaf || voice.deaf;
    final bool hasCommunityMic = voice.mute || voice.suppress;
    final Color micColor = hasCommunityMic
        ? context.colors.statusDanger
        : const Color(0xFFFFFFFF);
    final Color deafColor = voice.deaf
        ? context.colors.statusDanger
        : const Color(0xFFFFFFFF);
    final String? connectionId = voice.connectionId;
    final StringBuffer semantics = StringBuffer(display);
    if (connectionId != null && connectionId.isNotEmpty) {
      semantics.write(' $connectionId');
    }
    if (showMute) {
      semantics.write(
        ' ${hasCommunityMic ? l10n.voiceParticipantTooltipCommunityMuted : l10n.voiceParticipantTooltipMuted}',
      );
    }
    if (showDeaf) {
      semantics.write(
        ' ${voice.deaf ? l10n.voiceParticipantTooltipCommunityDeafened : l10n.voiceParticipantTooltipDeafened}',
      );
    }
    return Semantics(
      label: semantics.toString(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Align(
            alignment: Alignment.bottomLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (showMute) ...<Widget>[
                        Tooltip(
                          message: hasCommunityMic
                              ? l10n.voiceParticipantTooltipCommunityMuted
                              : l10n.voiceParticipantTooltipMuted,
                          child: PhosphorIcon(
                            PhosphorIconsFill.microphoneSlash,
                            size: 14,
                            color: micColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      if (showDeaf) ...<Widget>[
                        Tooltip(
                          message: voice.deaf
                              ? l10n.voiceParticipantTooltipCommunityDeafened
                              : l10n.voiceParticipantTooltipDeafened,
                          child: PhosphorIcon(
                            PhosphorIconsFill.speakerSlash,
                            size: 14,
                            color: deafColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Tooltip(
                        message: voice.isMobile
                            ? l10n.voiceParticipantTooltipMobileDevice
                            : l10n.voiceParticipantTooltipDesktopDevice,
                        child: PhosphorIcon(
                          voice.isMobile
                              ? PhosphorIconsFill.deviceMobile
                              : PhosphorIconsFill.desktop,
                          size: 14,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Tooltip(
                          message:
                              connectionId != null && connectionId.isNotEmpty
                              ? l10n.voiceParticipantTooltipConnection(
                                  connectionId,
                                )
                              : display,
                          child: Text.rich(
                            TextSpan(
                              style: context.textStyles.bodySmall.copyWith(
                                color: context.colors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <InlineSpan>[
                                TextSpan(text: display),
                                if (connectionId != null &&
                                    connectionId.isNotEmpty)
                                  TextSpan(
                                    text: ' ($connectionId)',
                                    style: context.textStyles.bodySmall
                                        .copyWith(
                                          color: context.colors.textSecondary,
                                        ),
                                  ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExtraDevicesChip extends StatelessWidget {
  const _ExtraDevicesChip({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          '+$count',
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _VoiceCallStatusOverlay extends ConsumerWidget {
  const _VoiceCallStatusOverlay({required this.channelId, this.guildId});

  final String channelId;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (bool connecting, bool reconnecting, String? joinError) = ref.watch(
      voiceSessionProvider.select((VoiceSessionState session) {
        final bool here =
            session.isInVoice &&
            session.channelId == channelId &&
            (guildId == null
                ? session.guildId == null || session.guildId!.isEmpty
                : session.guildId == guildId);
        return (
          here && session.isConnecting,
          here && session.isReconnecting,
          here ? session.errorMessage : null,
        );
      }),
    );
    if (!connecting && !reconnecting && joinError == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (reconnecting || connecting)
                _VoiceStatusPill(
                  label: reconnecting
                      ? l10n.gatewayReconnectingToast
                      : l10n.voiceChannelStatusConnecting,
                ),
              if (joinError != null) ...<Widget>[
                if (reconnecting || connecting) const SizedBox(height: 8),
                VoiceJoinErrorBanner(message: joinError),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceStatusPill extends StatelessWidget {
  const _VoiceStatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundFloating,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.colors.backgroundTertiary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FluxerLoadingSpinner(color: context.colors.textPrimary),
            const SizedBox(width: 8),
            Text(
              label,
              style: context.textStyles.smallText.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
