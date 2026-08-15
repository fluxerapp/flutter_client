/// Drops repeated identical error logs within a cooldown window
class ErrorLogRateLimiter {
  ErrorLogRateLimiter({
    this.cooldown = const Duration(seconds: 60),
    this.pruneInterval = const Duration(minutes: 5),
    this.pruneThreshold = 64,
  });

  final Duration cooldown;
  final Duration pruneInterval;
  final int pruneThreshold;

  final Map<String, _Entry> _entries = <String, _Entry>{};
  DateTime? _lastPrune;

  /// Returns false when this error should not be logged again yet :(
  bool shouldLog({
    required Object error,
    required String source,
    StackTrace? stackTrace,
  }) {
    final DateTime now = DateTime.now();
    _maybePrune(now);

    final String key = _key(error, stackTrace, source);
    final _Entry? entry = _entries[key];
    if (entry != null && now.difference(entry.lastLogged) < cooldown) {
      entry.suppressed++;
      return false;
    }
    if (entry != null && entry.suppressed > 0) {
      entry.suppressed = 0;
    }
    _entries[key] = _Entry(lastLogged: now);
    return true;
  }

  int suppressedCount({
    required Object error,
    required String source,
    StackTrace? stackTrace,
  }) {
    return _entries[_key(error, stackTrace, source)]?.suppressed ?? 0;
  }

  void _maybePrune(DateTime now) {
    final bool intervalElapsed =
        _lastPrune == null || now.difference(_lastPrune!) >= pruneInterval;
    if (!intervalElapsed && _entries.length < pruneThreshold) {
      return;
    }
    _lastPrune = now;
    _entries.removeWhere(
      (_, _Entry entry) => now.difference(entry.lastLogged) >= cooldown,
    );
  }

  String _key(Object error, StackTrace? stackTrace, String source) {
    final String? stackHead = stackTrace
        ?.toString()
        .split('\n')
        .where((String line) => line.trim().isNotEmpty)
        .firstOrNull;
    return '${error.runtimeType}|$error|$source|${stackHead ?? ''}';
  }
}

class _Entry {
  _Entry({required this.lastLogged});

  final DateTime lastLogged;
  int suppressed = 0;
}
