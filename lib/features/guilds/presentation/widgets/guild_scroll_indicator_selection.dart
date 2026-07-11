import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';

enum GuildScrollIndicatorEdge { top, bottom }

typedef GuildScrollIndicatorCandidate = ({
  String id,
  GuildScrollIndicatorSeverity severity,
  double distance,
  int order,
});

typedef GuildScrollIndicatorSelection = ({
  GuildScrollIndicatorEdge edge,
  GuildScrollIndicatorCandidate candidate,
});

typedef GuildScrollIndicatorTarget = ({
  String id,
  GuildScrollIndicatorSeverity severity,
  double top,
  double bottom,
  int order,
});

typedef GuildScrollIndicatorLayout = ({
  double scrollTop,
  double viewportHeight,
  List<GuildScrollIndicatorTarget> targets,
  GuildScrollIndicatorEdge? preferredEdge,
});

const double kGuildScrollIndicatorVisibilityEpsilon = 0.5;

int _severityRank(GuildScrollIndicatorSeverity severity) {
  return switch (severity) {
    GuildScrollIndicatorSeverity.mention => 2,
    GuildScrollIndicatorSeverity.unread => 1,
  };
}

bool _isValidTarget(GuildScrollIndicatorTarget target) {
  return target.id.isNotEmpty &&
      target.top.isFinite &&
      target.bottom.isFinite &&
      target.bottom >= target.top;
}

bool _isBetterCandidate(
  GuildScrollIndicatorCandidate candidate,
  GuildScrollIndicatorCandidate? current,
) {
  if (current == null) {
    return true;
  }
  final int candidateSeverity = _severityRank(candidate.severity);
  final int currentSeverity = _severityRank(current.severity);
  if (candidateSeverity != currentSeverity) {
    return candidateSeverity > currentSeverity;
  }
  if (candidate.distance != current.distance) {
    return candidate.distance < current.distance;
  }
  return candidate.order < current.order;
}

({
  GuildScrollIndicatorCandidate? topCandidate,
  GuildScrollIndicatorCandidate? bottomCandidate,
})
collectGuildScrollIndicatorCandidates(GuildScrollIndicatorLayout layout) {
  final double viewportTop = layout.scrollTop < 0 ? 0 : layout.scrollTop;
  final double viewportBottom =
      viewportTop + (layout.viewportHeight < 0 ? 0 : layout.viewportHeight);
  GuildScrollIndicatorCandidate? topCandidate;
  GuildScrollIndicatorCandidate? bottomCandidate;
  for (final GuildScrollIndicatorTarget target in layout.targets) {
    if (!_isValidTarget(target)) {
      continue;
    }
    if (target.bottom <= viewportTop + kGuildScrollIndicatorVisibilityEpsilon) {
      final GuildScrollIndicatorCandidate candidate = (
        id: target.id,
        severity: target.severity,
        distance: (viewportTop - target.bottom).clamp(0, double.infinity),
        order: target.order,
      );
      if (_isBetterCandidate(candidate, topCandidate)) {
        topCandidate = candidate;
      }
    } else if (target.top >=
        viewportBottom - kGuildScrollIndicatorVisibilityEpsilon) {
      final GuildScrollIndicatorCandidate candidate = (
        id: target.id,
        severity: target.severity,
        distance: (target.top - viewportBottom).clamp(0, double.infinity),
        order: target.order,
      );
      if (_isBetterCandidate(candidate, bottomCandidate)) {
        bottomCandidate = candidate;
      }
    }
  }
  return (topCandidate: topCandidate, bottomCandidate: bottomCandidate);
}

GuildScrollIndicatorSelection? selectGuildScrollIndicator({
  required GuildScrollIndicatorCandidate? topCandidate,
  required GuildScrollIndicatorCandidate? bottomCandidate,
  GuildScrollIndicatorEdge? preferredEdge,
  GuildScrollIndicatorEdge? previousEdge,
}) {
  if (topCandidate == null && bottomCandidate == null) {
    return null;
  }
  if (topCandidate == null && bottomCandidate != null) {
    return (edge: GuildScrollIndicatorEdge.bottom, candidate: bottomCandidate);
  }
  if (topCandidate != null && bottomCandidate == null) {
    return (edge: GuildScrollIndicatorEdge.top, candidate: topCandidate);
  }
  final GuildScrollIndicatorCandidate top = topCandidate!;
  final GuildScrollIndicatorCandidate bottom = bottomCandidate!;
  final int topSeverityRank = _severityRank(top.severity);
  final int bottomSeverityRank = _severityRank(bottom.severity);
  if (topSeverityRank > bottomSeverityRank) {
    return (edge: GuildScrollIndicatorEdge.top, candidate: top);
  }
  if (bottomSeverityRank > topSeverityRank) {
    return (edge: GuildScrollIndicatorEdge.bottom, candidate: bottom);
  }
  if (top.distance < bottom.distance) {
    return (edge: GuildScrollIndicatorEdge.top, candidate: top);
  }
  if (bottom.distance < top.distance) {
    return (edge: GuildScrollIndicatorEdge.bottom, candidate: bottom);
  }
  if (preferredEdge == GuildScrollIndicatorEdge.top) {
    return (edge: GuildScrollIndicatorEdge.top, candidate: top);
  }
  if (preferredEdge == GuildScrollIndicatorEdge.bottom) {
    return (edge: GuildScrollIndicatorEdge.bottom, candidate: bottom);
  }
  if (previousEdge == GuildScrollIndicatorEdge.top) {
    return (edge: GuildScrollIndicatorEdge.top, candidate: top);
  }
  if (previousEdge == GuildScrollIndicatorEdge.bottom) {
    return (edge: GuildScrollIndicatorEdge.bottom, candidate: bottom);
  }
  return (edge: GuildScrollIndicatorEdge.top, candidate: top);
}

GuildScrollIndicatorSelection? resolveGuildScrollIndicator({
  required GuildScrollIndicatorLayout layout,
  GuildScrollIndicatorEdge? previousEdge,
}) {
  final ({
    GuildScrollIndicatorCandidate? topCandidate,
    GuildScrollIndicatorCandidate? bottomCandidate,
  })
  candidates = collectGuildScrollIndicatorCandidates(layout);
  return selectGuildScrollIndicator(
    topCandidate: candidates.topCandidate,
    bottomCandidate: candidates.bottomCandidate,
    preferredEdge: layout.preferredEdge,
    previousEdge: previousEdge,
  );
}
