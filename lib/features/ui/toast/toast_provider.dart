import 'dart:async';

import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toast_provider.g.dart';

class ToastEntry {
  const ToastEntry({
    required this.toast,
    required this.id,
    required this.isVisible,
  });

  final FluxerToast toast;
  final int id;
  final bool isVisible;

  ToastEntry copyWith({FluxerToast? toast, int? id, bool? isVisible}) {
    return ToastEntry(
      toast: toast ?? this.toast,
      id: id ?? this.id,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

@Riverpod(keepAlive: true)
class Toast extends _$Toast {
  int _nextId = 0;
  Timer? _autoDismissTimer;
  Timer? _removalTimer;
  Timer? _replacementTimer;
  FluxerToast? _pendingToast;

  @override
  List<ToastEntry> build() {
    ref.onDispose(_cancelTimers);
    return [];
  }

  void show(FluxerToast toast) {
    _autoDismissTimer?.cancel();
    _cancelPendingToast();
    final ToastEntry? visibleEntry = _findVisibleEntry();
    if (visibleEntry != null) {
      dismiss(visibleEntry.id);
      _pendingToast = toast;
      _replacementTimer = Timer(fluxerToastAnimationDuration, () {
        _replacementTimer = null;
        _pendingToast = null;
        _presentToast(toast);
      });
      return;
    }
    if (state.isNotEmpty) {
      _removalTimer?.cancel();
      _removalTimer = null;
      state = [];
    }
    _presentToast(toast);
  }

  void dismiss(int id) {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    final int entryIndex = state.indexWhere(
      (ToastEntry entry) => entry.id == id && entry.isVisible,
    );
    if (entryIndex == -1) {
      return;
    }
    final List<ToastEntry> updatedState = [...state];
    updatedState[entryIndex] = updatedState[entryIndex].copyWith(
      isVisible: false,
    );
    state = updatedState;
    _removalTimer?.cancel();
    _removalTimer = Timer(fluxerToastAnimationDuration, () {
      _removalTimer = null;
      _remove(id);
    });
  }

  void hide(FluxerToast toast) {
    if (identical(_pendingToast, toast)) {
      _cancelPendingToast();
      return;
    }
    for (final ToastEntry entry in state) {
      if (entry.isVisible && identical(entry.toast, toast)) {
        dismiss(entry.id);
        return;
      }
    }
  }

  void _cancelPendingToast() {
    _replacementTimer?.cancel();
    _replacementTimer = null;
    _pendingToast = null;
  }

  void _presentToast(FluxerToast toast) {
    final ToastEntry entry = ToastEntry(
      toast: toast,
      id: _nextId++,
      isVisible: true,
    );
    state = [entry];
    _autoDismissTimer = Timer(toast.duration, () => dismiss(entry.id));
  }

  void _remove(int id) {
    state = state.where((ToastEntry entry) => entry.id != id).toList();
  }

  ToastEntry? _findVisibleEntry() {
    for (final ToastEntry entry in state) {
      if (entry.isVisible) {
        return entry;
      }
    }
    return null;
  }

  void _cancelTimers() {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    _removalTimer?.cancel();
    _removalTimer = null;
    _cancelPendingToast();
  }
}
