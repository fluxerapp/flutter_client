import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/double_tap_action_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/double_tap_action_preferences_provider.dart';

DoubleTapActionSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<DoubleTapActionSyncedField>(DoubleTapActionSyncedField.new),
  );
}

void main() {
  group('DoubleTapActionSyncedField', () {
    test('maps proto values to local preferences', () {
      expect(
        DoubleTapActionSyncedField.fromProtoEnum(
          pb.DoubleTapAction.DOUBLE_TAP_ACTION_EDIT,
        ),
        DoubleTapActionPreference.edit,
      );
    });

    test('round-trips edit through field 117', () {
      const local = DoubleTapActionPreferencesState(
        action: DoubleTapActionPreference.edit,
      );
      final encoded = SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: null,
        fieldNumber: SyncedPreferenceField.doubleTapAction.fieldNumber,
        fieldMessageBytes: _field().encodePushValueBytes(local),
        fieldWireType: 0,
      );
      final decoded = pb.SyncedPreferences.fromBuffer(base64Decode(encoded));
      expect(
        decoded.doubleTapAction,
        pb.DoubleTapAction.DOUBLE_TAP_ACTION_EDIT,
      );
    });
  });
}
