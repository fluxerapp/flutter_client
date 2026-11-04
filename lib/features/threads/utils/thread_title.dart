import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

bool threadOwnerBlocked(Channel thread, Set<String> blockedUserIds) {
  final String? ownerId = thread.ownerId;
  return ownerId != null && blockedUserIds.contains(ownerId);
}

String threadTitleText(
  Channel thread,
  FluxerLocalizations l10n, {
  required Set<String> blockedUserIds,
  required Channel? parent,
}) {
  if (!threadOwnerBlocked(thread, blockedUserIds)) {
    return thread.name;
  }
  return (parent?.isThreadOnly ?? false)
      ? l10n.forumPostBlockedAuthor
      : l10n.threadBlockedAuthor;
}

String watchThreadTitleText(
  WidgetRef ref,
  Channel thread,
  FluxerLocalizations l10n,
) {
  final String? ownerId = thread.ownerId;
  if (ownerId == null ||
      !ref.watch(
        blockedUserIdsProvider.select(
          (Set<String> ids) => ids.contains(ownerId),
        ),
      )) {
    return thread.name;
  }
  final String? parentId = thread.parentId;
  final bool inForum =
      parentId != null &&
      (ref.watch(channelByIdProvider(parentId)).value?.isThreadOnly ?? false);
  return inForum ? l10n.forumPostBlockedAuthor : l10n.threadBlockedAuthor;
}

String readThreadTitleText(
  WidgetRef ref,
  Channel thread,
  FluxerLocalizations l10n,
) {
  final String? parentId = thread.parentId;
  return threadTitleText(
    thread,
    l10n,
    blockedUserIds: ref.read(blockedUserIdsProvider),
    parent: parentId == null
        ? null
        : ref.read(channelByIdProvider(parentId)).value,
  );
}
