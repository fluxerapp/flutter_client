import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final FluxerClient client = ref.read(fluxerClientProvider);
  try {
    final UserProfileFullResponse profile = await client.users.getUserProfile(
      targetId: resolvedId,
      guildId: guildId,
      withMutualFriends: 'true',
      withMutualGuilds: 'true',
    );
    await _cacheUserProfile(database, profile);
    return profile;
  } on Object {
    if (cachedUser != null) {
      return userProfileFromCachedUser(cachedUser);
    }
    return null;
  }
}

UserProfileFullResponse userProfileFromCachedUser(User user, {Member? member}) {
  final UserPartialResponse partialUser = UserPartialResponse(
    id: user.id,
    username: user.username,
    discriminator: user.discriminator,
    globalName: user.globalName,
    avatar: user.avatar,
    avatarColor: user.avatarColor,
    flags: 0,
    bot: user.bot,
    system: user.system,
  );
  final DateTime? joinedAt = member?.joinedAt;
  return UserProfileFullResponse(
    user: partialUser,
    userProfile: UserProfileFullResponseUserProfile(
      bio: user.bio,
      pronouns: user.pronouns,
      banner: user.banner,
      accentColor: user.accentColor,
    ),
    guildMember: member == null || joinedAt == null
        ? null
        : GuildMemberResponse(
            user: partialUser,
            nick: member.nick,
            avatar: member.serverAvatar,
            roles: parseMemberRoleIds(member.roleIdsJson),
            joinedAt: joinedAt,
            mute: false,
            deaf: false,
            communicationDisabledUntil: member.communicationDisabledUntil,
            profileFlags: member.profileFlags,
          ),
    timezoneOffset: null,
  );
}

Future<void> _cacheUserProfile(
  FluxerDatabase database,
  UserProfileFullResponse profile,
) async {
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
}

const String _kOwnProfileStorageKeyPrefix = 'own_full_profile_v1_';

@Riverpod(keepAlive: true)
class CurrentUserFullProfile extends _$CurrentUserFullProfile {
  @override
  UserProfileFullResponse? build() {
    final String userId = ref.watch(
      userSettingsViewModelProvider.select((state) => state.userId),
    );
    if (userId.isNotEmpty) {
      unawaited(_restoreThenRefresh(userId));
    }
    return null;
  }

  bool _isCurrent(String userId) =>
      ref.mounted && ref.read(userSettingsViewModelProvider).userId == userId;

  Future<void> _restoreThenRefresh(String userId) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String? raw = preferences.getString(
        '$_kOwnProfileStorageKeyPrefix$userId',
      );
      if (raw != null && _isCurrent(userId) && state == null) {
        state = UserProfileFullResponse.fromJson(
          jsonDecode(raw) as Map<String, Object?>,
        );
      }
    } on Object catch (_) {}
    await _refresh(userId);
  }

  Future<void> refresh() async {
    final String userId = ref.read(userSettingsViewModelProvider).userId;
    if (userId.isNotEmpty) {
      await _refresh(userId);
    }
  }

  Future<void> _refresh(String userId) async {
    try {
      final UserProfileFullResponse profile = await ref
          .read(fluxerClientProvider)
          .users
          .getUserProfile(targetId: userId);
      if (!_isCurrent(userId)) {
        return;
      }
      state = profile;
      await _cacheUserProfile(ref.read(fluxerDatabaseProvider), profile);
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString(
        '$_kOwnProfileStorageKeyPrefix$userId',
        jsonEncode(profile.toJson()),
      );
    } on Object {
      return;
    }
  }
}

final Provider<CurrentUserCachedProfile?> currentUserCachedProfileProvider =
    Provider<CurrentUserCachedProfile?>((ref) {
      final UserSettingsViewState settings = ref.watch(
        userSettingsViewModelProvider,
      );
      if (settings.userId.isEmpty || settings.username.isEmpty) {
        return null;
      }
      final int? persistedFlags = ref.watch(
        currentUserFullProfileProvider.select(
          (UserProfileFullResponse? profile) => profile?.user.flags,
        ),
      );
      return CurrentUserCachedProfile(
        id: settings.userId,
        username: settings.username,
        discriminator: settings.discriminator,
        globalName: settings.displayName,
        avatar: settings.avatar,
        avatarColor: settings.avatarColor,
        bio: settings.bio,
        pronouns: settings.pronouns,
        accentColor: settings.accentColor,
        banner: settings.banner,
        publicFlags: settings.isProfileLoaded
            ? settings.publicFlags
            : persistedFlags ?? settings.publicFlags,
      );
    });

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
