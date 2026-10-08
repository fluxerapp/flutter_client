import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_guild_gate_provider.g.dart';

enum ThreadGateTransition { unchanged, activated, deactivated }

class ThreadsGate {
  final Set<String> _active = <String>{};
  final List<void Function()> _listeners = <void Function()>[];

  bool isActive(String? guildId) =>
      guildId != null && guildId.isNotEmpty && _active.contains(guildId);

  bool get anyActive => _active.isNotEmpty;

  Set<String> get activeGuildIds => Set<String>.unmodifiable(_active);

  ThreadGateTransition apply(String guildId, {required bool active}) {
    final bool changed = active
        ? _active.add(guildId)
        : _active.remove(guildId);
    if (!changed) {
      return ThreadGateTransition.unchanged;
    }
    _notify();
    return active
        ? ThreadGateTransition.activated
        : ThreadGateTransition.deactivated;
  }

  void resetConnection() {
    if (_active.isEmpty) {
      return;
    }
    _active.clear();
    _notify();
  }

  void addListener(void Function() listener) => _listeners.add(listener);

  void removeListener(void Function() listener) => _listeners.remove(listener);

  void _notify() {
    for (final void Function() listener in List<void Function()>.of(
      _listeners,
    )) {
      listener();
    }
  }
}

@Riverpod(keepAlive: true)
ThreadsGate threadsGate(Ref ref) => ThreadsGate();

@Riverpod(keepAlive: true)
class ThreadGuildGate extends _$ThreadGuildGate {
  @override
  Set<String> build() {
    final ThreadsGate gate = ref.watch(threadsGateProvider);
    void sync() => state = gate.activeGuildIds;
    gate.addListener(sync);
    ref.onDispose(() => gate.removeListener(sync));
    return gate.activeGuildIds;
  }
}

@riverpod
bool threadChannelsActive(Ref ref, String? guildId) {
  if (guildId == null || guildId.isEmpty) {
    return false;
  }
  return ref.watch(
    threadGuildGateProvider.select((Set<String> ids) => ids.contains(guildId)),
  );
}

@riverpod
bool anyThreadChannelsActive(Ref ref) => ref.watch(
  threadGuildGateProvider.select((Set<String> ids) => ids.isNotEmpty),
);
