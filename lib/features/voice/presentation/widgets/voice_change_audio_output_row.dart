import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

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
    if (!showNativeVoiceAudioRoutePicker()) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String routeLabel = _voiceActiveOutputRouteLabel(ref, l10n);
    return _NativeRoutePickerOverlay(
      label: l10n.voiceChangeAudioOutputLabel,
      value: routeLabel,
      child: FluxerSettingsConfigureRow(
        key: kVoiceChangeAudioOutputKey,
        title: l10n.voiceChangeAudioOutputLabel,
        description: routeLabel,
        onConfigure: () {},
        trailing: PhosphorIcon(
          PhosphorIconsBold.caretRight,
          size: 16,
          color: context.colors.textSecondary,
        ),
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String routeLabel = _voiceActiveOutputRouteLabel(ref, l10n);
    final colors = context.colors;
    return _NativeRoutePickerOverlay(
      label: l10n.voiceChangeAudioOutputLabel,
      value: routeLabel,
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
        subtitle: routeLabel,
        trailing: PhosphorIcon(
          PhosphorIconsBold.caretRight,
          size: 18,
          color: colors.textPrimaryMuted,
        ),
      ),
    );
  }
}
