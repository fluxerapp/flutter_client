import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/presence_update_batcher.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_status_service.g.dart';

/// User-selectable presence status sent as `UserSettingsUpdateRequest.status`.
///
/// Replaces the `UserStatusType` enum the previous SDK exposed; the regenerated
/// SDK inlines the enum per request field. Values: online, dnd, idle, invisible
/// (the backend's settable status set).
typedef PresenceStatus = UserStatusType;

/// Presence status the account reverts to after a timed status expires
/// (`UserSettingsUpdateRequest.statusResetsTo`). Same value set as
/// [PresenceStatus]; the SDK models it as a separate inlined enum.
typedef PresenceResetStatus = UserStatusType;

class UserStatusService {
  UserStatusService(this._ref);

  final Ref _ref;

  Future<void> setPresenceStatus({
    required PresenceStatus status,
    Duration? duration,
  }) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final DateTime? resetsAt = duration == null
        ? null
        : DateTime.now().toUtc().add(duration);
    final PresenceResetStatus? resetsTo = duration == null
        ? null
        : PresenceResetStatus.online;
    final UserSettingsUpdateRequest request = UserSettingsUpdateRequest(
      status: status,
      statusResetsAt: JsonNullable.of(resetsAt?.toIso8601String()),
      statusResetsTo: JsonNullable.of(resetsTo),
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
    required PresenceStatus fallbackStatus,
  }) async {
    final String? userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final UserSettingsUpdateRequest request = UserSettingsUpdateRequest(
      status: fallbackStatus,
      statusResetsAt: const JsonNullable.of(null),
      statusResetsTo: const JsonNullable.of(null),
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
      customStatus: JsonNullable.of(payload),
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
    await _patchSettings(
      userId: userId,
      request: UserSettingsUpdateRequest(
        customStatus: const JsonNullable.of(null),
      ),
      optimisticStatus:
          _ref.read(userSettingsStatusProvider)?.status ?? 'online',
      optimisticCustomStatusText: null,
    );
  }

  Future<void> _patchSettings({
    required String userId,
    required UserSettingsUpdateRequest request,
    required String optimisticStatus,
    required String? optimisticCustomStatusText,
  }) async {
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final UserSettingsResponse? previousSettings = _ref.read(
      userSettingsStatusProvider,
    );
    await _applyOptimisticUpdate(
      userId: userId,
      optimisticStatus: optimisticStatus,
      optimisticCustomStatusText: optimisticCustomStatusText,
      request: request,
    );
    try {
      await _ref
          .read(fluxerDioProvider)
          .patch<dynamic>('/users/@me/settings', data: request.toJson());
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
          customStatus: serializeCustomStatus(previousSettings.customStatus),
          mobile: isFluxerMobileClient,
        );
      }
      rethrow;
    }
  }

  Future<void> _applyOptimisticUpdate({
    required String userId,
    required String optimisticStatus,
    required String? optimisticCustomStatusText,
    required UserSettingsUpdateRequest request,
  }) async {
    final FluxerDatabase database = _ref.read(fluxerDatabaseProvider);
    final UserSettingsTableData? row = await database.userSettingsDao
        .getSettings(userId);
    final Map<String, Object?> merged = row == null
        ? <String, Object?>{}
        : Map<String, Object?>.from(
            jsonDecode(row.data) as Map<String, Object?>,
          );
    if (request.status != null) {
      merged['status'] = request.status!.json;
      merged['status_resets_at'] = request.statusResetsAt.value;
      merged['status_resets_to'] = request.statusResetsTo.value?.json;
    }
    if (request.customStatus.isPresent) {
      merged['custom_status'] = request.customStatus.value?.toJson();
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
      mobile: isFluxerMobileClient,
    );
  }
}

@Riverpod(keepAlive: true)
UserStatusService userStatusService(Ref ref) => UserStatusService(ref);
