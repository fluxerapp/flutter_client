import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_user_settings_repository.g.dart';

const Duration kGuildUserSettingsPatchDebounce = Duration(seconds: 3);
const Duration kGuildUserSettingsPatchRetryBaseDelay = Duration(seconds: 2);
const Duration _kPatchRetryMaxDelay = Duration(seconds: 60);

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
    this._patchDebounce = kGuildUserSettingsPatchDebounce,
    this._patchRetryBaseDelay = kGuildUserSettingsPatchRetryBaseDelay,
  }) {
    _ref.listen<String?>(fluxerAuthTokenProvider, (
      String? previous,
      String? next,
    ) {
      if (previous != next) {
        _cancelPatchRetries();
      }
    });
  }

  final Ref _ref;
  final Duration _patchDebounce;
  final Duration _patchRetryBaseDelay;
  final Map<String, int> _patchRetryAttempts = <String, int>{};
  final Random _random = Random();
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

  void _cancelPatchRetries() {
    for (final String guildId in _patchRetryAttempts.keys) {
      _cancelPatchTimer(guildId);
    }
    _patchRetryAttempts.clear();
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

  Future<void> toggleAllCategoriesCollapsed({
    required String guildId,
    required List<String> categoryIds,
    GuildUserSettingsPersistenceOptions options =
        const GuildUserSettingsPersistenceOptions(),
  }) async {
    try {
      final Map<String, ChannelOverrides> overrides =
          await _loadChannelOverridesFromCache(guildId);
      final List<String> uniqueCategoryIds = categoryIds.toSet().toList();
      if (uniqueCategoryIds.isEmpty) {
        return;
      }
      final bool allCollapsed = uniqueCategoryIds.every(
        (String categoryId) => overrides[categoryId]?.collapsed ?? false,
      );
      final bool newCollapsed = !allCollapsed;
      for (final String categoryId in uniqueCategoryIds) {
        final ChannelOverrides? previous = overrides[categoryId];
        overrides[categoryId] = _mergeChannelOverride(
          previous: previous,
          collapsed: newCollapsed,
        );
      }
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
        '[GuildUserSettingsRepository] Failed to toggle all categories collapsed',
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
    int? flags,
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
          flags: flags,
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

  void _scheduleChannelOverridesPatch(String guildId, {Duration? delay}) {
    _patchTimers[guildId]?.cancel();
    _patchTimers[guildId] = Timer(delay ?? _patchDebounce, () {
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
    final String? sessionToken = _ref.read(fluxerAuthTokenProvider);
    try {
      final FluxerClient client = _ref.read(fluxerClientProvider);
      final FluxerDatabase db = _ref.read(fluxerDatabaseProvider);
      final UserGuildSettingsUpdateRequest body =
          UserGuildSettingsUpdateRequest(
            channelOverrides: JsonNullable.of(
              channelOverrides.isEmpty ? null : channelOverrides,
            ),
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
      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion(
          guildId: Value(_storageGuildId(response.guildId, guildId)),
          data: Value(jsonEncode(response.toJson())),
        ),
      );
      _patchRetryAttempts.remove(guildId);
    } on Object catch (error, stackTrace) {
      final bool transient = isTransientNetworkError(error);
      if (transient) {
        talker.warning(
          '[GuildUserSettingsRepository] Channel overrides sync failed, '
          'will retry: $error',
        );
      } else {
        talker.error(
          '[GuildUserSettingsRepository] Failed to sync channel overrides to server',
          error,
          stackTrace,
        );
      }
      if (rethrowOnFailure) {
        rethrow;
      }
      if (transient && _ref.read(fluxerAuthTokenProvider) == sessionToken) {
        _scheduleChannelOverridesPatchRetry(guildId);
      }
    }
  }

  void _scheduleChannelOverridesPatchRetry(String guildId) {
    final int attempt = (_patchRetryAttempts[guildId] ?? 0) + 1;
    _patchRetryAttempts[guildId] = attempt;
    _scheduleChannelOverridesPatch(
      guildId,
      delay: jitteredBackoff(
        attempt: attempt,
        base: _patchRetryBaseDelay,
        cap: _kPatchRetryMaxDelay,
        random: _random,
      ),
    );
  }

  String _storageGuildId(String? responseGuildId, String requestGuildId) {
    if (requestGuildId == '@me') {
      return '@me';
    }
    return responseGuildId ?? requestGuildId;
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
}

ChannelOverrides _mergeChannelOverride({
  required ChannelOverrides? previous,
  bool? muted,
  int? durationSeconds,
  UserNotificationSettings? messageNotifications,
  bool? collapsed,
  int? flags,
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
    messageNotifications: messageNotifications == null
        ? previous?.messageNotifications ??
              UserNotificationSettingsInput.inherit
        : UserNotificationSettingsInput.fromJson(
            messageNotifications.json ?? 0,
          ),
    muted: resolvedMuted ?? false,
    muteConfig: muteConfig,
    unreadBadges: previous?.unreadBadges,
    flags: flags ?? previous?.flags,
  );
}
