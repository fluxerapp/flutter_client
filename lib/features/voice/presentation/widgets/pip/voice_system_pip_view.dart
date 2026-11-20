import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/pip/voice_pip_video.dart';
import 'package:fluxer_app/features/voice/providers/voice_system_pip_providers.dart';
import 'package:fluxer_app/features/voice/services/voice_system_pip_coordinator.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceSystemPipHost extends ConsumerWidget {
  const VoiceSystemPipHost({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool active = ref.watch(voiceSystemPipActiveProvider);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Offstage(
          offstage: active,
          child: TickerMode(enabled: !active, child: child),
        ),
        if (active) const VoiceSystemPipView(),
      ],
    );
  }
}

class VoiceSystemPipView extends ConsumerWidget {
  const VoiceSystemPipView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? tileId = ref.watch(
      voiceSystemPipTargetProvider.select(
        (VoiceSystemPipTarget? target) => target?.tileId,
      ),
    );
    return ColoredBox(
      color: const Color(0xFF000000),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          ref
              .read(voiceSystemPipCoordinatorProvider)
              .reportPipSize(constraints.biggest);
          if (tileId == null) {
            return const SizedBox.expand();
          }
          return VoicePipVideo(tileId: tileId, blocked: false);
        },
      ),
    );
  }
}
