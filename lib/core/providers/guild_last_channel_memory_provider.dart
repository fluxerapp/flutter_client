import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/guild_last_channel_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';

final Provider<GuildLastChannelDao> guildLastChannelMemoryProvider =
    Provider<GuildLastChannelDao>((Ref ref) {
      final GuildLastChannelDao dao = ref
          .watch(fluxerDatabaseProvider)
          .guildLastChannelDao;
      unawaited(dao.seedMemory());
      return dao;
    });

String? peekGuildLastChannelId(ProviderContainer container, String guildId) {
  return container
      .read(guildLastChannelMemoryProvider)
      .peekLastChannel(guildId);
}
