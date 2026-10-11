import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase, MembersCompanion;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

import '../../../../helpers/open_test_database.dart';

const String _userId = '1000000000000000001';
const String _ownerId = '1000000000000000002';
const String _guildId = '1100000000000000001';
const String _generalId = '1200000000000000001';
const String _rulesId = '1200000000000000002';

class _VerifiedUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: _userId,
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: DateTime.utc(2024),
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    email: 'user@example.com',
    verified: true,
    isProfileLoaded: true,
  );
}

class _HighVerificationGuildList extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: <Guild>[
      Guild(
        id: _guildId,
        name: 'Fluxer HQ',
        ownerId: _ownerId,
        verificationLevel: GuildVerificationLevel.high,
      ),
    ],
  );
}

class _EmptyDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

void main() {
  test('switching channels in a guild that blocks the member never reports '
      'the composer as sendable', () async {
    final FluxerDatabase db = openTestDatabase();
    for (final String channelId in <String>[_generalId, _rulesId]) {
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: _guildId,
          name: channelId,
        ),
      );
    }
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: _userId,
        guildId: _guildId,
        joinedAt: Value(DateTime.now().subtract(const Duration(minutes: 2))),
      ),
    );

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        currentUserIdProvider.overrideWithValue(_userId),
        userSettingsViewModelProvider.overrideWith(_VerifiedUserSettings.new),
        guildListViewModelProvider.overrideWith(_HighVerificationGuildList.new),
        dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
        channelListViewModelProvider.overrideWithValue(
          const ChannelListState(
            guild: null,
            categories: <ChannelCategory>[
              ChannelCategory(
                id: 'text',
                name: 'Text',
                channels: <Channel>[
                  Channel(id: _generalId, guildId: _guildId, name: 'general'),
                  Channel(id: _rulesId, guildId: _guildId, name: 'rules'),
                ],
              ),
            ],
            selectedChannelId: _generalId,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    final ProviderSubscription<AsyncValue<GuildComposerAccess>> general =
        container.listen(guildComposerAccessProvider(_generalId), (_, _) {});
    for (var i = 0; i < 50 && !general.read().hasValue; i++) {
      await pumpEventQueue();
    }
    expect(general.read().value?.canAccess, isFalse);
    expect(
      general.read().value?.reason,
      GuildComposerBlockReason.notMemberLongEnough,
    );

    final ProviderSubscription<AsyncValue<GuildComposerAccess>> rules =
        container.listen(guildComposerAccessProvider(_rulesId), (_, _) {});
    general.close();

    final AsyncValue<GuildComposerAccess> firstFrame = rules.read();
    expect(firstFrame.hasValue, isTrue);
    expect(firstFrame.value?.canAccess, isFalse);
    expect(
      firstFrame.value?.reason,
      GuildComposerBlockReason.notMemberLongEnough,
    );
  });
}
