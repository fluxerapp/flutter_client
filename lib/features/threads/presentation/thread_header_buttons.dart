import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/threads/presentation/thread_browser_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_members_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_menu_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

bool showsThreadHeaderActions(WidgetRef ref, Channel? channel) {
  if (channel == null ||
      !(isTextThreadParentType(channel.type) || channel.isThread)) {
    return false;
  }
  return ref.watch(threadChannelsActiveProvider(channel.guildId));
}

class ThreadHeaderMobileButton extends ConsumerWidget {
  const ThreadHeaderMobileButton({required this.channel, super.key});

  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showsThreadHeaderActions(ref, channel)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isThread = channel.isThread;
    return FluxerButton.circle(
      icon: isThread ? PhosphorIconsFill.users : PhosphorIconsFill.chatsCircle,
      variant: FluxerButtonVariant.secondary,
      size: FluxerButtonSize.small,
      iconSize: 20,
      semanticLabel: isThread ? l10n.threadMembers : l10n.threadBrowserTitle,
      onPressed: () => unawaited(
        isThread
            ? showThreadMembersSheet(context, channel)
            : showThreadBrowserSheet(context, ref, channel),
      ),
    );
  }
}

class ThreadHeaderToolbarButtons extends ConsumerWidget {
  const ThreadHeaderToolbarButtons({required this.channel, super.key});

  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showsThreadHeaderActions(ref, channel)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!channel.isThread) {
      return ChannelHeaderIconButton(
        icon: PhosphorIconsFill.chatsCircle,
        label: l10n.threadBrowserTitle,
        onPressed: () =>
            unawaited(showThreadBrowserSheet(context, ref, channel)),
      );
    }
    final bool isMember =
        ref.watch(threadMembershipProvider(channel.id)).value != null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (isMember)
          ChannelHeaderIconButton(
            icon: PhosphorIconsFill.bell,
            label: l10n.threadNotificationSettings,
            onPressed: () =>
                unawaited(showThreadNotificationSheet(context, ref, channel)),
          ),
        ChannelHeaderIconButton(
          icon: PhosphorIconsFill.dotsThreeCircle,
          label: l10n.threadMoreOptions,
          onPressed: () =>
              unawaited(showThreadMenuSheet(context, ref, channel)),
        ),
      ],
    );
  }
}
