import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_navbar_scroll_store_provider.g.dart';

class GuildNavbarScrollStore {
  double offset = 0;
}

@Riverpod(keepAlive: true)
GuildNavbarScrollStore guildNavbarScrollStore(Ref ref) =>
    GuildNavbarScrollStore();
