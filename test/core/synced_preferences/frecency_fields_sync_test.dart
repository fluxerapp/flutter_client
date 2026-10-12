import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/channel_frecency.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/mention_frecency.dart';
import 'package:fluxer_app/features/channels/providers/channel_frecency_provider.dart';
import 'package:fluxer_app/features/chat/providers/composer/mention_frecency_provider.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

const int _day = 86400000;
const String _channel = '1558633981610557443';
const String _guild = '1558633981610557440';

void main() {
  group('channel frecency', () {
    test('heat weighs recent uses like web', () {
      final now = DateTime(2026, 10, 12, 12).millisecondsSinceEpoch;
      expect(
        channelFrecencyHeat(
          ChannelFrecencyUse(totalUses: 3, recentUses: [now - 2 * _day, now]),
          now,
        ),
        (3 * (150 / 2)).ceil(),
      );
    });

    test('merge unions uses, keeps the max total and the last ten', () {
      final now = DateTime(2026, 10, 12, 12).millisecondsSinceEpoch;
      final local = {
        'a': ChannelFrecencyUse(
          totalUses: 12,
          recentUses: [for (var i = 0; i < 10; i++) now - (20 - i) * 1000],
        ),
      };
      final incoming = {
        'a': ChannelFrecencyUse(totalUses: 4, recentUses: [now - 500, now]),
        'b': ChannelFrecencyUse(totalUses: 1, recentUses: [now]),
        'c': const ChannelFrecencyUse(totalUses: 0, recentUses: [5]),
      };
      final merged = mergeChannelFrecencyUsage(local, incoming, now);
      expect(merged.keys, ['a', 'b']);
      expect(merged['a']!.totalUses, 12);
      expect(merged['a']!.recentUses.length, kChannelFrecencyMaxSamples);
      expect(merged['a']!.recentUses.last, now);
      expect(mergeChannelFrecencyUsage(incoming, local, now), merged);
    });

    test('tracking caps at 100 by dropping the oldest last use', () {
      final now = DateTime(2026, 10, 12, 12).millisecondsSinceEpoch;
      ChannelFrecencyUsage usage = {
        for (var i = 0; i < 100; i++)
          'k$i': ChannelFrecencyUse(totalUses: 1, recentUses: [now - i * 1000]),
      };
      usage = trackChannelFrecencyUse(usage, 'new', now);
      expect(usage.length, kChannelFrecencyMaxItems);
      expect(usage.containsKey('k99'), isFalse);
      expect(usage.containsKey('new'), isTrue);
    });
  });

  group('mention frecency', () {
    test('records per guild scope and prunes each scope to 100', () {
      final now = DateTime(2026, 10, 12).millisecondsSinceEpoch;
      MentionFrecencyScopes scopes = {};
      for (var i = 0; i < 101; i++) {
        scopes = recordMentionFrecency(
          scopes,
          guildId: 'g',
          userId: 'u$i',
          nowMs: now + i,
        );
      }
      scopes = recordMentionFrecency(
        scopes,
        guildId: null,
        userId: 'dm-user',
        nowMs: now,
      );
      expect(scopes['g']!.length, kMentionFrecencyMaxEntriesPerScope);
      expect(scopes['g']!.containsKey('u0'), isFalse);
      expect(scopes[kMentionFrecencyGlobalScope]!.keys, ['dm-user']);
    });
  });

  group('sync', () {
    late RecordingUsersApi api;
    late ProviderContainer container;
    late SyncedPreferencesStore store;

    setUp(() {
      api = RecordingUsersApi();
      container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          fluxerClientProvider.overrideWithValue(RecordingFluxerClient(api)),
          currentUserIdProvider.overrideWithValue('user-1'),
        ],
      );
      addTearDown(container.dispose);
      store = container.read(syncedPreferencesStoreProvider);
    });

    test('a mobile mention is pushed into the web mention scopes', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          pb.SyncedPreferences(
            mentionFrecency: pb.MentionFrecencyState(
              scopes: [
                pb.MentionFrecencyState_Scope(
                  guildId: _guild,
                  entries: [
                    pb.MentionFrecencyState_Entry(
                      userId: 'web-user',
                      count: 2,
                      lastAtMs: Int64(now),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      container
          .read(mentionFrecencyProvider.notifier)
          .record(guildId: _guild, userId: 'mobile-user');
      await flushSyncedPreferencesDebounce(store);

      final scope = api.lastPush.mentionFrecency.scopes.single;
      expect(scope.guildId, _guild);
      expect(scope.entries.map((e) => e.userId), ['web-user', 'mobile-user']);
      expect(scope.entries.first.count, 2);
    });

    test('channel selections merge with web history and push', () async {
      final now = DateTime.now().millisecondsSinceEpoch;
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          pb.SyncedPreferences(
            channelFrecency: pb.ChannelFrecencyState(
              usage: {
                '1558633981610557445': pb.ChannelFrecencyEntry(
                  totalUses: 7,
                  recentUsesMs: [Int64(now - 1000)],
                ),
              }.entries,
            ),
          ),
        ),
      );
      container
          .read(channelFrecencyProvider.notifier)
          .recordSelection(guildId: _guild, channelId: _channel);
      await flushSyncedPreferencesDebounce(store);

      final usage = api.lastPush.channelFrecency.usage;
      expect(usage.keys.toSet(), {'1558633981610557445', _channel, _guild});
      expect(usage['1558633981610557445']!.totalUses, 7);
      expect(usage[_channel]!.totalUses, 1);
    });

    test('threads stay out of the synced channel history', () async {
      await store.hydrateFromUserSettings(
        syncedPreferencesUserSettings(pb.SyncedPreferences()),
      );
      container
          .read(channelFrecencyProvider.notifier)
          .recordSelection(guildId: '@me', channelId: _channel, isThread: true);
      expect(container.read(channelFrecencyProvider), isEmpty);
    });
  });

  group('account switch', () {
    test('another account never inherits frecency held in memory', () async {
      final api = RecordingUsersApi();
      final switching = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          fluxerClientProvider.overrideWithValue(RecordingFluxerClient(api)),
        ],
      );
      addTearDown(switching.dispose);
      final switchingStore = switching.read(syncedPreferencesStoreProvider);
      switching.read(currentUserIdProvider.notifier).set('user-a');
      await switchingStore.hydrateFromUserSettings(
        syncedPreferencesUserSettings(pb.SyncedPreferences()),
      );
      switching
          .read(channelFrecencyProvider.notifier)
          .recordSelection(guildId: _guild, channelId: _channel);
      switching
          .read(mentionFrecencyProvider.notifier)
          .record(guildId: _guild, userId: 'a-friend');
      await flushSyncedPreferencesDebounce(switchingStore);

      switchingStore.reset();
      switching.read(currentUserIdProvider.notifier).set('user-b');
      final now = DateTime.now().millisecondsSinceEpoch;
      await switchingStore.hydrateFromUserSettings(
        syncedPreferencesUserSettings(
          pb.SyncedPreferences(
            channelFrecency: pb.ChannelFrecencyState(
              usage: {
                '1558633981610557445': pb.ChannelFrecencyEntry(
                  totalUses: 2,
                  recentUsesMs: [Int64(now)],
                ),
              }.entries,
            ),
          ),
        ),
      );
      final pushesBefore = api.pushes.length;
      switching
          .read(mentionFrecencyProvider.notifier)
          .record(guildId: _guild, userId: 'b-friend');
      switching
          .read(channelFrecencyProvider.notifier)
          .recordSelection(guildId: '@me', channelId: '1558633981610557446');
      await flushSyncedPreferencesDebounce(switchingStore);

      final List<pb.SyncedPreferences> pushes = api.pushes
          .skip(pushesBefore)
          .toList();
      expect(pushes, isNotEmpty);
      expect(pushes.last.channelFrecency.usage.keys.toSet(), {
        '1558633981610557445',
        '1558633981610557446',
      });
      expect(
        pushes.last.mentionFrecency.scopes
            .expand((s) => s.entries)
            .map((e) => e.userId),
        ['b-friend'],
      );
    });
  });
}
