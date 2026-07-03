import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_user_settings_repository.g.dart';

/// Debounce window for coalescing per-guild channel override PATCH requests
const Duration kGuildUserSettingsPatchDebounce = Duration(seconds: 3);

@Riverpod(keepAlive: true)
GuildUserSettingsRepository guildUserSettingsRepository(Ref ref) {
  final GuildUserSettingsRepository repository = GuildUserSettingsRepository(
    ref,
  );
  ref
    ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
      if ((previous ?? false) && !next) {
        unawaited(repository.flushPendingPatches());
      }
    })
    ..listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
      if ((previous ?? false) && !next) {
        unawaited(repository.flushPendingPatches());
      }
    })
    ..onDispose(repository.dispose);
  return repository;
}

class GuildUserSettingsPersistenceOptions {
  const GuildUserSettingsPersistenceOptions({this.persistImmediately = false});

  final bool persistImmediately;
}

class GuildUserSettingsRepository {
  GuildUserSettingsRepository(
    this._ref, {
    Duration patchDebounce = kGuildUserSettingsPatchDebounce,
  }) : _patchDebounce = patchDebounce;

  final Ref _ref;
  final Duration _patchDebounce;
  final Map<String, Future<void>> _guildWriteChains = <String, Future<void>>{};
  final Map<String, Timer> _patchTimers = <String, Timer>{};

  Future<T> _runSerialized<T>(String guildId, Future<T> Function() action) {
    final Completer<T> result = Completer<T>();
    final Future<void> previous =
        _guildWriteChains[guildId] ?? Future<void>.value();
    _guildWriteChains[guildId] = previous.then((void _) async {
      try {
        result.complete(await action());
      } on Object catch (error, stackTrace) {
        result.completeError(error, stackTrace);
      }
    });
    return result.future;
  }

  void dispose() {
    for (final Timer timer in _patchTimers.values) {
      timer.cancel();
    }
    _patchTimers.clear();
  }

  Future<void> flushPendingPatches({String? guildId}) async {
    if (guildId != null) {
      _patchTimers[guildId]?.cancel();
      _patchTimers.remove(guildId);
      await _runSerialized<void>(guildId, () async {
        final Map<String, ChannelOverrides> overrides =
            await _loadChannelOverridesFromCache(guildId);
        await _syncChannelOverridesToServer(
          guildId: guildId,
          channelOverrides: overrides,
        );
      });
      return;
    }
    final List<String> guildIds = _patchTimers.keys.toList();
    for (final String id in guildIds) {
      await flushPendingPatches(guildId: id);
    }
  }

  Future<void> toggleCategoryCollapsed({
    required String guildId,
    required String categoryId,
    GuildUserSettingsPersistenceOptions options =
        const GuildUserSettingsPersistenceOptions(),
  }) async {
    try {
      final Map<String, ChannelOverrides> overrides =
          await _loadChannelOverridesFromCache(guildId);
      final ChannelOverrides? previous = overrides[categoryId];
      await updateChannelOverride(
        guildId: guildId,
        channelId: categoryId,
        collapsed: !(previous?.collapsed ?? false),
        options: options,
      );
    } on Object catch (error, stackTrace) {
      talker.error(
        '[GuildUserSettingsRepository] Failed to toggle category collapsed',
        error,
        stackTrace,
      );
    }
  }

  Future<void> updateChannelOverride({
    required String guildId,
    required String channelId,
    bool? muted,
    int? durationSeconds,
    UserNotificationSettings? messageNotifications,
    bool? collapsed,
    GuildUserSettingsPersistenceOptions options =
        const GuildUserSettingsPersistenceOptions(),
  }) {
    return _runSerialized<void>(guildId, () async {
      try {
        final Map<String, ChannelOverrides> overrides =
            await _loadChannelOverridesFromCache(guildId);
        final ChannelOverrides? previous = overrides[channelId];
        final ChannelOverrides override = _mergeChannelOverride(
          previous: previous,
          muted: muted,
          durationSeconds: durationSeconds,
          messageNotifications: messageNotifications,
          collapsed: collapsed,
        );
        overrides[channelId] = override;
        await _persistChannelOverridesLocally(
          guildId: guildId,
          channelOverrides: overrides,
        );
        if (options.persistImmediately) {
          _cancelPatchTimer(guildId);
          await _syncChannelOverridesToServer(
            guildId: guildId,
            channelOverrides: overrides,
            rethrowOnFailure: true,
          );
          return;
        }
        _scheduleChannelOverridesPatch(guildId);
      } on Object catch (error, stackTrace) {
        talker.error(
          '[GuildUserSettingsRepository] Failed to update channel override',
          error,
          stackTrace,
        );
        rethrow;
      }
    });
  }

  Future<void> removeChannelOverride({
    required String guildId,
    required String channelId,
    GuildUserSettingsPersistenceOptions options =
        const GuildUserSettingsPersistenceOptions(),
  }) {
    return _runSerialized<void>(guildId, () async {
      final Map<String, ChannelOverrides> overrides =
          await _loadChannelOverridesFromCache(guildId);
      overrides.remove(channelId);
      await _persistChannelOverridesLocally(
        guildId: guildId,
        channelOverrides: overrides,
      );
      if (options.persistImmediately) {
        _cancelPatchTimer(guildId);
        await _syncChannelOverridesToServer(
          guildId: guildId,
          channelOverrides: overrides,
          rethrowOnFailure: true,
        );
        return;
      }
      _scheduleChannelOverridesPatch(guildId);
    });
  }

  void _cancelPatchTimer(String guildId) {
    _patchTimers[guildId]?.cancel();
    _patchTimers.remove(guildId);
  }

  void _scheduleChannelOverridesPatch(String guildId) {
    _patchTimers[guildId]?.cancel();
    _patchTimers[guildId] = Timer(_patchDebounce, () {
      _patchTimers.remove(guildId);
      unawaited(
        _runSerialized<void>(guildId, () async {
          try {
            final Map<String, ChannelOverrides> overrides =
                await _loadChannelOverridesFromCache(guildId);
            await _syncChannelOverridesToServer(
              guildId: guildId,
              channelOverrides: overrides,
            );
          } on Object catch (error, stackTrace) {
            talker.error(
              '[GuildUserSettingsRepository] Failed to sync channel overrides',
              error,
              stackTrace,
            );
          }
        }),
      );
    });
  }

  Future<Map<String, ChannelOverrides>> _loadChannelOverridesFromCache(
    String guildId,
  ) async {
    final FluxerDatabase db = _ref.read(fluxerDatabaseProvider);
    final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
    if (existing == null) {
      return <String, ChannelOverrides>{};
    }
    try {
      final UserGuildSettingsResponse settings =
          UserGuildSettingsResponse.fromJson(
            jsonDecode(existing.data) as Map<String, dynamic>,
          );
      return Map<String, ChannelOverrides>.from(
        settings.channelOverrides ?? const {},
      );
    } on Object {
      return <String, ChannelOverrides>{};
    }
  }

  Future<void> _persistChannelOverridesLocally({
    required String guildId,
    required Map<String, ChannelOverrides> channelOverrides,
  }) async {
    final FluxerDatabase db = _ref.read(fluxerDatabaseProvider);
    final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
    final Map<String, dynamic> data = existing == null
        ? _defaultUserGuildSettingsData(guildId)
        : jsonDecode(existing.data) as Map<String, dynamic>;
    data['channel_overrides'] = channelOverrides.isEmpty
        ? null
        : channelOverrides.map(
            (String key, ChannelOverrides value) =>
                MapEntry<String, dynamic>(key, value.toJson()),
          );
    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion(
        guildId: Value(guildId),
        data: Value(jsonEncode(data)),
      ),
    );
  }

  Future<void> _syncChannelOverridesToServer({
    required String guildId,
    required Map<String, ChannelOverrides> channelOverrides,
    bool rethrowOnFailure = false,
  }) async {
    try {
      final FluxerClient client = _ref.read(fluxerClientProvider);
      final FluxerDatabase db = _ref.read(fluxerDatabaseProvider);
      final UserGuildSettingsUpdateRequest body =
          UserGuildSettingsUpdateRequest(
            channelOverrides: channelOverrides.isEmpty
                ? null
                : channelOverrides,
          );
      final UserGuildSettingsResponse response;
      if (guildId == '@me') {
        response = await client.users.updateDmNotificationSettings(body: body);
      } else {
        response = await client.users.updateGuildSettingsForUser(
          guildId: guildId,
          body: body,
        );
      }
      final Map<String, ChannelOverrides>? persistedOverrides =
          _mergePersistedChannelOverrides(
            requested: channelOverrides,
            response: response.channelOverrides,
          );
      final Map<String, dynamic> persistedData = response.toJson()
        ..['channel_overrides'] = persistedOverrides?.map(
          (String key, ChannelOverrides value) =>
              MapEntry<String, dynamic>(key, value.toJson()),
        );
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion(
          guildId: Value(_storageGuildId(response.guildId, guildId)),
          data: Value(jsonEncode(persistedData)),
        ),
      );
    } on Object catch (error, stackTrace) {
      talker.error(
        '[GuildUserSettingsRepository] Failed to sync channel overrides to server',
        error,
        stackTrace,
      );
      if (rethrowOnFailure) {
        rethrow;
      }
    }
  }

  String _storageGuildId(String? responseGuildId, String requestGuildId) {
    if (requestGuildId == '@me') {
      return '@me';
    }
    return responseGuildId ?? requestGuildId;
  }
}

Map<String, dynamic> _defaultUserGuildSettingsData(String guildId) {
  return UserGuildSettingsResponse(
    guildId: guildId == '@me' ? null : guildId,
    messageNotifications: guildId == '@me'
        ? UserNotificationSettings.allMessages
        : UserNotificationSettings.inherit,
    muted: false,
    muteConfig: null,
    mobilePush: true,
    suppressEveryone: false,
    suppressRoles: false,
    hideMutedChannels: false,
    channelOverrides: null,
    version: -1,
  ).toJson();
}

Map<String, ChannelOverrides>? _mergePersistedChannelOverrides({
  required Map<String, ChannelOverrides> requested,
  required Map<String, ChannelOverrides>? response,
}) {
  if (requested.isEmpty && (response == null || response.isEmpty)) {
    return null;
  }
  final Map<String, ChannelOverrides> merged =
      Map<String, ChannelOverrides>.from(requested);
  if (response != null) {
    merged.addAll(response);
  }
  return merged;
}

ChannelOverrides _mergeChannelOverride({
  required ChannelOverrides? previous,
  bool? muted,
  int? durationSeconds,
  UserNotificationSettings? messageNotifications,
  bool? collapsed,
}) {
  final bool? resolvedMuted = muted ?? previous?.muted;
  final bool isExplicitUnmute = muted == false;
  final bool isExplicitMute = muted ?? false;
  final ChannelOverridesMuteConfig? muteConfig = isExplicitUnmute
      ? null
      : isExplicitMute
      ? ChannelOverridesMuteConfig(
          endTime: durationSeconds == null
              ? null
              : DateTime.now()
                    .add(Duration(seconds: durationSeconds))
                    .toUtc()
                    .toIso8601String(),
          selectedTimeWindow: durationSeconds ?? -1,
        )
      : previous?.muteConfig;
  return ChannelOverrides(
    collapsed: collapsed ?? previous?.collapsed ?? false,
    messageNotifications:
        messageNotifications ??
        previous?.messageNotifications ??
        UserNotificationSettings.inherit,
    muted: resolvedMuted ?? false,
    muteConfig: muteConfig,
    unreadBadges: previous?.unreadBadges,
  );
}
