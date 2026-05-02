import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Compact controls when a voice session is active.
///
/// This is just a temporary design for testing, need to work on a final design.
class VoiceCallBar extends ConsumerWidget {
  const VoiceCallBar({super.key});

  String _guildName(List<Guild> guilds, String? guildId) {
    if (guildId == null || guildId.isEmpty) {
      return '';
    }
    final Guild? guild = guilds.where((Guild g) => g.id == guildId).firstOrNull;
    return guild?.name ?? '';
  }

  String _guildChannelSubtitle(ChannelListState state, String? channelId) {
    if (channelId == null || channelId.isEmpty) {
      return '';
    }
    final Channel? channel = findChannelById(state, channelId);
    return channel?.name ?? channelId;
  }

  DmConversation? _dmForVoice(
    List<DmConversation> conversations,
    String? channelId,
  ) {
    if (channelId == null || channelId.isEmpty) {
      return null;
    }
    return findDmById(conversations, channelId);
  }

  String _privateSubtitle(DmConversation? dm, String? channelId) {
    if (dm != null) {
      return dm.displayName;
    }
    return channelId ?? '';
  }

  String _guildPrimaryLine({
    required FluxerLocalizations l10n,
    required VoiceSessionState voice,
    required String guildName,
  }) {
    if (voice.errorMessage != null) {
      return guildName.isEmpty ? l10n.dmVoiceCallBarIssueFallback : guildName;
    }
    if (voice.isConnected) {
      return guildName.isEmpty
          ? l10n.voiceCallBarGuildConnectedFallback
          : guildName;
    }
    return guildName.isEmpty
        ? l10n.dmVoiceCallBarConnecting
        : '$guildName (${l10n.dmVoiceCallBarConnecting})';
  }

  String _privatePrimaryLine({
    required FluxerLocalizations l10n,
    required VoiceSessionState voice,
    required bool isGroup,
  }) {
    if (voice.errorMessage != null) {
      return l10n.dmVoiceCallBarIssueFallback;
    }
    if (!voice.isConnected) {
      return l10n.dmVoiceCallBarConnecting;
    }
    return isGroup
        ? l10n.dmVoiceCallBarGroupPrimary
        : l10n.dmVoiceCallBarDirectPrimary;
  }

  void _onBarNavigate(
    BuildContext context, {
    required VoiceSessionState voice,
    required bool isGuild,
  }) {
    final String? channelId = voice.channelId;
    if (channelId == null || channelId.isEmpty) {
      return;
    }
    if (isGuild) {
      final String? guildId = voice.guildId;
      if (guildId == null || guildId.isEmpty) {
        return;
      }
      navigateToContent(context, RoutePaths.guildChannel(guildId, channelId));
      return;
    }
    unawaited(context.push(RoutePaths.dmChannelCall(channelId)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!voice.isInVoice && voice.errorMessage == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isGuildVoice =
        voice.guildId != null && voice.guildId!.isNotEmpty;
    final List<DmConversation> conversations = ref.watch(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final ChannelListState channelState = ref.watch(
      channelListViewModelProvider,
    );
    final DmConversation? dm =
        isGuildVoice ? null : _dmForVoice(conversations, voice.channelId);
    late final String primaryLine;
    late final String subtitle;
    if (isGuildVoice) {
      primaryLine = _guildPrimaryLine(
        l10n: l10n,
        voice: voice,
        guildName: _guildName(
          ref.watch(guildListViewModelProvider.select((s) => s.guilds)),
          voice.guildId,
        ),
      );
      subtitle = _guildChannelSubtitle(channelState, voice.channelId);
    } else {
      primaryLine = _privatePrimaryLine(
        l10n: l10n,
        voice: voice,
        isGroup: dm?.isGroup ?? false,
      );
      subtitle = _privateSubtitle(dm, voice.channelId);
    }
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVoiceState = connectionId == null
        ? null
        : ref.watch(voiceStatesMapProvider)[connectionId];
    final bool isMuted = selfVoiceState?.selfMute ?? false;
    final bool isDeafened = selfVoiceState?.selfDeaf ?? false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(height: 1, color: context.colors.borderColor),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(12),
            color: context.colors.backgroundSecondary,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _onBarNavigate(context, voice: voice, isGuild: isGuildVoice);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    children: <Widget>[
                      _buildStatusIcon(context),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              primaryLine,
                              style: context.textStyles.channelName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (subtitle.isNotEmpty) ...<Widget>[
                              const SizedBox(height: 2),
                              Text(
                                subtitle,
                                style: context.textStyles.categoryName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                            if (voice.errorMessage != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                voice.errorMessage!,
                                style: context.textStyles.categoryName.copyWith(
                                  color: context.colors.statusDanger,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (voice.errorMessage == null &&
                          voice.isInVoice) ...<Widget>[
                        const SizedBox(width: 8),
                        _ControlIconButton(
                          icon: isMuted
                              ? PhosphorIconsFill.microphoneSlash
                              : PhosphorIconsFill.microphone,
                          color: isMuted
                              ? context.colors.statusDanger
                              : context.colors.backgroundTertiary,
                          onPressed: () {
                            unawaited(
                              ref
                                  .read(voiceSessionProvider.notifier)
                                  .toggleSelfMute(),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        _ControlIconButton(
                          icon: isDeafened
                              ? PhosphorIconsFill.speakerSlash
                              : PhosphorIconsFill.speakerHigh,
                          color: isDeafened
                              ? context.colors.statusDanger
                              : context.colors.backgroundTertiary,
                          onPressed: () {
                            unawaited(
                              ref
                                  .read(voiceSessionProvider.notifier)
                                  .toggleSelfDeafen(),
                            );
                          },
                        ),
                      ],
                      const SizedBox(width: 6),
                      if (voice.errorMessage != null)
                        TextButton(
                          onPressed: () {
                            ref
                                .read(voiceSessionProvider.notifier)
                                .clearError();
                          },
                          child: const Text('Dismiss'),
                        )
                      else if (voice.isConnected)
                        FilledButton.tonal(
                          onPressed: () {
                            unawaited(
                              ref
                                  .read(voiceSessionProvider.notifier)
                                  .leaveVoice(),
                            );
                          },
                          child: Text(l10n.voiceChannelLeave),
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

  Widget _buildStatusIcon(BuildContext context) {
    return PhosphorIcon(
      PhosphorIconsRegular.phone,
      color: context.colors.textSecondary,
      size: 22,
    );
  }
}

class _ControlIconButton extends StatelessWidget {
  const _ControlIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final PhosphorIconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: PhosphorIcon(
              icon,
              size: 18,
              color: context.colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
