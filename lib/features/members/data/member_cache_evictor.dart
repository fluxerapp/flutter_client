import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/gateway.dart';

const int kMaxCachedMembersPerGuild = 5000;

class MemberCacheEvictor {
  MemberCacheEvictor(this._database);

  final db.FluxerDatabase _database;

  Future<void> evictIfNeeded({
    required String guildId,
    Set<String> protectedUserIds = const <String>{},
  }) async {
    final int count = await _database.memberDao.countMembers(guildId);
    if (count <= kMaxCachedMembersPerGuild) {
      return;
    }
    await _database.memberDao.evictStaleMembers(
      guildId: guildId,
      protectedUserIds: protectedUserIds,
      maxMembers: kMaxCachedMembersPerGuild,
    );
  }
}

Set<String> collectProtectedMemberUserIds({
  required Ref ref,
  required String guildId,
}) {
  final Set<String> protected = <String>{};
  final String currentUserId = ref.read(
    userSettingsViewModelProvider.select((settings) => settings.userId),
  );
  if (currentUserId.isNotEmpty) {
    protected.add(currentUserId);
  }
  final Map<String, VoiceState> voiceStates = ref.read(voiceStatesMapProvider);
  for (final VoiceState state in voiceStates.values) {
    if (state.guildId == guildId) {
      protected.add(state.userId);
    }
  }
  final String? activeChannelId = ref.read(activeChannelIdProvider);
  if (activeChannelId != null) {
    final MemberListViewportListState? listState = ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: guildId, channelId: activeChannelId);
    if (listState != null) {
      for (final MemberListViewportRow row in listState.rows.values) {
        final String? userId = row.userId;
        if (userId != null && userId.isNotEmpty) {
          protected.add(userId);
        }
      }
    }
  }
  return protected;
}

final Provider<MemberCacheEvictor> memberCacheEvictorProvider =
    Provider<MemberCacheEvictor>((Ref ref) {
      return MemberCacheEvictor(ref.watch(fluxerDatabaseProvider));
    });
