import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sidebar_scroll_store_provider.g.dart';

class GuildSidebarScrollStore {
  final Map<String, double> _offsets = <String, double>{};

  double? offsetFor(String guildId) => _offsets[guildId];

  void setOffset(String guildId, double offset) => _offsets[guildId] = offset;
}

@Riverpod(keepAlive: true)
GuildSidebarScrollStore guildSidebarScrollStore(Ref ref) =>
    GuildSidebarScrollStore();
