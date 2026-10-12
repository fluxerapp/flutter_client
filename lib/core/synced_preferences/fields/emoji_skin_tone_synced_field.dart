import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';

class EmojiSkinToneSyncedField
    extends ProtoSyncedFieldAdapter<String, pickers_pb.EmojiState> {
  EmojiSkinToneSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.emoji;

  @override
  bool get keepsUnpushedEditsAcrossLaunches => true;

  @override
  String readLocal() {
    throw UnsupportedError('Use readLocalValue for the emoji skin tone');
  }

  @override
  Future<String> readLocalValue() async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return '';
    }
    return _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getEmojiSkinTone(userId);
  }

  @override
  Future<void> applyRemote(String value) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await _ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setEmojiSkinTone(userId, value);
    _ref.invalidate(emojiSkinToneProvider);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasEmoji();

  @override
  pickers_pb.EmojiState readSubMessage(pb.SyncedPreferences message) =>
      message.emoji;

  @override
  String fromProto(pickers_pb.EmojiState proto) => proto.skinTone;

  @override
  void writeProto(pickers_pb.EmojiState proto, String local) {
    proto.skinTone = local;
  }

  @override
  pickers_pb.EmojiState createEmptyProto() => pickers_pb.EmojiState();

  @override
  pb.SyncedPreferences wrapProto(pickers_pb.EmojiState proto) =>
      pb.SyncedPreferences(emoji: proto);

  @override
  bool statesEqual(String a, String b) => a == b;

  @override
  bool hasLocalData(String local) => local.isNotEmpty;
}
