import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_sync_service.g.dart';

/// Pushes theme updates to PATCH `/users/@me/settings`. Each call awaits the
/// server response so callers can block UI on the ack.
class UserSettingsSyncService {
  UserSettingsSyncService(Ref ref) : _ref = ref;

  final Ref _ref;

  Future<void> pushTheme(UserSettingsUpdateRequestThemeTheme theme) async {
    final client = _ref.read(fluxerClientProvider);
    try {
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(theme: theme),
      );
      talker.debug('[UserSettingsSync] Pushed theme=${theme.json}');
    } on Object catch (e, st) {
      talker.error('[UserSettingsSync] Push failed', e, st);
      rethrow;
    }
  }

  Future<void> pushTimeFormat(TimeFormatTypes timeFormat) async {
    final client = _ref.read(fluxerClientProvider);
    try {
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(timeFormat: timeFormat),
      );
      talker.debug('[UserSettingsSync] Pushed timeFormat=${timeFormat.json}');
    } on Object catch (e, st) {
      talker.error('[UserSettingsSync] Push failed', e, st);
      rethrow;
    }
  }

  Future<void> pushLocale(sdk.Locale locale) async {
    final client = _ref.read(fluxerClientProvider);
    try {
      final UserSettingsResponse updated = await client.users
          .updateCurrentUserSettings(
            body: UserSettingsUpdateRequest(locale: locale),
          );
      await _persistSettings(updated);
      talker.debug('[UserSettingsSync] Pushed locale=${locale.json}');
    } on Object catch (e, st) {
      talker.error('[UserSettingsSync] Push locale failed', e, st);
      rethrow;
    }
  }

  Future<void> _persistSettings(UserSettingsResponse settings) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await _ref
        .read(fluxerDatabaseProvider)
        .userSettingsDao
        .upsertSettings(
          UserSettingsTableCompanion(
            userId: Value(userId),
            data: Value(jsonEncode(settings.toJson())),
          ),
        );
  }

  Future<UserSettingsResponse> fetchCurrentSettings() async {
    final client = _ref.read(fluxerClientProvider);
    try {
      return await client.users.getCurrentUserSettings();
    } on Object catch (e, st) {
      talker.error('[UserSettingsSync] Fetch failed', e, st);
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
UserSettingsSyncService userSettingsSync(Ref ref) =>
    UserSettingsSyncService(ref);
