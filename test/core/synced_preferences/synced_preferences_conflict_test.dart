import 'dart:async';
import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

class _ServerUsersApi implements UsersApi {
  _ServerUsersApi(this.blob);

  String blob;
  final List<pb.SyncedPreferences> accepted = [];
  int conflicts = 0;

  Future<void> writeFromOtherDevice(
    void Function(pb.SyncedPreferences preferences) edit,
  ) async {
    final pb.SyncedPreferences preferences = pb.SyncedPreferences.fromBuffer(
      base64Decode(blob),
    );
    edit(preferences);
    blob = encodeSyncedPreferences(preferences);
  }

  @override
  Future<UserSettingsResponse> getCurrentUserSettings() async =>
      testUserSettingsWithSyncedBlob(blob);

  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    UserSettingsUpdateRequest? body,
  }) async {
    final Hash current = await Sha256().hash(base64Decode(blob));
    final String currentHex = [
      for (final int byte in current.bytes)
        byte.toRadixString(16).padLeft(2, '0'),
    ].join();
    if (body?.syncedPreferencesBaseHash != currentHex) {
      conflicts++;
      final requestOptions = RequestOptions(path: '/users/@me/settings');
      throw DioException(
        requestOptions: requestOptions,
        response: Response<Map<String, dynamic>>(
          requestOptions: requestOptions,
          statusCode: 409,
          data: {'code': 'SYNCED_PREFERENCES_CONFLICT'},
        ),
        type: DioExceptionType.badResponse,
      );
    }
    blob = body!.syncedPreferences.value!;
    accepted.add(pb.SyncedPreferences.fromBuffer(base64Decode(blob)));
    return testUserSettingsWithSyncedBlob(blob);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _ServerClient extends FluxerClient {
  _ServerClient(this._users) : super(Dio());

  final UsersApi _users;

  @override
  UsersApi get users => _users;
}

class _GatedChannelFrecencyAdapter
    extends SyncedFieldAdapter<pb.ChannelFrecencyState> {
  Completer<void>? gate;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.channelFrecency;

  @override
  pb.ChannelFrecencyState readLocal() => pb.ChannelFrecencyState();

  @override
  Future<pb.ChannelFrecencyState> readLocalValue() async {
    await gate?.future;
    return readLocal();
  }

  @override
  Future<void> applyRemote(pb.ChannelFrecencyState value) async {}

  @override
  pb.ChannelFrecencyState? readFromProto(pb.SyncedPreferences message) => null;

  @override
  $pb.GeneratedMessage toProtoMessage(pb.ChannelFrecencyState local) => local;

  @override
  bool statesEqual(pb.ChannelFrecencyState a, pb.ChannelFrecencyState b) =>
      true;

  @override
  bool verifyRoundtrip(pb.ChannelFrecencyState candidate) => true;

  @override
  bool hasLocalData(pb.ChannelFrecencyState local) => false;
}

pickers_pb.FavoriteGifEntry _gif(String id) => pickers_pb.FavoriteGifEntry(
  url: 'https://media.example/$id.gif',
  proxyUrl: 'https://proxy.example/$id.gif',
  width: 100,
  height: 100,
);

List<String> _gifUrls(pb.SyncedPreferences preferences) =>
    preferences.favoriteGifs.entries.map((entry) => entry.url).toList();

void main() {
  late _ServerUsersApi server;
  late ProviderContainer container;
  late SyncedPreferencesStore store;

  Future<void> start(pb.SyncedPreferences initial) async {
    final database = openTestDatabase();
    server = _ServerUsersApi(encodeSyncedPreferences(initial));
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerClientProvider.overrideWithValue(_ServerClient(server)),
        currentUserIdProvider.overrideWithValue('user-1'),
      ],
    );
    addTearDown(container.dispose);
    await container.read(appearancePreferencesProvider.notifier).load('user-1');
    store = container.read(syncedPreferencesStoreProvider);
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(server.blob),
    );
    await drainAsyncWork();
  }

  Future<void> deliverServerUpdate() async {
    await store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(server.blob),
    );
    await drainAsyncWork();
  }

  void addGif(String id) {
    container
        .read(favoriteGifsProvider.notifier)
        .addFromMessageMedia(
          url: 'https://media.example/$id.gif',
          proxyUrl: 'https://proxy.example/$id.gif',
          width: 100,
          height: 100,
        );
  }

  test('changes from another device right after a push are kept', () async {
    await start(
      pb.SyncedPreferences(
        favoriteGifs: pickers_pb.FavoriteGifSettings(entries: [_gif('g1')]),
        accessibility: accessibility_pb.AccessibilitySettings(
          showFavorites: true,
        ),
      ),
    );

    addGif('g2');
    await flushSyncedPreferencesDebounce(store);
    await server.writeFromOtherDevice((preferences) {
      preferences.favoriteGifs.entries.add(_gif('d3'));
      preferences.accessibility.showFavorites = false;
    });
    await deliverServerUpdate();

    expect(container.read(appearancePreferencesProvider).showFavorites, false);
    await container
        .read(appearancePreferencesProvider.notifier)
        .setHideKeyboardHints(value: true);
    await flushSyncedPreferencesDebounce(store);

    final pb.SyncedPreferences pushed = server.accepted.last;
    expect(_gifUrls(pushed), [
      'https://media.example/g1.gif',
      'https://media.example/g2.gif',
      'https://media.example/d3.gif',
    ]);
    expect(pushed.accessibility.showFavorites, isFalse);
    expect(pushed.accessibility.hideKeyboardHints, isTrue);
  });

  test(
    'a stale copy of the pushed snapshot does not revert the push',
    () async {
      await start(
        pb.SyncedPreferences(
          favoriteGifs: pickers_pb.FavoriteGifSettings(entries: [_gif('g1')]),
        ),
      );
      final String beforePush = server.blob;

      addGif('g2');
      await flushSyncedPreferencesDebounce(store);
      await store.hydrateFromUserSettings(
        testUserSettingsWithSyncedBlob(beforePush),
      );
      await drainAsyncWork();

      expect(container.read(favoriteGifsProvider).entries, hasLength(2));
      expect(server.accepted, hasLength(1));
    },
  );

  test('a conflicting push refetches, merges and retries on the newer '
      'snapshot', () async {
    await start(
      pb.SyncedPreferences(
        emojiPicker: pickers_pb.EmojiPickerState(
          favoriteEmojiIds: ['unicode:heart'],
        ),
        favoriteGifs: pickers_pb.FavoriteGifSettings(entries: [_gif('g1')]),
      ),
    );
    await server.writeFromOtherDevice((preferences) {
      preferences.favoriteGifs.entries.add(_gif('d2'));
      preferences.emojiPicker.favoriteEmojiIds.add('unicode:star');
    });

    await container
        .read(favoriteEmojiKeysProvider.notifier)
        .toggle('unicode:tada');
    await flushSyncedPreferencesDebounce(store);
    expect(server.conflicts, 1);
    await flushSyncedPreferencesDebounce(store);

    final pb.SyncedPreferences stored = pb.SyncedPreferences.fromBuffer(
      base64Decode(server.blob),
    );
    expect(server.accepted, hasLength(1));
    expect(_gifUrls(stored), [
      'https://media.example/g1.gif',
      'https://media.example/d2.gif',
    ]);
    expect(
      stored.emojiPicker.favoriteEmojiIds,
      containsAll(<String>['unicode:heart', 'unicode:star', 'unicode:tada']),
    );
  });

  test('a push never runs while a hydrate is reconciling', () async {
    final database = openTestDatabase();
    server = _ServerUsersApi('');
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerClientProvider.overrideWithValue(_ServerClient(server)),
        currentUserIdProvider.overrideWithValue('user-1'),
      ],
    );
    addTearDown(container.dispose);
    store = container.read(syncedPreferencesStoreProvider);
    final gated = _GatedChannelFrecencyAdapter()..gate = Completer<void>();
    store.registerAdapter(gated);
    await server.writeFromOtherDevice((preferences) {
      preferences.favoriteGifs = pickers_pb.FavoriteGifSettings(
        entries: [for (var i = 0; i < 5; i++) _gif('g$i')],
      );
    });

    await container.read(soundPreferencesProvider.notifier).setMasterVolume(80);
    final Future<void> hydrate = store.hydrateFromUserSettings(
      testUserSettingsWithSyncedBlob(server.blob),
    );
    await drainAsyncWork();
    await flushSyncedPreferencesDebounce(store);
    expect(server.accepted, isEmpty);

    gated.gate!.complete();
    await hydrate;
    await flushSyncedPreferencesDebounce(store);

    expect(server.accepted, isNotEmpty);
    for (final pb.SyncedPreferences push in server.accepted) {
      expect(push.favoriteGifs.entries, hasLength(5));
    }
    expect(server.accepted.last.sound.masterVolume, 80);
  });
}
