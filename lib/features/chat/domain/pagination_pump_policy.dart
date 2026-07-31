/// Pump policy primitives for edge pagination.
///
/// Pure Dart by design: the coordinator (application layer) and the demand
/// source (presentation layer) both speak in these types, and neither may
/// drag Flutter or Riverpod into the domain to do it.
library;

/// Which loaded edge of the message window a request extends.
enum PaginationEdge { older, newer }

/// Budget for one pump: a chain of requests serving one demand episode.
class PumpBudget {
  /// Requests a single pump may issue before yielding.
  static const int maxRequestsPerPump = 4;

  /// Cooldown after a yield before geometry progress may resume the pump.
  static const Duration yieldCooldown = Duration(milliseconds: 300);
}

/// Status of one page request, bound to the request that produced it.
enum PageLoadStatus {
  /// A page was installed into the window.
  applied,

  /// The request completed with an empty page; nothing was installed.
  empty,

  /// The window moved (channel switch, wholesale replacement, or boundary
  /// supersession) while the request was in flight; nothing was installed.
  superseded,

  /// An entry guard refused the request before any fetch was issued.
  skipped,

  /// The fetch threw; nothing was installed.
  failed,
}

/// Immutable, request-bound outcome returned by `loadMore()`/`loadNewer()`.
///
/// The coordinator transitions ONLY from this record - never by diffing VM
/// state across the await (early returns, internal catches, supersession,
/// and interleaved realtime/trim/swap writes make state diffs lie).
final class PageLoadResult {
  const PageLoadResult({
    required this.edge,
    required this.channelId,
    required this.windowEpoch,
    required this.requestCursor,
    required this.installedBoundary,
    required this.status,
    required this.hasMoreAtEdge,
  });

  final PaginationEdge edge;
  final String channelId;

  /// Window epoch captured at request start.
  final int windowEpoch;

  /// The boundary id the request was issued with; null when the request was
  /// skipped before cursor derivation.
  final String? requestCursor;

  /// The window's new edge-boundary id when [status] == [PageLoadStatus.applied].
  final String? installedBoundary;

  final PageLoadStatus status;

  /// The edge's hasMore flag after this result.
  final bool hasMoreAtEdge;
}

/// True when the page advanced the cursor: the new boundary id differs
/// from the boundary id the request was issued with.
bool cursorAdvanced({
  required String? requestCursor,
  required String? newBoundary,
}) => newBoundary != null && newBoundary != requestCursor;
