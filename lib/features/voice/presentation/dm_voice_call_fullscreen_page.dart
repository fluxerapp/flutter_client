import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/chat_route_sync_guard.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/voice/flip_camera_button.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_join_button.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(
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
          ? _LocalCameraOrientationSync(
              child: isMobileLayout(context)
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
          : _DmVoiceEmptyPane(
              channelId: widget.channelId,
              participantPreviewCount: ref.watch(
                privateChannelVoiceParticipantCountProvider(widget.channelId),
              ),
            ),
    );
  }
}

class _DmVoiceEmptyPane extends ConsumerWidget {
  const _DmVoiceEmptyPane({
    required this.channelId,
    required this.participantPreviewCount,
  });

  final String channelId;
  final int participantPreviewCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final conversations = ref.watch(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final dm = findDmById(conversations, channelId);
    final String headline = dm?.displayName ?? l10n.dmVoiceFullscreenTitle;
    return ColoredBox(
      color: context.colors.backgroundSecondaryLighter,
      child: SafeArea(
        top: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: context.textStyles.channelName.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: context.colors.textPrimary,
                  ),
                ),
                if (participantPreviewCount > 0) ...<Widget>[
                  const SizedBox(height: 12),
                  Text(
                    l10n.voiceChannelParticipantCount(participantPreviewCount),
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  l10n.voiceChannelEmptyDescription,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textTertiary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                VoiceChannelJoinButton(
                  onPressed: () {
                    unawaited(
                      joinVoiceChannelWithConfirmation(
                        ref: ref,
                        context: context,
                        guildId: null,
                        channelId: channelId,
                      ),
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

class _LocalCameraOrientationSync extends ConsumerStatefulWidget {
  const _LocalCameraOrientationSync({required this.child});

  final Widget child;

  @override
  ConsumerState<_LocalCameraOrientationSync> createState() =>
      _LocalCameraOrientationSyncState();
}

class _LocalCameraOrientationSyncState
    extends ConsumerState<_LocalCameraOrientationSync> {
  Orientation? _lastOrientation;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.orientationOf(context);
    if (_lastOrientation != null && _lastOrientation != orientation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(
            ref
                .read(voiceSessionProvider.notifier)
                .refreshLocalCameraAfterOrientationChange(),
          );
        }
      });
    }
    _lastOrientation = orientation;
    return widget.child;
  }
}
