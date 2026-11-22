import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/presentation/keybind_recorder.dart';
import 'package:fluxer_app/features/input/providers/keybind_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoicePushToTalkSettings extends ConsumerWidget {
  const VoicePushToTalkSettings({super.key});

  String _delayLabel(FluxerLocalizations l10n, int milliseconds) {
    if (milliseconds >= 1000) {
      final String seconds = (milliseconds / 1000).toStringAsFixed(
        milliseconds % 1000 == 0 ? 0 : 1,
      );
      return l10n.audioAndVideoReleaseDelaySeconds(seconds);
    }
    return l10n.audioAndVideoReleaseDelayMilliseconds(milliseconds);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final KeybindPreferencesState preferences = ref.watch(
      keybindPreferencesProvider,
    );
    final KeybindPreferences notifier = ref.read(
      keybindPreferencesProvider.notifier,
    );
    final CustomKeybindEntry? primary = preferences.primaryFor(
      KeybindAction.voicePushToTalk,
    );
    final int selectedDelay = kPushToTalkReleaseDelayOptions.reduce(
      (int a, int b) =>
          (a - preferences.pushToTalkReleaseDelayMs).abs() <=
              (b - preferences.pushToTalkReleaseDelayMs).abs()
          ? a
          : b,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FluxerSettingsSwitchItem(
          label: l10n.audioAndVideoPushToTalkLabel,
          description: l10n.audioAndVideoPushToTalkDescription,
          value: preferences.isPushToTalk,
          onChanged: (bool value) => unawaited(
            notifier.setTransmitMode(
              value
                  ? VoiceTransmitMode.pushToTalk
                  : VoiceTransmitMode.voiceActivity,
            ),
          ),
        ),
        if (preferences.isPushToTalk) ...<Widget>[
          FluxerSettingsSubsection(
            title: l10n.audioAndVideoPushToTalkKeybindLabel,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: KeybindRecorder(
                  combo:
                      primary?.combo ??
                      const StoredKeybindCombo(enabled: true, global: true),
                  onChanged: (StoredKeybindCombo combo) => unawaited(
                    notifier.setPrimaryCombo(
                      KeybindAction.voicePushToTalk,
                      combo,
                    ),
                  ),
                ),
              ),
            ],
          ),
          FluxerSelect<int>(
            label: l10n.audioAndVideoReleaseDelayLabel,
            description: l10n.audioAndVideoReleaseDelayDescription,
            value: selectedDelay,
            enableSearch: false,
            items: <FluxerSelectItem<int>>[
              for (final int option in kPushToTalkReleaseDelayOptions)
                FluxerSelectItem<int>(
                  value: option,
                  label: _delayLabel(l10n, option),
                ),
            ],
            onChanged: (int value) =>
                unawaited(notifier.setPushToTalkReleaseDelay(value)),
          ),
        ],
      ],
    );
  }
}
