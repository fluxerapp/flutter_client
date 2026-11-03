import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/domain/privacy_permission.dart';
import 'package:fluxer_app/features/settings/providers/view_models/privacy_dashboard_view_model.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/synced_preferences_test_helpers.dart';

const _userA = '100000000000000001';
const _userB = '200000000000000002';

class _Account {
  _Account({required this.incomingCallFlags, this.fetchGate});

  int incomingCallFlags;
  Completer<void>? fetchGate;
}

class _UsersApi implements UsersApi {
  _UsersApi(this.accounts);

  final Map<String, _Account> accounts;
  String active = _userA;

  @override
  Future<UserSettingsResponse> getCurrentUserSettings() async {
    final _Account account = accounts[active]!;
    await account.fetchGate?.future;
    return _settings(account.incomingCallFlags);
  }

  @override
  Future<UserPrivateResponse> getCurrentUser() async {
    final _Account account = accounts[active]!;
    await account.fetchGate?.future;
    return UserPrivateResponse.fromJson(<String, Object?>{
      ..._privateUserJson,
      'id': active,
    });
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _Client extends FluxerClient {
  _Client(this._users) : super(Dio());

  final UsersApi _users;

  @override
  UsersApi get users => _users;
}

UserSettingsResponse _settings(int incomingCallFlags) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': encodeSyncedPreferences(pb.SyncedPreferences()),
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
    'incoming_call_flags': incomingCallFlags,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'afk_timeout': 600,
    'time_format': 0,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'default_share_voice_activity': false,
  });
}

const Map<String, Object?> _privateUserJson = <String, Object?>{
  'id': _userA,
  'username': 'tester',
  'discriminator': '0001',
  'global_name': null,
  'avatar': null,
  'avatar_color': null,
  'bot': false,
  'system': false,
  'flags': 0,
  'is_staff': false,
  'acls': <String>[],
  'traits': <String>[],
  'email': null,
  'phone': null,
  'bio': null,
  'pronouns': null,
  'accent_color': null,
  'banner': null,
  'banner_color': null,
  'mfa_enabled': false,
  'verified': true,
  'has_verified_phone': false,
  'premium_type': null,
  'premium_since': null,
  'premium_until': null,
  'premium_will_cancel': false,
  'premium_billing_cycle': null,
  'premium_lifetime_sequence': null,
  'premium_badge_hidden': false,
  'premium_badge_masked': false,
  'premium_badge_timestamp_hidden': false,
  'premium_badge_sequence_hidden': false,
  'premium_purchase_disabled': false,
  'premium_enabled_override': false,
  'premium_discriminator': false,
  'premium_perks_disabled': false,
  'password_last_changed_at': null,
  'required_actions': <String>[],
  'nsfw_allowed': true,
  'has_dismissed_premium_onboarding': false,
  'has_ever_purchased': false,
  'has_unread_gift_inventory': false,
  'unread_gift_inventory_count': 0,
  'used_mobile_client': true,
  'pending_bulk_message_deletion': null,
  'last_voice_activity_sharing_change_at': null,
};

void main() {
  test('privacy settings follow the active account', () async {
    final _UsersApi api = _UsersApi(<String, _Account>{
      _userA: _Account(incomingCallFlags: IncomingCallFlag.nobody),
      _userB: _Account(incomingCallFlags: IncomingCallFlag.everyone),
    });
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerClientProvider.overrideWithValue(_Client(api))],
    );
    addTearDown(container.dispose);

    container.read(currentUserIdProvider.notifier).set(_userA);
    final ProviderSubscription<PrivacyDashboardViewState> sub = container
        .listen(privacyDashboardViewModelProvider(_userA), (_, _) {});
    addTearDown(sub.close);
    await drainAsyncWork();

    expect(
      container
          .read(privacyDashboardViewModelProvider(_userA))
          .incomingCallFlags,
      IncomingCallFlag.nobody,
    );

    api.active = _userB;
    container.read(currentUserIdProvider.notifier).set(_userB);
    final ProviderSubscription<PrivacyDashboardViewState> subB = container
        .listen(privacyDashboardViewModelProvider(_userB), (_, _) {});
    addTearDown(subB.close);
    await drainAsyncWork();

    expect(
      container
          .read(privacyDashboardViewModelProvider(_userB))
          .incomingCallFlags,
      IncomingCallFlag.everyone,
    );
    expect(
      container.read(privacyDashboardViewModelProvider(_userB)).isLoading,
      isFalse,
    );
  });

  test('a privacy fetch for the previous account does not replace the '
      'current one', () async {
    final Completer<void> accountAGate = Completer<void>();
    final _UsersApi api = _UsersApi(<String, _Account>{
      _userA: _Account(
        incomingCallFlags: IncomingCallFlag.nobody,
        fetchGate: accountAGate,
      ),
      _userB: _Account(incomingCallFlags: IncomingCallFlag.everyone),
    });
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerClientProvider.overrideWithValue(_Client(api))],
    );
    addTearDown(container.dispose);

    container.read(currentUserIdProvider.notifier).set(_userA);
    final ProviderSubscription<PrivacyDashboardViewState> sub = container
        .listen(privacyDashboardViewModelProvider(_userA), (_, _) {});
    addTearDown(sub.close);
    await drainAsyncWork();

    api.active = _userB;
    container.read(currentUserIdProvider.notifier).set(_userB);
    final ProviderSubscription<PrivacyDashboardViewState> subB = container
        .listen(privacyDashboardViewModelProvider(_userB), (_, _) {});
    addTearDown(subB.close);
    await drainAsyncWork();
    expect(
      container
          .read(privacyDashboardViewModelProvider(_userB))
          .incomingCallFlags,
      IncomingCallFlag.everyone,
    );

    accountAGate.complete();
    await drainAsyncWork();

    expect(
      container
          .read(privacyDashboardViewModelProvider(_userB))
          .incomingCallFlags,
      IncomingCallFlag.everyone,
    );
  });
}
