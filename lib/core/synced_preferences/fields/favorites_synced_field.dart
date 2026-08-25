import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/favorite_channels_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:protobuf/protobuf.dart' as $pb;

enum FavoritesWireDecodeStatus { empty, success, failure }

class FavoritesWireDecodeResult {
  const FavoritesWireDecodeResult._({
    required this.status,
    required this.state,
  });

  final FavoritesWireDecodeStatus status;
  final FavoritesLocalState state;

  static const empty = FavoritesWireDecodeResult._(
    status: FavoritesWireDecodeStatus.empty,
    state: FavoritesLocalState.empty,
  );
}

class FavoritesLocalState {
  const FavoritesLocalState({
    required this.channels,
    required this.categories,
    required this.collapsedCategoryIds,
    required this.hideMutedChannels,
    required this.muted,
  });

  final List<db.FavoriteChannel> channels;
  final List<db.FavoriteCategory> categories;
  final List<String> collapsedCategoryIds;
  final bool hideMutedChannels;
  final bool muted;

  static const empty = FavoritesLocalState(
    channels: [],
    categories: [],
    collapsedCategoryIds: [],
    hideMutedChannels: false,
    muted: false,
  );
}

class FavoritesSyncedField extends SyncedFieldAdapter<FavoritesLocalState> {
  FavoritesSyncedField(this._ref, {this._readSyncedLocal});

  final Ref _ref;
  final FavoritesLocalState? Function()? _readSyncedLocal;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.favorites;

  @override
  FavoritesLocalState readLocal() {
    throw UnsupportedError('Use readLocalValue for favorites');
  }

  @override
  Future<FavoritesLocalState> readLocalValue() {
    final dao = _ref.read(fluxerDatabaseProvider).favoriteChannelsDao;
    return FavoritesStateHelpers.readFromDatabase(dao);
  }

  @override
  Future<void> applyRemote(FavoritesLocalState value) async {
    final dao = _ref.read(fluxerDatabaseProvider).favoriteChannelsDao;
    final normalized = FavoritesStateHelpers.normalizeForSync(value);
    await dao.replaceAllFromSync(
      channels: normalized.channels,
      categories: normalized.categories,
      collapsedCategoryIds: normalized.collapsedCategoryIds,
      hideMutedChannels: normalized.hideMutedChannels,
      muted: normalized.muted,
    );
  }

  @override
  FavoritesLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasFavorites()) {
      return null;
    }
    return FavoritesStateHelpers.normalizeForSync(
      FavoritesStateHelpers.fromProto(message.favorites),
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(FavoritesLocalState local) {
    return FavoritesStateHelpers.toProto(
      FavoritesStateHelpers.normalizeForSync(local),
    );
  }

  @override
  bool statesEqual(FavoritesLocalState a, FavoritesLocalState b) {
    return FavoritesStateHelpers.statesEqual(a, b);
  }

  @override
  FavoritesLocalState mergeForMigration({
    required FavoritesLocalState local,
    required FavoritesLocalState remote,
  }) {
    return FavoritesStateHelpers.mergeForMigration(
      local: local,
      server: remote,
      syncedLocal: _readSyncedLocal?.call(),
    );
  }

  @override
  bool verifyRoundtrip(FavoritesLocalState candidate) {
    return FavoritesStateHelpers.verifyRoundtripStability(candidate);
  }

  @override
  bool hasLocalData(FavoritesLocalState local) {
    return local.channels.isNotEmpty || local.categories.isNotEmpty;
  }

  @override
  bool hasRemoteData(FavoritesLocalState remote) {
    return hasLocalData(remote);
  }

  @override
  bool hasRemoteAdditions(
    FavoritesLocalState local,
    FavoritesLocalState remote,
  ) {
    final localIds = local.channels.map((channel) => channel.channelId).toSet();
    final remoteIds = remote.channels
        .map((channel) => channel.channelId)
        .toSet();
    return remoteIds.difference(localIds).isNotEmpty;
  }

  @override
  bool hasInboundUpdatesWhileProtected(
    FavoritesLocalState local,
    FavoritesLocalState remote,
  ) {
    if (FavoritesStateHelpers.isRemoteShrink(local: local, remote: remote)) {
      return false;
    }
    return !statesEqual(local, remote);
  }

  static FavoritesWireDecodeResult decodeFromWireResult(String encoded) {
    if (encoded.isEmpty) {
      return FavoritesWireDecodeResult.empty;
    }
    try {
      final synced = pb.SyncedPreferences.fromBuffer(
        FavoritesStateHelpers.decodeBase64(encoded),
      );
      if (!synced.hasFavorites()) {
        return const FavoritesWireDecodeResult._(
          status: FavoritesWireDecodeStatus.failure,
          state: FavoritesLocalState.empty,
        );
      }
      return FavoritesWireDecodeResult._(
        status: FavoritesWireDecodeStatus.success,
        state: FavoritesStateHelpers.normalizeForSync(
          FavoritesStateHelpers.fromProto(synced.favorites),
        ),
      );
    } on Object {
      return const FavoritesWireDecodeResult._(
        status: FavoritesWireDecodeStatus.failure,
        state: FavoritesLocalState.empty,
      );
    }
  }
}

class FavoritesStateHelpers {
  const FavoritesStateHelpers._();

  static List<int> decodeBase64(String encoded) {
    return encoded.isEmpty ? <int>[] : base64Decode(encoded);
  }

  static Future<FavoritesLocalState> readFromDatabase(
    FavoriteChannelsDao dao,
  ) async {
    final channels = await dao.watchChannels().first;
    final categories = await dao.getCategories();
    final settings = await dao.getSettings();
    return normalizeForSync(
      FavoritesLocalState(
        channels: channels,
        categories: categories,
        collapsedCategoryIds: favoriteSettingsCollapsedCategoryIds(settings),
        hideMutedChannels: settings.hideMuted,
        muted: settings.muted,
      ),
    );
  }

  static bool verifyRoundtripStability(FavoritesLocalState candidate) {
    final normalized = normalizeForSync(candidate);
    final roundtripped = normalizeForSync(fromProto(toProto(normalized)));
    return statesEqual(normalized, roundtripped);
  }

  static FavoritesLocalState normalizeForSync(FavoritesLocalState state) {
    return FavoritesLocalState(
      channels: [
        for (final channel in state.channels)
          db.FavoriteChannel(
            channelId: channel.channelId,
            guildId: _normalizeGuildIdForStorage(channel.guildId),
            parentId: _normalizeOptionalString(channel.parentId),
            position: channel.position,
            nickname: _normalizeOptionalString(channel.nickname),
          ),
      ],
      categories: state.categories,
      collapsedCategoryIds: _normalizeCollapsedCategoryIds(
        state.collapsedCategoryIds,
      ),
      hideMutedChannels: state.hideMutedChannels,
      muted: state.muted,
    );
  }

  static bool statesEqual(FavoritesLocalState a, FavoritesLocalState b) {
    final left = normalizeForSync(a);
    final right = normalizeForSync(b);
    if (left.hideMutedChannels != right.hideMutedChannels ||
        left.muted != right.muted) {
      return false;
    }
    if (!_stringSetsEqual(
      left.collapsedCategoryIds,
      right.collapsedCategoryIds,
    )) {
      return false;
    }
    if (left.channels.length != right.channels.length ||
        left.categories.length != right.categories.length) {
      return false;
    }
    final sortedChannelsA = [...left.channels]
      ..sort((x, y) => x.position.compareTo(y.position));
    final sortedChannelsB = [...right.channels]
      ..sort((x, y) => x.position.compareTo(y.position));
    for (var i = 0; i < sortedChannelsA.length; i++) {
      final channelA = sortedChannelsA[i];
      final channelB = sortedChannelsB[i];
      if (channelA.channelId != channelB.channelId ||
          _normalizeGuildIdForCompare(channelA.guildId) !=
              _normalizeGuildIdForCompare(channelB.guildId) ||
          channelA.parentId != channelB.parentId ||
          channelA.position != channelB.position ||
          channelA.nickname != channelB.nickname) {
        return false;
      }
    }
    final sortedCategoriesA = [...left.categories]
      ..sort((x, y) => x.position.compareTo(y.position));
    final sortedCategoriesB = [...right.categories]
      ..sort((x, y) => x.position.compareTo(y.position));
    for (var i = 0; i < sortedCategoriesA.length; i++) {
      final categoryA = sortedCategoriesA[i];
      final categoryB = sortedCategoriesB[i];
      if (categoryA.id != categoryB.id ||
          categoryA.name != categoryB.name ||
          categoryA.position != categoryB.position) {
        return false;
      }
    }
    return true;
  }

  static bool _keepLocalOnlyCategory(
    String categoryId, {
    required Set<String> serverCategoryIds,
    Set<String>? syncedLocalCategoryIds,
  }) {
    if (serverCategoryIds.contains(categoryId)) {
      return false;
    }
    if (syncedLocalCategoryIds == null) {
      return true;
    }
    return !syncedLocalCategoryIds.contains(categoryId);
  }

  static FavoritesLocalState mergeForMigration({
    required FavoritesLocalState local,
    required FavoritesLocalState server,
    FavoritesLocalState? syncedLocal,
  }) {
    final normalizedLocal = normalizeForSync(local);
    final normalizedServer = normalizeForSync(server);
    final syncedLocalCategoryIds = syncedLocal == null
        ? null
        : normalizeForSync(
            syncedLocal,
          ).categories.map((category) => category.id).toSet();
    final serverChannelIds = normalizedServer.channels
        .map((channel) => channel.channelId)
        .toSet();
    final channels = <db.FavoriteChannel>[];
    var position = 0;
    for (final channel in normalizedServer.channels) {
      channels.add(
        db.FavoriteChannel(
          channelId: channel.channelId,
          guildId: channel.guildId,
          parentId: channel.parentId,
          position: position++,
          nickname: channel.nickname,
        ),
      );
    }
    for (final channel in normalizedLocal.channels) {
      if (serverChannelIds.contains(channel.channelId)) {
        continue;
      }
      channels.add(
        db.FavoriteChannel(
          channelId: channel.channelId,
          guildId: channel.guildId,
          parentId: channel.parentId,
          position: position++,
          nickname: channel.nickname,
        ),
      );
    }
    final serverCategoryIds = normalizedServer.categories
        .map((category) => category.id)
        .toSet();
    final categories = <db.FavoriteCategory>[];
    var categoryPosition = 0;
    for (final category in normalizedServer.categories) {
      categories.add(
        db.FavoriteCategory(
          id: category.id,
          name: category.name,
          position: categoryPosition++,
        ),
      );
    }
    for (final category in normalizedLocal.categories) {
      if (!_keepLocalOnlyCategory(
        category.id,
        serverCategoryIds: serverCategoryIds,
        syncedLocalCategoryIds: syncedLocalCategoryIds,
      )) {
        continue;
      }
      categories.add(
        db.FavoriteCategory(
          id: category.id,
          name: category.name,
          position: categoryPosition++,
        ),
      );
    }
    final mergedCategoryIds = categories.map((category) => category.id).toSet();
    final collapsed = [
      for (final id in {
        ...normalizedServer.collapsedCategoryIds,
        ...normalizedLocal.collapsedCategoryIds,
      })
        if (mergedCategoryIds.contains(id)) id,
    ];
    return normalizeForSync(
      FavoritesLocalState(
        channels: channels,
        categories: categories,
        collapsedCategoryIds: collapsed,
        hideMutedChannels: normalizedServer.hideMutedChannels,
        muted: normalizedServer.muted,
      ),
    );
  }

  static bool isRemoteShrink({
    required FavoritesLocalState local,
    required FavoritesLocalState remote,
  }) {
    final localIds = local.channels.map((channel) => channel.channelId).toSet();
    final remoteIds = remote.channels
        .map((channel) => channel.channelId)
        .toSet();
    return remoteIds.length < localIds.length &&
        !remoteIds.containsAll(localIds);
  }

  static FavoritesLocalState fromProto(pb.FavoritesState state) {
    return FavoritesLocalState(
      channels: [
        for (final channel in state.channels)
          db.FavoriteChannel(
            channelId: channel.channelId,
            guildId: channel.guildId.isEmpty ? null : channel.guildId,
            parentId: channel.hasParentId() && channel.parentId.isNotEmpty
                ? channel.parentId
                : null,
            position: channel.position,
            nickname: channel.hasNickname() && channel.nickname.isNotEmpty
                ? channel.nickname
                : null,
          ),
      ],
      categories: [
        for (final category in state.categories)
          db.FavoriteCategory(
            id: category.id,
            name: category.name,
            position: category.position,
          ),
      ],
      collapsedCategoryIds: state.collapsedCategoryIds.toList(),
      hideMutedChannels: state.hideMutedChannels,
      muted: state.muted,
    );
  }

  static pb.FavoritesState toProto(FavoritesLocalState local) {
    return pb.FavoritesState(
      channels: [
        for (final channel in local.channels) _channelToProto(channel),
      ],
      categories: [
        for (final category in local.categories)
          pb.FavoriteCategory(
            id: category.id,
            name: category.name,
            position: category.position,
          ),
      ],
      collapsedCategoryIds: local.collapsedCategoryIds,
      hideMutedChannels: local.hideMutedChannels,
      muted: local.muted,
    );
  }

  static bool _stringSetsEqual(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }
    final setA = a.toSet();
    return setA.length == b.length && setA.containsAll(b);
  }

  static String? _normalizeGuildIdForStorage(String? guildId) {
    final trimmed = guildId?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  static String _normalizeGuildIdForCompare(String? guildId) {
    final trimmed = guildId?.trim();
    if (trimmed == null || trimmed.isEmpty || trimmed == favoriteDmGuildId) {
      return favoriteDmGuildId;
    }
    return trimmed;
  }

  static pb.FavoriteChannel _channelToProto(db.FavoriteChannel channel) {
    final proto = pb.FavoriteChannel(
      channelId: channel.channelId,
      guildId: _encodeGuildIdForWire(channel.guildId),
      position: channel.position,
    );
    final parentId = channel.parentId;
    if (parentId != null) {
      proto.parentId = parentId;
    }
    final nickname = channel.nickname;
    if (nickname != null) {
      proto.nickname = nickname;
    }
    return proto;
  }

  static String _encodeGuildIdForWire(String? guildId) {
    final trimmed = guildId?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return favoriteDmGuildId;
    }
    return trimmed;
  }

  static String? _normalizeOptionalString(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  static List<String> _normalizeCollapsedCategoryIds(List<String> values) {
    final seen = <String>{};
    final normalized = <String>[];
    for (final value in values) {
      final trimmed = value.trim();
      if (trimmed.isEmpty || seen.contains(trimmed)) {
        continue;
      }
      seen.add(trimmed);
      normalized.add(trimmed);
    }
    return normalized;
  }
}
