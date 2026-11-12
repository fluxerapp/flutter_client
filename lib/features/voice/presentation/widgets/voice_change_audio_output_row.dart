import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_output_route_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_voice/fluxer_voice.dart' show VoiceActiveOutputRoute;

const Key kVoiceChangeAudioOutputKey = Key('voice-change-audio-output');

String _voiceActiveOutputRouteLabel(WidgetRef ref, FluxerLocalizations l10n) {
  final VoiceActiveOutputRoute? active = ref.watch(
    voiceIosNativeRouteSyncProvider,
  );
  final String? deviceName = active?.deviceName;
  if (deviceName != null) {
    return deviceName;
  }
  return voiceOutputRouteLabel(
    l10n,
    active?.route ?? ref.watch(voiceSettingsProvider).outputRoute,
  );
}

class _NativeRoutePickerOverlay extends ConsumerStatefulWidget {
  const _NativeRoutePickerOverlay({
    required this.label,
    required this.value,
    required this.child,
  });

  final String label;
  final String value;
  final Widget child;

  @override
  ConsumerState<_NativeRoutePickerOverlay> createState() =>
      _NativeRoutePickerOverlayState();
}

class _NativeRoutePickerOverlayState
    extends ConsumerState<_NativeRoutePickerOverlay> {
  MethodChannel? _channel;

  void _onCreated(int id) {
    _channel = MethodChannel('fluxer_app/voice_route_picker/$id');
    _sendValue();
  }

  void _sendValue() {
    _channel?.invokeMethod<void>('setValue', widget.value).ignore();
  }

  @override
  void didUpdateWidget(_NativeRoutePickerOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _sendValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool inCall = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.isInVoice),
    );
    return Stack(
      children: <Widget>[
        ExcludeSemantics(child: widget.child),
        Positioned.fill(
          child: UiKitView(
            key: ValueKey<String>('$inCall-${widget.label}'),
            viewType: 'fluxer_app/voice_route_picker',
            creationParams: <String, Object>{
              'inCall': inCall,
              'label': widget.label,
              'value': widget.value,
            },
            creationParamsCodec: const StandardMessageCodec(),
            onPlatformViewCreated: _onCreated,
          ),
        ),
      ],
    );
  }
}

class VoiceChangeAudioOutputSettingsRow extends ConsumerWidget {
  const VoiceChangeAudioOutputSettingsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool usesNativePicker = showNativeVoiceAudioRoutePicker();
    final String routeLabel = usesNativePicker
        ? _voiceActiveOutputRouteLabel(ref, l10n)
        : watchVoiceCallOutputRouteName(
            ref,
            l10n,
            watchVoiceCallOutputRoute(ref),
          );
    final Widget row = FluxerSettingsConfigureRow(
      key: kVoiceChangeAudioOutputKey,
      title: l10n.voiceChangeAudioOutputLabel,
      description: routeLabel,
      onConfigure: usesNativePicker
          ? () {}
          : () => unawaited(showVoiceOutputRouteSheet(context)),
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: 16,
        color: context.colors.textSecondary,
      ),
    );
    if (!usesNativePicker) {
      return row;
    }
    return _NativeRoutePickerOverlay(
      label: l10n.voiceChangeAudioOutputLabel,
      value: routeLabel,
      child: row,
    );
  }
}

class VoiceChangeAudioOutputPanelRow extends ConsumerWidget {
  const VoiceChangeAudioOutputPanelRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final bool usesNativePicker = showNativeVoiceAudioRoutePicker();
    final VoiceOutputRoute route = usesNativePicker
        ? VoiceOutputRoute.speaker
        : watchVoiceCallOutputRoute(ref);
    final String routeLabel = usesNativePicker
        ? _voiceActiveOutputRouteLabel(ref, l10n)
        : watchVoiceCallOutputRouteName(ref, l10n, route);
    final Widget row = FluxerListRow(
      key: kVoiceChangeAudioOutputKey,
      leading: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: PhosphorIcon(
            voiceOutputRouteIcon(route),
            size: 20,
            color: colors.textPrimary,
          ),
        ),
      ),
      title: l10n.voiceChangeAudioOutputLabel,
      subtitle: routeLabel,
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: 18,
        color: colors.textPrimaryMuted,
      ),
      onTap: usesNativePicker
          ? null
          : () => unawaited(showVoiceOutputRouteSheet(context)),
    );
    if (!usesNativePicker) {
      return row;
    }
    return _NativeRoutePickerOverlay(
      label: l10n.voiceChangeAudioOutputLabel,
      value: routeLabel,
      child: row,
    );
  }
}
