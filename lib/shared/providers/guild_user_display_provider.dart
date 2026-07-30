import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';

String? resolveGuildIdForChannel(WidgetRef ref, String? channelId) {
  if (channelId != null && channelId.isNotEmpty) {
    final String? activeChannelId = ref.watch(activeChannelIdProvider);
    if (channelId == activeChannelId) {
      return ref.watch(contextualGuildIdProvider);
    }
    return ref.watch(channelGuildIdProvider(channelId)).value;
  }
  return ref.watch(contextualGuildIdProvider);
}

String watchMentionUserDisplayName({
  required WidgetRef ref,
  required String userId,
  String? channelId,
}) {
  final String? guildId = resolveGuildIdForChannel(ref, channelId);
  if (guildId != null && guildId.isNotEmpty) {
    final GuildUserDisplay? display = ref
        .watch(guildUserDisplayProvider((userId, guildId)))
        .value;
    return resolveMentionUserDisplayName(userId: userId, guildDisplay: display);
  }
  final GuildUserDisplay? display = ref
      .watch(guildUserDisplayFromDbProvider((userId, null)))
      .value;
  return resolveMentionUserDisplayName(userId: userId, guildDisplay: display);
}

GuildUserDisplay watchMessageAuthorDisplay({
  required WidgetRef ref,
  required Message message,
  required String? guildId,
  required String? currentUserId,
}) {
  final bool prefersPersistedAuthor = messagePrefersPersistedAuthorDisplay(
    message,
  );
  GuildUserDisplay? guildDisplay;
  if (!prefersPersistedAuthor) {
    final bool isCurrentUserAuthor =
        currentUserId != null && message.authorId == currentUserId;
    final String authorId = message.authorId;
    if (isCurrentUserAuthor) {
      guildDisplay = ref
          .watch(guildUserDisplayFromDbProvider((authorId, guildId)))
          .value;
    } else {
      guildDisplay = ref
          .watch(guildUserDisplayProvider((authorId, guildId)))
          .value;
    }
  }
  return resolveMessageAuthorDisplay(
    message: message,
    guildId: guildId,
    guildDisplay: guildDisplay,
  );
}

final StreamProviderFamily<db.User?, String> _userRowProvider = StreamProvider
    .autoDispose
    .family<db.User?, String>(
      (ref, userId) =>
          ref.watch(fluxerDatabaseProvider).userDao.watchUserById(userId),
    );

final StreamProviderFamily<db.Member?, (String, String)> _memberRowProvider =
    StreamProvider.autoDispose.family<db.Member?, (String, String)>(
      (ref, key) => ref
          .watch(fluxerDatabaseProvider)
          .memberDao
          .watchMemberByUserId(key.$1, key.$2),
    );

AsyncValue<GuildUserDisplay?> _combine(
  Ref ref,
  (String, String?) args, {
  required bool fetchOnMiss,
}) {
  final (String userId, String? guildId) = args;
  final AsyncValue<db.User?> userAsync = ref.watch(_userRowProvider(userId));
  final AsyncValue<db.Member?> memberAsync =
      guildId != null && guildId.isNotEmpty
      ? ref.watch(_memberRowProvider((userId, guildId)))
      : const AsyncValue<db.Member?>.data(null);
  final String? friendNickname = ref
      .watch(friendNicknameProvider(userId))
      .value;
  final db.User? user = userAsync.value;
  if (fetchOnMiss &&
      guildId != null &&
      guildId.isNotEmpty &&
      user != null &&
      memberAsync.value == null) {
    final GuildMemberHydrationService hydrationService = ref.read(
      guildMemberHydrationServiceProvider,
    );
    if (!hydrationService.isNonMember(guildId, userId)) {
      hydrationService.requestHydration(
        guildId: guildId,
        userIds: <String>[userId],
        onMemberFetched: (String fetchedUserId) {
          if (ref.mounted) {
            ref.invalidate(memberRoleColorProvider((fetchedUserId, guildId)));
          }
        },
      );
    }
  }
  if (userAsync.isLoading && !userAsync.hasValue) {
    return const AsyncValue<GuildUserDisplay?>.loading();
  }
  return AsyncValue<GuildUserDisplay?>.data(
    user == null
        ? null
        : resolveGuildUserDisplayFromRows(
            user: user,
            member: memberAsync.value,
            guildId: guildId,
            friendNickname: friendNickname,
          ),
  );
}

final ProviderFamily<AsyncValue<GuildUserDisplay?>, (String, String?)>
guildUserDisplayFromDbProvider = Provider.autoDispose
    .family<AsyncValue<GuildUserDisplay?>, (String, String?)>(
      (ref, args) => _combine(ref, args, fetchOnMiss: false),
    );

final ProviderFamily<AsyncValue<GuildUserDisplay?>, (String, String?)>
guildUserDisplayProvider = Provider.autoDispose
    .family<AsyncValue<GuildUserDisplay?>, (String, String?)>(
      (ref, args) => _combine(ref, args, fetchOnMiss: true),
    );
