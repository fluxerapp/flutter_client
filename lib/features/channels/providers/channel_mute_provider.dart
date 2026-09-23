import 'dart:convert';

import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_mute_provider.g.dart';

/// Stream of muted channel/category IDs for a guild, derived from the
/// user's per-guild channel overrides. Overrides whose mute window has
/// already elapsed are excluded. Guild-wide mute is tracked separately by
/// `guildMuteProvider`.
@riverpod
Stream<Set<String>> mutedChannelIds(Ref ref, String guildId) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.userGuildSettingsDao.watchByGuildId(guildId).map((settings) {
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
