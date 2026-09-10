import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
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
import 'package:fluxer_app/features/voice/utils/voice_stream_info.dart';
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
const Key kVoiceCallViewModeToggleKey = Key('voice-call-view-mode-toggle');

Duration _tileMoveDuration(BuildContext context) {
  if (MediaQuery.disableAnimationsOf(context)) {
    return Duration.zero;
  }
  return _kTileMoveDuration;
}

bool _sameViewerStreamKeys(List<String> a, List<String> b) {
  if (a.length != b.length) {
    return false;
  }
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
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
  List<String> lastViewerStreamKeys = const <String>[];
  late final PageController _galleryPageController;
  late final ValueNotifier<int> _galleryPageIndex;
  String? _featuredTileId;
  VoicePipOverlayPhase _pipPhase = VoicePipOverlayPhase.hidden;
  bool _isConnected = false;

  bool _stalePinScheduled = false;

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

  void _syncViewerKeys(
    List<_VoiceGridTileItem> tiles,
    Set<String> watchedTileIds,
  ) {
    if (watchedTileIds.isEmpty) {
      if (lastViewerStreamKeys.isNotEmpty) {
        lastViewerStreamKeys = const <String>[];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          ref
              .read(voiceSessionProvider.notifier)
              .updateViewerStreamKeys(const <String>[]);
        });
      }
      return;
    }
    final Set<String> aliveScreenShareIds = <String>{
      for (final _VoiceGridTileItem tile in tiles)
        if (tile.source == VoiceParticipantTileSource.screenShare) tile.tileId,
    };
    if (watchedTileIds.any(
      (String tileId) => !aliveScreenShareIds.contains(tileId),
    )) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref
            .read(voiceScreenShareWatchTileProvider.notifier)
            .retainTileIds(aliveScreenShareIds);
      });
    }
    final List<String> nextKeys = voiceViewerStreamKeysForWatchedTiles(
      watchedTileIds: watchedTileIds,
      streamKeyForTile: (String tileId) {
        for (final _VoiceGridTileItem tile in tiles) {
          if (tile.tileId == tileId) {
            return buildViewerStreamKey(
              voice: tile.data.voice,
              isScreenShareTile:
                  tile.source == VoiceParticipantTileSource.screenShare,
            );
          }
        }
        return null;
      },
    );
    if (_sameViewerStreamKeys(lastViewerStreamKeys, nextKeys)) {
      return;
    }
    lastViewerStreamKeys = nextKeys;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(voiceSessionProvider.notifier).updateViewerStreamKeys(nextKeys);
    });
  }

  void _watchStream(_VoiceGridTileItem item) {
    if (item.source != VoiceParticipantTileSource.screenShare) {
      return;
    }
    ref.read(voiceScreenShareWatchTileProvider.notifier).watch(item.tileId);
  }

  void _stopWatching(String tileId) {
    ref.read(voiceScreenShareWatchTileProvider.notifier).unwatch(tileId);
  }

  void _onTileTap(_VoiceGridTileItem item, bool isFocusMain) {
    if (item.source == VoiceParticipantTileSource.screenShare) {
      final bool alreadyWatching = ref
          .read(voiceScreenShareWatchTileProvider)
          .contains(item.tileId);
      _watchStream(item);
      if (isFocusMain && alreadyWatching) {
        ref
            .read(voiceCallLayoutProvider.notifier)
            .setMode(VoiceCallLayoutMode.grid);
        return;
      }
      if (!isFocusMain) {
        ref.read(voiceCallLayoutProvider.notifier).pin(item.tileId);
        _revealOverlay();
      }
      return;
    }
    if (isFocusMain) {
      ref
          .read(voiceCallLayoutProvider.notifier)
          .setMode(VoiceCallLayoutMode.grid);
      return;
    }
    ref.read(voiceCallLayoutProvider.notifier).pin(item.tileId);
    _revealOverlay();
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
    final String? baseUrl = ref.watch(fluxerBaseUrlProvider);
    final Set<String> watchedTileIds = ref.watch(
      voiceScreenShareWatchTileProvider,
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
    _syncViewerKeys(tileItems, watchedTileIds);
    if (layout.pinnedTileId != null &&
        !tileItems.any(
          (_VoiceGridTileItem tile) => tile.tileId == layout.pinnedTileId,
        )) {
      _scheduleClearStalePin();
    }
    return Listener(
      onPointerHover: _onPointerHover,
      child: LayoutBuilder(
        builder: (BuildContext c, BoxConstraints cons) {
          return _buildLayout(
            context: context,
            constraints: cons,
            tiles: tileItems,
            watchedTileIds: watchedTileIds,
            layout: layout,
            room: liveKit,
            me: me,
            localConnectionId: localConnectionId,
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
    required Set<String> watchedTileIds,
    required VoiceCallLayoutState layout,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final double maxWidth = constraints.maxWidth;
    final double maxHeight = constraints.maxHeight;
    final EdgeInsets stageInsets = MediaQuery.paddingOf(context);
    final double innerWidth = math.max(0, maxWidth - stageInsets.horizontal);
    final double innerHeight = math.max(0, maxHeight - stageInsets.vertical);
    final bool compact = innerWidth < 520 || innerHeight < 360;
    final int count = tiles.length;

    final VoiceGridPackedLayoutMetrics packed = _resolveLayoutMetrics(
      tileCount: count,
      containerWidth: innerWidth,
      containerHeight: innerHeight,
      compact: compact,
    );

    _VoiceGridTileItem? pinned;
    if (layout.pinnedTileId != null) {
      for (final _VoiceGridTileItem tile in tiles) {
        if (tile.tileId == layout.pinnedTileId) {
          pinned = tile;
          break;
        }
      }
    }

    final VoiceCallVisualLayout visual = resolveVoiceCallVisualLayout(
      isFocusMode: layout.mode == VoiceCallLayoutMode.focus,
      pinnedTileId: pinned?.tileId,
      tileCount: count,
      visibleTileCount: packed.visibleTileCount,
    );

    if (visual == VoiceCallVisualLayout.packedGrid) {
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: Padding(
          padding: stageInsets,
          child: _buildGrid(
            context: context,
            maxWidth: innerWidth,
            maxHeight: innerHeight,
            metrics: packed.metrics,
            tiles: tiles,
            watchedTileIds: watchedTileIds,
            room: room,
            me: me,
            localConnectionId: localConnectionId,
            baseUrl: baseUrl,
            l10n: l10n,
          ),
        ),
      );
    }

    if (visual == VoiceCallVisualLayout.paginatedGrid) {
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: Padding(
          padding: stageInsets,
          child: _buildPaginatedGrid(
            context: context,
            maxWidth: innerWidth,
            maxHeight: innerHeight,
            tiles: tiles,
            watchedTileIds: watchedTileIds,
            tilesPerPage: packed.visibleTileCount,
            compact: compact,
            room: room,
            me: me,
            localConnectionId: localConnectionId,
            baseUrl: baseUrl,
            l10n: l10n,
          ),
        ),
      );
    }

    if (tiles.isEmpty) {
      return _wrapLayoutSurface(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        child: const SizedBox.expand(),
      );
    }

    final _VoiceGridTileItem mainTile = pinned ?? _autoMainTile(tiles, me: me);
    final List<_VoiceGridTileItem> secondary = tiles
        .where((_VoiceGridTileItem t) => t.tileId != mainTile.tileId)
        .toList();
    final bool isScreenShareMain =
        mainTile.source == VoiceParticipantTileSource.screenShare;

    return _wrapLayoutSurface(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: Padding(
        padding: stageInsets,
        child: _buildFocus(
          context: context,
          maxWidth: innerWidth,
          maxHeight: innerHeight,
          mainTile: mainTile,
          secondary: secondary,
          watchedTileIds: watchedTileIds,
          compact: compact,
          expandMiniGrid: layout.isFocusMiniGridExpanded,
          isFilmstripCollapsed:
              layout.isFilmstripCollapsed || isScreenShareMain,
          room: room,
          me: me,
          localConnectionId: localConnectionId,
          baseUrl: baseUrl,
          l10n: l10n,
        ),
      ),
    );
  }

  void _scheduleClearStalePin() {
    if (_stalePinScheduled) {
      return;
    }
    _stalePinScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _stalePinScheduled = false;
      if (!mounted) {
        return;
      }
      ref.read(voiceCallLayoutProvider.notifier).clearStalePin();
    });
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
            const _VoiceCallViewModeToggle(),
          ],
        ),
      ),
    );
  }

  _VoiceGridTileItem _autoMainTile(
    List<_VoiceGridTileItem> tiles, {
    String? me,
  }) {
    _VoiceGridTileItem? selfCamera;
    for (final _VoiceGridTileItem tile in tiles) {
      if (tile.source == VoiceParticipantTileSource.screenShare) {
        continue;
      }
      final bool isSelfCamera =
          me != null &&
          tile.data.userId == me &&
          tile.source == VoiceParticipantTileSource.camera;
      if (isSelfCamera) {
        selfCamera = tile;
        continue;
      }
      return tile;
    }
    return selfCamera ?? tiles.first;
  }

  Widget _buildPaginatedGrid({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required List<_VoiceGridTileItem> tiles,
    required Set<String> watchedTileIds,
    required int tilesPerPage,
    required bool compact,
    required Room? room,
    required String? me,
    required String? localConnectionId,
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
                  watchedTileIds: watchedTileIds,
                  room: room,
                  me: me,
                  localConnectionId: localConnectionId,
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
    required Set<String> watchedTileIds,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final ({double width, double height}) placed = voiceGridPlacedTileSize(
      cellWidth: metrics.tileWidth,
      cellHeight: metrics.tileHeight,
      tileCount: tiles.length,
      squareTile:
          tiles.length == 1 &&
          tiles.first.source == VoiceParticipantTileSource.camera &&
          !tiles.first.data.voice.selfVideo,
    );
    final int columns = math.max(1, metrics.columns);
    final double tileW = placed.width;
    final double tileH = placed.height;
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
                baseUrl: baseUrl,
                l10n: l10n,
                isFocusMain: false,
                isActiveScreenShare: watchedTileIds.contains(tile.tileId),
                fillContainer: true,
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
    required Set<String> watchedTileIds,
    required bool compact,
    required bool expandMiniGrid,
    required bool isFilmstripCollapsed,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final bool landscape = maxWidth > maxHeight;
    final bool hasSecondary = secondary.isNotEmpty && !isFilmstripCollapsed;
    final double filmstripCrossAxis = voiceFocusFilmstripCrossAxis(
      compact: compact,
      landscape: landscape,
    );
    final bool isScreenShareMain =
        mainTile.source == VoiceParticipantTileSource.screenShare;
    final EdgeInsets mainPadding = isScreenShareMain
        ? EdgeInsets.zero
        : EdgeInsets.fromLTRB(
            voiceGridEdgePaddingPx,
            voiceGridEdgePaddingPx,
            landscape && hasSecondary ? 0 : voiceGridEdgePaddingPx,
            !landscape && hasSecondary ? 0 : voiceGridEdgePaddingPx,
          );
    final Widget mainStage = RepaintBoundary(
      child: _buildCard(
        context: context,
        tile: mainTile,
        room: room,
        me: me,
        localConnectionId: localConnectionId,
        baseUrl: baseUrl,
        l10n: l10n,
        isFocusMain: true,
        isActiveScreenShare: watchedTileIds.contains(mainTile.tileId),
        fillContainer: true,
        edgeToEdge: isScreenShareMain,
      ),
    );
    final Widget mainExpanded = isScreenShareMain
        ? mainStage
        : Align(
            child: AspectRatio(
              aspectRatio: voiceGridTileAspectRatio,
              child: mainStage,
            ),
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
            baseUrl: baseUrl,
            l10n: l10n,
            isFocusMain: false,
            isActiveScreenShare: watchedTileIds.contains(tile.tileId),
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
            child: Padding(padding: mainPadding, child: mainExpanded),
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
          child: Padding(padding: mainPadding, child: mainExpanded),
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
    required String? baseUrl,
    required FluxerLocalizations l10n,
    required bool isFocusMain,
    required bool isActiveScreenShare,
    bool isFilmstrip = false,
    bool fillContainer = false,
    bool omitVideoTrack = false,
    bool edgeToEdge = false,
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
      streamPreviewUrl: buildViewerStreamPreviewUrl(
        baseUrl: baseUrl,
        voice: tile.data.voice,
        isScreenShareTile:
            tile.source == VoiceParticipantTileSource.screenShare,
      ),
      onTap: () => _onTileTap(tile, isFocusMain),
      onWatch: () => _watchStream(tile),
      onStopWatching: () => _stopWatching(tile.tileId),
      onContextMenu: (Offset position) =>
          _showParticipantMenu(context, ref, tile, position: position),
      l10n: l10n,
      omitVideoTrack: omitVideoTrack || hostFeatured || !_isConnected,
      edgeToEdge: edgeToEdge,
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
    required this.onTap,
    required this.onWatch,
    required this.onStopWatching,
    required this.onContextMenu,
    required this.l10n,
    this.omitVideoTrack = false,
    this.extraDeviceCount = 0,
    this.edgeToEdge = false,
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
  final bool edgeToEdge;
  final int extraDeviceCount;
  final String? streamPreviewUrl;
  final VoidCallback onTap;
  final VoidCallback onWatch;
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
    final BorderRadius radius = BorderRadius.circular(edgeToEdge ? 0 : 12);
    final Color streamSurface = context.colors.backgroundPrimary;
    final Color cardColor = tileSource == VoiceParticipantTileSource.screenShare
        ? streamSurface
        : (avatarArgb == null
              ? context.colors.brandPrimary
              : Color(0xFF000000 | avatarArgb));
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
      fillContainer: fillContainer,
      videoCornerRadius: edgeToEdge ? 0 : 12,
      streamPreviewUrl: streamPreviewUrl,
      isTileFocused: isFocusMain,
      pauseOwnScreenSharePreviewOnUnfocus: pauseOwnPreview,
      mirrorCamera: mirrorCamera,
      omitVideoTrack: omitVideoTrack,
      subscribeQuality: voiceCameraSubscribeQuality(
        isFilmstrip: isFilmstrip,
        isFocusMain: isFocusMain || (isActiveScreenShare && !isFilmstrip),
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
                  Positioned.fill(child: _WatchStreamOverlay(onWatch: onWatch)),
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
                              participant: participant,
                              collectQuality: isActiveScreenShare,
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

class _StreamStatusBadge extends StatefulWidget {
  const _StreamStatusBadge({
    required this.participant,
    required this.collectQuality,
  });

  final Participant? participant;
  final bool collectQuality;

  @override
  State<_StreamStatusBadge> createState() => _StreamStatusBadgeState();
}

class _StreamStatusBadgeState extends State<_StreamStatusBadge> {
  static const Duration _kPollInterval = Duration(seconds: 1);

  Timer? _poll;
  int _height = 0;
  int _fps = 0;
  bool _refreshing = false;

  @override
  void initState() {
    super.initState();
    widget.participant?.addListener(_onParticipantChanged);
    _syncPolling();
    unawaited(_refresh());
  }

  @override
  void didUpdateWidget(covariant _StreamStatusBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.participant != widget.participant) {
      oldWidget.participant?.removeListener(_onParticipantChanged);
      widget.participant?.addListener(_onParticipantChanged);
    }
    if (oldWidget.collectQuality != widget.collectQuality) {
      if (!widget.collectQuality) {
        _apply(height: 0, fps: 0);
      }
      _syncPolling();
    }
    unawaited(_refresh());
  }

  @override
  void dispose() {
    _poll?.cancel();
    widget.participant?.removeListener(_onParticipantChanged);
    super.dispose();
  }

  void _syncPolling() {
    _poll?.cancel();
    _poll = null;
    if (!widget.collectQuality) {
      return;
    }
    _poll = Timer.periodic(_kPollInterval, (_) {
      unawaited(_refresh());
    });
  }

  void _onParticipantChanged() {
    unawaited(_refresh());
  }

  Future<void> _refresh() async {
    if (_refreshing) {
      return;
    }
    if (!widget.collectQuality) {
      _apply(height: 0, fps: 0);
      return;
    }
    final Participant? participant = widget.participant;
    if (participant == null) {
      _apply(height: 0, fps: 0);
      return;
    }
    _refreshing = true;
    try {
      final TrackPublication? publication = resolveScreenShareVideoPublication(
        participant: participant,
        requireTrack: false,
      );
      if (publication == null) {
        _apply(height: 0, fps: 0);
        return;
      }
      final VideoDimensions? dimensions = publication.dimensions;
      final Track? track = publication.track;
      var settingsWidth = 0;
      var settingsHeight = 0;
      var settingsFps = 0;
      if (track is VideoTrack) {
        try {
          final Map<String, dynamic> settings = track.mediaStreamTrack
              .getSettings();
          settingsFps = voiceStreamFpsFromSettings(settings);
          settingsWidth = voiceStreamDimensionFromSettings(settings, 'width');
          settingsHeight = voiceStreamDimensionFromSettings(settings, 'height');
        } on Object {
          settingsFps = 0;
        }
      }
      var statsFps = 0;
      var statsHeight = 0;
      if (track is RemoteVideoTrack) {
        try {
          final stats = await track.getReceiverStats();
          statsFps = parsePositiveFrameRate(stats?.framesPerSecond);
          statsHeight = parsePositiveInt(stats?.frameHeight);
        } on Object {
          statsFps = 0;
        }
      } else if (track is LocalVideoTrack) {
        try {
          final stats = await track.getSenderStats();
          statsFps = maxPositiveFrameRate(
            stats.map((item) => item.framesPerSecond),
          );
          statsHeight = voiceStreamHeightFromLargestFrame(
            widths: stats.map((item) => item.frameWidth),
            heights: stats.map((item) => item.frameHeight),
          );
        } on Object {
          statsFps = 0;
        }
      }
      var captureFps = 0;
      if (track is LocalVideoTrack) {
        final VideoCaptureOptions options = track.currentOptions;
        captureFps = firstPositiveFrameRate(<int>[
          parsePositiveFrameRate(options.maxFrameRate),
          parsePositiveFrameRate(options.params.encoding?.maxFramerate),
        ]);
      }
      _apply(
        height: resolveVoiceStreamLabelHeight(
          statsHeight: statsHeight,
          settingsWidth: settingsWidth,
          settingsHeight: settingsHeight,
          publicationWidth: dimensions?.width ?? 0,
          publicationHeight: dimensions?.height ?? 0,
        ),
        fps: firstPositiveFrameRate(<int>[settingsFps, statsFps, captureFps]),
      );
    } finally {
      _refreshing = false;
    }
  }

  void _apply({required int height, required int fps}) {
    if (!mounted) {
      return;
    }
    if (height == _height && fps == _fps) {
      return;
    }
    setState(() {
      _height = height;
      _fps = fps;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_height <= 0) {
      return const FluxerLiveBadge(tone: FluxerLiveBadgeTone.voiceTile);
    }
    final String label = voiceStreamQualityLabel(height: _height, fps: _fps);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        DecoratedBox(
          decoration: voiceTileHudChipDecoration(
            color: const Color(0xFF000000),
          ),
          child: SizedBox(
            height: kVoiceTileHudChipHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        const FluxerLiveBadge(tone: FluxerLiveBadgeTone.voiceTile),
      ],
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
            child: InkWell(
              onTap: onWatch,
              borderRadius: BorderRadius.circular(6),
              child: DecoratedBox(
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

class _VoiceCallViewModeToggle extends ConsumerWidget {
  const _VoiceCallViewModeToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceCallLayoutMode mode = ref.watch(
      voiceCallLayoutProvider.select(
        (VoiceCallLayoutState state) => state.mode,
      ),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isFocus = mode == VoiceCallLayoutMode.focus;
    final String label = isFocus
        ? l10n.voiceCallViewModeGrid
        : l10n.voiceCallViewModeFocus;
    return _TileHudVisibility(
      child: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Semantics(
              button: true,
              label: label,
              child: Tooltip(
                message: label,
                child: Material(
                  color: context.colors.backgroundFloating.withValues(
                    alpha: 0.85,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    key: kVoiceCallViewModeToggleKey,
                    onTap: () {
                      ref
                          .read(voiceCallLayoutProvider.notifier)
                          .setMode(
                            isFocus
                                ? VoiceCallLayoutMode.grid
                                : VoiceCallLayoutMode.focus,
                          );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: PhosphorIcon(
                          isFocus
                              ? PhosphorIconsFill.squaresFour
                              : PhosphorIconsFill.userFocus,
                          size: 20,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
