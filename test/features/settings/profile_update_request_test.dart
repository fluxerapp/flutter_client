import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('buildCurrentUserProfileUpdateRequest', () {
    test('only includes fields that changed', () {
      final state = const UserSettingsViewState(
        userId: '1',
        username: 'alice',
        displayName: 'Alice',
        discriminator: '0',
        avatar: 'existing_hash',
        avatarColor: null,
        memberSince: null,
        status: 'online',
        bio: 'Hello',
        pronouns: 'she/her',
        accentColor: 0xFF0000,
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: [],
        editedAvatarBase64: 'data:image/png;base64,abc',
      ).copyWith(editedBio: 'New bio');

      final json = buildCurrentUserProfileUpdateRequest(state).toJson();
      expect(json.keys, unorderedEquals(['bio', 'avatar']));
      expect(json['bio'], 'New bio');
      expect(json['avatar'], 'data:image/png;base64,abc');
      expect(json.containsKey('pronouns'), isFalse);
      expect(json.containsKey('global_name'), isFalse);
      expect(json.containsKey('timezone'), isFalse);
      expect(json.containsKey('timezone_privacy_flags'), isFalse);
    });

    test('includes timezone fields when edited', () {
      final state =
          const UserSettingsViewState(
            userId: '1',
            username: 'alice',
            displayName: 'Alice',
            discriminator: '0',
            avatar: null,
            avatarColor: null,
            memberSince: null,
            status: 'online',
            messageDisplayCompact: false,
            developerMode: false,
            trustedDomains: [],
            timezone: 'Europe/London',
            timezonePrivacyFlags: 1,
          ).copyWith(
            editedTimezone: 'America/New_York',
            editedTimezonePrivacyFlags: 3,
          );

      final json = buildCurrentUserProfileUpdateRequest(state).toJson();
      expect(json['timezone'], 'America/New_York');
      expect(json['timezone_privacy_flags'], 3);
    });

    test('sends null timezone when cleared', () {
      final state = const UserSettingsViewState(
        userId: '1',
        username: 'alice',
        displayName: 'Alice',
        discriminator: '0',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: [],
        timezone: 'Europe/London',
      ).copyWith(editedTimezone: null);

      final json = buildCurrentUserProfileUpdateRequest(state).toJson();
      expect(json.containsKey('timezone'), isTrue);
      expect(json['timezone'], isNull);
    });

    test('public constructor does not clear patch fields', () {
      final body = UserUpdateWithVerificationRequest(
        hasUnreadGiftInventory: false,
      );
      expect(body.toJson().containsKey('avatar'), isFalse);
      expect(body.toJson().containsKey('bio'), isFalse);
    });
  });
}
