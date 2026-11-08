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

String voiceOutputDeviceKindLabel(
  FluxerLocalizations l10n,
  VoiceOutputDeviceKind kind,
) {
  switch (kind) {
    case VoiceOutputDeviceKind.earpiece:
      return l10n.voiceOutputRouteEarpiece;
    case VoiceOutputDeviceKind.speaker:
      return l10n.voiceOutputRouteSpeaker;
    case VoiceOutputDeviceKind.wired:
      return l10n.voiceOutputRouteHeadset;
    case VoiceOutputDeviceKind.usb:
      return l10n.voiceOutputRouteUsb;
    case VoiceOutputDeviceKind.bluetooth:
      return l10n.voiceOutputRouteBluetooth;
    case VoiceOutputDeviceKind.bluetoothLe:
      return l10n.voiceOutputRouteBluetoothLe;
    case VoiceOutputDeviceKind.hearingAid:
      return l10n.voiceOutputRouteHearingAid;
  }
}

PhosphorIconData voiceOutputDeviceKindIcon(VoiceOutputDeviceKind kind) {
  switch (kind) {
    case VoiceOutputDeviceKind.usb:
      return PhosphorIconsFill.usb;
    case VoiceOutputDeviceKind.hearingAid:
      return PhosphorIconsFill.ear;
    case VoiceOutputDeviceKind.earpiece:
    case VoiceOutputDeviceKind.speaker:
    case VoiceOutputDeviceKind.wired:
    case VoiceOutputDeviceKind.bluetooth:
    case VoiceOutputDeviceKind.bluetoothLe:
      return voiceOutputRouteIcon(kind.route);
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

List<VoiceOutputDevice> _watchVoiceOutputDeviceOptions(WidgetRef ref) {
  return voiceOutputDeviceOptions(
    devices: ref.watch(voiceOutputDevicesProvider),
    available: ref.watch(voiceAvailableOutputRoutesProvider),
  );
}

VoiceOutputDevice? _watchSelectedVoiceOutputDevice(
  WidgetRef ref,
  List<VoiceOutputDevice> options,
  VoiceOutputRoute route,
) {
  return selectedVoiceOutputDevice(
    options: options,
    route: route,
    overrideDeviceId: ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState settings) => settings.outputDeviceOverride,
      ),
    ),
  );
}

String watchVoiceCallOutputRouteName(
  WidgetRef ref,
  FluxerLocalizations l10n,
  VoiceOutputRoute route,
) {
  final VoiceOutputDevice? device = _watchSelectedVoiceOutputDevice(
    ref,
    _watchVoiceOutputDeviceOptions(ref),
    route,
  );
  final String? name = device?.name;
  if (name != null && !isBuiltInVoiceOutputRoute(route)) {
    return name;
  }
  return voiceOutputRouteLabel(l10n, route);
}

Future<void> showVoiceOutputRouteSheet(BuildContext context) {
  unawaited(
    ProviderScope.containerOf(
      context,
      listen: false,
    ).read(voiceOutputDevicesProvider.notifier).refresh(),
  );
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
    final List<VoiceOutputDevice> options = _watchVoiceOutputDeviceOptions(ref);
    final VoiceOutputDevice? selected = _watchSelectedVoiceOutputDevice(
      ref,
      options,
      watchVoiceCallOutputRoute(ref),
    );
    return FluxerBottomSheetContent(
      child: FluxerMenuGroup(
        children: <Widget>[
          for (final VoiceOutputDevice device in options)
            FluxerBottomSheetMenuItem(
              label: voiceOutputDeviceKindLabel(l10n, device.kind),
              hint: device.name,
              icon: voiceOutputDeviceKindIcon(device.kind),
              isSelected: device == selected,
              trailing: FluxerRadioIndicator(selected: device == selected),
              onTap: () {
                unawaited(
                  ref
                      .read(voiceSettingsProvider.notifier)
                      .selectOutputDevice(device),
                );
                onClose();
              },
            ),
        ],
      ),
    );
  }
}
