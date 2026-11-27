import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_modal.dart';
import 'package:fluxer_app/features/voice/providers/active_screen_share_source_provider.dart';
import 'package:fluxer_app/features/voice/providers/active_self_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_capability.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> startOrStopScreenShare(BuildContext context, WidgetRef ref) {
  if (!_isSelfStreaming(ref) && usesScreenShareSourcePicker) {
    return showVoiceScreenSharePicker(context);
  }
  return _toggleSelfStream(context, ref);
}

Future<void> stopScreenShare(BuildContext context, WidgetRef ref) async {
  if (_isSelfStreaming(ref)) {
    await _toggleSelfStream(context, ref);
  }
}

Future<void> changeScreenShareSource(BuildContext context, WidgetRef ref) {
  final ScreenShareSource? active = ref.read(activeScreenShareSourceProvider);
  return showVoiceScreenSharePicker(
    context,
    mode: ScreenSharePickerMode.change,
    initialTab: active == null
        ? ScreenSharePickerTab.entireScreen
        : ScreenSharePickerTab.forKind(active.kind),
  );
}

bool _isSelfStreaming(WidgetRef ref) =>
    ref.read(activeSelfVoiceStateProvider)?.selfStream ?? false;

Future<void> _toggleSelfStream(BuildContext context, WidgetRef ref) {
  return ref
      .read(voiceSessionProvider.notifier)
      .toggleSelfStream(
        screenShareNotificationText: FluxerLocalizations.of(
          context,
        ).voiceScreenShareNotificationText,
      );
}
