import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/privacy_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

PrivacySyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(Provider<PrivacySyncedField>(PrivacySyncedField.new));
}

const AdvancedPrivacyLocalState _defaultAdvancedPrivacy =
    AdvancedPrivacyLocalState(
      preuploadMessageAttachments: true,
      disableStreamPreviews: false,
    );

void main() {
  group('PrivacySyncedField', () {
    test(
      'toProtoMessageForPush overwrites disable_stream_previews from wire',
      () {
        const local = PrivacyLocalState(
          showActiveNow: true,
          advanced: _defaultAdvancedPrivacy,
        );
        final wireBase = pb.PrivacyPreferences(disableStreamPreviews: true);
        final pushed =
            _field().toProtoMessageForPush(local, wireSubMessage: wireBase)
                as pb.PrivacyPreferences;
        expect(pushed.disableStreamPreviews, isFalse);
        expect(pushed.showActiveNow, isTrue);
      },
    );
  });
}
