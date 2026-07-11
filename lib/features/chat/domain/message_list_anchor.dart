import 'package:fluxer_app/features/chat/domain/message.dart';

/// Change at the newest (render-leading, bottom) edge of the message window
/// between two successive builds.
///
/// In the reverse chat list the newest message sits at render index 0, so only
/// changes to the data-end (the newest side) can move the viewport while the
/// user is scrolled up. Older-edge changes (prepend on load-older, trim of the
/// oldest on load-newer) are position-stable for free and are deliberately
/// reported as zero so the caller leaves the scroll position alone.
class LeadingEdgeDelta {
  const LeadingEdgeDelta({
    required this.addedNewest,
    required this.removedNewest,
  });

  /// Newer messages appended at the data end since the previous build.
  final int addedNewest;

  /// Newest messages dropped from the data end (window trim / delete of tail).
  final int removedNewest;

  bool get isUnchanged => addedNewest == 0 && removedNewest == 0;
}

/// Diffs [prev] -> [next] at the newest end only.
///
/// Messages are chronological ascending (index 0 oldest, `last` newest), as
/// produced by the chat view model's merge. The diff anchors on `prev.last`:
/// if it still exists in [next], everything after it was appended
/// ([LeadingEdgeDelta.addedNewest]); if it is gone, the newest entries were
/// trimmed and the count after `next.last` in [prev] is
/// [LeadingEdgeDelta.removedNewest].
///
/// Returns a zero delta when either list is empty (initial load, clear) or when
/// the windows fully diverge (channel switch); the caller resets its baseline on
/// channel switch so the divergent case is never relied upon for correctness.
LeadingEdgeDelta computeLeadingEdgeDelta(
  List<Message> prev,
  List<Message> next,
) => computeLeadingEdgeKeyDelta(
  prev.map((Message message) => message.id).toList(growable: false),
  next.map((Message message) => message.id).toList(growable: false),
);

/// Diffs stable render-item identities at the newest edge.
LeadingEdgeDelta computeLeadingEdgeKeyDelta(
  List<Object> prevKeys,
  List<Object> nextKeys,
) {
  const LeadingEdgeDelta none = LeadingEdgeDelta(
    addedNewest: 0,
    removedNewest: 0,
  );
  if (prevKeys.isEmpty || nextKeys.isEmpty) {
    return none;
  }
  final Object prevLastKey = prevKeys.last;
  final int idxInNext = nextKeys.lastIndexOf(prevLastKey);
  if (idxInNext != -1) {
    return LeadingEdgeDelta(
      addedNewest: nextKeys.length - 1 - idxInNext,
      removedNewest: 0,
    );
  }
  final Object nextLastKey = nextKeys.last;
  final int idxInPrev = prevKeys.lastIndexOf(nextLastKey);
  if (idxInPrev != -1) {
    return LeadingEdgeDelta(
      addedNewest: 0,
      removedNewest: prevKeys.length - 1 - idxInPrev,
    );
  }
  return none;
}
