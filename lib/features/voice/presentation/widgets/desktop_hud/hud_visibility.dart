import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceHudVisibility extends ConsumerWidget {
  const VoiceHudVisibility({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool visible = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        duration: context.motion.panel,
        curve: context.motion.curve,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }
}
