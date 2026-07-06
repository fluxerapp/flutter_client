import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_navbar_scroll_store_provider.g.dart';

class GuildNavbarScrollStore {
  double _offset = 0;

  double get offset => _offset;

  void setOffset(double offset) => _offset = offset;
}

@Riverpod(keepAlive: true)
GuildNavbarScrollStore guildNavbarScrollStore(Ref ref) =>
    GuildNavbarScrollStore();
