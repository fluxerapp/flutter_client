import 'package:fluxer_app/material_ui.dart';

class _AnimatedImageCandidate {
  _AnimatedImageCandidate({required this.key});

  final String key;
  double visibleFraction = 0;
  bool active = false;
}

/// Coordinates animated image playback in a scrollable feed.
class AnimatedImagePlaybackController extends ChangeNotifier {
  final Map<String, _AnimatedImageCandidate> _candidates =
      <String, _AnimatedImageCandidate>{};

  void register(String key, double visibleFraction) {
    _candidates
            .putIfAbsent(key, () => _AnimatedImageCandidate(key: key))
            .visibleFraction =
        visibleFraction;
    _recompute();
  }

  void updateVisibility(String key, double visibleFraction) {
    final _AnimatedImageCandidate? candidate = _candidates[key];
    if (candidate == null) {
      return;
    }
    candidate.visibleFraction = visibleFraction;
    _recompute();
  }

  void unregister(String key) {
    _candidates.remove(key);
    _recompute();
  }

  bool isPlaying(String key) {
    final _AnimatedImageCandidate? candidate = _candidates[key];
    if (candidate == null) {
      return false;
    }
    return candidate.active;
  }

  void _recompute() {
    final Map<String, bool> previousActive = <String, bool>{
      for (final _AnimatedImageCandidate c in _candidates.values)
        c.key: c.active,
    };
    for (final _AnimatedImageCandidate candidate in _candidates.values) {
      candidate.active = candidate.visibleFraction > 0;
    }
    if (_activeMapChanged(previousActive)) {
      notifyListeners();
    }
  }

  bool _activeMapChanged(Map<String, bool> previousActive) {
    final Map<String, bool> currentActive = <String, bool>{
      for (final _AnimatedImageCandidate c in _candidates.values)
        c.key: c.active,
    };
    if (previousActive.length != currentActive.length) {
      return true;
    }
    for (final MapEntry<String, bool> entry in previousActive.entries) {
      if (currentActive[entry.key] != entry.value) {
        return true;
      }
    }
    return false;
  }
}

class AnimatedImagePlaybackScope
    extends InheritedNotifier<AnimatedImagePlaybackController> {
  const AnimatedImagePlaybackScope({
    required super.child,
    required AnimatedImagePlaybackController controller,
    super.key,
  }) : super(notifier: controller);

  static AnimatedImagePlaybackController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AnimatedImagePlaybackScope>()
        ?.notifier;
  }
}
