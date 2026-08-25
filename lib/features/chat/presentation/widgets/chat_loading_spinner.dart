import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';

class ChatLoadingSpinner extends StatefulWidget {
  const ChatLoadingSpinner({required this.reason, this.color, super.key});

  final ChatSpinnerReason reason;
  final Color? color;

  @override
  State<ChatLoadingSpinner> createState() => _ChatLoadingSpinnerState();
}

class _ChatLoadingSpinnerState extends State<ChatLoadingSpinner> {
  @override
  void initState() {
    super.initState();
    assert(() {
      debugLogChatSpinnerMount(widget.reason);
      return true;
    }(), 'Log chat spinner mount for debug builds.');
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ExcludeSemantics(child: FluxerLoadingSpinner(color: widget.color)),
    );
  }
}
