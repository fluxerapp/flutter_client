import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/privacy_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

void main() {
  group('PrivacySyncedField', () {
    test('toProtoForPush preserves disable_stream_previews from wire', () {
      const local = PrivacyLocalState(
        showActiveNow: true,
        advanced: kDefaultAdvancedPrivacy,
      );
      final wireBase = pb.PrivacyPreferences(disableStreamPreviews: true);
      final pushed = PrivacySyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.disableStreamPreviews, isFalse);
      expect(pushed.showActiveNow, isTrue);
    });
  });
}
