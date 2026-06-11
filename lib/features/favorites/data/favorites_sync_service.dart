import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/favorites_state_codec.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';

const Duration _kFavoritesSyncDebounce = Duration(milliseconds: 500);

final favoritesSyncServiceProvider = Provider<FavoritesSyncService>((ref) {
  return FavoritesSyncService(ref);
});

class FavoritesSyncService {
  FavoritesSyncService(this._ref);

  final Ref _ref;
  String _wireBlob = '';
  bool _isApplyingRemote = false;
  Timer? _pushTimer;
  int _pushGeneration = 0;

  Future<void> hydrateFromUserSettings(UserSettingsResponse settings) async {
    final encoded = settings.syncedPreferences;
    final serverState = FavoritesStateCodec.decodeFavoritesFromWire(encoded);
    final dao = _ref.read(fluxerDatabaseProvider).favoriteChannelsDao;
    final localState = await FavoritesStateCodec.readFromDatabase(dao);
    final hasLocalData =
        localState.channels.isNotEmpty || localState.categories.isNotEmpty;
    final hasServerData =
        serverState.channels.isNotEmpty || serverState.categories.isNotEmpty;

    if (!hasLocalData && !hasServerData) {
      _wireBlob = encoded;
      return;
    }

    if (FavoritesStateCodec.statesEqual(localState, serverState)) {
      _wireBlob = encoded;
      return;
    }

    _wireBlob = encoded;

    if (hasLocalData && !hasServerData) {
      schedulePush();
      return;
    }

    final FavoritesLocalState target = hasLocalData && hasServerData
        ? FavoritesStateCodec.mergeForMigration(
            local: localState,
            server: serverState,
          )
        : serverState;

    if (!FavoritesStateCodec.statesEqual(target, localState)) {
      await _applyState(target, fromRemote: true);
    }

    if (hasLocalData &&
        hasServerData &&
        !FavoritesStateCodec.statesEqual(target, serverState)) {
      schedulePush();
    }
  }

  void schedulePush() {
    if (_isApplyingRemote) {
      return;
    }
    _pushTimer?.cancel();
    _pushTimer = Timer(_kFavoritesSyncDebounce, () {
      unawaited(_flushPush());
    });
  }

  Future<void> _flushPush() async {
    if (_isApplyingRemote) {
      return;
    }
    final generation = ++_pushGeneration;
    try {
      final dao = _ref.read(fluxerDatabaseProvider).favoriteChannelsDao;
      final localState = await FavoritesStateCodec.readFromDatabase(dao);
      final serverState = FavoritesStateCodec.decodeFavoritesFromWire(
        _wireBlob,
      );
      if (FavoritesStateCodec.statesEqual(localState, serverState)) {
        return;
      }
      final encoded = FavoritesStateCodec.encodeFavoritesIntoWire(
        currentWire: _wireBlob.isEmpty ? null : _wireBlob,
        local: localState,
      );
      if (generation != _pushGeneration) {
        return;
      }
      final client = _ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(syncedPreferences: encoded),
      );
      _wireBlob = encoded;
      talker.debug('[FavoritesSync] Pushed favorites to server');
    } on Object catch (error, stackTrace) {
      talker.error('[FavoritesSync] Push failed', error, stackTrace);
    }
  }

  Future<void> applyAfterLocalMutation() async {
    if (_isApplyingRemote) {
      return;
    }
    schedulePush();
  }

  Future<void> _applyState(
    FavoritesLocalState state, {
    required bool fromRemote,
  }) async {
    _isApplyingRemote = fromRemote;
    try {
      final dao = _ref.read(fluxerDatabaseProvider).favoriteChannelsDao;
      await dao.replaceAllFromSync(
        channels: state.channels,
        categories: state.categories,
        collapsedCategoryIds: state.collapsedCategoryIds,
        hideMutedChannels: state.hideMutedChannels,
        muted: state.muted,
      );
    } finally {
      _isApplyingRemote = false;
    }
  }
}
