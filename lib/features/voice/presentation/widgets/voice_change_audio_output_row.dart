import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Key kVoiceChangeAudioOutputKey = Key('voice-change-audio-output');

final GlobalKey voiceChangeAudioOutputRowKey = GlobalKey();

Rect? voiceChangeAudioOutputRowAnchor() {
  final BuildContext? context = voiceChangeAudioOutputRowKey.currentContext;
  if (context == null) {
    return null;
  }
  final RenderObject? renderObject = context.findRenderObject();
  if (renderObject is! RenderBox || !renderObject.hasSize) {
    return null;
  }
  final Offset origin = renderObject.localToGlobal(Offset.zero);
  return origin & renderObject.size;
}

String voiceOutputRouteLabel(FluxerLocalizations l10n, VoiceOutputRoute route) {
  switch (route) {
    case VoiceOutputRoute.speaker:
      return l10n.voiceOutputRouteSpeaker;
    case VoiceOutputRoute.earpiece:
      return l10n.voiceOutputRouteEarpiece;
    case VoiceOutputRoute.headset:
      return l10n.voiceOutputRouteHeadset;
  }
}

Future<void> openNativeVoiceAudioRoutePicker(WidgetRef ref) async {
  ref.read(voiceIosNativeRouteSyncProvider);
  final VoiceSettings settingsNotifier = ref.read(
    voiceSettingsProvider.notifier,
  );
  final VoiceSettingsState currentBeforePicker = ref.read(
    voiceSettingsProvider,
  );
  final String? pickedRoute = await presentNativeVoiceRoutePicker(
    anchor: voiceChangeAudioOutputRowAnchor(),
  );
  await syncVoiceSettingsAfterNativeRoutePicker(
    settingsNotifier: settingsNotifier,
    currentBeforePicker: currentBeforePicker,
    pickedRouteName: pickedRoute,
    readCurrentState: () => ref.read(voiceSettingsProvider),
  );
}

class VoiceChangeAudioOutputSettingsRow extends ConsumerWidget {
  const VoiceChangeAudioOutputSettingsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showNativeVoiceAudioRoutePicker()) {
      return const SizedBox.shrink();
    }
    ref.watch(voiceIosNativeRouteSyncProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceOutputRoute route = ref.watch(voiceSettingsProvider).outputRoute;
    return KeyedSubtree(
      key: voiceChangeAudioOutputRowKey,
      child: FluxerSettingsConfigureRow(
        key: kVoiceChangeAudioOutputKey,
        title: l10n.voiceChangeAudioOutputLabel,
        description: voiceOutputRouteLabel(l10n, route),
        onConfigure: () {
          unawaited(openNativeVoiceAudioRoutePicker(ref));
        },
      ),
    );
  }
}

class VoiceChangeAudioOutputPanelRow extends ConsumerWidget {
  const VoiceChangeAudioOutputPanelRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showNativeVoiceAudioRoutePicker()) {
      return const SizedBox.shrink();
    }
    ref.watch(voiceIosNativeRouteSyncProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceOutputRoute route = ref.watch(voiceSettingsProvider).outputRoute;
    final colors = context.colors;
    return KeyedSubtree(
      key: voiceChangeAudioOutputRowKey,
      child: FluxerListRow(
        key: kVoiceChangeAudioOutputKey,
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsFill.speakerHigh,
              size: 20,
              color: colors.textPrimary,
            ),
          ),
        ),
        title: l10n.voiceChangeAudioOutputLabel,
        subtitle: voiceOutputRouteLabel(l10n, route),
        trailing: PhosphorIcon(
          PhosphorIconsBold.caretRight,
          size: 18,
          color: colors.textPrimaryMuted,
        ),
        onTap: () {
          unawaited(openNativeVoiceAudioRoutePicker(ref));
        },
      ),
    );
  }
}
