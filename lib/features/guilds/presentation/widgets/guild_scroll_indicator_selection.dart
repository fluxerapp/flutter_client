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

const double kGuildScrollIndicatorVisibilityEpsilon = 0.5;

int _severityRank(GuildScrollIndicatorSeverity severity) {
  return switch (severity) {
    GuildScrollIndicatorSeverity.mention => 2,
    GuildScrollIndicatorSeverity.unread => 1,
  };
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
