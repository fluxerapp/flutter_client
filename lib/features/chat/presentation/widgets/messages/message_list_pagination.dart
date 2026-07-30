enum MessageLoadEdge { older, newer }

double messageListLoadEnterMargin(double viewportHeight) =>
    (viewportHeight * 0.9).clamp(480.0, 900.0);

double messageListLoadRearmMargin(double viewportHeight) =>
    messageListLoadEnterMargin(viewportHeight) + viewportHeight * 0.5;

double messageListLoadProgressDelta(double viewportHeight) =>
    (viewportHeight * 0.15).clamp(80.0, 160.0);

class MessageEdgeLoadTrigger {
  double? _olderBaseline;
  double? _newerBaseline;

  void reset() {
    _olderBaseline = null;
    _newerBaseline = null;
  }

  void clearEdge(MessageLoadEdge edge) {
    _setBaseline(edge, null);
  }

  bool shouldRequest({
    required MessageLoadEdge edge,
    required double distanceFromEdge,
    required double viewportHeight,
    required bool hasMore,
    required bool isLoading,
    required bool isUserDrivenScroll,
    required bool hasActiveJumpTarget,
  }) {
    final double enterMargin = messageListLoadEnterMargin(viewportHeight);
    final double rearmMargin = enterMargin + viewportHeight * 0.5;
    if (distanceFromEdge > rearmMargin) {
      _setBaseline(edge, null);
    }
    if (!hasMore ||
        isLoading ||
        hasActiveJumpTarget ||
        !isUserDrivenScroll ||
        distanceFromEdge > enterMargin) {
      return false;
    }

    final double? baseline = _baseline(edge);
    final double delta = messageListLoadProgressDelta(viewportHeight);
    if (baseline != null && distanceFromEdge > baseline - delta) {
      return false;
    }

    _setBaseline(edge, distanceFromEdge);
    return true;
  }

  double? _baseline(MessageLoadEdge edge) =>
      edge == MessageLoadEdge.older ? _olderBaseline : _newerBaseline;

  void _setBaseline(MessageLoadEdge edge, double? value) {
    if (edge == MessageLoadEdge.older) {
      _olderBaseline = value;
    } else {
      _newerBaseline = value;
    }
  }
}
