import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/double_tap_reaction_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/double_tap_reaction_preferences_provider.dart';

void main() {
  group('DoubleTapReactionSyncedField', () {
    test('defaults to thumbs up when proto name is empty', () {
      final state = DoubleTapReactionSyncedField.fromProtoSettings(
        pb.ReactionEmoji(),
      );
      expect(state.name, kDefaultDoubleTapReactionName);
      expect(state.id, isNull);
      expect(state.isSet, isFalse);
    });

    test('reads unicode thumbs up from proto', () {
      final state = DoubleTapReactionSyncedField.fromProtoSettings(
        pb.ReactionEmoji(name: '👍'),
      );
      expect(state.name, '👍');
      expect(state.id, isNull);
      expect(state.isSet, isTrue);
    });

    test('reads custom emoji id and name', () {
      final state = DoubleTapReactionSyncedField.fromProtoSettings(
        pb.ReactionEmoji(id: '123', name: 'pepe'),
      );
      expect(state.name, 'pepe');
      expect(state.id, '123');
      expect(state.isCustom, isTrue);
      expect(state.isSet, isTrue);
    });

    test('does not write a default thumbs up when unset', () {
      final proto = pb.ReactionEmoji(name: '🔥', id: '1');
      DoubleTapReactionSyncedField.writeProtoSettings(
        proto,
        DoubleTapReactionPreferencesState.unset,
      );
      expect(proto.hasName(), isFalse);
      expect(proto.hasId(), isFalse);
    });

    test('writes unicode without id', () {
      final proto = pb.ReactionEmoji();
      DoubleTapReactionSyncedField.writeProtoSettings(
        proto,
        const DoubleTapReactionPreferencesState(isSet: true),
      );
      expect(proto.name, '👍');
      expect(proto.hasId(), isFalse);
    });

    test('writes custom id and name', () {
      final proto = pb.ReactionEmoji();
      DoubleTapReactionSyncedField.writeProtoSettings(
        proto,
        const DoubleTapReactionPreferencesState(
          name: 'pepe',
          id: '123',
          isSet: true,
        ),
      );
      expect(proto.name, 'pepe');
      expect(proto.id, '123');
    });

    test('roundtrips unicode through SyncedPreferences field 114', () {
      final proto = pb.ReactionEmoji();
      DoubleTapReactionSyncedField.writeProtoSettings(
        proto,
        const DoubleTapReactionPreferencesState(isSet: true),
      );
      final wrapped = pb.SyncedPreferences(doubleTapReaction: proto);
      expect(wrapped.hasDoubleTapReaction(), isTrue);
      final roundtrip = DoubleTapReactionSyncedField.fromProtoSettings(
        wrapped.doubleTapReaction,
      );
      expect(roundtrip.name, '👍');
      expect(roundtrip.isSet, isTrue);
    });

    test('roundtrips custom through SyncedPreferences field 114', () {
      final proto = pb.ReactionEmoji();
      DoubleTapReactionSyncedField.writeProtoSettings(
        proto,
        const DoubleTapReactionPreferencesState(
          name: 'pepe',
          id: '123',
          isSet: true,
        ),
      );
      final wrapped = pb.SyncedPreferences(doubleTapReaction: proto);
      final roundtrip = DoubleTapReactionSyncedField.fromProtoSettings(
        wrapped.doubleTapReaction,
      );
      expect(roundtrip.name, 'pepe');
      expect(roundtrip.id, '123');
    });
  });
}
