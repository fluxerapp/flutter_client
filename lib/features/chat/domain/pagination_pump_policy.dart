enum PaginationEdge { older, newer }

class PumpBudget {
  static const int maxRequestsPerPump = 4;

  static const Duration yieldCooldown = Duration(milliseconds: 300);
}

enum PageLoadStatus { applied, empty, superseded, skipped, failed }

final class PageLoadResult {
  const PageLoadResult({
    required this.channelId,
    required this.windowEpoch,
    required this.requestCursor,
    required this.installedBoundary,
    required this.status,
    required this.hasMoreAtEdge,
  });

  final String channelId;

  final int windowEpoch;

  final String? requestCursor;

  final String? installedBoundary;

  final PageLoadStatus status;

  final bool hasMoreAtEdge;
}

bool cursorAdvanced({
  required String? requestCursor,
  required String? newBoundary,
}) => newBoundary != null && newBoundary != requestCursor;
