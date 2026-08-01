import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class SearchEnginesSyncedField extends SyncedFieldAdapter<SearchEnginesState> {
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
  SearchEnginesState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasSearchEngines()) {
      return null;
    }
    final engines = message.searchEngines;
    return SearchEnginesState.defaults().mergeSyncedDefaults(
      textSearchEngineId: engines.hasTextSearchEngineId()
          ? engines.textSearchEngineId
          : null,
      reverseImageSearchEngineId: engines.hasReverseImageSearchEngineId()
          ? engines.reverseImageSearchEngineId
          : null,
      translatorEngineId: engines.hasTranslationProviderId()
          ? engines.translationProviderId
          : null,
    );
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasSearchEngines() ? wire.searchEngines : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(SearchEnginesState local) {
    return toProtoForPush(local: local);
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    SearchEnginesState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pb.SearchEngineSettings?,
    );
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

  @override
  bool verifyRoundtrip(SearchEnginesState candidate) {
    final proto = toProtoMessage(candidate) as pb.SearchEngineSettings;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(searchEngines: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  static pb.SearchEngineSettings toProtoForPush({
    required SearchEnginesState local,
    pb.SearchEngineSettings? wireBase,
  }) {
    final settings = wireBase != null
        ? (pb.SearchEngineSettings()..mergeFromMessage(wireBase))
        : pb.SearchEngineSettings();

    final textSearchEngineId = local.textSearchEngineId;
    if (textSearchEngineId != null && textSearchEngineId.isNotEmpty) {
      settings.textSearchEngineId = textSearchEngineId;
    } else {
      settings.clearTextSearchEngineId();
    }

    final reverseImageSearchEngineId = local.reverseImageSearchEngineId;
    if (reverseImageSearchEngineId != null &&
        reverseImageSearchEngineId.isNotEmpty) {
      settings.reverseImageSearchEngineId = reverseImageSearchEngineId;
    } else {
      settings.clearReverseImageSearchEngineId();
    }

    final translatorEngineId = local.translatorEngineId;
    if (translatorEngineId != null && translatorEngineId.isNotEmpty) {
      settings.translationProviderId = translatorEngineId;
    } else {
      settings.clearTranslationProviderId();
    }

    return settings;
  }
}
