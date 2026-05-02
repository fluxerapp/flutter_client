import 'dart:async';
import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kVideoAspectW = 16;
const double _kVideoAspectH = 9;

int _voiceGridColumnCount({
  required double width,
  required double height,
  required int count,
}) {
  if (count < 1) {
    return 1;
  }
  if (width >= 1180 && height >= 460 && count >= 10) {
    return 4;
  }
  if (width >= 860 && height >= 360 && count >= 5) {
    return 3;
  }
  if (width >= 520 && height >= 260 && count >= 2) {
    return 2;
  }
  return 1;
}

double _voiceGridGap(int count) {
  if (count >= 40) {
    return 4;
  }
  if (count >= 24) {
    return 6;
  }
  if (count >= 12) {
    return 8;
  }
  if (count >= 6) {
    return 10;
  }
  return 12;
}

EdgeInsets _voiceGridPadding({
  required double maxWidth,
  required double maxHeight,
}) {
  double horizontal = 12;
  if (maxWidth <= 419) {
    horizontal = 6;
  } else if (maxWidth <= 759) {
    horizontal = 8;
  }
  double vertical = 14;
  if (maxHeight <= 359) {
    vertical = 8;
  } else if (maxHeight <= 519) {
    vertical = 10;
  }
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

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
}) {
  final List<_VoiceGridTileItem> tileItems = <_VoiceGridTileItem>[];
  for (final VoiceChannelParticipantData participant in participants) {
    tileItems.add(
      _VoiceGridTileItem(
        data: participant,
        source: VoiceParticipantTileSource.camera,
      ),
    );
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
  tileItems.sort((_VoiceGridTileItem a, _VoiceGridTileItem b) {
    final int rankA = a.source == VoiceParticipantTileSource.screenShare
        ? 0
        : 1;
    final int rankB = b.source == VoiceParticipantTileSource.screenShare
        ? 0
        : 1;
    return rankA.compareTo(rankB);
  });
  return tileItems;
}

class VoiceChannelParticipantGrid extends ConsumerStatefulWidget {
  const VoiceChannelParticipantGrid({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  ConsumerState<VoiceChannelParticipantGrid> createState() =>
      _VoiceChannelParticipantGridState();
}

class _VoiceChannelParticipantGridState
    extends ConsumerState<VoiceChannelParticipantGrid> {
  static const Duration _kFocusedOverlayHideDelay = Duration(seconds: 3);

  String? focusedTileId;
  String? lastViewerStreamKey;
  bool isFocusedTileOverlayVisible = true;
  Timer? _focusedOverlayHideTimer;

  void _cancelFocusedOverlayHideTimer() {
    _focusedOverlayHideTimer?.cancel();
    _focusedOverlayHideTimer = null;
  }

  void _scheduleFocusedOverlayHide() {
    _cancelFocusedOverlayHideTimer();
    _focusedOverlayHideTimer = Timer(_kFocusedOverlayHideDelay, () {
      if (!mounted || focusedTileId == null) {
        return;
      }
      setState(() {
        isFocusedTileOverlayVisible = false;
      });
    });
  }

  void _syncViewerStreamWatch(
    List<_VoiceGridTileItem> tileItems,
    String? activeTileId,
  ) {
    String? nextViewerStreamKey;
    if (activeTileId != null) {
      for (final _VoiceGridTileItem tileItem in tileItems) {
        if (tileItem.tileId != activeTileId) {
          continue;
        }
        nextViewerStreamKey = buildViewerStreamKey(
          voice: tileItem.data.voice,
          isScreenShareTile:
              tileItem.source == VoiceParticipantTileSource.screenShare,
        );
        break;
      }
    }
    if (nextViewerStreamKey == lastViewerStreamKey) {
      return;
    }
    lastViewerStreamKey = nextViewerStreamKey;
    ref
        .read(voiceSessionProvider.notifier)
        .updateViewerStreamKeys(
          nextViewerStreamKey == null
              ? const <String>[]
              : <String>[nextViewerStreamKey],
        );
  }

  void _syncTileState(List<_VoiceGridTileItem> tileItems) {
    final Set<String> tileIds = tileItems
        .map((_VoiceGridTileItem tile) => tile.tileId)
        .toSet();
    final String? nextFocused =
        focusedTileId != null && tileIds.contains(focusedTileId)
        ? focusedTileId
        : null;
    final String? currentActive = ref.read(voiceScreenShareWatchTileProvider);
    String? nextActiveScreen = currentActive;
    if (nextActiveScreen != null && !tileIds.contains(nextActiveScreen)) {
      nextActiveScreen = null;
    }
    if (nextFocused == focusedTileId && nextActiveScreen == currentActive) {
      _syncViewerStreamWatch(tileItems, nextActiveScreen);
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      if (nextActiveScreen != currentActive) {
        ref
            .read(voiceScreenShareWatchTileProvider.notifier)
            .setActiveTileId(nextActiveScreen);
      }
      setState(() {
        focusedTileId = nextFocused;
      });
      _syncViewerStreamWatch(tileItems, nextActiveScreen);
    });
  }

  void _toggleTile(_VoiceGridTileItem tileItem) {
    final bool isFocusedTile = focusedTileId == tileItem.tileId;
    if (isFocusedTile && !isFocusedTileOverlayVisible) {
      setState(() {
        isFocusedTileOverlayVisible = true;
      });
      _scheduleFocusedOverlayHide();
      return;
    }
    setState(() {
      if (isFocusedTile) {
        focusedTileId = null;
        isFocusedTileOverlayVisible = true;
        _cancelFocusedOverlayHideTimer();
      } else {
        focusedTileId = tileItem.tileId;
        isFocusedTileOverlayVisible = true;
      }
    });
    if (!isFocusedTile) {
      _scheduleFocusedOverlayHide();
    }
  }

  void _startWatchingScreenShare(_VoiceGridTileItem tileItem) {
    if (tileItem.source != VoiceParticipantTileSource.screenShare) {
      return;
    }
    ref
        .read(voiceScreenShareWatchTileProvider.notifier)
        .setActiveTileId(tileItem.tileId);
    setState(() {
      focusedTileId = tileItem.tileId;
      isFocusedTileOverlayVisible = true;
    });
    _scheduleFocusedOverlayHide();
  }

  void _stopWatchingScreenShare(_VoiceGridTileItem tileItem) {
    if (tileItem.source != VoiceParticipantTileSource.screenShare) {
      return;
    }
    final String? currentActive = ref.read(voiceScreenShareWatchTileProvider);
    if (currentActive != tileItem.tileId) {
      return;
    }
    ref.read(voiceScreenShareWatchTileProvider.notifier).setActiveTileId(null);
  }

  @override
  Widget build(BuildContext context) {
    final String key = voiceChannelParticipantsFamilyKey(
      widget.guildId,
      widget.channelId,
    );
    final Room? liveKit = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.liveKitRoom),
    );
    final String? me = ref.watch(currentUserIdProvider);
    final String? localConnectionId = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => s.activeConnectionId,
      ),
    );
    final VoiceSessionState voiceForGrid = ref.watch(voiceSessionProvider);
    final bool onThisChannel = voiceForGrid.isInVoice &&
        voiceForGrid.channelId == widget.channelId &&
        voiceForGrid.guildId == widget.guildId;
    final AsyncValue<List<VoiceChannelParticipantData>> async = ref.watch(
      voiceChannelParticipantsProvider(key),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return async.when(
      data: (List<VoiceChannelParticipantData> list) {
        if (list.isEmpty) {
          if (onThisChannel && voiceForGrid.isConnecting) {
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
        final List<_VoiceGridTileItem> tileItems = _buildTileItems(
          participants: list,
          room: liveKit,
          currentUserId: me,
          localConnectionId: localConnectionId,
        );
        _syncTileState(tileItems);
        final String? activeWatchTileId = ref.watch(
          voiceScreenShareWatchTileProvider,
        );
        final bool hasFocusedTile = focusedTileId != null;
        _VoiceGridTileItem? focusedTile;
        if (hasFocusedTile) {
          for (final _VoiceGridTileItem tileItem in tileItems) {
            if (tileItem.tileId == focusedTileId) {
              focusedTile = tileItem;
              break;
            }
          }
        }
        final List<_VoiceGridTileItem> visibleTiles = focusedTile != null
            ? <_VoiceGridTileItem>[focusedTile]
            : tileItems;
        return LayoutBuilder(
          builder: (BuildContext c, BoxConstraints cons) {
            final EdgeInsets gridPad = _voiceGridPadding(
              maxWidth: cons.maxWidth,
              maxHeight: cons.maxHeight,
            );
            final int n = visibleTiles.length;
            final double innerW = (cons.maxWidth - gridPad.horizontal).clamp(
              0,
              double.infinity,
            );
            final double innerH = (cons.maxHeight - gridPad.vertical).clamp(
              0,
              double.infinity,
            );
            final int cols = _voiceGridColumnCount(
              width: innerW,
              height: innerH,
              count: n,
            );
            final double gap = _voiceGridGap(n);
            final double baseCellW = (innerW - (cols - 1) * gap) / cols;
            final double maxSingleTileW =
                innerH * _kVideoAspectW / _kVideoAspectH;
            final double cellW = focusedTile != null || n == 1
                ? min(innerW, maxSingleTileW)
                : baseCellW;
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: cons.maxHeight),
                child: Padding(
                  padding: gridPad,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: innerW,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: gap,
                          runSpacing: gap,
                          children: visibleTiles
                              .map(
                                (_VoiceGridTileItem tileItem) => SizedBox(
                                  key: ValueKey<String>(tileItem.tileId),
                                  width: cellW,
                                  child: _VoiceParticipantCard(
                                    data: tileItem.data,
                                    room: liveKit,
                                    currentUserId: me,
                                    localConnectionId: localConnectionId,
                                    tileSource: tileItem.source,
                                    isActiveScreenShare:
                                        activeWatchTileId == tileItem.tileId,
                                    streamPreviewUrl:
                                        buildViewerStreamPreviewUrl(
                                          baseUrl: ref.watch(
                                            fluxerBaseUrlProvider,
                                          ),
                                          voice: tileItem.data.voice,
                                          isScreenShareTile:
                                              tileItem.source ==
                                              VoiceParticipantTileSource
                                                  .screenShare,
                                        ),
                                    authToken: ref.watch(
                                      fluxerAuthTokenProvider,
                                    ),
                                    onTap: () => _toggleTile(tileItem),
                                    onStartWatching: () =>
                                        _startWatchingScreenShare(tileItem),
                                    onStopWatching: () =>
                                        _stopWatchingScreenShare(tileItem),
                                    showOverlay:
                                        focusedTileId != tileItem.tileId ||
                                        isFocusedTileOverlayVisible,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (Object err, StackTrace s) {
        return Center(
          child: PhosphorIcon(
            PhosphorIconsFill.prohibit,
            size: 32,
            color: context.colors.textTertiary,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cancelFocusedOverlayHideTimer();
    super.dispose();
  }
}

class _VoiceParticipantCard extends StatelessWidget {
  const _VoiceParticipantCard({
    required this.data,
    required this.room,
    required this.currentUserId,
    required this.localConnectionId,
    required this.tileSource,
    required this.isActiveScreenShare,
    required this.streamPreviewUrl,
    required this.authToken,
    required this.onTap,
    required this.onStartWatching,
    required this.onStopWatching,
    required this.showOverlay,
  });

  final VoiceChannelParticipantData data;
  final Room? room;
  final String? currentUserId;
  final String? localConnectionId;
  final VoiceParticipantTileSource tileSource;
  final bool isActiveScreenShare;
  final String? streamPreviewUrl;
  final String? authToken;
  final VoidCallback onTap;
  final VoidCallback onStartWatching;
  final VoidCallback onStopWatching;
  final bool showOverlay;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final database.User? user = data.user;
    final String display = user != null
        ? (user.globalName ?? user.username)
        : data.userId;
    final VoiceState v = data.voice;
    final int? avatarArgb = user?.avatarColor;
    final Color cardColor = avatarArgb == null
        ? context.colors.brandPrimary
        : Color(0xFF000000 | avatarArgb);
    final Participant? participant = resolveVoiceParticipant(
      room: room,
      voice: v,
      userId: data.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final bool isOwnScreenShareTile =
        tileSource == VoiceParticipantTileSource.screenShare &&
        localConnectionId != null &&
        v.connectionId == localConnectionId;
    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
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
                voice: v,
                display: display,
                backgroundColor: cardColor,
                user: user,
                tileSource: tileSource,
                isActiveScreenShare: isActiveScreenShare,
                streamPreviewUrl: streamPreviewUrl,
                authToken: authToken,
              ),
              if (tileSource == VoiceParticipantTileSource.screenShare &&
                  !isOwnScreenShareTile &&
                  !isActiveScreenShare)
                Positioned.fill(
                  child: _WatchStreamOverlay(onWatch: onStartWatching),
                ),
              if (tileSource == VoiceParticipantTileSource.screenShare &&
                  !isOwnScreenShareTile &&
                  isActiveScreenShare &&
                  showOverlay)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _StopWatchingButton(onStopWatching: onStopWatching),
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
                    voice: v,
                    display: display,
                  ),
                ),
            ],
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
      return _LiveBadge(l10n: l10n);
    }
    return ListenableBuilder(
      listenable: p,
      builder: (BuildContext context, Widget? child) {
        final _StreamTrackInfo? info = _resolveInfo();
        if (info == null) {
          return _LiveBadge(l10n: l10n);
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
            _LiveBadge(l10n: l10n),
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

class _LiveBadge extends StatelessWidget {
  const _LiveBadge({required this.l10n});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFDC2626),
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Text(
          l10n.voiceLiveBadge.toUpperCase(),
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
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
      final String muteSem = hasCommunityMic
          ? l10n.voiceParticipantTooltipCommunityMuted
          : l10n.voiceParticipantTooltipMuted;
      semantics.write(' $muteSem');
    }
    if (showDeaf) {
      final String deafSem = voice.deaf
          ? l10n.voiceParticipantTooltipCommunityDeafened
          : l10n.voiceParticipantTooltipDeafened;
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
