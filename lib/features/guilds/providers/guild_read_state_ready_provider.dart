import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_read_state_ready_provider.g.dart';

@Riverpod(keepAlive: true)
class GuildReadStateReady extends _$GuildReadStateReady {
  @override
  bool build() {
    ref.watch(currentUserIdProvider);
    return false;
  }

  void markReady() {
    if (state) {
      return;
    }
    state = true;
  }
}
