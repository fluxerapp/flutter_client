import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show TextField;

/// Scrolls a composer [TextField]'s [scrollController] to the end after layout.
///
/// Used after programmatic inserts (emoji picker) so the caret stays
/// visible when the field exceeds its visible row limit. Skips when content
/// still fits (`maxScrollExtent <= 0`) or the controller has no clients.
void scheduleComposerScrollToEnd(
  ScrollController scrollController, {
  bool Function()? isMounted,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (isMounted != null && !isMounted()) {
      return;
    }
    if (!scrollController.hasClients) {
      return;
    }
    final double maxScrollExtent = scrollController.position.maxScrollExtent;
    if (maxScrollExtent <= 0) {
      return;
    }
    scrollController.jumpTo(maxScrollExtent);
  });
}
