import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

@immutable
class FavoriteGifsSyncedLocalState {
  const FavoriteGifsSyncedLocalState({
    required this.entries,
    required this.saveAsSavedMedia,
    this.seenFirstTimePrompt = false,
  });

  final List<FavoriteGifEntry> entries;
  final bool saveAsSavedMedia;
  final bool seenFirstTimePrompt;

  static const empty = FavoriteGifsSyncedLocalState(
    entries: [],
    saveAsSavedMedia: false,
  );

  @override
  bool operator ==(Object other) {
    return other is FavoriteGifsSyncedLocalState &&
        other.saveAsSavedMedia == saveAsSavedMedia &&
        other.seenFirstTimePrompt == seenFirstTimePrompt &&
        listEquals(other.entries, entries);
  }

  @override
  int get hashCode {
    return Object.hash(
      saveAsSavedMedia,
      seenFirstTimePrompt,
      Object.hashAll(entries),
    );
  }
}

class FavoriteGifsSyncedField
    extends
        ProtoSyncedFieldAdapter<
          FavoriteGifsSyncedLocalState,
          pickers_pb.FavoriteGifSettings
        > {
  FavoriteGifsSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.favoriteGifs;

  @override
  FavoriteGifsSyncedLocalState readLocal() {
    final favoriteGifs = _ref.read(favoriteGifsProvider);
    final saveAsSavedMedia = _ref
        .read(advancedPreferencesProvider)
        .saveGifFavoritesAsSavedMedia;
    return FavoriteGifsSyncedLocalState(
      entries: favoriteGifs.entries,
      saveAsSavedMedia: saveAsSavedMedia,
      seenFirstTimePrompt: favoriteGifs.seenFirstTimePrompt,
    );
  }

  @override
  Future<void> applyRemote(FavoriteGifsSyncedLocalState value) async {
    _ref
        .read(favoriteGifsProvider.notifier)
        .applySynced(
          entries: value.entries,
          seenFirstTimePrompt: value.seenFirstTimePrompt,
        );
    await _ref
        .read(advancedPreferencesProvider.notifier)
        .applySyncedSaveGifFavoritesAsSavedMedia(value: value.saveAsSavedMedia);
  }

  @override
  bool hasField(pb.SyncedPreferences message) => message.hasFavoriteGifs();

  @override
  pickers_pb.FavoriteGifSettings readSubMessage(pb.SyncedPreferences message) {
    return message.favoriteGifs;
  }

  static FavoriteGifsSyncedLocalState decodeSettings(
    pickers_pb.FavoriteGifSettings proto,
  ) {
    return FavoriteGifsSyncedLocalState(
      entries: proto.entries.map(_entryFromProto).toList(growable: false),
      saveAsSavedMedia: proto.saveAsSavedMedia,
      seenFirstTimePrompt: proto.seenFirstTimePrompt,
    );
  }

  @override
  FavoriteGifsSyncedLocalState fromProto(pickers_pb.FavoriteGifSettings proto) {
    return decodeSettings(proto);
  }

  @override
  void writeProto(
    pickers_pb.FavoriteGifSettings proto,
    FavoriteGifsSyncedLocalState local,
  ) {
    final wireEntriesByUrl = {
      for (final entry in proto.entries) entry.url: entry,
    };
    proto.entries
      ..clear()
      ..addAll(
        local.entries.map(
          (entry) =>
              _entryToProto(entry, wireEntry: wireEntriesByUrl[entry.url]),
        ),
      );
    proto.saveAsSavedMedia = local.saveAsSavedMedia;
    proto.seenFirstTimePrompt = local.seenFirstTimePrompt;
  }

  @override
  pickers_pb.FavoriteGifSettings createEmptyProto() {
    return pickers_pb.FavoriteGifSettings();
  }

  @override
  pb.SyncedPreferences wrapProto(pickers_pb.FavoriteGifSettings proto) {
    return pb.SyncedPreferences(favoriteGifs: proto);
  }

  @override
  bool statesEqual(
    FavoriteGifsSyncedLocalState a,
    FavoriteGifsSyncedLocalState b,
  ) {
    return a == b;
  }

  static pickers_pb.FavoriteGifSettings toProtoForPush({
    required FavoriteGifsSyncedLocalState local,
    pickers_pb.FavoriteGifSettings? wireBase,
  }) {
    final proto = mergeOrCreate(wireBase, pickers_pb.FavoriteGifSettings.new);
    FavoriteGifsSyncedField._writeProto(proto, local);
    return proto;
  }

  static void _writeProto(
    pickers_pb.FavoriteGifSettings proto,
    FavoriteGifsSyncedLocalState local,
  ) {
    final wireEntriesByUrl = {
      for (final entry in proto.entries) entry.url: entry,
    };
    proto.entries
      ..clear()
      ..addAll(
        local.entries.map(
          (entry) =>
              _entryToProto(entry, wireEntry: wireEntriesByUrl[entry.url]),
        ),
      );
    proto.saveAsSavedMedia = local.saveAsSavedMedia;
    proto.seenFirstTimePrompt = local.seenFirstTimePrompt;
  }

  static FavoriteGifEntry _entryFromProto(pickers_pb.FavoriteGifEntry entry) {
    return FavoriteGifEntry(
      url: entry.url,
      proxyUrl: entry.proxyUrl,
      width: entry.width,
      height: entry.height,
      contentType: entry.contentType,
      placeholder: entry.placeholder.isEmpty ? null : entry.placeholder,
      media: entry.media.map(
        (key, value) => MapEntry(
          key,
          FavoriteGifMediaFormat(
            src: value.src,
            proxySrc: value.proxySrc,
            width: value.width,
            height: value.height,
          ),
        ),
      ),
    );
  }

  static pickers_pb.FavoriteGifEntry _entryToProto(
    FavoriteGifEntry entry, {
    pickers_pb.FavoriteGifEntry? wireEntry,
  }) {
    final proto = pickers_pb.FavoriteGifEntry(
      url: entry.url,
      proxyUrl: entry.proxyUrl,
      width: entry.width,
      height: entry.height,
      contentType: entry.contentType,
      placeholder: entry.placeholder ?? '',
    );
    for (final MapEntry(:key, :value) in entry.media.entries) {
      proto.media[key] = pickers_pb.FavoriteGifMediaFormat(
        src: value.src,
        proxySrc: value.proxySrc,
        width: value.width,
        height: value.height,
      );
    }
    if (wireEntry != null) {
      for (final MapEntry(:key, :value) in wireEntry.media.entries) {
        proto.media.putIfAbsent(key, () => value);
      }
    }
    return proto;
  }
}
