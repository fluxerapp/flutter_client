import 'package:flutter/material.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';

/// Chat loading spinner with optional debug mount logging.
class ChatLoadingSpinner extends StatelessWidget {
  const ChatLoadingSpinner({required this.reason, this.color, super.key});

  final ChatSpinnerReason reason;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    assert(() {
      debugLogChatSpinnerMount(reason);
      return true;
    }(), 'Log chat spinner mount for debug builds.');
    return RepaintBoundary(child: FluxerLoadingSpinner(color: color));
  }
}
