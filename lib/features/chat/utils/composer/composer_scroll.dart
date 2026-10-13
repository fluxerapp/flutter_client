import 'package:flutter/widgets.dart';

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
