import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_announcer_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_magic_tap_provider.dart';

class VoiceCallAccessibilityLayer extends ConsumerWidget {
  const VoiceCallAccessibilityLayer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(voiceMagicTapBridgeProvider);
    final String? announcement = ref.watch(voiceCallAnnouncerProvider);
    if (MediaQuery.supportsAnnounceOf(context)) {
      return child;
    }
    return Stack(
      fit: StackFit.passthrough,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        child,
        Positioned(
          left: 0,
          top: 0,
          width: 1,
          height: 1,
          child: Semantics(
            container: true,
            liveRegion: true,
            label: announcement ?? '',
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
