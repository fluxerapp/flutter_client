import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_mute_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Set<String>> mutedDmChannelIds(Ref ref) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.userGuildSettingsDao.watchByGuildId('@me').map((settings) {
    if (settings == null) {
      return const <String>{};
    }

    final data = jsonDecode(settings.data) as Map<String, dynamic>;
    final gs = UserGuildSettingsResponse.fromJson(data);
    final overrides = gs.channelOverrides;
    if (overrides == null) {
      return const <String>{};
    }

    final muted = <String>{};
    for (final entry in overrides.entries) {
      if (!entry.value.muted) {
        continue;
      }
      final Object? endTimeValue = entry.value.muteConfig?.endTime;
      final String? endTimeStr = endTimeValue is String ? endTimeValue : null;
      if (endTimeStr != null) {
        final endTime = DateTime.tryParse(endTimeStr);
        if (endTime != null && endTime.isBefore(DateTime.now())) {
          continue;
        }
      }
      muted.add(entry.key);
    }
    return muted;
  });
}
