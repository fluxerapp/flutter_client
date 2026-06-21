import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_status_service.g.dart';

class UserStatusService {
  UserStatusService(this._ref);

  final Ref _ref;

  Future<void> setPresenceStatus({
    required UserStatusType status,
    Duration? duration,
  }) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final DateTime? resetsAt = duration == null
        ? null
        : DateTime.now().toUtc().add(duration);
    final UserStatusType? resetsTo =
        duration == null ? null : UserStatusType.online;
    final UserSettingsUpdateRequest request = UserSettingsUpdateRequest(
      status: status,
      statusResetsAt: resetsAt?.toIso8601String(),
      statusResetsTo: resetsTo,
    );
    await _patchSettings(
      userId: userId,
      request: request,
      optimisticStatus: status.json ?? 'online',
      optimisticCustomStatusText: serializeCustomStatus(
        _ref.read(userSettingsStatusProvider)?.customStatus,
      ),
    );
  }

  Future<void> applyScheduledStatusReset({
    required UserStatusType fallbackStatus,
  }) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final UserSettingsUpdateRequest request = UserSettingsUpdateRequest(
      status: fallbackStatus,
    );
    await _patchSettings(
      userId: userId,
      request: request,
      optimisticStatus: fallbackStatus.json ?? 'online',
      optimisticCustomStatusText: serializeCustomStatus(
        _ref.read(userSettingsStatusProvider)?.customStatus,
      ),
    );
  }

  Future<void> setCustomStatus(CustomStatusPayload payload) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final UserSettingsUpdateRequest request = UserSettingsUpdateRequest(
      customStatus: payload,
    );
    await _patchSettings(
      userId: userId,
      request: request,
      optimisticStatus:
          _ref.read(userSettingsStatusProvider)?.status ?? 'online',
      optimisticCustomStatusText: serializeCustomStatus(
        customStatusResponseFromPayload(payload),
      ),
    );
  }

  Future<void> clearCustomStatus() async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final UserSettingsResponse? previousSettings =
        _ref.read(userSettingsStatusProvider);
    await _applyOptimisticUpdate(
      userId: userId,
      previousSettings: previousSettings,
      optimisticStatus:
          _ref.read(userSettingsStatusProvider)?.status ?? 'online',
      optimisticCustomStatusText: null,
      request: const UserSettingsUpdateRequest(),
    );
    if (previousSettings != null) {
      final Map<String, Object?> merged =
          Map<String, Object?>.from(previousSettings.toJson())
            ..['custom_status'] = null;
      await database.userSettingsDao.upsertSettings(
        UserSettingsTableCompanion(
          userId: Value(userId),
          data: Value(jsonEncode(merged)),
        ),
      );
      await database.userDao.updateUserPresence(
        userId,
        status: previousSettings.status,
      );
    }
    try {
      await _ref.read(fluxerDioProvider).patch<dynamic>(
        '/users/@me/settings',
        data: <String, dynamic>{'custom_status': null},
      );
      talker.debug('[UserStatusService] Cleared custom status');
    } on Object catch (error, stackTrace) {
      talker.error(
        '[UserStatusService] Clear custom status failed',
        error,
        stackTrace,
      );
      if (previousSettings != null) {
        await database.userSettingsDao.upsertSettings(
          UserSettingsTableCompanion(
            userId: Value(userId),
            data: Value(jsonEncode(previousSettings.toJson())),
          ),
        );
        await database.userDao.updateUserPresence(
          userId,
          status: previousSettings.status,
          customStatus: serializeCustomStatus(
            previousSettings.customStatus,
          ),
        );
      }
      rethrow;
    }
  }

  Future<void> _patchSettings({
    required String userId,
    required UserSettingsUpdateRequest request,
    required String optimisticStatus,
    required String? optimisticCustomStatusText,
  }) async {
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final UserSettingsResponse? previousSettings =
        _ref.read(userSettingsStatusProvider);
    await _applyOptimisticUpdate(
      userId: userId,
      previousSettings: previousSettings,
      optimisticStatus: optimisticStatus,
      optimisticCustomStatusText: optimisticCustomStatusText,
      request: request,
    );
    try {
      final client = _ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(body: request);
      talker.debug('[UserStatusService] Settings patch succeeded');
    } on Object catch (error, stackTrace) {
      talker.error(
        '[UserStatusService] Settings patch failed',
        error,
        stackTrace,
      );
      if (previousSettings != null) {
        await database.userSettingsDao.upsertSettings(
          UserSettingsTableCompanion(
            userId: Value(userId),
            data: Value(jsonEncode(previousSettings.toJson())),
          ),
        );
        await database.userDao.updateUserPresence(
          userId,
          status: previousSettings.status,
          customStatus: serializeCustomStatus(
            previousSettings.customStatus,
          ),
        );
      }
      rethrow;
    }
  }

  Future<void> _applyOptimisticUpdate({
    required String userId,
    required UserSettingsResponse? previousSettings,
    required String optimisticStatus,
    required String? optimisticCustomStatusText,
    required UserSettingsUpdateRequest request,
  }) async {
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final UserSettingsTableData? row =
        await database.userSettingsDao.getSettings(userId);
    final Map<String, Object?> merged = row == null
        ? <String, Object?>{}
        : Map<String, Object?>.from(
            jsonDecode(row.data) as Map<String, Object?>,
          );
    if (request.status != null) {
      merged['status'] = request.status!.json;
      merged['status_resets_at'] = request.statusResetsAt;
      merged['status_resets_to'] = request.statusResetsTo?.json;
    }
    if (request.customStatus != null) {
      merged['custom_status'] = request.customStatus!.toJson();
    }
    await database.userSettingsDao.upsertSettings(
      UserSettingsTableCompanion(
        userId: Value(userId),
        data: Value(jsonEncode(merged)),
      ),
    );
    await database.userDao.updateUserPresence(
      userId,
      status: optimisticStatus,
      customStatus: optimisticCustomStatusText,
    );
  }
}

@Riverpod(keepAlive: true)
UserStatusService userStatusService(Ref ref) => UserStatusService(ref);
