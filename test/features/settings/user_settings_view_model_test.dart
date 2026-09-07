import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/domain/guild_asset_mode.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

UserSettingsViewState _baseSettings({
  String userId = '1',
  String? avatar,
  String? banner,
  String? selectedGuildId,
  String? guildAvatar,
  String? guildBanner,
  GuildAssetMode guildAvatarMode = GuildAssetMode.inherit,
  GuildAssetMode guildBannerMode = GuildAssetMode.inherit,
  String? editedAvatarBase64,
  String? editedBannerBase64,
  String? editedGuildAvatarBase64,
  String? editedGuildBannerBase64,
  bool avatarCleared = false,
  bool bannerCleared = false,
  bool guildAvatarCleared = false,
  bool guildBannerCleared = false,
}) {
  return UserSettingsViewState(
    userId: userId,
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: avatar,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    banner: banner,
    editedAvatarBase64: editedAvatarBase64,
    editedBannerBase64: editedBannerBase64,
    avatarCleared: avatarCleared,
    bannerCleared: bannerCleared,
    selectedGuildId: selectedGuildId,
    guildAvatar: guildAvatar,
    guildBanner: guildBanner,
    guildAvatarMode: guildAvatarMode,
    guildBannerMode: guildBannerMode,
    editedGuildAvatarBase64: editedGuildAvatarBase64,
    editedGuildBannerBase64: editedGuildBannerBase64,
    guildAvatarCleared: guildAvatarCleared,
    guildBannerCleared: guildBannerCleared,
  );
}

/// Offline stub for `loadProfile()`'s `client.users.getCurrentUser()`. The API
/// call returns a `Future<Never>.error` (bottom type, assignable to any
/// `Future<T>`), so `loadProfile()` suspends at its `await`, lets `build()`
/// return (initializing `state`), then fails asynchronously into its own
/// `on Exception` guard — mirroring a network failure without hitting it.
class _OfflineFluxerClient implements FluxerClient {
  @override
  final UsersApi users = _OfflineUsersApi();

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

class _OfflineUsersApi implements UsersApi {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      Future<Never>.error(Exception('network disabled in test'));
}

void main() {
  group('UserSettingsViewState preview asset getters', () {
    test('global profile uses global avatar and banner fields', () {
      const state = UserSettingsViewState(
        userId: '1',
        username: 'user',
        displayName: 'user',
        discriminator: '0001',
        avatar: 'global_avatar',
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
        banner: 'global_banner',
        editedAvatarBase64: 'data:image/png;base64,abc',
        editedBannerBase64: 'data:image/png;base64,def',
      );

      expect(state.previewAvatarBase64, 'data:image/png;base64,abc');
      expect(state.previewBannerBase64, 'data:image/png;base64,def');
      expect(state.previewAvatarCleared, isFalse);
      expect(state.previewBannerCleared, isFalse);
      expect(state.previewAvatarUrl, contains('/avatars/1/global_avatar.webp'));
      expect(state.previewBannerUrl, contains('/banners/1/global_banner.webp'));
    });

    test('guild custom mode resolves guild avatar and banner URLs', () {
      final state = _baseSettings(
        avatar: 'global_avatar',
        banner: 'global_banner',
        selectedGuildId: '10',
        guildAvatar: 'guild_avatar',
        guildBanner: 'guild_banner',
        guildAvatarMode: GuildAssetMode.custom,
        guildBannerMode: GuildAssetMode.custom,
      );

      expect(state.previewAvatarBase64, isNull);
      expect(state.previewBannerBase64, isNull);
      expect(state.previewAvatarCleared, isFalse);
      expect(state.previewBannerCleared, isFalse);
      expect(
        state.previewAvatarUrl,
        contains('/guilds/10/users/1/avatars/guild_avatar.webp'),
      );
      expect(
        state.previewBannerUrl,
        contains('/guilds/10/users/1/banners/guild_banner.webp'),
      );
    });

    test('animated hashes preview as animated media, fixes #737', () {
      final state = _baseSettings(
        avatar: 'a_global_avatar',
        banner: 'a_global_banner',
      );

      expect(
        state.previewAvatarUrl,
        contains('/avatars/1/a_global_avatar.gif?animated=true'),
      );
      expect(
        state.previewBannerUrl,
        contains('/banners/1/a_global_banner.gif?animated=true'),
      );
      expect(state.avatarUrl, contains('/avatars/1/global_avatar.webp'));

      final guildState = _baseSettings(
        avatar: 'a_global_avatar',
        banner: 'a_global_banner',
        selectedGuildId: '10',
        guildAvatar: 'a_guild_avatar',
        guildBanner: 'a_guild_banner',
        guildAvatarMode: GuildAssetMode.custom,
        guildBannerMode: GuildAssetMode.custom,
      );

      expect(
        guildState.previewAvatarUrl,
        contains('/guilds/10/users/1/avatars/a_guild_avatar.gif?animated=true'),
      );
      expect(
        guildState.previewBannerUrl,
        contains('/guilds/10/users/1/banners/a_guild_banner.gif?animated=true'),
      );
    });

    test('guild inherit mode falls back to global assets', () {
      final state = _baseSettings(
        avatar: 'global_avatar',
        banner: 'global_banner',
        selectedGuildId: '10',
        guildAvatar: 'guild_avatar',
        guildBanner: 'guild_banner',
      );

      expect(state.previewAvatarUrl, contains('/avatars/1/global_avatar.webp'));
      expect(state.previewBannerUrl, contains('/banners/1/global_banner.webp'));
    });

    test('guild unset mode clears avatar and banner preview', () {
      final state = _baseSettings(
        avatar: 'global_avatar',
        banner: 'global_banner',
        selectedGuildId: '10',
        guildAvatar: 'guild_avatar',
        guildBanner: 'guild_banner',
        guildAvatarMode: GuildAssetMode.unset,
        guildBannerMode: GuildAssetMode.unset,
      );

      expect(state.previewAvatarBase64, isNull);
      expect(state.previewBannerBase64, isNull);
      expect(state.previewAvatarUrl, isNull);
      expect(state.previewBannerUrl, isNull);
      expect(state.previewAvatarCleared, isTrue);
      expect(state.previewBannerCleared, isTrue);
    });

    test('guild custom mode prefers pending base64 uploads', () {
      final state = _baseSettings(
        selectedGuildId: '10',
        guildAvatar: 'guild_avatar',
        guildBanner: 'guild_banner',
        guildAvatarMode: GuildAssetMode.custom,
        guildBannerMode: GuildAssetMode.custom,
        editedGuildAvatarBase64: 'data:image/png;base64,guild-avatar',
        editedGuildBannerBase64: 'data:image/png;base64,guild-banner',
      );

      expect(state.previewAvatarBase64, 'data:image/png;base64,guild-avatar');
      expect(state.previewBannerBase64, 'data:image/png;base64,guild-banner');
      expect(state.previewAvatarUrl, isNull);
      expect(state.previewBannerUrl, isNull);
      expect(state.previewAvatarCleared, isFalse);
      expect(state.previewBannerCleared, isFalse);
    });

    test('guild custom mode cleared assets hide preview media', () {
      final state = _baseSettings(
        selectedGuildId: '10',
        guildAvatar: 'guild_avatar',
        guildBanner: 'guild_banner',
        guildAvatarMode: GuildAssetMode.custom,
        guildBannerMode: GuildAssetMode.custom,
        guildAvatarCleared: true,
        guildBannerCleared: true,
      );

      expect(state.previewAvatarUrl, isNull);
      expect(state.previewBannerUrl, isNull);
      expect(state.previewAvatarCleared, isTrue);
      expect(state.previewBannerCleared, isTrue);
    });
  });

  test('userSettingsViewModel does not rebuild on presence-only writes but '
      'does on display changes', () async {
    final db = openTestDatabase();
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'u1', username: 'alice'),
    );
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'u2', username: 'bob'),
    );

    final container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        fluxerClientProvider.overrideWithValue(_OfflineFluxerClient()),
      ],
    );
    addTearDown(container.dispose);

    // Drive the view model to watch the current user 'u1'.
    container.read(currentUserIdProvider.notifier).set('u1');

    var notifyCount = 0;
    final sub = container.listen(
      userSettingsViewModelProvider,
      (previous, next) => notifyCount++,
    );
    addTearDown(sub.close);

    // Let the watched user-row stream populate the state once.
    await pumpEventQueue();
    expect(container.read(userSettingsViewModelProvider).displayName, 'alice');
    final baseline = notifyCount;

    // Presence-only write to the current user re-emits the row but no
    // consumed field changes -> distinct projection filters it -> no notify.
    await db.userDao.updateUserPresence('u1', status: 'idle');
    await pumpEventQueue();
    expect(
      notifyCount,
      baseline,
      reason: 'self presence-only change must not notify',
    );

    // Presence write to a DIFFERENT user still invalidates the users table
    // (Drift streams are table-granular), re-emitting the current-user row
    // with identical projected fields -> distinct also filters this -> no
    // notify. This is the real PRESENCE_UPDATE storm being suppressed.
    await db.userDao.updateUserPresence('u2', status: 'dnd');
    await pumpEventQueue();
    expect(
      notifyCount,
      baseline,
      reason: "another user's presence write must not notify settings",
    );

    // A real display-field change must still propagate to the state.
    await db.userDao.upsertUser(
      UsersCompanion.insert(id: 'u1', username: 'alice2'),
    );
    await pumpEventQueue();
    expect(container.read(userSettingsViewModelProvider).displayName, 'alice2');
    expect(notifyCount, greaterThan(baseline));
  });

  test('reset clears isSaving for per-guild profile', () {
    final container = ProviderContainer(
      overrides: [
        userSettingsViewModelProvider.overrideWith(
          _PerGuildSavingUserSettings.new,
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(userSettingsViewModelProvider).isSaving, isTrue);

    container.read(userSettingsViewModelProvider.notifier).reset();

    expect(container.read(userSettingsViewModelProvider).isSaving, isFalse);
  });
}

class _PerGuildSavingUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: '1',
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
    selectedGuildId: 'guild1',
    isSaving: true,
  );
}
