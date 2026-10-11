import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';

String? resolveGuildIdForChannel(WidgetRef ref, String? channelId) {
  if (channelId != null && channelId.isNotEmpty) {
    final channel = resolveGuildChannel(ref, channelId);
    if (channel != null && channel.guildId.isNotEmpty) {
      return channel.guildId;
    }
    final fromStream = ref.watch(channelGuildIdProvider(channelId)).value;
    if (fromStream != null && fromStream.isNotEmpty) {
      return fromStream;
    }
  }
  return ref.watch(contextualGuildIdProvider);
}

String watchMentionUserDisplayName({
  required WidgetRef ref,
  required String userId,
  String? channelId,
  String? guildId,
}) {
  final String? resolvedGuildId =
      guildId ?? resolveGuildIdForChannel(ref, channelId);
  if (resolvedGuildId != null && resolvedGuildId.isNotEmpty) {
    final GuildUserDisplay? display = ref
        .watch(guildUserDisplayProvider((userId, resolvedGuildId)))
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
  final String? channelNickname = guildId == null || guildId.isEmpty
      ? ref.watch(
          _dmChannelNicksProvider(message.channelId).select(
            (AsyncValue<Map<String, String>> nicks) =>
                nicks.value?[message.authorId],
          ),
        )
      : null;
  return resolveMessageAuthorDisplay(
    message: message,
    guildDisplay: guildDisplay,
    channelNickname: channelNickname,
    productName: ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    ),
  );
}

final StreamProviderFamily<db.User?, String> _userRowProvider = StreamProvider
    .autoDispose
    .family<db.User?, String>(
      (ref, userId) =>
          ref.watch(fluxerDatabaseProvider).userDao.watchUserById(userId),
    );

final StreamProviderFamily<Map<String, String>, String>
_dmChannelNicksProvider = StreamProvider.autoDispose
    .family<Map<String, String>, String>(
      (ref, channelId) => ref
          .watch(fluxerDatabaseProvider)
          .dmChannelDao
          .watchNicksJson(channelId)
          .map((String? json) => parseDmChannelNicksJson(json ?? '')),
    );

const int _lastResolvedDisplayLimit = 2048;

final Provider<Map<(String, String?), GuildUserDisplay>>
_lastResolvedDisplayProvider =
    Provider<Map<(String, String?), GuildUserDisplay>>((ref) {
      ref.watch(fluxerDatabaseProvider);
      return <(String, String?), GuildUserDisplay>{};
    });

bool _isSettling(AsyncValue<Object?> value) =>
    value.isLoading && !value.hasValue;

class GuildUserDisplayWarmer {
  final Map<String, List<ProviderSubscription<Future<Object?>>>> _held =
      <String, List<ProviderSubscription<Future<Object?>>>>{};

  Future<void> warm(
    Ref ref, {
    required String channelId,
    required String? guildId,
    required Iterable<String> userIds,
  }) async {
    final bool inGuild = guildId != null && guildId.isNotEmpty;
    final List<ProviderSubscription<Future<Object?>>> next =
        <ProviderSubscription<Future<Object?>>>[
          for (final String userId in userIds.toSet()) ...[
            ref.listen(_userRowProvider(userId).future, _ignoreChange),
            ref.listen(friendNicknameProvider(userId).future, _ignoreChange),
            if (inGuild)
              ref.listen(
                memberRowByGuildProvider((userId, guildId)).future,
                _ignoreChange,
              ),
          ],
        ];
    try {
      await Future.wait(
        next.map(
          (ProviderSubscription<Future<Object?>> subscription) =>
              subscription.read().then<void>((_) {}, onError: (Object _) {}),
        ),
      );
    } finally {
      _close(_held[channelId]);
      _held[channelId] = next;
    }
  }

  void release(String channelId) => _close(_held.remove(channelId));

  void releaseAll() {
    for (final String channelId in _held.keys.toList()) {
      release(channelId);
    }
  }

  void _close(List<ProviderSubscription<Future<Object?>>>? subscriptions) {
    for (final ProviderSubscription<Future<Object?>> subscription
        in subscriptions ?? const <ProviderSubscription<Future<Object?>>>[]) {
      subscription.close();
    }
  }
}

void _ignoreChange(Object? previous, Object? next) {}

AsyncValue<GuildUserDisplay?> _combine(
  Ref ref,
  (String, String?) args, {
  required bool fetchOnMiss,
}) {
  final (String userId, String? guildId) = args;
  final AsyncValue<db.User?> userAsync = ref.watch(_userRowProvider(userId));
  final AsyncValue<db.Member?> memberAsync =
      guildId != null && guildId.isNotEmpty
      ? ref.watch(memberRowByGuildProvider((userId, guildId)))
      : const AsyncValue<db.Member?>.data(null);
  final AsyncValue<String?> friendNicknameAsync = ref.watch(
    friendNicknameProvider(userId),
  );
  final String? friendNickname = friendNicknameAsync.value;
  final Map<(String, String?), GuildUserDisplay> lastResolved = ref.watch(
    _lastResolvedDisplayProvider,
  );
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
      );
    }
  }
  final GuildUserDisplay? previous = lastResolved[args];
  if (previous != null &&
      (_isSettling(userAsync) ||
          _isSettling(memberAsync) ||
          _isSettling(friendNicknameAsync))) {
    return AsyncValue<GuildUserDisplay?>.data(previous);
  }
  if (_isSettling(userAsync)) {
    return const AsyncValue<GuildUserDisplay?>.loading();
  }
  if (user == null) {
    lastResolved.remove(args);
    return const AsyncValue<GuildUserDisplay?>.data(null);
  }
  final GuildUserDisplay display = resolveGuildUserDisplayFromRows(
    user: user,
    member: memberAsync.value,
    guildId: guildId,
    friendNickname: friendNickname,
  );
  lastResolved.remove(args);
  if (lastResolved.length >= _lastResolvedDisplayLimit) {
    lastResolved.remove(lastResolved.keys.first);
  }
  lastResolved[args] = display;
  return AsyncValue<GuildUserDisplay?>.data(display);
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
