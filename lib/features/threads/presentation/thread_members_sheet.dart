import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_member_list_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showThreadMembersSheet(BuildContext context, Channel thread) {
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: FluxerLocalizations.of(context).threadMembers,
    initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
    builder: (sheetContext, scrollController, close) => ThreadMembersList(
      thread: thread,
      scrollController: scrollController,
      hostContext: context,
    ),
  );
}

String threadMemberDisplayName(ThreadMemberEntry entry) {
  final GuildMemberResponse? member = entry.member;
  final String? nick = member?.nick;
  if (nick != null && nick.isNotEmpty) {
    return nick;
  }
  final String? globalName = member?.user.globalName;
  if (globalName != null && globalName.isNotEmpty) {
    return globalName;
  }
  return member?.user.username ?? entry.userId;
}

class ThreadMembersPanel extends ConsumerWidget {
  const ThreadMembersPanel({required this.thread, super.key});

  static const double width = 240;

  final Channel thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      color: context.colors.backgroundSecondary,
      child: ThreadMembersList(thread: thread, hostContext: context),
    );
  }
}

class ThreadMembersList extends ConsumerWidget {
  const ThreadMembersList({
    required this.thread,
    required this.hostContext,
    this.scrollController,
    super.key,
  });

  final Channel thread;
  final BuildContext hostContext;
  final ScrollController? scrollController;

  Future<void> _remove(WidgetRef ref, ThreadMemberEntry entry) async {
    await runThreadAction(
      hostContext,
      ref,
      (ThreadsRepository repo) => repo.removeMember(
        guildId: thread.guildId,
        threadId: thread.id,
        userId: entry.userId,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref.watch(threadMemberListSubscriptionProvider(thread.guildId, thread.id));
    final List<ThreadMemberEntry>? members = ref.watch(
      threadMemberListProvider(thread.id),
    );
    final ThreadActorContext? actor = ref.watch(
      threadActorContextProvider(thread.id),
    );
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool canRemove =
        actor != null && canRemoveThreadMember(actor) == null;
    if (members == null) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (members.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(context.layout.s4),
          child: Text(
            l10n.threadMembersEmpty,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      ),
      children: <Widget>[
        FluxerListSection(
          header: l10n.threadMembersCount(members.length),
          children: <Widget>[
            for (final ThreadMemberEntry entry in members)
              _memberRow(
                context,
                ref,
                entry,
                removable: canRemove && entry.userId != currentUserId,
              ),
          ],
        ),
      ],
    );
  }

  Widget _memberRow(
    BuildContext context,
    WidgetRef ref,
    ThreadMemberEntry entry, {
    required bool removable,
  }) {
    final String name = threadMemberDisplayName(entry);
    return FluxerListRow(
      leading: FluxerAvatar.user(
        userId: entry.userId,
        imageUrl: FluxerMediaUrl.userAvatar(
          userId: entry.userId,
          hash: entry.member?.user.avatar,
        ),
        fallbackText: name,
        avatarColor: entry.member?.user.avatarColor,
        size: 36,
        showStatus: false,
      ),
      title: name,
      trailing: removable
          ? FluxerButton.ghost(
              icon: PhosphorIconsBold.userMinus,
              isSquare: true,
              size: FluxerButtonSize.compact,
              semanticLabel: FluxerLocalizations.of(
                context,
              ).threadRemoveMember(name),
              onPressedAsync: () => _remove(ref, entry),
            )
          : null,
      onTap: () => unawaited(
        FluxerUserProfileSheet.show(
          hostContext,
          userId: entry.userId,
          guildId: thread.guildId,
        ),
      ),
    );
  }
}
