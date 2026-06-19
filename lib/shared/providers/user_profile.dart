import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile.g.dart';

class CurrentUserCachedProfile {
  const CurrentUserCachedProfile({
    required this.id,
    required this.username,
    required this.discriminator,
    required this.globalName,
    required this.avatar,
    required this.avatarColor,
    required this.bio,
    required this.pronouns,
    required this.accentColor,
    required this.banner,
    required this.publicFlags,
  });

  final String id;
  final String username;
  final String discriminator;
  final String? globalName;
  final String? avatar;
  final int? avatarColor;
  final String? bio;
  final String? pronouns;
  final int? accentColor;
  final String? banner;
  final int publicFlags;
}

@riverpod
Future<UserProfileFullResponse?> userProfile(
  Ref ref, {
  String? userId,
  String? guildId,
}) async {
  final String resolvedId =
      userId ?? ref.read(userSettingsViewModelProvider).userId;

  if (resolvedId.isEmpty) {
    return null;
  }

  final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final User? cachedUser = await database.userDao.getUserById(resolvedId);
  unawaited(
    _refreshUserProfileFromNetwork(
      ref,
      userId: resolvedId,
      guildId: guildId,
    ),
  );
  if (cachedUser != null) {
    return _userProfileFromCachedUser(cachedUser);
  }

  final FluxerClient client = ref.read(fluxerClientProvider);
  try {
    return await client.users.getUserProfile(
      targetId: resolvedId,
      guildId: guildId,
      withMutualFriends: 'true',
      withMutualGuilds: 'true',
    );
  } on Object {
    return null;
  }
}

UserProfileFullResponse _userProfileFromCachedUser(User user) {
  return UserProfileFullResponse(
    user: UserProfileFullResponseUser(
      id: user.id,
      username: user.username,
      discriminator: user.discriminator,
      globalName: user.globalName,
      avatar: user.avatar,
      avatarColor: user.avatarColor,
      flags: 0,
    ),
    userProfile: UserProfileFullResponseUserProfile(
      bio: user.bio,
      pronouns: user.pronouns,
      banner: user.banner,
      accentColor: user.accentColor,
    ),
    timezoneOffset: null,
  );
}

Future<void> _refreshUserProfileFromNetwork(
  Ref ref, {
  required String userId,
  String? guildId,
}) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  try {
    final UserProfileFullResponse profile = await client.users.getUserProfile(
      targetId: userId,
      guildId: guildId,
      withMutualFriends: 'true',
      withMutualGuilds: 'true',
    );
    await database.userDao.upsertUser(
      UsersCompanion(
        id: Value(profile.user.id),
        username: Value(profile.user.username),
        discriminator: Value(profile.user.discriminator),
        globalName: Value(profile.user.globalName),
        avatar: Value(profile.user.avatar),
        avatarColor: Value(profile.user.avatarColor),
        bio: Value(profile.userProfile.bio),
        pronouns: Value(profile.userProfile.pronouns),
        accentColor: Value(profile.userProfile.accentColor),
        banner: Value(profile.userProfile.banner),
      ),
    );
    ref.invalidate(
      userProfileProvider(userId: userId, guildId: guildId),
    );
  } on Object {
    return;
  }
}

// `AutoDisposeFutureProvider` is not exposed by the public API; the explicit
// type would require a `package:riverpod/src/...` import.
// ignore: specify_nonobvious_property_types
final currentUserProfileConnectionsProvider =
    FutureProvider.autoDispose<List<ConnectionResponse>>((ref) async {
      final String userId = ref.watch(
        userSettingsViewModelProvider.select((state) => state.userId),
      );
      if (userId.isEmpty) {
        return const <ConnectionResponse>[];
      }
      final FluxerClient client = ref.read(fluxerClientProvider);
      try {
        final UserProfileFullResponse profile = await client.users
            .getUserProfile(targetId: userId);
        return profile.connectedAccounts ?? const <ConnectionResponse>[];
      } on Object {
        return const <ConnectionResponse>[];
      }
    });

final StreamProvider<CurrentUserCachedProfile?>
currentUserCachedProfileProvider = StreamProvider<CurrentUserCachedProfile?>((
  ref,
) {
  final String userId = ref.watch(
    userSettingsViewModelProvider.select((state) => state.userId),
  );
  if (userId.isEmpty) {
    return const Stream<CurrentUserCachedProfile?>.empty();
  }
  final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
  final int publicFlags = ref.watch(
    userSettingsViewModelProvider.select((state) => state.publicFlags),
  );
  unawaited(_refreshCurrentUserProfile(ref, userId));
  return database.userDao.watchUserById(userId).map((User? row) {
    if (row == null) {
      return null;
    }
    return CurrentUserCachedProfile(
      id: row.id,
      username: row.username,
      discriminator: row.discriminator,
      globalName: row.globalName,
      avatar: row.avatar,
      avatarColor: row.avatarColor,
      bio: row.bio,
      pronouns: row.pronouns,
      accentColor: row.accentColor,
      banner: row.banner,
      publicFlags: publicFlags,
    );
  });
});

Future<void> _refreshCurrentUserProfile(Ref ref, String userId) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  try {
    final UserProfileFullResponse profile = await client.users.getUserProfile(
      targetId: userId,
    );
    await database.userDao.upsertUser(
      UsersCompanion(
        id: Value(profile.user.id),
        username: Value(profile.user.username),
        discriminator: Value(profile.user.discriminator),
        globalName: Value(profile.user.globalName),
        avatar: Value(profile.user.avatar),
        avatarColor: Value(profile.user.avatarColor),
        bio: Value(profile.userProfile.bio),
        pronouns: Value(profile.userProfile.pronouns),
        accentColor: Value(profile.userProfile.accentColor),
        banner: Value(profile.userProfile.banner),
      ),
    );
  } on Object {
    return;
  }
}

@riverpod
Future<String?> userProfileSelfNote(Ref ref, {required String userId}) async {
  if (userId.isEmpty) {
    return null;
  }
  final UserNotesTableData? row = await ref
      .read(fluxerDatabaseProvider)
      .userNotesDao
      .getNote(userId);
  final String? content = row?.content;
  if (content == null || content.trim().isEmpty) {
    return null;
  }
  return content.trim();
}
