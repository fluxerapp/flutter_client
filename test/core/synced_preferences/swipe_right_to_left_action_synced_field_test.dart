import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/swipe_right_to_left_action_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/preferences/message_ui_preferences_providers.dart';

SwipeRightToLeftActionSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<SwipeRightToLeftActionSyncedField>(
      SwipeRightToLeftActionSyncedField.new,
    ),
  );
}

void main() {
  group('SwipeRightToLeftActionSyncedField', () {
    test('maps proto values to local preferences', () {
      expect(
        SwipeRightToLeftActionSyncedField.fromProtoEnum(
          pb.SwipeAction.SWIPE_ACTION_CHANNEL_DETAILS,
        ),
        SwipeRightToLeftActionPreference.channelDetails,
      );
      expect(
        SwipeRightToLeftActionSyncedField.fromProtoEnum(
          pb.SwipeAction.SWIPE_ACTION_REPLY,
        ),
        SwipeRightToLeftActionPreference.reply,
      );
    });

    test('round-trips channel details through field 118', () {
      const local = SwipeRightToLeftActionPreferencesState(
        action: SwipeRightToLeftActionPreference.channelDetails,
      );
      final encoded = SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: null,
        fieldNumber: SyncedPreferenceField.swipeRightToLeftAction.fieldNumber,
        fieldMessageBytes: _field().encodePushValueBytes(local),
        fieldWireType: 0,
      );
      final decoded = pb.SyncedPreferences.fromBuffer(base64Decode(encoded));
      expect(
        decoded.swipeRightToLeftAction,
        pb.SwipeAction.SWIPE_ACTION_CHANNEL_DETAILS,
      );
    });
  });
}
