import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_display_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_noise_filter_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Key kVoiceControlPanelSettingsKey = Key('voice-control-panel-settings');
const Key kVoiceControlPanelShowChatKey = Key('voice-control-panel-show-chat');
const Key kVoiceControlPanelUseEarpieceKey = Key(
  'voice-control-panel-use-earpiece',
);
const Key kVoiceControlPanelOnlyShowVideosKey = Key(
  'voice-control-panel-only-show-videos',
);
const Key kVoiceControlPanelShowOwnCameraKey = Key(
  'voice-control-panel-show-own-camera',
);

class VoiceChannelControlPanelSettings extends ConsumerWidget {
  const VoiceChannelControlPanelSettings({
    this.channelId,
    this.channelName,
    super.key,
  });

  final String? channelId;
  final String? channelName;

  Future<void> _setNoiseSuppressionTier(
    WidgetRef ref,
    NoiseSuppressionTier tier,
  ) async {
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final VoiceSettingsState settings = ref.read(voiceSettingsProvider);
    if (settings.voiceProcessingMode != VoiceProcessingMode.custom) {
      await settingsNotifier.setVoiceProcessingMode(VoiceProcessingMode.custom);
    }
    await settingsNotifier.setNoiseSuppressionTier(tier);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final VoiceSettingsState settings = ref.watch(voiceSettingsProvider);
    final VoiceSettings settingsNotifier = ref.read(
      voiceSettingsProvider.notifier,
    );
    final VoiceCallDisplayPreferencesState displayPreferences = ref.watch(
      voiceCallDisplayPreferencesProvider,
    );
    final VoiceCallDisplayPreferences displayNotifier = ref.read(
      voiceCallDisplayPreferencesProvider.notifier,
    );
    final bool noiseFilterSupported = ref
        .watch(voiceNoiseFilterProvider)
        .maybeWhen(
          data: (VoiceNoiseFilterState value) => value.isSupported,
          orElse: () => false,
        );
    final NoiseSuppressionTier noiseSuppressionTier =
        effectiveVoicePanelNoiseSuppressionTier(
          settings: settings,
          noiseFilterSupported: noiseFilterSupported,
        );
    final String? channelId = this.channelId;
    final bool showChatRow =
        channelId != null &&
        (ref.watch(voiceChannelTextChatSupportedProvider(channelId)).value ??
            false);
    final bool canSwitchSpeaker = AudioManager.instance.canSwitchSpeakerphone;
    return Padding(
      key: kVoiceControlPanelSettingsKey,
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s2, layout.s4, layout.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (showChatRow) ...<Widget>[
            FluxerListSection(
              children: <Widget>[
                FluxerListRow(
                  key: kVoiceControlPanelShowChatKey,
                  leading: const VoicePanelListIcon(
                    icon: PhosphorIconsFill.chatTeardrop,
                  ),
                  title: l10n.voiceTextChatShow,
                  trailing: PhosphorIcon(
                    PhosphorIconsBold.caretRight,
                    size: 18,
                    color: context.colors.textPrimaryMuted,
                  ),
                  onTap: () {
                    unawaited(
                      showVoiceChannelChatSheet(
                        context,
                        channelId: channelId,
                        channelName: channelName,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: layout.s4),
          ],
          FluxerListSection(
            header: l10n.voicePanelSettingsSectionTitle,
            children: <Widget>[
              if (canSwitchSpeaker)
                VoicePanelSettingSwitchRow(
                  key: kVoiceControlPanelUseEarpieceKey,
                  icon: PhosphorIconsFill.deviceMobile,
                  label: l10n.voicePanelUseEarpieceLabel,
                  value: !settings.preferSpeakerOutput,
                  onChanged: (bool value) {
                    unawaited(
                      settingsNotifier.setPreferSpeakerOutput(value: !value),
                    );
                  },
                ),
              VoicePanelSettingSwitchRow(
                key: kVoiceControlPanelOnlyShowVideosKey,
                icon: PhosphorIconsFill.videoCamera,
                label: l10n.voicePanelOnlyShowVideosLabel,
                description: l10n.voicePanelOnlyShowVideosDescription,
                value: displayPreferences.onlyShowVideos,
                onChanged: (bool value) {
                  displayNotifier.setOnlyShowVideos(value: value);
                },
              ),
              VoicePanelSettingSwitchRow(
                key: kVoiceControlPanelShowOwnCameraKey,
                icon: PhosphorIconsFill.userFocus,
                label: l10n.voicePanelShowOwnCameraLabel,
                value: displayPreferences.showOwnCamera,
                onChanged: (bool value) {
                  displayNotifier.setShowOwnCamera(value: value);
                },
              ),
            ],
          ),
          SizedBox(height: layout.s4),
          FluxerListSection(
            header: l10n.audioAndVideoNoiseSuppressionSectionTitle,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(layout.s4),
                child: FluxerRadioGroup<NoiseSuppressionTier>(
                  value: noiseSuppressionTier,
                  onChanged: (NoiseSuppressionTier value) {
                    unawaited(_setNoiseSuppressionTier(ref, value));
                  },
                  items: <FluxerRadioItem<NoiseSuppressionTier>>[
                    FluxerRadioItem(
                      value: NoiseSuppressionTier.enhanced,
                      label: l10n.audioAndVideoNoiseSuppressionEnhancedLabel,
                      enabled: noiseFilterSupported,
                    ),
                    FluxerRadioItem(
                      value: NoiseSuppressionTier.standard,
                      label: l10n.audioAndVideoNoiseSuppressionStandardLabel,
                    ),
                    FluxerRadioItem(
                      value: NoiseSuppressionTier.none,
                      label: l10n.audioAndVideoNoiseSuppressionNoneLabel,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

NoiseSuppressionTier effectiveVoicePanelNoiseSuppressionTier({
  required VoiceSettingsState settings,
  required bool noiseFilterSupported,
}) {
  switch (settings.voiceProcessingMode) {
    case VoiceProcessingMode.studio:
      return NoiseSuppressionTier.none;
    case VoiceProcessingMode.voice:
      return noiseFilterSupported
          ? NoiseSuppressionTier.enhanced
          : NoiseSuppressionTier.standard;
    case VoiceProcessingMode.custom:
      return settings.noiseSuppressionTier;
  }
}

class VoicePanelListIcon extends StatelessWidget {
  const VoicePanelListIcon({required this.icon, super.key});

  final PhosphorIconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Center(
        child: PhosphorIcon(icon, size: 20, color: context.colors.textPrimary),
      ),
    );
  }
}

class VoicePanelSettingSwitchRow extends StatelessWidget {
  const VoicePanelSettingSwitchRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
    this.description,
    super.key,
  });

  final PhosphorIconData icon;
  final String label;
  final String? description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final textStyles = context.textStyles;
    final colors = context.colors;
    return FluxerTappable(
      onTap: () => onChanged(!value),
      semanticLabel: description != null ? '$label. $description' : label,
      toggled: value,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isPressed = states.contains(WidgetState.pressed);
        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isPressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.45)
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: <Widget>[
              VoicePanelListIcon(icon: icon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      label,
                      style: textStyles.username.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    if (description != null) ...<Widget>[
                      const SizedBox(height: 2),
                      Text(
                        description!,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: layout.s4),
              FluxerSwitchControl(value: value),
            ],
          ),
        );
      },
    );
  }
}
