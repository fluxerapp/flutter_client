import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/favorites_state_codec.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

void main() {
  group('SyncedPreferencesWireCodec', () {
    test('replaceField updates only target field number', () {
      final wire = base64Encode(
        pb.SyncedPreferences(
          accessibility: accessibility_pb.AccessibilitySettings(
            hideKeyboardHints: true,
          ),
          favorites: pb.FavoritesState(
            channels: [
              pb.FavoriteChannel(channelId: 'a', guildId: 'g', position: 0),
            ],
          ),
        ).writeToBuffer(),
      );
      final updatedFavorites = pb.FavoritesState(
        channels: [
          pb.FavoriteChannel(channelId: 'b', guildId: 'g', position: 0),
        ],
      );
      final encoded = SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: wire,
        fieldNumber: SyncedPreferenceField.favorites.fieldNumber,
        fieldMessageBytes: updatedFavorites.writeToBuffer(),
      );
      final decoded = pb.SyncedPreferences.fromBuffer(base64Decode(encoded));
      expect(decoded.favorites.channels.single.channelId, 'b');
      expect(decoded.accessibility.hideKeyboardHints, isTrue);
    });

    test('parseFieldNumbers returns all top-level fields', () {
      final bytes = pb.SyncedPreferences(
        accessibility: accessibility_pb.AccessibilitySettings(),
        sidebar: pb.SidebarPreferences(),
        favorites: pb.FavoritesState(),
      ).writeToBuffer();
      final numbers = SyncedPreferencesWireCodec.parseFieldNumbers(bytes);
      expect(numbers, containsAll([1, 42, 40]));
    });

    test('encodeFieldIntoWire preserves foreign fields', () {
      const initial = FavoritesLocalState(
        channels: [
          db.FavoriteChannel(channelId: 'fav', guildId: 'g', position: 0),
        ],
        categories: [],
        collapsedCategoryIds: [],
        hideMutedChannels: false,
        muted: false,
      );
      final foreign = _encodeStringField(3, 'preview');
      final favoritesWire = base64Decode(
        FavoritesStateCodec.encodeFavoritesIntoWire(
          currentWire: null,
          local: initial,
        ),
      );
      final combined = base64Encode(
        Uint8List.fromList([...foreign, ...favoritesWire]),
      );
      final encoded = SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: combined,
        fieldNumber: SyncedPreferenceField.favorites.fieldNumber,
        fieldMessageBytes: pb.FavoritesState(
          channels: [
            pb.FavoriteChannel(channelId: 'next', guildId: 'g', position: 0),
          ],
        ).writeToBuffer(),
      );
      expect(
        SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
          before: combined,
          after: encoded,
          replacedFieldNumber: SyncedPreferenceField.favorites.fieldNumber,
        ),
        isTrue,
      );
    });

    test('accessibility push preserves unrelated top-level field chunks', () {
      final chatInput = _encodeMessageField(
        112,
        pb.ChatInputSettings(convertEmoticons: true).writeToBuffer(),
      );
      final accessibility = accessibility_pb.AccessibilitySettings(
        hideKeyboardHints: false,
        showMessageSendButton: true,
      );
      final wire = base64Encode(
        Uint8List.fromList([
          ..._encodeMessageField(1, accessibility.writeToBuffer()),
          ...chatInput,
        ]),
      );
      final updatedAccessibility = accessibility_pb.AccessibilitySettings(
        hideKeyboardHints: true,
        showMessageSendButton: true,
      );
      final encoded = SyncedPreferencesWireCodec.encodeFieldIntoWire(
        currentWire: wire,
        fieldNumber: SyncedPreferenceField.accessibility.fieldNumber,
        fieldMessageBytes: updatedAccessibility.writeToBuffer(),
      );
      expect(
        SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
          before: wire,
          after: encoded,
          replacedFieldNumber: SyncedPreferenceField.accessibility.fieldNumber,
        ),
        isTrue,
      );
      final decoded = pb.SyncedPreferences.fromBuffer(base64Decode(encoded));
      expect(decoded.accessibility.hideKeyboardHints, isTrue);
      expect(decoded.accessibility.showMessageSendButton, isTrue);
      expect(decoded.chatInput.convertEmoticons, isTrue);
    });
  });
}

List<int> _encodeVarint(int value) {
  final bytes = <int>[];
  var current = value;
  while (current > 0x7f) {
    bytes.add((current & 0x7f) | 0x80);
    current >>= 7;
  }
  bytes.add(current);
  return bytes;
}

Uint8List _encodeStringField(int fieldNumber, String value) {
  final valueBytes = utf8.encode(value);
  final tag = (fieldNumber << 3) | 2;
  return Uint8List.fromList([
    ..._encodeVarint(tag),
    ..._encodeVarint(valueBytes.length),
    ...valueBytes,
  ]);
}

Uint8List _encodeMessageField(int fieldNumber, List<int> messageBytes) {
  final tag = (fieldNumber << 3) | 2;
  return Uint8List.fromList([
    ..._encodeVarint(tag),
    ..._encodeVarint(messageBytes.length),
    ...messageBytes,
  ]);
}
