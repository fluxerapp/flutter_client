import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/textual_preview_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

typedef TextualPreviewLocalState = TextualPreviewPreferencesState;

class TextualPreviewSyncedField
    extends SyncedFieldAdapter<TextualPreviewLocalState> {
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
  TextualPreviewLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasTextualPreview()) {
      return null;
    }
    return TextualPreviewLocalState(wrapText: message.textualPreview.wrapText);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(TextualPreviewLocalState local) {
    return pb.TextualPreviewSettings(wrapText: local.wrapText);
  }

  @override
  bool statesEqual(TextualPreviewLocalState a, TextualPreviewLocalState b) {
    return a.wrapText == b.wrapText;
  }

  @override
  TextualPreviewLocalState mergeForMigration({
    required TextualPreviewLocalState local,
    required TextualPreviewLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(TextualPreviewLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.TextualPreviewSettings;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(textualPreview: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }
}
