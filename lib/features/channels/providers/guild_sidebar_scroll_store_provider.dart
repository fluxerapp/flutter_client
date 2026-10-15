import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sidebar_scroll_store_provider.g.dart';

class GuildSidebarScrollStore {
  final Map<String, double> _offsets = <String, double>{};
  final Map<String, String> _shownChannelIds = <String, String>{};

  double? offsetFor(String guildId) => _offsets[guildId];

  void setOffset(String guildId, double offset) => _offsets[guildId] = offset;

  String? shownChannelFor(String guildId) => _shownChannelIds[guildId];

  void setShownChannel(String guildId, String channelId) =>
      _shownChannelIds[guildId] = channelId;
}

@Riverpod(keepAlive: true)
GuildSidebarScrollStore guildSidebarScrollStore(Ref ref) =>
    GuildSidebarScrollStore();
