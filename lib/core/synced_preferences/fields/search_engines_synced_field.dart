import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

class SearchEnginesSyncedField
    extends
        ProtoSyncedFieldAdapter<SearchEnginesState, pb.SearchEngineSettings> {
  SearchEnginesSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.searchEngines;

  @override
  SearchEnginesState readLocal() {
    return _ref.read(advancedPreferencesProvider).searchEngines;
  }

  @override
  Future<void> applyRemote(SearchEnginesState value) async {
    await _ref
        .read(advancedPreferencesProvider.notifier)
        .applySyncedSearchEngines(value);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasSearchEngines();

  @override
  pb.SearchEngineSettings readSubMessage(pb.SyncedPreferences message) {
    return message.searchEngines;
  }

  @override
  SearchEnginesState fromProto(pb.SearchEngineSettings proto) {
    return SearchEnginesState.defaults().mergeSyncedDefaults(
      textSearchEngineId: proto.hasTextSearchEngineId()
          ? proto.textSearchEngineId
          : null,
      reverseImageSearchEngineId: proto.hasReverseImageSearchEngineId()
          ? proto.reverseImageSearchEngineId
          : null,
      translatorEngineId: proto.hasTranslationProviderId()
          ? proto.translationProviderId
          : null,
    );
  }

  @override
  void writeProto(pb.SearchEngineSettings proto, SearchEnginesState local) {
    writeSearchEnginesProto(proto, local);
  }

  @override
  pb.SearchEngineSettings createEmptyProto() => pb.SearchEngineSettings();

  @override
  pb.SyncedPreferences wrapProto(pb.SearchEngineSettings proto) {
    return pb.SyncedPreferences(searchEngines: proto);
  }

  @override
  bool statesEqual(SearchEnginesState a, SearchEnginesState b) {
    return a.textSearchEngineId == b.textSearchEngineId &&
        a.reverseImageSearchEngineId == b.reverseImageSearchEngineId &&
        a.translatorEngineId == b.translatorEngineId;
  }

  @override
  SearchEnginesState mergeForMigration({
    required SearchEnginesState local,
    required SearchEnginesState remote,
  }) {
    return local.mergeSyncedDefaults(
      textSearchEngineId: remote.textSearchEngineId,
      reverseImageSearchEngineId: remote.reverseImageSearchEngineId,
      translatorEngineId: remote.translatorEngineId,
    );
  }

  static pb.SearchEngineSettings toProtoForPush({
    required SearchEnginesState local,
    pb.SearchEngineSettings? wireBase,
  }) {
    final settings = mergeOrCreate(wireBase, pb.SearchEngineSettings.new);
    writeSearchEnginesProto(settings, local);
    return settings;
  }

  static void writeSearchEnginesProto(
    pb.SearchEngineSettings proto,
    SearchEnginesState local,
  ) {
    final textSearchEngineId = local.textSearchEngineId;
    if (textSearchEngineId != null && textSearchEngineId.isNotEmpty) {
      proto.textSearchEngineId = textSearchEngineId;
    } else {
      proto.clearTextSearchEngineId();
    }

    final reverseImageSearchEngineId = local.reverseImageSearchEngineId;
    if (reverseImageSearchEngineId != null &&
        reverseImageSearchEngineId.isNotEmpty) {
      proto.reverseImageSearchEngineId = reverseImageSearchEngineId;
    } else {
      proto.clearReverseImageSearchEngineId();
    }

    final translatorEngineId = local.translatorEngineId;
    if (translatorEngineId != null && translatorEngineId.isNotEmpty) {
      proto.translationProviderId = translatorEngineId;
    } else {
      proto.clearTranslationProviderId();
    }
  }
}
