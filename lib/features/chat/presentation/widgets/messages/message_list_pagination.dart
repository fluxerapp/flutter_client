/// Pure edge predicates that drive bidirectional message-list pagination.
///
/// In the reverse chat list the newest message is at `minScrollExtent` (the
/// bottom) and the oldest is at `maxScrollExtent` (the top). Loading is gated
/// purely on proximity to an edge plus the in-flight flags; there is no
/// cooldown or user-intent heuristic. Each load self-terminates because the
/// `ChatScrollObserver` keeps the viewport fixed, which pushes the scroll
/// position back out of the band after a page is inserted.
library;

/// Distance from an edge (in pixels) within which the next page is requested.
///
/// Kept below a typical page's rendered height so at most one page loads per
/// approach to an edge.
const double kMessageListLoadMargin = 1200;

/// Whether older messages should load: the viewport is within
/// [kMessageListLoadMargin] of the top ([maxScrollExtent] in the reverse list).
bool shouldLoadOlderAtEdge({
  required double pixels,
  required double maxScrollExtent,
  required bool hasMoreMessages,
  required bool isLoadingMore,
}) =>
    hasMoreMessages &&
    !isLoadingMore &&
    (maxScrollExtent - pixels) <= kMessageListLoadMargin;

/// Whether newer messages should load: the viewport is within
/// [kMessageListLoadMargin] of the bottom ([minScrollExtent] in the reverse
/// list).
bool shouldLoadNewerAtEdge({
  required double pixels,
  required double minScrollExtent,
  required bool hasMoreNewerMessages,
  required bool isLoadingNewer,
}) =>
    hasMoreNewerMessages &&
    !isLoadingNewer &&
    (pixels - minScrollExtent) <= kMessageListLoadMargin;
