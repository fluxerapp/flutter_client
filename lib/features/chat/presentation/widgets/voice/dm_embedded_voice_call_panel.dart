import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/local_camera_orientation_sync.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kDmEmbeddedVoiceMinHeight = 160;
const double _kDmEmbeddedVoiceMaxHeight = 520;
const double _kDmEmbeddedVoiceDefaultHeight = 280;

bool _showsEmbeddedDmVoice(String channelId, VoiceSessionState voice) {
  final bool isPrivate = voice.guildId == null || voice.guildId!.isEmpty;
  return isPrivate &&
      voice.channelId == channelId &&
      voice.isConnected &&
      voice.errorMessage == null;
}

class DmEmbeddedVoiceCallPanel extends ConsumerStatefulWidget {
  const DmEmbeddedVoiceCallPanel({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<DmEmbeddedVoiceCallPanel> createState() =>
      _DmEmbeddedVoiceCallPanelState();
}

class _DmEmbeddedVoiceCallPanelState
    extends ConsumerState<DmEmbeddedVoiceCallPanel> {
  late double _height = _kDmEmbeddedVoiceDefaultHeight;

  @override
  Widget build(BuildContext context) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!_showsEmbeddedDmVoice(widget.channelId, voice)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final conversations = ref.watch(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final dm = findDmById(conversations, widget.channelId);
    final String title =
        dm?.displayName ??
        dm?.recipientName ??
        l10n.dmVoiceEmbeddedFallbackTitle;
    return Material(
      color: context.colors.chatBackground,
      child: SizedBox(
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (DragUpdateDetails d) {
                setState(() {
                  _height = (_height - d.delta.dy).clamp(
                    _kDmEmbeddedVoiceMinHeight,
                    _kDmEmbeddedVoiceMaxHeight,
                  );
                });
              },
              child: Material(
                color: context.colors.backgroundSecondary,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(
                          PhosphorIconsBold.dotsNine,
                          size: 20,
                          color: context.colors.textSecondary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: context.textStyles.channelName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.dmVoiceCallFullScreenTooltip,
                        onPressed: () {
                          unawaited(
                            context.push(
                              RoutePaths.dmChannelCall(widget.channelId),
                            ),
                          );
                        },
                        icon: PhosphorIcon(
                          PhosphorIconsBold.arrowsOut,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 1, color: context.colors.borderColor),
            Expanded(
              child: LocalCameraOrientationSync(
                child: VoiceChannelParticipantGrid(channelId: widget.channelId),
              ),
            ),
            const VoiceChannelControlBar(),
          ],
        ),
      ),
    );
  }
}
