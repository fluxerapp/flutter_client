import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/guild_last_channels.dart';

part 'guild_last_channel_dao.g.dart';

@DriftAccessor(tables: [GuildLastChannels])
class GuildLastChannelDao extends DatabaseAccessor<FluxerDatabase>
    with _$GuildLastChannelDaoMixin {
  GuildLastChannelDao(super.attachedDatabase);

  final Map<String, String> _memory = <String, String>{};
  final Set<String> _memoryTouched = <String>{};
  Future<void>? _memorySeed;
  int _memoryEpoch = 0;

  String? peekLastChannel(String guildId) => _memory[guildId];

  Future<void> seedMemory() => _memorySeed ??= _loadMemory();

  Future<void> _loadMemory() async {
    final int epoch = _memoryEpoch;
    final List<GuildLastChannel> rows = await select(guildLastChannels).get();
    if (epoch != _memoryEpoch) {
      return;
    }
    for (final GuildLastChannel row in rows) {
      if (!_memoryTouched.contains(row.guildId)) {
        _memory[row.guildId] = row.channelId;
      }
    }
  }

  Future<String?> getLastChannel(String guildId) async {
    final row = await (select(
      guildLastChannels,
    )..where((t) => t.guildId.equals(guildId))).getSingleOrNull();
    return row?.channelId;
  }

  Future<void> setLastChannel(String guildId, String channelId) {
    _memory[guildId] = channelId;
    _memoryTouched.add(guildId);
    return into(guildLastChannels).insertOnConflictUpdate(
      GuildLastChannelsCompanion.insert(guildId: guildId, channelId: channelId),
    );
  }

  Future<void> removeGuild(String guildId) {
    _memory.remove(guildId);
    _memoryTouched.add(guildId);
    return (delete(
      guildLastChannels,
    )..where((t) => t.guildId.equals(guildId))).go();
  }

  Future<void> clearAll() {
    _memory.clear();
    _memoryTouched.clear();
    _memoryEpoch++;
    return delete(guildLastChannels).go();
  }
}
