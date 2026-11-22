import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';

class SpellcheckSyncedField
    extends ProtoSyncedFieldAdapter<bool, pb.SpellcheckSettings> {
  SpellcheckSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.spellcheck;

  @override
  bool readLocal() =>
      _ref.read(syncedExtrasPreferencesProvider).spellcheckEnabled;

  @override
  Future<void> applyRemote(bool value) => _ref
      .read(syncedExtrasPreferencesProvider.notifier)
      .applySpellcheck(enabled: value);

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasSpellcheck();

  @override
  pb.SpellcheckSettings readSubMessage(pb.SyncedPreferences message) =>
      message.spellcheck;

  @override
  bool fromProto(pb.SpellcheckSettings proto) =>
      !proto.hasEnabled() || proto.enabled;

  @override
  void writeProto(pb.SpellcheckSettings proto, bool local) {
    proto.enabled = local;
  }

  @override
  pb.SpellcheckSettings createEmptyProto() => pb.SpellcheckSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.SpellcheckSettings proto) =>
      pb.SyncedPreferences(spellcheck: proto);

  @override
  bool statesEqual(bool a, bool b) => a == b;
}

class ChatInputSyncedField
    extends ProtoSyncedFieldAdapter<bool, pb.ChatInputSettings> {
  ChatInputSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.chatInput;

  @override
  bool readLocal() =>
      _ref.read(syncedExtrasPreferencesProvider).convertEmoticons;

  @override
  Future<void> applyRemote(bool value) => _ref
      .read(syncedExtrasPreferencesProvider.notifier)
      .applyConvertEmoticons(enabled: value);

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasChatInput();

  @override
  pb.ChatInputSettings readSubMessage(pb.SyncedPreferences message) =>
      message.chatInput;

  @override
  bool fromProto(pb.ChatInputSettings proto) => proto.convertEmoticons;

  @override
  void writeProto(pb.ChatInputSettings proto, bool local) {
    proto.convertEmoticons = local;
  }

  @override
  pb.ChatInputSettings createEmptyProto() => pb.ChatInputSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.ChatInputSettings proto) =>
      pb.SyncedPreferences(chatInput: proto);

  @override
  bool statesEqual(bool a, bool b) => a == b;
}

typedef HiddenGuildButtonsLocal = ({bool help, bool download});

class HiddenGuildButtonsSyncedField
    extends
        ProtoSyncedFieldAdapter<
          HiddenGuildButtonsLocal,
          pb.HiddenGuildListButtons
        > {
  HiddenGuildButtonsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.hiddenGuildButtons;

  @override
  HiddenGuildButtonsLocal readLocal() {
    final SyncedExtrasState state = _ref.read(syncedExtrasPreferencesProvider);
    return (help: state.hideHelpButton, download: state.hideDownloadButton);
  }

  @override
  Future<void> applyRemote(HiddenGuildButtonsLocal value) => _ref
      .read(syncedExtrasPreferencesProvider.notifier)
      .applyHiddenGuildButtons(help: value.help, download: value.download);

  @override
  bool hasField(pb.SyncedPreferences message) =>
      message.hasHiddenGuildButtons();

  @override
  pb.HiddenGuildListButtons readSubMessage(pb.SyncedPreferences message) =>
      message.hiddenGuildButtons;

  @override
  HiddenGuildButtonsLocal fromProto(pb.HiddenGuildListButtons proto) =>
      (help: proto.helpButton, download: proto.downloadButton);

  @override
  void writeProto(
    pb.HiddenGuildListButtons proto,
    HiddenGuildButtonsLocal local,
  ) {
    proto
      ..helpButton = local.help
      ..downloadButton = local.download;
  }

  @override
  pb.HiddenGuildListButtons createEmptyProto() => pb.HiddenGuildListButtons();

  @override
  pb.SyncedPreferences wrapProto(pb.HiddenGuildListButtons proto) =>
      pb.SyncedPreferences(hiddenGuildButtons: proto);

  @override
  bool statesEqual(HiddenGuildButtonsLocal a, HiddenGuildButtonsLocal b) =>
      a == b;
}
