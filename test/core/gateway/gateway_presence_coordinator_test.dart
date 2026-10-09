import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/gateway_presence_coordinator.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

class _PresenceTrackingConnection extends GatewayConnection {
  _PresenceTrackingConnection() : super(token: 'test', dio: Dio());

  final List<GatewayPresence> presenceUpdates = <GatewayPresence>[];

  @override
  void updatePresence(GatewayPresence presence) {
    presenceUpdates.add(presence);
    super.updatePresence(presence);
  }
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

  test('marks AFK when backgrounded and clears on foreground', () {
    final _PresenceTrackingConnection connection =
        _PresenceTrackingConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        gatewayConnectionProvider.overrideWithValue(connection),
        gatewayHasAuthTokenProvider.overrideWithValue(true),
        userSettingsStatusProvider.overrideWithValue(_settings()),
        appUiForegroundProvider.overrideWith(AppUiForeground.new),
      ],
    );
    addTearDown(container.dispose);

    container.read(_testGatewayPresenceCoordinatorBinding);
    container.read(appUiForegroundProvider.notifier).setResumed(true);

    expect(connection.presenceUpdates.last.afk, isFalse);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    expect(connection.presenceUpdates.last.afk, isTrue);

    container.read(appUiForegroundProvider.notifier).setResumed(true);
    expect(connection.presenceUpdates.last.afk, isFalse);
  });

  test('re-sends lifecycle presence after gateway session recovery', () {
    final _PresenceTrackingConnection connection =
        _PresenceTrackingConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        gatewayConnectionProvider.overrideWithValue(connection),
        gatewayHasAuthTokenProvider.overrideWithValue(true),
        userSettingsStatusProvider.overrideWithValue(_settings()),
        appUiForegroundProvider.overrideWith(AppUiForeground.new),
      ],
    );
    addTearDown(container.dispose);

    container.read(_testGatewayPresenceCoordinatorBinding);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    container.read(appUiForegroundProvider.notifier).setResumed(false);
    container.read(appUiForegroundProvider.notifier).setResumed(true);

    final int countBeforeRecovery = connection.presenceUpdates.length;
    expect(connection.presenceUpdates.last.afk, isFalse);

    container.read(gatewaySessionRecoveryProvider.notifier).bump();

    expect(connection.presenceUpdates.length, countBeforeRecovery + 1);
    expect(connection.presenceUpdates.last.afk, isFalse);
  });
}
