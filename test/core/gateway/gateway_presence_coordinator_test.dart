import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/gateway_presence_coordinator.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

class _PresenceTrackingConnection extends GatewayConnection {
  _PresenceTrackingConnection([this._log]) : super(token: 'test', dio: Dio());

  final List<String>? _log;
  final List<GatewayPresence> presenceUpdates = <GatewayPresence>[];

  @override
  void updatePresence(GatewayPresence presence) {
    presenceUpdates.add(presence);
    _log?.add('presence afk=${presence.afk}');
    super.updatePresence(presence);
  }
}

class _HeldAckAdapter implements HttpClientAdapter {
  _HeldAckAdapter(this._log);

  final List<String> _log;
  final Completer<void> release = Completer<void>();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    _log.add('ack sent');
    await release.future;
    _log.add('ack done');
    return ResponseBody.fromString(
      '{"read_states":[],"read_state_proto":""}',
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

AckBatcher _ackBatcher(HttpClientAdapter adapter) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  return AckBatcher(client: FluxerClient(dio));
}

List<Override> _overrides(
  _PresenceTrackingConnection connection, {
  AckBatcher? ackBatcher,
}) {
  return <Override>[
    gatewayConnectionProvider.overrideWithValue(connection),
    gatewayHasAuthTokenProvider.overrideWithValue(true),
    userSettingsStatusProvider.overrideWithValue(_settings()),
    appUiForegroundProvider.overrideWith(AppUiForeground.new),
    ackBatcherProvider.overrideWithValue(
      ackBatcher ?? _ackBatcher(_HeldAckAdapter(<String>[])),
    ),
  ];
}

UserSettingsResponse _settings({String status = 'online'}) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': status,
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': '',
    'render_embeds': true,
    'profile_privacy': 0,
    'privacy_setup_version': 0,
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'render_reactions': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 600,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'time_format': 0,
  });
}

final Provider<void> _testGatewayPresenceCoordinatorBinding = Provider<void>((
  Ref ref,
) {
  bindGatewayPresenceCoordinator(ref, mobileOs: true);
});

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('marks AFK when backgrounded and clears on foreground', () async {
    final _PresenceTrackingConnection connection =
        _PresenceTrackingConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: _overrides(connection),
    );
    addTearDown(container.dispose);

    container.read(_testGatewayPresenceCoordinatorBinding);
    container.read(appUiForegroundProvider.notifier).setResumed(true);

    expect(connection.presenceUpdates.last.afk, isFalse);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await pumpEventQueue();
    expect(connection.presenceUpdates.last.afk, isTrue);

    container.read(appUiForegroundProvider.notifier).setResumed(true);
    expect(connection.presenceUpdates.last.afk, isFalse);
  });

  test('re-sends lifecycle presence after gateway session recovery', () async {
    final _PresenceTrackingConnection connection =
        _PresenceTrackingConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: _overrides(connection),
    );
    addTearDown(container.dispose);

    container.read(_testGatewayPresenceCoordinatorBinding);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await pumpEventQueue();
    container.read(appUiForegroundProvider.notifier).setResumed(true);

    final int countBeforeRecovery = connection.presenceUpdates.length;
    expect(connection.presenceUpdates.last.afk, isFalse);

    container.read(gatewaySessionRecoveryProvider.notifier).bump();

    expect(connection.presenceUpdates.length, countBeforeRecovery + 1);
    expect(connection.presenceUpdates.last.afk, isFalse);
  });

  test('delivers pending read acks before marking AFK on background', () async {
    final List<String> log = <String>[];
    final _HeldAckAdapter adapter = _HeldAckAdapter(log);
    final _PresenceTrackingConnection connection = _PresenceTrackingConnection(
      log,
    );
    final ProviderContainer container = ProviderContainer(
      overrides: _overrides(connection, ackBatcher: _ackBatcher(adapter)),
    );
    addTearDown(container.dispose);

    container.read(_testGatewayPresenceCoordinatorBinding);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    container
        .read(ackBatcherProvider)
        .queue(
          channelId: '100',
          messageId: '200',
          immediate: false,
          hadMentions: false,
        );
    log.clear();

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await pumpEventQueue();
    expect(log, <String>['ack sent']);

    adapter.release.complete();
    await pumpEventQueue();
    expect(log, <String>['ack sent', 'ack done', 'presence afk=true']);
  });

  test('marks AFK when a background ack flush never answers', () {
    fakeAsync((FakeAsync async) {
      final List<String> log = <String>[];
      final _PresenceTrackingConnection connection =
          _PresenceTrackingConnection(log);
      final ProviderContainer container = ProviderContainer(
        overrides: _overrides(
          connection,
          ackBatcher: _ackBatcher(_HeldAckAdapter(log)),
        ),
      );
      addTearDown(container.dispose);

      container.read(_testGatewayPresenceCoordinatorBinding);
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      container
          .read(ackBatcherProvider)
          .queue(
            channelId: '100',
            messageId: '200',
            immediate: false,
            hadMentions: false,
          );
      log.clear();

      container.read(appUiForegroundProvider.notifier).setResumed(false);
      async.elapse(const Duration(seconds: 4));
      expect(log, <String>['ack sent']);

      async.elapse(const Duration(seconds: 2));
      expect(log, <String>['ack sent', 'presence afk=true']);
    });
  });
}
