import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/members/domain/member.dart' as members;
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('resolveDisplayName', () {
    test('prefers guild > friend > global > username', () {
      expect(
        resolveDisplayName(
          username: 'user',
          guildNickname: 'Guild',
          friendNickname: 'Friend',
          globalName: 'Global',
        ),
        'Guild',
      );
      expect(
        resolveDisplayName(
          username: 'user',
          friendNickname: 'Friend',
          globalName: 'Global',
        ),
        'Friend',
      );
      expect(
        resolveDisplayName(username: 'user', globalName: 'Global'),
        'Global',
      );
      expect(resolveDisplayName(username: 'user'), 'user');
    });

    test('skips blank', () {
      expect(
        resolveDisplayName(
          username: 'user',
          guildNickname: '   ',
          friendNickname: 'Friend',
        ),
        'Friend',
      );
    });
  });

  group('resolveGuildUserDisplayFromProfile', () {
    test('uses global profile when guild data is absent', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(userPronouns: 'they/them'),
        guildId: null,
        friendNickname: null,
      );
      expect(actual.displayName, 'Global Name');
      expect(actual.avatarUrl, contains('/avatars/1/user_avatar.webp'));
      expect(actual.bannerUrl, contains('/banners/1/user_banner.webp'));
      expect(actual.bio, 'global bio');
      expect(actual.pronouns, 'they/them');
    });

    test('uses guild nickname, avatar, banner, and bio', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          userPronouns: 'she/her',
          guildMember: _guildMember(nick: 'Guild Nick', avatar: 'guild_avatar'),
          guildProfile: _guildProfile(
            bio: 'guild bio',
            banner: 'guild_banner',
            pronouns: 'xe/xem',
          ),
        ),
        guildId: '10',
        friendNickname: null,
      );
      expect(actual.displayName, 'Guild Nick');
      expect(
        actual.avatarUrl,
        contains('/guilds/10/users/1/avatars/guild_avatar.webp'),
      );
      expect(
        actual.bannerUrl,
        contains('/guilds/10/users/1/banners/guild_banner.webp'),
      );
      expect(actual.bio, 'guild bio');
      expect(actual.pronouns, 'xe/xem');
    });

    test('uses animated global avatar and banner urls', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(userAvatar: 'a_user_avatar', userBanner: 'a_banner'),
        guildId: null,
        friendNickname: null,
      );
      expect(actual.avatarUrl, contains('/avatars/1/user_avatar.webp?size='));
      expect(
        actual.bannerUrl,
        contains('/banners/1/a_banner.gif?animated=true&size='),
      );
    });

    test('uses animated guild avatar and banner urls', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          guildMember: _guildMember(avatar: 'a_guild_avatar'),
          guildProfile: _guildProfile(banner: 'a_guild_banner'),
        ),
        guildId: '10',
        friendNickname: null,
      );
      expect(
        actual.avatarUrl,
        contains('/guilds/10/users/1/avatars/guild_avatar.webp?size='),
      );
      expect(
        actual.bannerUrl,
        contains('/guilds/10/users/1/banners/guild_banner.webp?size='),
      );
    });

    test('guild nickname overrides friend nickname', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(guildMember: _guildMember(nick: 'Guild Nick')),
        guildId: '10',
        friendNickname: 'Friend Nick',
      );
      expect(actual.displayName, 'Guild Nick');
    });

    test('avatar unset forces default avatar fallback', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          guildMember: _guildMember(
            avatar: 'guild_avatar',
            profileFlags: guildProfileAvatarUnsetFlag,
          ),
        ),
        guildId: '10',
        friendNickname: null,
      );
      expect(actual.avatarUrl, isNull);
    });

    test('banner unset removes image and profile banner color', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          guildMember: _guildMember(profileFlags: guildProfileBannerUnsetFlag),
          guildProfile: _guildProfile(banner: 'guild_banner'),
        ),
        guildId: '10',
        friendNickname: null,
      );
      expect(actual.bannerUrl, isNull);
      expect(actual.bannerColor, const Color(0xFF112233));
    });

    test('guild profile bio falls back to global bio', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(guildProfile: _guildProfile()),
        guildId: '10',
        friendNickname: null,
      );
      expect(actual.bio, 'global bio');
    });

    test('guild profile pronouns fall back to global pronouns', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          userPronouns: 'she/her',
          guildMember: _guildMember(),
          guildProfile: _guildProfile(),
        ),
        guildId: '10',
        friendNickname: null,
      );
      expect(actual.pronouns, 'she/her');
    });

    test('showGlobalProfile uses global pronouns only', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromProfile(
        response: _profile(
          userPronouns: 'they/them',
          guildMember: _guildMember(),
          guildProfile: _guildProfile(pronouns: 'he/him'),
        ),
        guildId: '10',
        friendNickname: null,
        showGlobalProfile: true,
      );
      expect(actual.pronouns, 'they/them');
    });
  });

  group('resolveGuildUserDisplayFromRows', () {
    test('avatar unset forces null avatar url', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromRows(
        user: _dbUser(),
        member: _dbMember(profileFlags: guildProfileAvatarUnsetFlag),
        guildId: '10',
      );
      expect(actual.avatarUrl, isNull);
    });

    test('inherit mode uses global avatar when guild avatar is absent', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromRows(
        user: _dbUser(),
        member: _dbMember(),
        guildId: '10',
      );
      expect(actual.avatarUrl, contains('/avatars/1/user_avatar.webp'));
    });
  });

  group('resolveGuildMemberAvatarUrl', () {
    test('uses guild member media url when server avatar is set', () {
      final String? actual = resolveGuildMemberAvatarUrl(
        guildId: '10',
        userId: '1',
        memberAvatar: 'guild_avatar',
        userAvatarHash: 'user_avatar',
      );
      expect(
        actual,
        FluxerMediaUrl.guildMemberMedia(
          guildId: '10',
          userId: '1',
          type: GuildMemberMediaType.avatar,
          hash: 'guild_avatar',
        ),
      );
    });

    test('avatar unset forces null avatar url', () {
      expect(
        resolveGuildMemberAvatarUrl(
          guildId: '10',
          userId: '1',
          memberAvatar: 'guild_avatar',
          userAvatarHash: 'user_avatar',
          avatarUnset: true,
        ),
        isNull,
      );
    });
  });

  group('resolveGuildMemberResponseAvatarUrl', () {
    test('uses guild member media url when server avatar is set', () {
      final String? actual = resolveGuildMemberResponseAvatarUrl(
        guildId: '10',
        member: _guildMember(avatar: 'guild_avatar'),
      );
      expect(
        actual,
        FluxerMediaUrl.guildMemberMedia(
          guildId: '10',
          userId: '1',
          type: GuildMemberMediaType.avatar,
          hash: 'guild_avatar',
        ),
      );
    });

    test('avatar unset forces null avatar url', () {
      final String? actual = resolveGuildMemberResponseAvatarUrl(
        guildId: '10',
        member: _guildMember(profileFlags: guildProfileAvatarUnsetFlag),
      );
      expect(actual, isNull);
    });
  });

  group('resolveGuildUserDisplayFromMessage', () {
    test('can force animated avatar hashes to static urls', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromMessage(
        userId: '1',
        fallbackDisplayName: 'User',
        fallbackAvatarHash: 'a_avatar',
        fallbackAvatarColor: null,
        member: null,
        guildId: null,
        animatedAvatar: false,
      );
      expect(actual.avatarUrl, contains('/avatars/1/avatar.webp'));
      expect(actual.avatarUrl, isNot(contains('animated=true')));
    });

    test('avatar unset forces null avatar url when member is provided', () {
      final GuildUserDisplay actual = resolveGuildUserDisplayFromMessage(
        userId: '1',
        fallbackDisplayName: 'User',
        fallbackAvatarHash: 'user_avatar',
        fallbackAvatarColor: null,
        member: _dbMember(profileFlags: guildProfileAvatarUnsetFlag),
        guildId: '10',
      );
      expect(actual.avatarUrl, isNull);
    });
  });

  group('Member.fromRow avatar resolution', () {
    test('avatar unset returns null avatar', () {
      final members.Member actual = members.Member.fromRow(
        _dbMember(profileFlags: guildProfileAvatarUnsetFlag),
        _dbUser(),
        const <db.Role>[],
      );
      expect(actual.avatar, isNull);
    });

    test('inherit mode falls back to user avatar', () {
      final members.Member actual = members.Member.fromRow(
        _dbMember(),
        _dbUser(),
        const <db.Role>[],
      );
      expect(actual.avatar, 'user_avatar');
    });
  });

  group('messagePrefersPersistedAuthorDisplay', () {
    test('returns true when webhook id is set', () {
      expect(
        messagePrefersPersistedAuthorDisplay(
          _message(
            authorName: 'Hook',
            authorAvatar: 'av',
            authorIsBot: false,
            webhookId: 'wh-1',
          ),
        ),
        isTrue,
      );
    });

    test('returns true when author is a bot', () {
      expect(
        messagePrefersPersistedAuthorDisplay(
          _message(authorName: 'Bot', authorAvatar: 'av', authorIsBot: true),
        ),
        isTrue,
      );
    });

    test('returns false for a normal member message', () {
      expect(
        messagePrefersPersistedAuthorDisplay(
          _message(authorName: 'Human', authorAvatar: 'av', authorIsBot: false),
        ),
        isFalse,
      );
    });
  });

  group('resolveMessageAuthorDisplay', () {
    const String botUserId = '99';
    const String guildId = '10';
    final GuildUserDisplay botGuildDisplay = GuildUserDisplay(
      displayName: 'Fluxcord',
      accountDisplayName: 'Fluxcord',
      isBot: true,
      avatarUrl: FluxerMediaUrl.userAvatar(
        userId: botUserId,
        hash: 'bot_avatar',
        size: MediaProxySizes.avatarProfile,
      ),
      avatarHash: 'bot_avatar',
      avatarColor: 0x112233,
    );
    final GuildUserDisplay humanGuildDisplay = GuildUserDisplay(
      displayName: 'Guild Nick',
      accountDisplayName: 'Global Name',
      avatarUrl: FluxerMediaUrl.userAvatar(
        userId: botUserId,
        hash: 'bot_avatar',
        size: MediaProxySizes.avatarProfile,
      ),
      avatarHash: 'bot_avatar',
      avatarColor: 0x112233,
    );

    test('uses message display when guild id is null', () {
      final Message message = _message(
        authorName: 'Proxy One',
        authorAvatar: 'proxy_one',
        authorIsBot: true,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: null,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, 'Proxy One');
      expect(actual.avatarUrl, contains('/avatars/99/proxy_one.webp'));
    });

    test('uses message display when guild display is null', () {
      final Message message = _message(
        authorName: 'Proxy One',
        authorAvatar: 'proxy_one',
        authorIsBot: true,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
      );
      expect(actual.displayName, 'Proxy One');
    });

    test('prefers guild display for non-bot authors', () {
      final Message message = _message(
        authorName: 'Historical Name',
        authorAvatar: 'old_avatar',
        authorIsBot: false,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: humanGuildDisplay,
      );
      expect(actual.displayName, humanGuildDisplay.displayName);
      expect(actual.avatarUrl, humanGuildDisplay.avatarUrl);
    });

    test('uses guild display for bot when name and avatar match', () {
      final Message message = _message(
        authorName: 'Fluxcord',
        authorAvatar: 'bot_avatar',
        authorIsBot: true,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, botGuildDisplay.displayName);
      expect(actual.avatarUrl, botGuildDisplay.avatarUrl);
    });

    test('uses message display for bot when author name differs', () {
      final Message message = _message(
        authorName: 'Fluxer User',
        authorAvatar: 'bot_avatar',
        authorIsBot: true,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, 'Fluxer User');
      expect(actual.avatarUrl, contains('/avatars/99/bot_avatar.webp'));
    });

    test('uses message display for bot when avatar differs', () {
      final Message message = _message(
        authorName: 'Fluxcord',
        authorAvatar: 'webhook_avatar',
        authorIsBot: true,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, 'Fluxcord');
      expect(actual.avatarUrl, contains('/avatars/99/webhook_avatar.webp'));
    });

    test('uses guild display when cached authorIsBot is false for human', () {
      final Message message = _message(
        authorName: 'Historical Name',
        authorAvatar: 'old_avatar',
        authorIsBot: false,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: humanGuildDisplay,
      );
      expect(actual.displayName, humanGuildDisplay.displayName);
      expect(actual.avatarUrl, humanGuildDisplay.avatarUrl);
    });

    test('uses message display when authorIsBot is false but user is bot', () {
      final Message message = _message(
        authorName: 'Proxy One',
        authorAvatar: 'proxy_one',
        authorIsBot: false,
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, 'Proxy One');
      expect(actual.avatarUrl, contains('/avatars/99/proxy_one.webp'));
    });

    test(
      'uses message display for bot proxy when authorIsBot is persisted',
      () {
        final Message message = _message(
          authorName: 'Proxy One',
          authorAvatar: 'proxy_one',
          authorIsBot: true,
        );
        final GuildUserDisplay actual = resolveMessageAuthorDisplay(
          message: message,
          guildId: guildId,
          guildDisplay: botGuildDisplay,
        );
        expect(actual.displayName, 'Proxy One');
        expect(actual.avatarUrl, contains('/avatars/99/proxy_one.webp'));
      },
    );

    test('uses message display for webhook messages', () {
      final Message message = _message(
        authorName: 'Webhook User',
        authorAvatar: 'hook_avatar',
        authorIsBot: true,
        webhookId: '123456789',
      );
      final GuildUserDisplay actual = resolveMessageAuthorDisplay(
        message: message,
        guildId: guildId,
        guildDisplay: botGuildDisplay,
      );
      expect(actual.displayName, 'Webhook User');
      expect(actual.avatarUrl, contains('/avatars/99/hook_avatar.webp'));
    });
  });

  group('resolveMessageAuthorName', () {
    test('uses username when global name is empty', () {
      expect(
        resolveMessageAuthorName(
          const UserPartialResponse(
            id: '1',
            username: 'proxy_user',
            discriminator: '0000',
            globalName: '',
            avatar: null,
            avatarColor: null,
            flags: 0,
          ),
        ),
        'proxy_user',
      );
    });
  });

  group('mention display name resolution', () {
    test('shortMentionWireIdFallback keeps short ids intact', () {
      expect(shortMentionWireIdFallback('1234567890'), '1234567890');
    });

    test('shortMentionWireIdFallback truncates long snowflakes', () {
      expect(shortMentionWireIdFallback('123456789012345678'), '12345678…');
    });

    test('resolveMentionUserDisplayName uses guild display when present', () {
      const GuildUserDisplay display = GuildUserDisplay(
        displayName: 'ModeratorNick',
        accountDisplayName: 'Global Name',
        avatarUrl: null,
        avatarColor: null,
      );
      expect(
        resolveMentionUserDisplayName(
          userId: '123456789012345678',
          guildDisplay: display,
        ),
        'ModeratorNick',
      );
    });

    test('resolveMentionUserDisplayName falls back to truncated id', () {
      expect(
        resolveMentionUserDisplayName(userId: '123456789012345678'),
        '12345678…',
      );
    });
  });

  group('messageAuthorAvatarDiffers', () {
    test('treats animated prefix hashes as the same avatar', () {
      expect(
        messageAuthorAvatarDiffers(
          messageAvatarHash: 'a_bot_avatar',
          guildAvatarHash: 'bot_avatar',
        ),
        isFalse,
      );
    });

    test('detects different avatar hashes', () {
      expect(
        messageAuthorAvatarDiffers(
          messageAvatarHash: 'proxy_avatar',
          guildAvatarHash: 'bot_avatar',
        ),
        isTrue,
      );
    });
  });

  group('GuildUserDisplay equality', () {
    GuildUserDisplay make({
      String displayName = 'Alice',
      String accountDisplayName = 'alice',
      bool isBot = false,
      String? avatarUrl = 'https://cdn/a.png',
      String? avatarHash = 'hash',
      int? avatarColor = 0x112233,
      String? bannerUrl,
      Color? bannerColor,
      String? bio,
      String? pronouns,
      bool hasGuildProfile = false,
      bool isShowingGlobalProfile = false,
    }) => GuildUserDisplay(
      displayName: displayName,
      accountDisplayName: accountDisplayName,
      isBot: isBot,
      avatarUrl: avatarUrl,
      avatarHash: avatarHash,
      avatarColor: avatarColor,
      bannerUrl: bannerUrl,
      bannerColor: bannerColor,
      bio: bio,
      pronouns: pronouns,
      hasGuildProfile: hasGuildProfile,
      isShowingGlobalProfile: isShowingGlobalProfile,
    );

    test('equal and same hashCode when all display fields match', () {
      expect(make(), make());
      expect(make().hashCode, make().hashCode);
    });

    test('differs when displayName changes', () {
      expect(make(), isNot(make(displayName: 'Bob')));
    });

    test('differs when avatarUrl changes', () {
      expect(make(), isNot(make(avatarUrl: 'https://cdn/b.png')));
    });

    test('differs when avatarColor changes', () {
      expect(make(), isNot(make(avatarColor: 0x445566)));
    });

    test('differs when bannerColor changes', () {
      expect(
        make(bannerColor: const Color(0xFF000000)),
        isNot(make(bannerColor: const Color(0xFFFFFFFF))),
      );
    });
  });
}

Message _message({
  required String authorName,
  required String authorAvatar,
  required bool authorIsBot,
  String? webhookId,
}) {
  return Message(
    id: '1',
    channelId: '2',
    authorId: '99',
    authorName: authorName,
    authorAvatar: authorAvatar,
    authorIsBot: authorIsBot,
    webhookId: webhookId,
    content: 'hello',
    timestamp: DateTime.utc(2026),
  );
}

UserProfileFullResponse _profile({
  GuildMemberResponse? guildMember,
  UserProfileFullResponseGuildMemberProfile? guildProfile,
  String? userAvatar,
  String? userBanner,
  String? userPronouns,
}) {
  return UserProfileFullResponse(
    user: UserProfileFullResponseUser(
      id: '1',
      username: 'user',
      discriminator: '0001',
      globalName: 'Global Name',
      avatar: userAvatar ?? 'user_avatar',
      avatarColor: 0x112233,
      flags: 0,
    ),
    userProfile: UserProfileFullResponseUserProfile(
      bio: 'global bio',
      pronouns: userPronouns,
      banner: userBanner ?? 'user_banner',
      bannerColor: 0x445566,
      accentColor: 0x778899,
    ),
    guildMember: guildMember,
    guildMemberProfile: guildProfile,
    timezoneOffset: null,
  );
}

GuildMemberResponse _guildMember({
  String? nick,
  String? avatar,
  int? profileFlags,
}) {
  return GuildMemberResponse(
    user: const UserPartialResponse(
      id: '1',
      username: 'user',
      discriminator: '0001',
      globalName: 'Global Name',
      avatar: 'user_avatar',
      avatarColor: 0x112233,
      flags: 0,
    ),
    roles: const <String>[],
    joinedAt: DateTime.utc(2024),
    mute: false,
    deaf: false,
    nick: nick,
    avatar: avatar,
    profileFlags: profileFlags,
  );
}

UserProfileFullResponseGuildMemberProfile _guildProfile({
  String? bio,
  String? banner,
  String? pronouns,
}) {
  return UserProfileFullResponseGuildMemberProfile(
    bio: bio,
    pronouns: pronouns,
    banner: banner,
    accentColor: 0x112233,
  );
}

db.User _dbUser() {
  return const db.User(
    id: '1',
    username: 'user',
    discriminator: '0001',
    globalName: 'Global Name',
    avatar: 'user_avatar',
    avatarColor: 0x112233,
    bot: false,
    system: false,
    status: 'online',
    mobile: true,
  );
}

db.Member _dbMember({int? profileFlags, String? serverAvatar}) {
  return db.Member(
    userId: '1',
    guildId: '10',
    serverAvatar: serverAvatar,
    roleIdsJson: '[]',
    profileFlags: profileFlags,
  );
}
