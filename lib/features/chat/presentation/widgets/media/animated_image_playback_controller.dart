import 'package:fluxer_app/features/chat/utils/gif_preview_playback_policy.dart';
import 'package:fluxer_app/material_ui.dart';

class _AnimatedImageCandidate {
  _AnimatedImageCandidate({
    required this.key,
    required this.top,
    required this.left,
  });

  final String key;
  double visibleFraction = 0;
  double top;
  double left;
  bool active = false;
}

/// Coordinates animated image playback in a scrollable feed.
class AnimatedImagePlaybackController extends ChangeNotifier {
  AnimatedImagePlaybackController({
    this.maxActiveVideos = kMaxActiveGifVideos,
    this.suppressWhileScrolling = false,
  });

  final int? maxActiveVideos;
  final bool suppressWhileScrolling;
  bool _scrollActive = false;

  final Map<String, _AnimatedImageCandidate> _candidates =
      <String, _AnimatedImageCandidate>{};

  bool get scrollActive => _scrollActive;

  void setScrollActive({required bool active}) {
    if (_scrollActive == active) {
      return;
    }
    _scrollActive = active;
    _recompute();
  }

  void register(
    String key,
    double visibleFraction, {
    double top = 0,
    double left = 0,
  }) {
    final _AnimatedImageCandidate? existing = _candidates[key];
    if (existing != null &&
        existing.visibleFraction == visibleFraction &&
        existing.top == top &&
        existing.left == left) {
      return;
    }
    final _AnimatedImageCandidate candidate =
        existing ?? _AnimatedImageCandidate(key: key, top: top, left: left);
    candidate
      ..visibleFraction = visibleFraction
      ..top = top
      ..left = left;
    _candidates[key] = candidate;
    _recompute();
  }

  void updateVisibility(
    String key,
    double visibleFraction, {
    double? top,
    double? left,
  }) {
    final _AnimatedImageCandidate? candidate = _candidates[key];
    if (candidate == null) {
      return;
    }
    final double nextTop = top ?? candidate.top;
    final double nextLeft = left ?? candidate.left;
    if (candidate.visibleFraction == visibleFraction &&
        candidate.top == nextTop &&
        candidate.left == nextLeft) {
      return;
    }
    candidate
      ..visibleFraction = visibleFraction
      ..top = nextTop
      ..left = nextLeft;
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
    if (suppressWhileScrolling && _scrollActive) {
      for (final _AnimatedImageCandidate candidate in _candidates.values) {
        candidate.active = false;
      }
    } else {
      final List<_AnimatedImageCandidate> visible =
          _candidates.values
              .where((candidate) => candidate.visibleFraction > 0)
              .toList()
            ..sort(_compareCandidatesByPaintOrder);
      final int? configuredLimit = maxActiveVideos;
      final int limit = configuredLimit == null || configuredLimit <= 0
          ? visible.length
          : configuredLimit;
      final Set<String> allowed = visible
          .take(limit)
          .map((candidate) => candidate.key)
          .toSet();
      for (final _AnimatedImageCandidate candidate in _candidates.values) {
        candidate.active = allowed.contains(candidate.key);
      }
    }
    if (_activeMapChanged(previousActive)) {
      notifyListeners();
    }
  }

  static int _compareCandidatesByPaintOrder(
    _AnimatedImageCandidate a,
    _AnimatedImageCandidate b,
  ) {
    final int topComparison = a.top.compareTo(b.top);
    if (topComparison != 0) {
      return topComparison;
    }
    return a.left.compareTo(b.left);
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
