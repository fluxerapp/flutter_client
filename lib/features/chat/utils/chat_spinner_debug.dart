import 'package:flutter/foundation.dart';

/// Why a chat-surface loading spinner is mounted (debug builds only).
enum ChatSpinnerReason {
  panelNotReady('panel_not_ready'),
  listLoading('list_loading'),
  loadingMore('loading_more'),
  loadingNewer('loading_newer'),
  typing('typing');

  const ChatSpinnerReason(this.label);

  final String label;
}

void debugLogChatSpinnerMount(ChatSpinnerReason reason) {
  if (kDebugMode) {
    debugPrint('[ChatSpinner] mounted: ${reason.label}');
  }
}
