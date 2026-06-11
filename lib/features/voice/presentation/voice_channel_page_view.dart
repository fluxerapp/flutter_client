import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_join_button.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_e2ee_indicator.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';

int _countUniqueParticipantsInGuildChannel(
  Map<String, VoiceState> map,
  String guildId,
  String channelId,
) {
  final Set<String> userIds = <String>{};
  for (final VoiceState vs in map.values) {
    if (vs.channelId == channelId && vs.guildId == guildId) {
      userIds.add(vs.userId);
    }
  }
  return userIds.length;
}

bool _isVoiceSessionOnThisChannel(
  VoiceSessionState s,
  String guildId,
  String channelId,
) {
  if (!s.isInVoice) {
    return false;
  }
  if (s.channelId != channelId) {
    return false;
  }
  return s.guildId == guildId;
}

class VoiceChannelPageView extends ConsumerStatefulWidget {
  const VoiceChannelPageView({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  ConsumerState<VoiceChannelPageView> createState() =>
      _VoiceChannelPageViewState();
}

class _VoiceChannelPageViewState extends ConsumerState<VoiceChannelPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
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
  void didUpdateWidget(covariant VoiceChannelPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
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

  @override
  Widget build(BuildContext context) {
    final ChannelListState listState = ref.watch(channelListViewModelProvider);
    final Channel? channel =
        findChannelById(listState, widget.channelId) ??
        ref.watch(channelByIdProvider(widget.channelId)).value;
    final String name = channel?.name ?? '';
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final bool inThisChannel = _isVoiceSessionOnThisChannel(
      voice,
      widget.guildId,
      widget.channelId,
    );
    if (inThisChannel) {
      return _buildConnected(
        context,
        channelName: name,
        voice: voice,
        participantCount: _countUniqueParticipantsInGuildChannel(
          ref.watch(voiceStatesMapProvider),
          widget.guildId,
          widget.channelId,
        ),
      );
    }
    return _buildEmpty(context, channelName: name);
  }

  Widget _buildEmpty(BuildContext context, {required String channelName}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showChatButton =
        ref
            .watch(voiceChannelTextChatSupportedProvider(widget.channelId))
            .value ??
        false;
    final AsyncValue<VoiceJoinEligibility> joinEligibilityAsync = ref.watch(
      voiceJoinEligibilityProvider(widget.channelId),
    );
    final bool canJoinVoice = joinEligibilityAsync.value?.canJoin ?? true;
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
                if (channelName.isNotEmpty) ...<Widget>[
                  Text(
                    channelName,
                    textAlign: TextAlign.center,
                    style: context.textStyles.channelName.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
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
                  disabledTooltip: canJoinVoice
                      ? null
                      : l10n.voiceChannelNoConnectPermission,
                  onPressed: canJoinVoice
                      ? () {
                          unawaited(
                            joinVoiceChannelWithConfirmation(
                              ref: ref,
                              context: context,
                              guildId: widget.guildId,
                              channelId: widget.channelId,
                            ),
                          );
                        }
                      : null,
                ),
                if (showChatButton) ...<Widget>[
                  const SizedBox(height: 8),
                  FluxerButton.secondary(
                    label: l10n.voiceControlChat,
                    onPressed: () {
                      unawaited(
                        showVoiceChannelChatSheet(
                          context,
                          channelId: widget.channelId,
                          channelName: channelName.isNotEmpty
                              ? channelName
                              : null,
                        ),
                      );
                    },
                  ),
                ],
                VoiceE2eeIndicator(
                  guildId: widget.guildId,
                  channelId: widget.channelId,
                  variant: VoiceE2eeIndicatorVariant.voiceChannel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConnected(
    BuildContext context, {
    required String channelName,
    required VoiceSessionState voice,
    required int participantCount,
  }) {
    return _LocalCameraOrientationSync(
      child: ColoredBox(
        color: context.colors.chatBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: VoiceChannelParticipantGrid(
                guildId: widget.guildId,
                channelId: widget.channelId,
              ),
            ),
            VoiceChannelControlBar(channelId: widget.channelId),
          ],
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
