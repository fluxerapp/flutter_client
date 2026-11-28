import 'dart:async';

import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_entry.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerUnsavedChangesController extends ChangeNotifier {
  static const Duration flashDuration = Duration(milliseconds: 300);

  final Map<Object, FluxerUnsavedChangesEntry> _entries =
      <Object, FluxerUnsavedChangesEntry>{};
  Timer? _flashTimer;
  bool _flashing = false;
  bool _notifyScheduled = false;
  bool _disposed = false;

  bool get flashing => _flashing;

  bool get isDirty => dirtyEntry != null;

  FluxerUnsavedChangesEntry? get dirtyEntry {
    FluxerUnsavedChangesEntry? found;
    for (final FluxerUnsavedChangesEntry entry in _entries.values) {
      if (entry.hasUnsavedChanges) {
        found = entry;
      }
    }
    return found;
  }

  void update(Object owner, FluxerUnsavedChangesEntry entry) {
    final FluxerUnsavedChangesEntry? previous = _entries[owner];
    _entries[owner] = entry;
    if (!entry.sameStateAs(previous)) {
      _scheduleNotify();
    }
  }

  void remove(Object owner) {
    final FluxerUnsavedChangesEntry? removed = _entries.remove(owner);
    if (removed != null && removed.hasUnsavedChanges) {
      _scheduleNotify();
    }
  }

  bool blocksNavigation() {
    if (!isDirty) {
      return false;
    }
    flash();
    return true;
  }

  void flash() {
    _flashTimer?.cancel();
    _flashing = true;
    notifyListeners();
    _flashTimer = Timer(flashDuration, () {
      if (_disposed) {
        return;
      }
      _flashing = false;
      notifyListeners();
    });
  }

  void _scheduleNotify() {
    if (_notifyScheduled) {
      return;
    }
    _notifyScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyScheduled = false;
      if (!_disposed) {
        notifyListeners();
      }
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  @override
  void dispose() {
    _disposed = true;
    _flashTimer?.cancel();
    super.dispose();
  }
}
