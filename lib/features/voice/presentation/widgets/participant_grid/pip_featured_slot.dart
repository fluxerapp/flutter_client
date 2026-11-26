import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/material_ui.dart';

class VoicePipFeaturedSlot extends ConsumerWidget {
  const VoicePipFeaturedSlot({
    required this.phase,
    required this.child,
    super.key,
  });

  final VoicePipOverlayPhase phase;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasPin = ref.watch(
      voiceCallLayoutProvider.select(
        (VoiceCallLayoutState state) => state.pinnedTileId != null,
      ),
    );
    Widget slot = child;
    if (voicePipHidesFeaturedTile(phase)) {
      slot = Visibility(
        visible: false,
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        child: child,
      );
    }
    if (!hasPin && voicePipHostsFeatured(phase)) {
      return KeyedSubtree(key: kVoicePipExpandSlotKey, child: slot);
    }
    return slot;
  }
}
