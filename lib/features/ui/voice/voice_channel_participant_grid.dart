import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
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

class VoiceChannelParticipantGrid extends ConsumerWidget {
  const VoiceChannelParticipantGrid({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String key = voiceChannelParticipantsFamilyKey(guildId, channelId);
    final Room? liveKit = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.liveKitRoom),
    );
    final String? me = ref.watch(currentUserIdProvider);
    final String? localConnectionId = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.activeConnectionId),
    );
    final AsyncValue<List<VoiceChannelParticipantData>> async = ref.watch(
      voiceChannelParticipantsProvider(key),
    );
    return async.when(
      data: (List<VoiceChannelParticipantData> list) {
        if (list.isEmpty) {
          return const Center(
            child: FluxerLoadingSpinner(),
          );
        }
        return LayoutBuilder(
          builder: (BuildContext c, BoxConstraints cons) {
            final EdgeInsets gridPad = _voiceGridPadding(
              maxWidth: cons.maxWidth,
              maxHeight: cons.maxHeight,
            );
            final int n = list.length;
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
            final double cellW = n == 1
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
                          children: list
                              .map(
                                (VoiceChannelParticipantData e) => SizedBox(
                                  key: ValueKey<String>(
                                    '${e.userId}|${e.voice.sessionId ?? ''}|'
                                    '${e.voice.connectionId ?? ''}',
                                  ),
                                  width: cellW,
                                  child: _VoiceParticipantCard(
                                    data: e,
                                    room: liveKit,
                                    currentUserId: me,
                                    localConnectionId: localConnectionId,
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
}

class _VoiceParticipantCard extends StatelessWidget {
  const _VoiceParticipantCard({
    required this.data,
    required this.room,
    required this.currentUserId,
    required this.localConnectionId,
  });

  final VoiceChannelParticipantData data;
  final Room? room;
  final String? currentUserId;
  final String? localConnectionId;

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
    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
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
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _VoiceParticipantNameplate(
                l10n: l10n,
                voice: v,
                display: display,
              ),
            ),
          ],
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
