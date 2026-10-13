import 'package:flutter/foundation.dart';

enum ChatSpinnerReason {
  panelNotReady('panel_not_ready'),
  loadingMore('loading_more'),
  loadingNewer('loading_newer');

  const ChatSpinnerReason(this.label);

  final String label;
}

void debugLogChatSpinnerMount(ChatSpinnerReason reason) {
  if (kDebugMode) {
    debugPrint('[ChatSpinner] mounted: ${reason.label}');
  }
}
