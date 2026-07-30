import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

bool isPersonalNotesHeader({
  required DmConversation? dm,
  required String channelId,
  required String? currentUserId,
}) {
  if (dm?.isPersonalNotes ?? false) {
    return true;
  }
  return isPersonalNotesChannelRoute(
    channelId: channelId,
    currentUserId: currentUserId,
  );
}

bool isSystemDm(DmConversation? dm) {
  return dm != null && dm.isSystem;
}

bool shouldShowPinsForContext({
  required Channel? channel,
  required DmConversation? dm,
  required bool isPersonalNotes,
}) {
  if (isPersonalNotes) {
    return false;
  }
  if (dm != null && dm.isSystem) {
    return false;
  }
  return channel != null || dm != null;
}

bool shouldShowSearchForContext({
  required Channel? channel,
  required DmConversation? dm,
  required bool isPersonalNotes,
}) {
  if (isPersonalNotes) {
    return false;
  }
  return channel != null || dm != null;
}

bool shouldShowMemberListToggle({
  required Channel? channel,
  required DmConversation? dm,
}) {
  if (channel != null) {
    return true;
  }
  return dm?.isGroup ?? false;
}

String resolveChannelHeaderTitle(
  WidgetRef ref, {
  required String channelId,
  required FluxerLocalizations l10n,
  required Channel? channel,
  required DmConversation? dm,
  required bool isPersonalNotes,
}) {
  final String? nickname = ref
      .watch(favoriteChannelProvider(channelId))
      .value
      ?.nickname;
  if (nickname != null && nickname.isNotEmpty) {
    return nickname;
  }
  final String? friendNickname = dm != null && !dm.isGroup
      ? ref.watch(friendNicknameProvider(dm.recipientId)).value
      : null;
  if (channel != null) {
    return channel.name;
  }
  if (isPersonalNotes) {
    return l10n.personalNotesTitle;
  }
  if (dm != null) {
    return dm.displayNameWith(
      friendNickname,
      l10n: l10n,
      currentUserId: ref.watch(currentUserIdProvider),
    );
  }
  return '';
}
