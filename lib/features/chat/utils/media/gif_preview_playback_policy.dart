const int kMaxActiveGifVideos = 6;

const gifVideoPreviewPlaybackPolicy = GifPreviewPlaybackPolicy(
  maxActiveVideos: kMaxActiveGifVideos,
);

const gifAnimatedImagePreviewPlaybackPolicy = GifPreviewPlaybackPolicy(
  suppressWhileScrolling: false,
);

class GifPreviewPlaybackCandidate {
  const GifPreviewPlaybackCandidate({
    required this.index,
    required this.top,
    required this.bottom,
    required this.left,
  });

  final int index;
  final double top;
  final double bottom;
  final double left;
}

class GifPreviewPlaybackPolicy {
  const GifPreviewPlaybackPolicy({
    this.maxActiveVideos,
    this.suppressWhileScrolling = true,
  });

  final int? maxActiveVideos;
  final bool suppressWhileScrolling;

  Set<int> allowedVideoIndexes({
    required Iterable<GifPreviewPlaybackCandidate> candidates,
    required double viewportTop,
    required double viewportBottom,
    required bool isScrollActive,
  }) {
    final configuredLimit = maxActiveVideos;
    if ((configuredLimit != null && configuredLimit <= 0) ||
        (suppressWhileScrolling && isScrollActive)) {
      return <int>{};
    }

    final visibleCandidates =
        candidates
            .where(
              (candidate) =>
                  candidate.bottom >= viewportTop &&
                  candidate.top <= viewportBottom,
            )
            .toList()
          ..sort(_compareCandidatesByPaintOrder);

    final limit = configuredLimit ?? visibleCandidates.length;
    return visibleCandidates
        .take(limit)
        .map((candidate) => candidate.index)
        .toSet();
  }

  static int _compareCandidatesByPaintOrder(
    GifPreviewPlaybackCandidate a,
    GifPreviewPlaybackCandidate b,
  ) {
    final topComparison = a.top.compareTo(b.top);
    if (topComparison != 0) {
      return topComparison;
    }
    return a.left.compareTo(b.left);
  }
}
