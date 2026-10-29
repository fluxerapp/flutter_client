import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/invite_people_recipient.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

List<InvitePeopleRecipient> buildInvitePeopleRecipients({
  required List<Friend> friends,
  required List<DmConversation> dms,
  required FluxerLocalizations l10n,
}) {
  final Iterable<Friend> accepted = friends.where(
    (Friend f) => f.friendStatus == FriendStatus.accepted,
  );
  final Map<String, DmConversation> dmByRecipient = <String, DmConversation>{};
  final List<InvitePeopleRecipient> recipients = <InvitePeopleRecipient>[];

  for (final DmConversation dm in dms) {
    if (dm.isGroup) {
      recipients.add(
        InvitePeopleRecipient(
          id: dm.id,
          displayName: dm.displayName,
          secondaryText: l10n.guildNavbarGroupDm,
          channelId: dm.id,
        ),
      );
    } else {
      dmByRecipient[dm.recipientId] = dm;
    }
  }

  for (final Friend friend in accepted) {
    final DmConversation? dm = dmByRecipient[friend.id];
    final String? avatarUrl = friend.avatar != null
        ? FluxerMediaUrl.userAvatar(userId: friend.id, hash: friend.avatar)
        : null;
    recipients.add(
      InvitePeopleRecipient(
        id: friend.id,
        displayName: friend.displayName,
        secondaryText: friend.username,
        avatarUrl: avatarUrl,
        channelId: dm?.id,
      ),
    );
  }

  return recipients;
}

Future<List<InvitePeopleRecipient>> loadInvitePeopleRecipients({
  required WidgetRef ref,
  required FluxerLocalizations l10n,
}) async {
  final List<Friend> friends = await ref
      .read(friendRepositoryProvider)
      .getRelationships();
  final List<DmConversation> dms = await ref
      .read(dmRepositoryProvider)
      .getDmChannels();
  return buildInvitePeopleRecipients(friends: friends, dms: dms, l10n: l10n);
}
