import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/shell/presentation/overlapping_panels.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The chat header bar showing channel name, topic, and
/// action icons. Renders a compact single-row layout on
/// mobile and the full toolbar on tablet and desktop.
///
/// Resolves the title from server channels first, then
/// falls back to DM conversations so both contexts
/// display correctly.
class ChannelHeader extends ConsumerWidget {
  const ChannelHeader({this.showMessageActions = true, super.key});

  final bool showMessageActions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final channelState = ref.watch(channelListViewModelProvider);
    final channel = findChannelById(channelState, channelId);
    final dm = channel == null
        ? findDmById(
            ref.watch(dmViewModelProvider.select((s) => s.conversations)),
            channelId,
          )
        : null;
    final isMemberListVisible = ref.watch(
      channelListViewModelProvider.select((s) => s.isMemberListVisible),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.userAreaDividerColor),
        ),
      ),
      child: ResponsiveLayout(
        builder: (context, mode) => switch (mode) {
          LayoutMode.mobile => _buildMobileBar(
            context,
            ref,
            l10n: l10n,
            channel: channel,
            dm: dm,
            showMessageActions: showMessageActions,
          ),
          _ => _buildDesktopBar(
            context,
            ref,
            l10n: l10n,
            channel: channel,
            dm: dm,
            isMemberListVisible: isMemberListVisible,
            showMessageActions: showMessageActions,
          ),
        },
      ),
    );
  }

  Widget _buildMobileBar(
    BuildContext context,
    WidgetRef ref, {
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool showMessageActions,
  }) => Container(
    height: 64,
    color: context.colors.chatInputBackground,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        IconButton(
          icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft, size: 24),
          color: context.colors.textPrimaryMuted,
          onPressed: () {
            final panels = OverlappingPanels.of(context);
            if (panels != null) {
              panels.moveToState(RevealSide.left);
              return;
            }
            if (context.canPop()) {
              context.pop();
            }
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          style: IconButton.styleFrom(shape: const CircleBorder()),
        ),
        _buildLeadingIcon(context, channel: channel, dm: dm),
        const SizedBox(width: 6),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  _resolveTitle(channel: channel, dm: dm),
                  style: context.textStyles.channelName,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (dm != null && !dm.isGroup && dm.isBot) ...[
                const SizedBox(width: 6),
                const FluxerBotBadge(),
              ],
              if (channel != null) ...<Widget>[
                const SizedBox(width: 4),
                _buildVoiceConnectionStatus(
                  context,
                  ref,
                  l10n,
                  channel,
                  compact: true,
                ),
              ],
              const SizedBox(width: 4),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 16,
                color: context.colors.textPrimaryMuted,
              ),
            ],
          ),
        ),
        if (showMessageActions) ...[
          FluxerButton.circle(
            icon: PhosphorIconsBold.star,
            variant: FluxerButtonVariant.secondary,
            size: FluxerButtonSize.small,
            iconSize: 20,
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        if (dm != null) ...[
          FluxerButton.circle(
            icon: PhosphorIconsFill.phone,
            variant: FluxerButtonVariant.secondary,
            size: FluxerButtonSize.small,
            iconSize: 20,
            onPressed: () =>
                _executeOutboundDmCall(ref: ref, context: context, dm: dm),
          ),
          const SizedBox(width: 8),
          FluxerButton.circle(
            icon: PhosphorIconsFill.videoCamera,
            variant: FluxerButtonVariant.secondary,
            size: FluxerButtonSize.small,
            iconSize: 20,
            onPressed: () => _executeOutboundDmCall(
              ref: ref,
              context: context,
              dm: dm,
              startWithVideo: true,
            ),
          ),
        ],
        if (showMessageActions && dm == null)
          FluxerButton.circle(
            icon: PhosphorIconsBold.magnifyingGlass,
            variant: FluxerButtonVariant.secondary,
            size: FluxerButtonSize.small,
            iconSize: 20,
            onPressed: () {},
          ),
      ],
    ),
  );

  Widget _buildDesktopBar(
    BuildContext context,
    WidgetRef ref, {
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isMemberListVisible,
    required bool showMessageActions,
  }) => SizedBox(
    height: 56,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildLeadingIcon(context, channel: channel, dm: dm),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              _resolveTitle(channel: channel, dm: dm),
              style: context.textStyles.channelName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (dm != null && !dm.isGroup && dm.isBot) ...[
            const SizedBox(width: 6),
            const FluxerBotBadge(),
          ],
          if (channel != null) ...<Widget>[
            const SizedBox(width: 8),
            _buildVoiceConnectionStatus(
              context,
              ref,
              l10n,
              channel,
              compact: false,
            ),
          ],
          const SizedBox(width: 8),
          if (dm != null) ...[
            FluxerButton.circle(
              icon: PhosphorIconsFill.phone,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () =>
                  _executeOutboundDmCall(ref: ref, context: context, dm: dm),
            ),
            const SizedBox(width: 8),
            FluxerButton.circle(
              icon: PhosphorIconsFill.videoCamera,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () => _executeOutboundDmCall(
                ref: ref,
                context: context,
                dm: dm,
                startWithVideo: true,
              ),
            ),
            const SizedBox(width: 8),
          ],
          const Spacer(),
          if (showMessageActions) ...[
            _topBarIcon(
              context,
              PhosphorIconsFill.bell,
              'Notification Settings',
            ),
            _topBarIcon(context, PhosphorIconsFill.pushPin, 'Pinned Messages'),
            if (dm == null)
              _topBarIcon(
                context,
                PhosphorIconsFill.users,
                'Member List',
                isActive: isMemberListVisible,
                onTap: () => ref
                    .read(channelListViewModelProvider.notifier)
                    .toggleMemberList(),
              ),
            SizedBox(
              width: 160,
              height: 28,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.backgroundTertiary,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: context.colors.textPrimaryMuted,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    PhosphorIcon(
                      PhosphorIconsFill.magnifyingGlass,
                      size: 16,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ],
                ),
              ),
            ),
            _topBarIcon(context, PhosphorIconsFill.tray, 'Inbox'),
            _topBarIcon(context, PhosphorIconsFill.question, 'Help'),
          ],
        ],
      ),
    ),
  );

  Widget _buildLeadingIcon(
    BuildContext context, {
    required Channel? channel,
    required DmConversation? dm,
  }) {
    if (channel != null) {
      return ChannelIcon(type: channel.type);
    }
    if (dm != null) {
      return FluxerAvatar.user(
        fallbackText: dm.recipientName,
        userId: dm.recipientId,
        imageUrl: _dmAvatarUrl(dm),
        status: dm.recipientStatus,
        size: 32,
      );
    }
    return PhosphorIcon(
      PhosphorIconsFill.chatCircle,
      size: 20,
      color: context.colors.interactiveNormal,
    );
  }

  String? _dmAvatarUrl(DmConversation dm) {
    final avatar = dm.recipientAvatar;
    if (avatar == null) {
      return null;
    }
    return '$fluxerMediaCdn/avatars/'
        '${dm.recipientId}/$avatar.png';
  }

  /// TODO: Replace with a more final design
  Widget _buildVoiceConnectionStatus(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    Channel channel, {
    required bool compact,
  }) {
    if (channel.type != ChannelType.voice) {
      return const SizedBox.shrink();
    }
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!_channelHeaderVoiceSessionMatches(
      voice: voice,
      channelId: channel.id,
      guildId: channel.guildId,
    )) {
      return const SizedBox.shrink();
    }
    final bool hasError = voice.errorMessage != null;
    final IconData icon;
    final Color color;
    final String label;
    if (hasError) {
      icon = PhosphorIconsFill.cellSignalSlash;
      color = context.colors.statusDanger;
      label = l10n.voiceChannelStatusError;
    } else if (voice.isConnected) {
      icon = PhosphorIconsFill.cellSignalFull;
      color = context.colors.statusOnline;
      label = l10n.voiceChannelStatusConnected;
    } else {
      icon = PhosphorIconsFill.cellSignalMedium;
      color = context.colors.statusIdle;
      label = l10n.voiceChannelStatusConnecting;
    }
    final String tip = hasError ? voice.errorMessage! : label;
    return Tooltip(
      message: tip,
      child: Semantics(
        label: tip,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(icon, size: compact ? 15 : 17, color: color),
            if (!compact) ...<Widget>[
              const SizedBox(width: 4),
              Text(
                label,
                style: context.textStyles.bodySmall.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  static bool _channelHeaderVoiceSessionMatches({
    required VoiceSessionState voice,
    required String channelId,
    required String guildId,
  }) {
    if (!voice.isInVoice) {
      return false;
    }
    if (voice.channelId != channelId) {
      return false;
    }
    return voice.guildId == guildId;
  }

  String _resolveTitle({
    required Channel? channel,
    required DmConversation? dm,
  }) {
    if (channel != null) {
      return channel.name;
    }
    if (dm != null) {
      return dm.recipientName;
    }
    return '';
  }

  Widget _topBarIcon(
    BuildContext context,
    IconData icon,
    String tooltip, {
    bool isActive = false,
    VoidCallback? onTap,
  }) => Tooltip(
    message: tooltip,
    child: InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: PhosphorIcon(
          icon,
          size: 24,
          color: isActive
              ? context.colors.interactiveActive
              : context.colors.interactiveNormal,
        ),
      ),
    ),
  );
}

void _executeOutboundDmCall({
  required WidgetRef ref,
  required BuildContext context,
  required DmConversation dm,
  bool startWithVideo = false,
}) {
  unawaited(() async {
    final String? selfId = ref.read(currentUserIdProvider);
    final List<String> ringTargets = dm.remoteRecipientIds
        .where((String id) => selfId == null || id != selfId)
        .toList();
    final StartDirectVoiceCallResult r = await startDirectVoiceCall(
      ref,
      context,
      dm.id,
      outboundRingRecipients: ringTargets.isEmpty ? null : ringTargets,
      startWithVideo: startWithVideo,
    );
    if (!context.mounted) {
      return;
    }
    if (!r.ok && !r.microphoneDenied && !r.cameraDenied) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      final String? snackMessage = r.notEligible
          ? l10n.directVoiceCallNotEligible
          : r.joinAttemptFailed
          ? l10n.voiceJoinCallFailed
          : null;
      if (snackMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackMessage)));
      }
    }
  }());
}
