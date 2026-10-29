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

class VoiceOutputRouteRadioGroup extends ConsumerWidget {
  const VoiceOutputRouteRadioGroup({this.controlKey, super.key});

  final Key? controlKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final Set<VoiceOutputRoute> availableRoutes = ref.watch(
      voiceAvailableOutputRoutesProvider,
    );
    final VoiceOutputRoute selectedRoute = resolveVoiceOutputRoute(
      preference: settings.outputRoute,
      available: availableRoutes,
    );
    return Padding(
      key: controlKey,
      padding: EdgeInsets.all(layout.s4),
      child: FluxerRadioGroup<VoiceOutputRoute>(
        value: selectedRoute,
        onChanged: (VoiceOutputRoute route) {
          unawaited(settingsNotifier.setOutputRoute(route));
        },
        items: <FluxerRadioItem<VoiceOutputRoute>>[
          if (availableRoutes.contains(VoiceOutputRoute.speaker))
            FluxerRadioItem(
              value: VoiceOutputRoute.speaker,
              label: l10n.voiceOutputRouteSpeaker,
            ),
          if (availableRoutes.contains(VoiceOutputRoute.earpiece))
            FluxerRadioItem(
              value: VoiceOutputRoute.earpiece,
              label: l10n.voiceOutputRouteEarpiece,
            ),
          if (availableRoutes.contains(VoiceOutputRoute.headset))
            FluxerRadioItem(
              value: VoiceOutputRoute.headset,
              label: l10n.voiceOutputRouteHeadset,
            ),
        ],
      ),
    );
  }
}

class VoiceOutputRouteSettingsControl extends ConsumerWidget {
  const VoiceOutputRouteSettingsControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerSettingsSubsection(
      title: l10n.voiceChangeAudioOutputLabel,
      children: const <Widget>[VoiceOutputRouteRadioGroup()],
    );
  }
}
