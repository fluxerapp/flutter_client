import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ThreadComposerState { open, joinable, archived, locked }

ThreadComposerState resolveThreadComposerState({
  required Channel thread,
  required ThreadActorContext? actor,
  required bool isMember,
}) {
  final bool moderator = actor != null && isThreadModeratorFor(actor);
  if (thread.isLockedThread && !moderator) {
    return ThreadComposerState.locked;
  }
  if (thread.isArchivedThread) {
    return ThreadComposerState.archived;
  }
  if (!isMember && actor != null && canJoinThread(actor) == null) {
    return ThreadComposerState.joinable;
  }
  return ThreadComposerState.open;
}

class ThreadComposerGate extends ConsumerWidget {
  const ThreadComposerGate({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(anyThreadChannelsActiveProvider)) {
      return _layout(null, showChild: true);
    }
    final String channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final Channel? thread = channelId.isEmpty
        ? null
        : ref.watch(channelByIdProvider(channelId)).value;
    if (thread == null ||
        !thread.isThread ||
        !ref.watch(threadChannelsActiveProvider(thread.guildId))) {
      return _layout(null, showChild: true);
    }
    final ThreadMembership? member = ref
        .watch(threadMembershipProvider(thread.id))
        .value;
    final ThreadComposerState state = resolveThreadComposerState(
      thread: thread,
      actor: ref.watch(threadActorContextProvider(thread.id)),
      isMember: member != null,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget? bar = switch (state) {
      ThreadComposerState.open => null,
      ThreadComposerState.locked => _ThreadBar(
        icon: PhosphorIconsFill.lock,
        text: l10n.threadLockedNotice,
      ),
      ThreadComposerState.archived => _ThreadBar(
        icon: PhosphorIconsFill.archive,
        text: l10n.threadArchivedNotice,
      ),
      ThreadComposerState.joinable => _ThreadBar(
        icon: PhosphorIconsFill.chatsCircle,
        text: l10n.threadJoinNotice,
        action: FluxerButton.primary(
          label: l10n.threadJoin,
          size: FluxerButtonSize.small,
          fitContent: true,
          onPressedAsync: () async {
            await joinThread(context, ref, thread);
          },
        ),
      ),
    };
    return _layout(bar, showChild: state != ThreadComposerState.locked);
  }

  Widget _layout(Widget? bar, {required bool showChild}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (bar != null && !showChild)
          SafeArea(top: false, child: bar)
        else
          bar ?? const SizedBox.shrink(),
        if (showChild) child,
      ],
    );
  }
}

class _ThreadBar extends StatelessWidget {
  const _ThreadBar({required this.icon, required this.text, this.action});

  final IconData icon;
  final String text;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s2,
        context.layout.s4,
        context.layout.s2,
      ),
      child: Row(
        children: <Widget>[
          PhosphorIcon(icon, size: 18, color: context.colors.textPrimaryMuted),
          SizedBox(width: context.layout.s2),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ),
          if (action != null) ...<Widget>[
            SizedBox(width: context.layout.s2),
            action!,
          ],
        ],
      ),
    );
  }
}
