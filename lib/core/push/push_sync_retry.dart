const int pushSyncRetryLimit = 4;

Duration? pushSyncRetryDelay(int consecutiveFailures) {
  if (consecutiveFailures < 1 || consecutiveFailures > pushSyncRetryLimit) {
    return null;
  }
  return Duration(seconds: 5 * consecutiveFailures);
}

class PushSyncRetry {
  int _misses = 0;
  int _generation = 0;
  bool _pending = false;

  void beginExternalAttempt() {
    if (_pending) {
      return;
    }
    _misses = 0;
  }

  void succeeded() {
    _misses = 0;
    _pending = false;
    _generation += 1;
  }

  void schedule(void Function() retry) {
    _misses += 1;
    _generation += 1;
    final int generation = _generation;
    final Duration? delay = pushSyncRetryDelay(_misses);
    if (delay == null) {
      _pending = false;
      return;
    }
    _pending = true;
    Future<void>.delayed(delay, () {
      if (generation != _generation) {
        return;
      }
      _pending = false;
      retry();
    });
  }
}
