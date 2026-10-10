import 'dart:async';

import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visible_unavailable_guild_count_provider.g.dart';

const Duration kUnavailableIndicatorDebounce = Duration(milliseconds: 1500);

@Riverpod(keepAlive: true)
class VisibleUnavailableGuildCount extends _$VisibleUnavailableGuildCount {
  Timer? _hideTimer;

  @override
  int build() {
    ref.onDispose(() {
      _hideTimer?.cancel();
    });
    ref.listen(guildAvailabilityProvider, (_, Set<String> next) {
      _applyCount(next.length);
    });
    return ref.read(guildAvailabilityProvider).length;
  }

  void _applyCount(int count) {
    _hideTimer?.cancel();
    _hideTimer = null;
    if (count > 0) {
      state = count;
      return;
    }
    if (state == 0) {
      return;
    }
    _hideTimer = Timer(kUnavailableIndicatorDebounce, () {
      if (ref.mounted) {
        state = 0;
      }
    });
  }
}
