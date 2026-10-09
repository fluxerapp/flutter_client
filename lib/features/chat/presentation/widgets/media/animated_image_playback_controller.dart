import 'package:fluxer_app/material_ui.dart';

class _AnimatedImageCandidate {
  _AnimatedImageCandidate({required this.key});

  final String key;
  double visibleFraction = 0;
  int visibleSince = 0;
  bool active = false;
}

/// Most animated images the chat list plays at once.
const int kMaxActiveChatAnimatedImages = 3;

/// Coordinates animated image playback in a scrollable feed.
///
/// [maxActiveVideos] limits how many visible images animate. Null plays every
/// visible image. Over the limit, the most visible images play, and ties go to
/// the one that became visible last.
class AnimatedImagePlaybackController extends ChangeNotifier {
  AnimatedImagePlaybackController({
    this.maxActiveVideos,
    this.suppressWhileScrolling = false,
  });

  final int? maxActiveVideos;
  final bool suppressWhileScrolling;
  bool _scrollActive = false;
  int _visibleStamp = 0;

  final Map<String, _AnimatedImageCandidate> _candidates =
      <String, _AnimatedImageCandidate>{};

  void setScrollActive({required bool active}) {
    if (_scrollActive == active) {
      return;
    }
    _scrollActive = active;
    _recompute();
  }

  void register(String key, double visibleFraction) {
    final _AnimatedImageCandidate? existing = _candidates[key];
    if (existing != null && existing.visibleFraction == visibleFraction) {
      return;
    }
    final _AnimatedImageCandidate candidate =
        existing ?? _AnimatedImageCandidate(key: key);
    _setVisibleFraction(candidate, visibleFraction);
    _candidates[key] = candidate;
    _recompute();
  }

  void updateVisibility(String key, double visibleFraction) {
    final _AnimatedImageCandidate? candidate = _candidates[key];
    if (candidate == null || candidate.visibleFraction == visibleFraction) {
      return;
    }
    _setVisibleFraction(candidate, visibleFraction);
    _recompute();
  }

  void _setVisibleFraction(
    _AnimatedImageCandidate candidate,
    double visibleFraction,
  ) {
    if (candidate.visibleFraction <= 0 && visibleFraction > 0) {
      _visibleStamp += 1;
      candidate.visibleSince = _visibleStamp;
    }
    candidate.visibleFraction = visibleFraction;
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
            ..sort(_compareCandidatesByVisibility);
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

  static int _compareCandidatesByVisibility(
    _AnimatedImageCandidate a,
    _AnimatedImageCandidate b,
  ) {
    final int fractionComparison = b.visibleFraction.compareTo(
      a.visibleFraction,
    );
    if (fractionComparison != 0) {
      return fractionComparison;
    }
    return b.visibleSince.compareTo(a.visibleSince);
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
