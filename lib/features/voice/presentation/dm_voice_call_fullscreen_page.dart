import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_route_sync_guard.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/voice/flip_camera_button.dart';
import 'package:fluxer_app/features/ui/voice/local_camera_orientation_sync.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class DmVoiceCallFullscreenPage extends ConsumerStatefulWidget {
  const DmVoiceCallFullscreenPage({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<DmVoiceCallFullscreenPage> createState() =>
      _DmVoiceCallFullscreenPageState();
}

class _DmVoiceCallFullscreenPageState
    extends ConsumerState<DmVoiceCallFullscreenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !chatRouteShouldSync(context)) {
        return;
      }
      unawaited(
        ref
            .read(chatViewModelProvider.notifier)
            .switchChannel(widget.channelId, loadMessages: false),
      );
    });
  }

  @override
  void didUpdateWidget(covariant DmVoiceCallFullscreenPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !chatRouteShouldSync(context)) {
          return;
        }
        unawaited(
          ref
              .read(chatViewModelProvider.notifier)
              .switchChannel(widget.channelId, loadMessages: false),
        );
      });
    }
  }

  String _resolveAppBarTitle(FluxerLocalizations l10n) {
    final conversations = ref.read(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final dm = findDmById(conversations, widget.channelId);
    final String resolved = dm?.displayName ?? '';
    return resolved.isNotEmpty ? resolved : l10n.dmVoiceFullscreenTitle;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool usePhoneVoiceOverlay = isPhoneVoiceOverlay(context);
    final bool showsOverlay =
        !usePhoneVoiceOverlay ||
        ref.watch(
          voiceCallOverlayProvider.select(
            (VoiceCallOverlayState state) => state.showsOverlay,
          ),
        );
    final bool inThisChannel = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) =>
            s.isInVoice &&
            s.channelId == widget.channelId &&
            (s.guildId == null || s.guildId!.isEmpty),
      ),
    );
    return Scaffold(
      backgroundColor: context.colors.chatBackground,
      appBar: usePhoneVoiceOverlay && !showsOverlay
          ? null
          : AppBar(
              backgroundColor: context.colors.chatInputBackground,
              foregroundColor: context.colors.textPrimary,
              leading: BackButton(onPressed: () => context.pop()),
              title: Text(
                _resolveAppBarTitle(l10n),
                style: context.textStyles.channelName,
                overflow: TextOverflow.ellipsis,
              ),
              actions: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: FlipCameraButton(),
                ),
              ],
            ),
      body: inThisChannel
          ? LocalCameraOrientationSync(
              child: usePhoneVoiceOverlay
                  ? VoiceCallMobilePageLayout(
                      channelId: widget.channelId,
                      child: VoiceChannelParticipantGrid(
                        channelId: widget.channelId,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: VoiceChannelParticipantGrid(
                            channelId: widget.channelId,
                          ),
                        ),
                        VoiceChannelControlBar(channelId: widget.channelId),
                      ],
                    ),
            )
          : VoiceCallJoinEmptyState(
              channelId: widget.channelId,
              participantPreviewCount: ref.watch(
                privateChannelVoiceParticipantCountProvider(widget.channelId),
              ),
            ),
    );
  }
}
