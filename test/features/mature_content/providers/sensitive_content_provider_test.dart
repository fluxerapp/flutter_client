import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_platform_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/test_account_user_id.dart';

class _AdultUser extends CurrentUserPrivateRead {
  _AdultUser({this.matureContentUnlocked});

  final bool? matureContentUnlocked;

  @override
  UserPrivateResponse? build(String accountUserId) =>
      _adult(matureContentUnlocked: matureContentUnlocked);
}

Future<SensitiveContentState> _resolve({
  required UserSettingsResponse? settings,
  bool appStorePolicy = true,
  MatureGeoStatus geo = MatureGeoStatus.none,
  bool? matureContentUnlocked,
  DeclaredAgeFloor floor = DeclaredAgeFloor.none,
}) async {
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      matureContentAppStorePolicyProvider.overrideWithValue(appStorePolicy),
      currentUserPrivateReadProvider(kTestAccountUserId).overrideWith(
        () => _AdultUser(matureContentUnlocked: matureContentUnlocked),
      ),
      userSettingsStatusProvider.overrideWithValue(settings),
      matureGeoStatusProvider.overrideWith(
        (ref) => Future<MatureGeoStatus>.value(geo),
      ),
      declaredAgeFloorProvider.overrideWithValue(floor),
    ],
  );
  addTearDown(container.dispose);
  container.listen(sensitiveContentProvider, (_, _) {});
  await container.read(matureGeoStatusProvider.future);
  return container.read(sensitiveContentProvider);
}

void main() {
  test('iOS store policy locks an adult without the opt-in', () async {
    final SensitiveContentState state = await _resolve(
      settings: _settings(allowMatureContentOnIos: false),
    );
    expect(state.access, MatureAccess.appLocked);
    expect(state.showLocked, isTrue);
  });

  test('iOS store policy locks an adult before settings load', () async {
    final SensitiveContentState state = await _resolve(settings: null);
    expect(state.access, MatureAccess.appLocked);
    expect(state.showLocked, isTrue);
  });

  test('the web opt-in unlocks an adult on iOS', () async {
    final SensitiveContentState state = await _resolve(
      settings: _settings(allowMatureContentOnIos: true),
    );
    expect(state.access, MatureAccess.allowed);
    expect(state.showLocked, isFalse);
  });

  test(
    'a restricted region unlocks once the server reports an adult',
    () async {
      final UserSettingsResponse settings = _settings(
        allowMatureContentOnIos: true,
      );
      for (final bool appStorePolicy in <bool>[true, false]) {
        expect(
          (await _resolve(
            settings: settings,
            appStorePolicy: appStorePolicy,
            geo: MatureGeoStatus.restricted,
          )).access,
          MatureAccess.regionLocked,
        );
        expect(
          (await _resolve(
            settings: settings,
            appStorePolicy: appStorePolicy,
            geo: MatureGeoStatus.restricted,
            matureContentUnlocked: true,
          )).access,
          MatureAccess.allowed,
        );
      }
    },
  );

  test('an age range under 18 on the device keeps 18+ off', () async {
    final SensitiveContentState state = await _resolve(
      settings: _settings(allowMatureContentOnIos: true),
      geo: MatureGeoStatus.restricted,
      matureContentUnlocked: true,
      floor: DeclaredAgeFloor.minor,
    );
    expect(state.access, MatureAccess.minor);
  });
}

UserPrivateResponse _adult({bool? matureContentUnlocked}) =>
    UserPrivateResponse.fromJson({
      'mature_content_unlocked': ?matureContentUnlocked,
      'id': '100',
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
    });

UserSettingsResponse _settings({required bool allowMatureContentOnIos}) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': 'online',
    'theme': 'dark',
    'locale': 'en-US',
    'time_format': 0,
    'render_embeds': true,
    'render_reactions': true,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': null,
    'afk_timeout': 300,
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
    'profile_privacy': 0,
    'privacy_setup_version': 0,
    'synced_preferences': '',
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'allow_mature_content_on_ios': allowMatureContentOnIos,
    'bot_default_guilds_restricted': false,
  });
}
