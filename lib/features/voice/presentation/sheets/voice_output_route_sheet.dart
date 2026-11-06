import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const List<VoiceOutputRoute> _kVoiceOutputRouteOrder = <VoiceOutputRoute>[
  VoiceOutputRoute.speaker,
  VoiceOutputRoute.earpiece,
  VoiceOutputRoute.bluetooth,
  VoiceOutputRoute.headset,
];

String voiceOutputRouteLabel(FluxerLocalizations l10n, VoiceOutputRoute route) {
  switch (route) {
    case VoiceOutputRoute.speaker:
      return l10n.voiceOutputRouteSpeaker;
    case VoiceOutputRoute.earpiece:
      return l10n.voiceOutputRouteEarpiece;
    case VoiceOutputRoute.headset:
      return l10n.voiceOutputRouteHeadset;
    case VoiceOutputRoute.bluetooth:
      return l10n.voiceOutputRouteBluetooth;
  }
}

PhosphorIconData voiceOutputRouteIcon(VoiceOutputRoute route) {
  switch (route) {
    case VoiceOutputRoute.speaker:
      return PhosphorIconsFill.speakerHigh;
    case VoiceOutputRoute.earpiece:
      return PhosphorIconsFill.deviceMobileSpeaker;
    case VoiceOutputRoute.headset:
      return PhosphorIconsFill.headphones;
    case VoiceOutputRoute.bluetooth:
      return PhosphorIconsFill.bluetooth;
  }
}

VoiceOutputRoute watchVoiceCallOutputRoute(WidgetRef ref) {
  final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
  return resolveVoiceCallOutputRoute(
    preference: settings.outputRoute,
    override: settings.outputRouteOverride,
    available: ref.watch(voiceAvailableOutputRoutesProvider),
  );
}

String watchVoiceCallOutputRouteName(
  WidgetRef ref,
  FluxerLocalizations l10n,
  VoiceOutputRoute route,
) {
  final String? bluetoothName = ref.watch(voiceBluetoothDeviceNameProvider);
  if (route == VoiceOutputRoute.bluetooth && bluetoothName != null) {
    return bluetoothName;
  }
  return voiceOutputRouteLabel(l10n, route);
}

Future<void> showVoiceOutputRouteSheet(BuildContext context) {
  return FluxerBottomSheet.show<void>(
    context,
    useRootNavigator: true,
    title: FluxerLocalizations.of(context).voiceChangeAudioOutputLabel,
    variant: FluxerBottomSheetVariant.menu,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return _VoiceOutputRouteSheetBody(onClose: close);
    },
  );
}

class _VoiceOutputRouteSheetBody extends ConsumerWidget {
  const _VoiceOutputRouteSheetBody({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Set<VoiceOutputRoute> available = ref.watch(
      voiceAvailableOutputRoutesProvider,
    );
    final VoiceOutputRoute selected = watchVoiceCallOutputRoute(ref);
    return FluxerBottomSheetContent(
      child: FluxerMenuGroup(
        children: <Widget>[
          for (final VoiceOutputRoute route in _kVoiceOutputRouteOrder)
            if (available.contains(route))
              FluxerBottomSheetMenuItem(
                label: watchVoiceCallOutputRouteName(ref, l10n, route),
                icon: voiceOutputRouteIcon(route),
                isSelected: route == selected,
                trailing: FluxerRadioIndicator(selected: route == selected),
                onTap: () {
                  unawaited(
                    ref
                        .read(voiceSettingsProvider.notifier)
                        .selectOutputRoute(route),
                  );
                  onClose();
                },
              ),
        ],
      ),
    );
  }
}
