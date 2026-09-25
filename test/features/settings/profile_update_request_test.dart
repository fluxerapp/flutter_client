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
