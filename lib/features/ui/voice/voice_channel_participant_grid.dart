import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_context_menu.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_grid_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kTileMoveDuration = Duration(milliseconds: 260);
const Curve _kTileMoveCurve = Curves.easeOutCubic;

class _VoiceGridTileItem {
  const _VoiceGridTileItem({required this.data, required this.source});
  final VoiceChannelParticipantData data;
  final VoiceParticipantTileSource source;
  String get tileId {
    final VoiceState voice = data.voice;
    final String identity =
        voice.connectionId ?? voice.sessionId ?? data.userId;
    final String sourceValue = source == VoiceParticipantTileSource.camera
        ? 'camera'
        : 'screen';
    return '$identity|$sourceValue';
  }
}

List<_VoiceGridTileItem> _buildTileItems({
  required List<VoiceChannelParticipantData> participants,
  required Room? room,
  required String? currentUserId,
  required String? localConnectionId,
  required bool onlyShowVideos,
  required bool showOwnCamera,
}) {
  final List<_VoiceGridTileItem> tileItems = <_VoiceGridTileItem>[];
  for (final VoiceChannelParticipantData participant in participants) {
    final bool isOwnParticipant =
        currentUserId != null && participant.userId == currentUserId;
    final bool includeCameraTile = showOwnCamera || !isOwnParticipant;
    final bool includeVideoParticipant =
        !onlyShowVideos || participant.voice.selfVideo;
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
  static const Duration _kOverlayHideDelay = Duration(seconds: 3);

  String? lastViewerStreamKey;
  bool isOverlayVisible = true;
  Timer? _overlayHideTimer;

  // Layout metrics cache to avoid expensive recalculation on every frame
  VoiceGridPackedLayoutMetrics? _cachedLayoutMetrics;
  int? _cachedLayoutKey;

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

  void _cancelOverlayHideTimer() {
    _overlayHideTimer?.cancel();
    _overlayHideTimer = null;
  }

  void _scheduleOverlayHide() {
    _cancelOverlayHideTimer();
    _overlayHideTimer = Timer(_kOverlayHideDelay, () {
      if (!mounted) {
        return;
      }
      setState(() => isOverlayVisible = false);
    });
  }

  void _revealOverlay() {
    setState(() => isOverlayVisible = true);
    _scheduleOverlayHide();
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

  void _onTileTap(_VoiceGridTileItem item, bool isFocusMain) {
    if (isFocusMain) {
      if (!isOverlayVisible) {
        _revealOverlay();
        return;
      }
      ref.read(voiceCallLayoutProvider.notifier).unpin();
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
    final VoiceActiveSpeakersState speakers = ref.watch(
      voiceActiveSpeakersProvider,
    );
    final VoiceCallLayoutState layout = ref.watch(voiceCallLayoutProvider);
    final VoiceCallDisplayPreferencesState displayPreferences = ref.watch(
      voiceCallDisplayPreferencesProvider,
    );
    ref.watch(voiceChannelGridStructureProvider(participantKey));
    final List<VoiceChannelParticipantData> list = ref.read(
      voiceChannelParticipantsProvider(participantKey),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (list.isEmpty) {
      final bool isConnecting = ref.read(
        voiceSessionProvider.select((VoiceSessionState s) => s.isConnecting),
      );
      if (onThisChannel && isConnecting) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const FluxerLoadingSpinner(),
              const SizedBox(height: 12),
              Text(
                l10n.voiceChannelStatusConnecting,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        );
      }
      return const Center(child: FluxerLoadingSpinner());
    }
    final List<_VoiceGridTileItem> tileItems = _orderTiles(
      _buildTileItems(
        participants: list,
        room: liveKit,
        currentUserId: me,
        localConnectionId: localConnectionId,
        onlyShowVideos: displayPreferences.onlyShowVideos,
        showOwnCamera: displayPreferences.showOwnCamera,
      ),
      liveKit,
      me,
      localConnectionId,
      speakers,
    );
    final String? authToken = ref.watch(fluxerAuthTokenProvider);
    final String? baseUrl = ref.watch(fluxerBaseUrlProvider);
    return LayoutBuilder(
      builder: (BuildContext c, BoxConstraints cons) {
        return _buildLayout(
          context: context,
          constraints: cons,
          tiles: tileItems,
          layout: layout,
          speakers: speakers,
          room: liveKit,
          me: me,
          localConnectionId: localConnectionId,
          authToken: authToken,
          baseUrl: baseUrl,
          l10n: l10n,
        );
      },
    );
  }

  Widget _buildLayout({
    required BuildContext context,
    required BoxConstraints constraints,
    required List<_VoiceGridTileItem> tiles,
    required VoiceCallLayoutState layout,
    required VoiceActiveSpeakersState speakers,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final double maxWidth = constraints.maxWidth;
    final double maxHeight = constraints.maxHeight;
    final bool isMobile = isMobileLayout(context);
    final bool compact = maxWidth < 520 || maxHeight < 360;
    final int count = tiles.length;

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

    final bool useFocus =
        layout.mode == VoiceCallLayoutMode.focus ||
        isMobile ||
        gridOverflow ||
        count == 1;

    if (!useFocus) {
      _syncWatch(null, tiles);
      return _buildGrid(
        context: context,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        metrics: packed.metrics,
        tiles: tiles,
        speakers: speakers,
        room: room,
        me: me,
        localConnectionId: localConnectionId,
        authToken: authToken,
        baseUrl: baseUrl,
        l10n: l10n,
      );
    }

    final _VoiceGridTileItem mainTile = pinned ?? _autoMainTile(tiles);
    final List<_VoiceGridTileItem> secondary = tiles
        .where((_VoiceGridTileItem t) => t.tileId != mainTile.tileId)
        .toList();
    final String? activeScreenShareTileId =
        mainTile.source == VoiceParticipantTileSource.screenShare
        ? mainTile.tileId
        : null;
    _syncWatch(activeScreenShareTileId, tiles);

    return _buildFocus(
      context: context,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      mainTile: mainTile,
      secondary: secondary,
      compact: compact,
      speakers: speakers,
      room: room,
      me: me,
      localConnectionId: localConnectionId,
      authToken: authToken,
      baseUrl: baseUrl,
      l10n: l10n,
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

  Widget _buildGrid({
    required BuildContext context,
    required double maxWidth,
    required double maxHeight,
    required VoiceGridLayoutMetrics metrics,
    required List<_VoiceGridTileItem> tiles,
    required VoiceActiveSpeakersState speakers,
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
          duration: _kTileMoveDuration,
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
                speakers: speakers,
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
    required VoiceActiveSpeakersState speakers,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
  }) {
    final bool hasSecondary = secondary.isNotEmpty;
    final double filmstripHeight = compact ? 76 : 104;
    final bool isActiveScreenShareMain =
        mainTile.source == VoiceParticipantTileSource.screenShare;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 8 : 12,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: voiceGridTileAspectRatio,
                child: RepaintBoundary(
                  child: _buildCard(
                    context: context,
                    tile: mainTile,
                    speakers: speakers,
                    room: room,
                    me: me,
                    localConnectionId: localConnectionId,
                    authToken: authToken,
                    baseUrl: baseUrl,
                    l10n: l10n,
                    isFocusMain: true,
                    isActiveScreenShare: isActiveScreenShareMain,
                  ),
                ),
              ),
            ),
          ),
          if (hasSecondary) ...<Widget>[
            const SizedBox(height: 10),
            SizedBox(
              height: filmstripHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                itemCount: secondary.length,
                separatorBuilder: (BuildContext _, int _) =>
                    const SizedBox(width: 8),
                itemBuilder: (BuildContext _, int index) {
                  final _VoiceGridTileItem tile = secondary[index];
                  return AspectRatio(
                    aspectRatio: voiceGridTileAspectRatio,
                    child: RepaintBoundary(
                      child: _buildCard(
                        context: context,
                        tile: tile,
                        speakers: speakers,
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
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showParticipantMenu(
    BuildContext context,
    WidgetRef ref,
    _VoiceGridTileItem tile, {
    required Offset position,
  }) {
    unawaited(
      VoiceParticipantContextMenu.show(
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
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required _VoiceGridTileItem tile,
    required VoiceActiveSpeakersState speakers,
    required Room? room,
    required String? me,
    required String? localConnectionId,
    required String? authToken,
    required String? baseUrl,
    required FluxerLocalizations l10n,
    required bool isFocusMain,
    required bool isActiveScreenShare,
    bool isFilmstrip = false,
  }) {
    return _VoiceParticipantCard(
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
      streamPreviewUrl: buildViewerStreamPreviewUrl(
        baseUrl: baseUrl,
        voice: tile.data.voice,
        isScreenShareTile:
            tile.source == VoiceParticipantTileSource.screenShare,
      ),
      authToken: authToken,
      onTap: () => _onTileTap(tile, isFocusMain),
      onContextMenu: (Offset position) =>
          _showParticipantMenu(context, ref, tile, position: position),
      showOverlay: !isFocusMain || isOverlayVisible,
      l10n: l10n,
    );
  }

  @override
  void dispose() {
    _cancelOverlayHideTimer();
    super.dispose();
  }
}

/// Scales and fades a tile in on first appearance, then stays put while
/// [AnimatedPositioned] handles subsequent movement.
class _TileEnterAnimation extends StatelessWidget {
  const _TileEnterAnimation({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, double value, Widget? animatedChild) {
        return Opacity(
          opacity: value.clamp(0, 1),
          child: Transform.scale(
            scale: 0.94 + 0.06 * value,
            child: animatedChild,
          ),
        );
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
    required this.streamPreviewUrl,
    required this.authToken,
    required this.onTap,
    required this.onContextMenu,
    required this.showOverlay,
    required this.l10n,
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
  final String? streamPreviewUrl;
  final String? authToken;
  final VoidCallback onTap;
  final void Function(Offset position) onContextMenu;
  final bool showOverlay;
  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database.User? user = data.user;
    final GuildUserDisplay? resolvedDisplay = ref
        .watch(guildUserDisplayFromDbProvider((data.userId, guildId)))
        .value;
    final String display =
        resolvedDisplay?.displayName ??
        (user != null ? (user.globalName ?? user.username) : data.userId);
    final String? connectionId = data.voice.connectionId;
    final VoiceState voice = connectionId == null
        ? data.voice
        : ref.watch(voiceStateForConnectionProvider(connectionId)) ??
              data.voice;
    final VoiceActiveSpeakersState speakers = ref.watch(
      voiceActiveSpeakersProvider,
    );
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
    final bool isSpeaking =
        tileSource == VoiceParticipantTileSource.camera &&
        !_isVoiceMuted(voice) &&
        speakers.isParticipantSpeaking(participant);
    final bool isOwnScreenShareTile =
        tileSource == VoiceParticipantTileSource.screenShare &&
        localConnectionId != null &&
        voice.connectionId == localConnectionId;
    final Color ringColor = context.colors.statusOnline;
    final Widget card = Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        onSecondaryTapUp: (TapUpDetails details) =>
            onContextMenu(details.globalPosition),
        onLongPress: isTouchPrimaryInput(ref)
            ? () => onContextMenu(Offset.zero)
            : null,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              VoiceParticipantMediaTile(
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
                streamPreviewUrl: streamPreviewUrl,
                authToken: authToken,
                mirrorCamera: ref
                    .watch(voiceSettingsProvider)
                    .shouldMirrorOwnCamera,
              ),
              if (tileSource == VoiceParticipantTileSource.screenShare &&
                  !isOwnScreenShareTile &&
                  !isActiveScreenShare &&
                  !isFilmstrip)
                Positioned.fill(child: _WatchStreamOverlay(onWatch: onTap)),
              if (tileSource == VoiceParticipantTileSource.screenShare &&
                  !isOwnScreenShareTile &&
                  isActiveScreenShare &&
                  showOverlay)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _StopWatchingButton(onStopWatching: onTap),
                ),
              if (tileSource == VoiceParticipantTileSource.screenShare)
                Positioned(
                  top: 8,
                  right: 8,
                  child: _StreamStatusBadge(
                    l10n: l10n,
                    participant: participant,
                  ),
                ),
              if (showOverlay)
                Positioned(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  child: _VoiceParticipantNameplate(
                    l10n: l10n,
                    voice: voice,
                    display: display,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
    return Semantics(
      button: true,
      label: display,
      onTap: onTap,
      child: ExcludeSemantics(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: isSpeaking ? ringColor : Colors.transparent,
              width: isSpeaking ? 2.5 : 0,
            ),
          ),
          child: card,
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
    if (dimensions == null || dimensions.height <= 0) {
      return null;
    }
    return _StreamTrackInfo(
      height: dimensions.height,
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
                  style: TextStyle(
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
                            style: TextStyle(
                              color: context.colors.textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                  style: TextStyle(
                    color: context.colors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
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

class _VoiceParticipantNameplate extends StatefulWidget {
  const _VoiceParticipantNameplate({
    required this.l10n,
    required this.voice,
    required this.display,
  });

  final FluxerLocalizations l10n;
  final VoiceState voice;
  final String display;

  @override
  State<_VoiceParticipantNameplate> createState() =>
      _VoiceParticipantNameplateState();
}

class _VoiceParticipantNameplateState extends State<_VoiceParticipantNameplate>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 1,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool showMute =
        widget.voice.selfMute || widget.voice.mute || widget.voice.suppress;
    final bool showDeaf = widget.voice.selfDeaf || widget.voice.deaf;
    final bool hasCommunityMic = widget.voice.mute || widget.voice.suppress;
    final Color micColor = hasCommunityMic
        ? context.colors.statusDanger
        : const Color(0xFFFFFFFF);
    final Color deafColor = widget.voice.deaf
        ? context.colors.statusDanger
        : const Color(0xFFFFFFFF);
    final String? connectionId = widget.voice.connectionId;
    final StringBuffer semantics = StringBuffer(widget.display);
    if (connectionId != null && connectionId.isNotEmpty) {
      semantics.write(' ${widget.display} $connectionId');
    }
    if (showMute) {
      final String muteSem = hasCommunityMic
          ? widget.l10n.voiceParticipantTooltipCommunityMuted
          : widget.l10n.voiceParticipantTooltipMuted;
      semantics.write(' $muteSem');
    }
    if (showDeaf) {
      final String deafSem = widget.voice.deaf
          ? widget.l10n.voiceParticipantTooltipCommunityDeafened
          : widget.l10n.voiceParticipantTooltipDeafened;
      semantics.write(' $deafSem');
    }
    return Semantics(
      label: semantics.toString(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Align(
            alignment: Alignment.bottomLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth),
              child: FadeTransition(
                opacity: _animation,
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
                                ? widget
                                      .l10n
                                      .voiceParticipantTooltipCommunityMuted
                                : widget.l10n.voiceParticipantTooltipMuted,
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
                            message: widget.voice.deaf
                                ? widget
                                      .l10n
                                      .voiceParticipantTooltipCommunityDeafened
                                : widget.l10n.voiceParticipantTooltipDeafened,
                            child: PhosphorIcon(
                              PhosphorIconsFill.speakerSlash,
                              size: 14,
                              color: deafColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                        Tooltip(
                          message: widget.voice.isMobile
                              ? widget.l10n.voiceParticipantTooltipMobileDevice
                              : widget
                                    .l10n
                                    .voiceParticipantTooltipDesktopDevice,
                          child: PhosphorIcon(
                            widget.voice.isMobile
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
                                ? widget.l10n.voiceParticipantTooltipConnection(
                                    connectionId,
                                  )
                                : widget.display,
                            child: Text.rich(
                              TextSpan(
                                style: context.textStyles.bodySmall.copyWith(
                                  color: context.colors.textPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(text: widget.display),
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
            ),
          );
        },
      ),
    );
  }
}
