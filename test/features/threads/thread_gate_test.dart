import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _RecordingAdapter implements HttpClientAdapter {
  final List<String> paths = <String>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    paths.add(options.path);
    return ResponseBody.fromString('', 204);
  }

  @override
  void close({bool force = false}) {}
}

const Map<String, Object?> _threadJson = <String, Object?>{
  'id': 't1',
  'type': 11,
  'guild_id': 'g1',
  'parent_id': 'c1',
  'name': 'thread',
};

class _FlipAdapter implements HttpClientAdapter {
  _FlipAdapter(this.onFetch, {this.channel = _threadJson});

  final void Function() onFetch;
  final Map<String, Object?> channel;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    onFetch();
    return ResponseBody.fromString(
      jsonEncode(channel),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('ThreadsGate', () {
    test('reports transitions and fails closed on reset', () {
      final ThreadsGate gate = ThreadsGate();
      var notified = 0;
      gate.addListener(() => notified++);

      expect(gate.isActive('g1'), isFalse);
      expect(gate.apply('g1', active: true), ThreadGateTransition.activated);
      expect(gate.apply('g1', active: true), ThreadGateTransition.unchanged);
      expect(gate.isActive('g1'), isTrue);
      expect(gate.apply('g1', active: false), ThreadGateTransition.deactivated);
      gate
        ..apply('g2', active: true)
        ..resetConnection();

      expect(gate.anyActive, isFalse);
      expect(notified, 4);
    });

    test('providers follow the gate', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final ThreadsGate gate = container.read(threadsGateProvider);

      expect(container.read(threadChannelsActiveProvider('g1')), isFalse);
      gate.apply('g1', active: true);
      expect(container.read(threadChannelsActiveProvider('g1')), isTrue);
      expect(container.read(threadChannelsActiveProvider('g2')), isFalse);
      expect(container.read(anyThreadChannelsActiveProvider), isTrue);
      gate.resetConnection();
      expect(container.read(threadChannelsActiveProvider('g1')), isFalse);
    });
  });

  group('op 14', () {
    test('inactive guilds send the unchanged lazy request', () {
      expect(guildSyncSubscription(threads: false).toJson(), <String, Object?>{
        'active': true,
        'sync': true,
      });
    });

    test('active guilds subscribe to threads', () {
      expect(guildSyncSubscription(threads: true).toJson(), <String, Object?>{
        'active': true,
        'sync': true,
        'threads': true,
      });
    });

    test('a flip off sends explicit false and clears member lists', () {
      expect(
        threadGateFlipSubscription(active: false).toJson(),
        <String, Object?>{'threads': false, 'thread_member_lists': <String>[]},
      );
      expect(
        threadGateFlipSubscription(active: true).toJson(),
        <String, Object?>{'threads': true},
      );
    });
  });

  test('capability markers are advertised', () {
    expect(
      buildFluxerApiFeaturesHeaderValue().split(', '),
      contains('channel_threads'),
    );
    expect(kGatewayChannelThreads, 1 << 2);
  });

  test('thread REST is refused while the guild is inactive', () async {
    final _RecordingAdapter adapter = _RecordingAdapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = adapter;
    final ThreadsGate gate = ThreadsGate();
    final ThreadsRepository repository = ThreadsRepository(
      FluxerClient(dio),
      openTestDatabase(),
      gate,
    );

    await expectLater(
      repository.join(guildId: 'g1', threadId: 't1'),
      throwsA(isA<ThreadsInactiveException>()),
    );
    expect(adapter.paths, isEmpty);

    gate.apply('g1', active: true);
    await repository.join(guildId: 'g1', threadId: 't1');
    expect(adapter.paths, hasLength(1));
  });

  test('a no-op thread settings update answers 204 without failing', () async {
    final _RecordingAdapter adapter = _RecordingAdapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = adapter;
    final FluxerDatabase database = openTestDatabase();
    final ThreadsRepository repository = ThreadsRepository(
      FluxerClient(dio),
      database,
      ThreadsGate()..apply('g1', active: true),
    );

    final ThreadMemberResponse? member = await repository.updateSettings(
      guildId: 'g1',
      threadId: 't1',
      body: ThreadMemberSettingsRequest(flags: 2),
    );

    expect(member, isNull);
    expect(adapter.paths, <String>['/channels/t1/thread-members/@me/settings']);
    expect(await database.threadDao.getMember('t1'), isNull);
  });

  test('a thread settings update stores the returned member', () async {
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = _FlipAdapter(
        () {},
        channel: <String, Object?>{
          'id': 't1',
          'user_id': 'u1',
          'join_timestamp': '2026-09-29T00:00:00.000Z',
          'flags': 2,
        },
      );
    final FluxerDatabase database = openTestDatabase();
    final ThreadsRepository repository = ThreadsRepository(
      FluxerClient(dio),
      database,
      ThreadsGate()..apply('g1', active: true),
    );

    final ThreadMemberResponse? member = await repository.updateSettings(
      guildId: 'g1',
      threadId: 't1',
      body: ThreadMemberSettingsRequest(flags: 2),
    );

    expect(member?.flags, 2);
    expect(await database.threadDao.getMember('t1'), isNotNull);
  });

  test('a gate flip during a thread fetch drops the result', () async {
    final ThreadsGate gate = ThreadsGate()..apply('g1', active: true);
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = _FlipAdapter(() => gate.apply('g1', active: false));
    final FluxerDatabase database = openTestDatabase();
    final ThreadsRepository repository = ThreadsRepository(
      FluxerClient(dio),
      database,
      gate,
    );

    await expectLater(
      repository.fetch(guildId: 'g1', threadId: 't1'),
      throwsA(isA<ThreadsInactiveException>()),
    );
    expect(await database.channelDao.getChannelById('t1'), isNull);
  });

  test('a fetch stores only threads of the route guild', () async {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    addTearDown(
      () => driftRuntimeOptions.dontWarnAboutMultipleDatabases = false,
    );
    final ThreadsGate gate = ThreadsGate()..apply('g1', active: true);
    Future<FluxerDatabase> fetchWith(Map<String, Object?> channel) async {
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
        ..httpClientAdapter = _FlipAdapter(() {}, channel: channel);
      final FluxerDatabase database = openTestDatabase();
      await ThreadsRepository(
        FluxerClient(dio),
        database,
        gate,
      ).fetch(guildId: 'g1', threadId: 't1');
      return database;
    }

    final FluxerDatabase stored = await fetchWith(_threadJson);
    expect(await stored.channelDao.getChannelById('t1'), isNotNull);

    final FluxerDatabase otherGuild = await fetchWith(<String, Object?>{
      ..._threadJson,
      'guild_id': 'g2',
    });
    expect(await otherGuild.channelDao.getChannelById('t1'), isNull);

    final FluxerDatabase textChannel = await fetchWith(<String, Object?>{
      ..._threadJson,
      'type': 0,
    });
    expect(await textChannel.channelDao.getChannelById('t1'), isNull);
  });
}
