import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

final Set<String> _pendingGuildMemberFetches = <String>{};

Future<void> _fetchAndCacheGuildMember({
  required Ref ref,
  required db.FluxerDatabase database,
  required String userId,
  required String guildId,
}) async {
  if (!ref.mounted) {
    return;
  }
  try {
    final sdk = await ref
        .read(fluxerClientProvider)
        .guilds
        .getGuildMember(guildId: guildId, userId: userId);
    await database.userDao.upsertUser(
      db.UsersCompanion.insert(
        id: sdk.user.id,
        username: sdk.user.username,
        discriminator: Value(sdk.user.discriminator),
        globalName: Value(sdk.user.globalName),
        avatar: Value(sdk.user.avatar),
        avatarColor: Value(sdk.user.avatarColor),
        bot: Value(sdk.user.bot ?? false),
        system: Value(sdk.user.system ?? false),
        memberSince: Value(dateTimeFromUserSnowflakeOrNull(sdk.user.id)),
      ),
    );
    await database.memberDao.upsertMember(
      memberCompanionFromSdk(sdk, guildId: guildId),
    );
    if (!ref.mounted) {
      return;
    }
    ref.invalidate(memberRoleColorProvider((userId, guildId)));
  } on Object {
    // Keep the cached row when the member fetch fails.
  }
}

String? resolveGuildIdForChannel(WidgetRef ref, String? channelId) {
  if (channelId != null && channelId.isNotEmpty) {
    return ref.watch(channelByIdProvider(channelId)).value?.guildId;
  }
  return ref.watch(activeGuildIdProvider);
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
  if (fetchOnMiss &&
      guildId != null &&
      guildId.isNotEmpty &&
      (userAsync.value == null || memberAsync.value == null)) {
    final String key = '$guildId:$userId';
    if (!_pendingGuildMemberFetches.contains(key)) {
      _pendingGuildMemberFetches.add(key);
      unawaited(
        _fetchAndCacheGuildMember(
          ref: ref,
          database: ref.watch(fluxerDatabaseProvider),
          userId: userId,
          guildId: guildId,
        ).whenComplete(() => _pendingGuildMemberFetches.remove(key)),
      );
    }
  }
  if (userAsync.isLoading && !userAsync.hasValue) {
    return const AsyncValue<GuildUserDisplay?>.loading();
  }
  final db.User? user = userAsync.value;
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
