import 'dart:async';

const Duration kVoiceTrackHandoffGrace = Duration(milliseconds: 600);

/// One renderer per track so expand/minimize does not allocate a new texture.
class VoiceTrackRendererCache<T> {
  VoiceTrackRendererCache({
    required this.create,
    required this.dispose,
    this.evictAfter = kVoiceTrackHandoffGrace,
  });

  final Future<T> Function() create;

  // T is an argument of the callback, so the field is contravariant.
  // ignore: unsafe_variance
  final Future<void> Function(T renderer) dispose;
  final Duration evictAfter;

  final Map<String, _RendererSlot<T>> _slots = <String, _RendererSlot<T>>{};
  var _sessionEnded = false;

  /// Claims an already initialized renderer, or null if it still needs creating.
  T? retainIfPresent(String key) {
    final _RendererSlot<T>? slot = _slots[key];
    final T? value = slot?.value;
    if (slot == null || value == null) {
      return null;
    }
    _claim(slot);
    return value;
  }

  Future<T> retain(String key) {
    final _RendererSlot<T> slot = _slots.putIfAbsent(key, _RendererSlot<T>.new);
    _claim(slot);
    final T? value = slot.value;
    if (value != null) {
      return Future<T>.value(value);
    }
    return _ensureCreated(slot);
  }

  void release(String key) {
    final _RendererSlot<T>? slot = _slots[key];
    if (slot == null || slot.refs <= 0) {
      return;
    }
    slot.refs--;
    if (slot.refs > 0) {
      return;
    }
    if (_sessionEnded) {
      unawaited(_destroy(key));
      return;
    }
    slot.evictTimer?.cancel();
    slot.evictTimer = Timer(evictAfter, () {
      if (slot.refs > 0 || !identical(_slots[key], slot)) {
        return;
      }
      unawaited(_destroy(key));
    });
  }

  void markSessionEnded() {
    _sessionEnded = true;
    for (final String key in _slots.keys.toList()) {
      final _RendererSlot<T>? slot = _slots[key];
      if (slot == null || slot.refs > 0) {
        continue;
      }
      slot.evictTimer?.cancel();
      slot.evictTimer = null;
      unawaited(_destroy(key));
    }
  }

  /// Waits until pending creates and destroys finish.
  Future<void> drain() async {
    for (final String key in _slots.keys.toList()) {
      final _RendererSlot<T>? slot = _slots[key];
      if (slot == null || slot.refs > 0) {
        continue;
      }
      slot.evictTimer?.cancel();
      slot.evictTimer = null;
      await _destroy(key);
    }
    final List<Future<void>> pending = <Future<void>>[];
    for (final _RendererSlot<T> slot in _slots.values) {
      if (slot.pending != null) {
        pending.add(
          slot.pending!.then((_) {}, onError: (Object _, StackTrace _) {}),
        );
      }
      if (slot.destroyFuture != null) {
        pending.add(slot.destroyFuture!);
      }
    }
    if (pending.isNotEmpty) {
      await Future.wait<void>(pending);
    }
    for (final String key in _slots.keys.toList()) {
      final _RendererSlot<T>? slot = _slots[key];
      if (slot == null || slot.refs > 0) {
        continue;
      }
      await _destroy(key);
    }
  }

  void markSessionActive() {
    _sessionEnded = false;
  }

  void _claim(_RendererSlot<T> slot) {
    slot.evictTimer?.cancel();
    slot.evictTimer = null;
    slot.refs++;
  }

  Future<T> _ensureCreated(_RendererSlot<T> slot) {
    final Future<T>? pending = slot.pending;
    if (pending != null) {
      return pending;
    }
    late final Future<T> created;
    created = create().then<T>(
      (T value) {
        if (identical(slot.pending, created)) {
          slot
            ..pending = null
            ..value = value;
        }
        return value;
      },
      onError: (Object error, StackTrace stack) {
        if (identical(slot.pending, created)) {
          slot.pending = null;
        }
        Error.throwWithStackTrace(error, stack);
      },
    );
    slot.pending = created;
    return created;
  }

  Future<void> _destroy(String key) {
    final _RendererSlot<T>? slot = _slots[key];
    if (slot == null || slot.refs > 0) {
      return Future<void>.value();
    }
    final Future<void>? inFlight = slot.destroyFuture;
    if (inFlight != null) {
      return inFlight;
    }
    slot.destroying = true;
    final Future<void> destroyFuture = _destroyImpl(key, slot);
    slot.destroyFuture = destroyFuture;
    return destroyFuture;
  }

  Future<void> _destroyImpl(String key, _RendererSlot<T> slot) async {
    slot.evictTimer?.cancel();
    slot.evictTimer = null;
    T? value = slot.value;
    final Future<T>? pending = slot.pending;
    if (value == null && pending != null) {
      try {
        value = await pending;
      } on Object {
        value = null;
      }
    }
    if (slot.refs > 0 || !identical(_slots[key], slot)) {
      slot.destroying = false;
      return;
    }
    _slots.remove(key);
    if (value != null) {
      await dispose(value);
    }
    if (identical(_slots[key], slot)) {
      slot.destroyFuture = null;
    }
  }
}

class _RendererSlot<T> {
  T? value;
  Future<T>? pending;
  Future<void>? destroyFuture;
  int refs = 0;
  Timer? evictTimer;
  var destroying = false;
}
