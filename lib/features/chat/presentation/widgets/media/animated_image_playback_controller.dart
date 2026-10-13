import 'package:fluxer_app/material_ui.dart';

class _AnimatedImageCandidate {
  double visibleFraction = 0;
  int visibleSince = 0;
  bool active = false;
}

const int kMaxActiveChatAnimatedImages = 3;

class AnimatedImagePlaybackController extends ChangeNotifier {
  AnimatedImagePlaybackController({this.maxActiveVideos});

  final int? maxActiveVideos;
  int _visibleStamp = 0;

  final Map<Object, _AnimatedImageCandidate> _candidates =
      <Object, _AnimatedImageCandidate>{};

  void register(Object owner, double visibleFraction) {
    final _AnimatedImageCandidate? existing = _candidates[owner];
    if (existing != null && existing.visibleFraction == visibleFraction) {
      return;
    }
    final _AnimatedImageCandidate candidate =
        existing ?? _AnimatedImageCandidate();
    _setVisibleFraction(candidate, visibleFraction);
    _candidates[owner] = candidate;
    _recompute();
  }

  void updateVisibility(Object owner, double visibleFraction) {
    final _AnimatedImageCandidate? candidate = _candidates[owner];
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

  void unregister(Object owner) {
    _candidates.remove(owner);
    _recompute();
  }

  bool isPlaying(Object owner) {
    final _AnimatedImageCandidate? candidate = _candidates[owner];
    if (candidate == null) {
      return false;
    }
    return candidate.active;
  }

  void _recompute() {
    final Map<_AnimatedImageCandidate, bool> previousActive =
        _activeByCandidate();
    final List<_AnimatedImageCandidate> visible =
        _candidates.values
            .where((candidate) => candidate.visibleFraction > 0)
            .toList()
          ..sort(_compareCandidatesByVisibility);
    final int? configuredLimit = maxActiveVideos;
    final int limit = configuredLimit == null || configuredLimit <= 0
        ? visible.length
        : configuredLimit;
    final Set<_AnimatedImageCandidate> allowed = visible.take(limit).toSet();
    for (final _AnimatedImageCandidate candidate in _candidates.values) {
      candidate.active = allowed.contains(candidate);
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

  Map<_AnimatedImageCandidate, bool> _activeByCandidate() =>
      <_AnimatedImageCandidate, bool>{
        for (final _AnimatedImageCandidate c in _candidates.values) c: c.active,
      };

  bool _activeMapChanged(Map<_AnimatedImageCandidate, bool> previousActive) {
    final Map<_AnimatedImageCandidate, bool> currentActive =
        _activeByCandidate();
    if (previousActive.length != currentActive.length) {
      return true;
    }
    for (final MapEntry<_AnimatedImageCandidate, bool> entry
        in previousActive.entries) {
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
