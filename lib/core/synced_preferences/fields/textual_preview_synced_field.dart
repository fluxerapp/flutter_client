import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/textual_preview_preferences_provider.dart';

typedef TextualPreviewLocalState = TextualPreviewPreferencesState;

class TextualPreviewSyncedField
    extends
        ProtoSyncedFieldAdapter<
          TextualPreviewLocalState,
          pb.TextualPreviewSettings
        > {
  TextualPreviewSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.textualPreview;

  @override
  TextualPreviewLocalState readLocal() {
    return _ref.read(textualPreviewPreferencesProvider);
  }

  @override
  Future<void> applyRemote(TextualPreviewLocalState value) async {
    await _ref
        .read(textualPreviewPreferencesProvider.notifier)
        .applySynced(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasTextualPreview();

  @override
  pb.TextualPreviewSettings readSubMessage(pb.SyncedPreferences message) {
    return message.textualPreview;
  }

  @override
  TextualPreviewLocalState fromProto(pb.TextualPreviewSettings proto) {
    return TextualPreviewLocalState(wrapText: proto.wrapText);
  }

  @override
  void writeProto(
    pb.TextualPreviewSettings proto,
    TextualPreviewLocalState local,
  ) {
    proto.wrapText = local.wrapText;
  }

  @override
  pb.TextualPreviewSettings createEmptyProto() => pb.TextualPreviewSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.TextualPreviewSettings proto) {
    return pb.SyncedPreferences(textualPreview: proto);
  }

  @override
  bool statesEqual(TextualPreviewLocalState a, TextualPreviewLocalState b) {
    return a == b;
  }
}
