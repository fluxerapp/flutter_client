import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_sfx_playback.dart';
import 'package:fluxer_app/features/settings/utils/sound_type_utils.dart';
import 'package:fluxer_app/features/settings/utils/sound_volume_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kMasterVolumeDefault = 100;

class UserNotificationsSoundSettingsSection extends ConsumerStatefulWidget {
  const UserNotificationsSoundSettingsSection({super.key});

  @override
  ConsumerState<UserNotificationsSoundSettingsSection> createState() =>
      _UserNotificationsSoundSettingsSectionState();
}

class _UserNotificationsSoundSettingsSectionState
    extends ConsumerState<UserNotificationsSoundSettingsSection> {
  bool _additionalSoundsExpanded = false;

  List<String> get _additionalSoundTypes => kAllNotificationSoundTypes
      .where((String type) => !kCommonNotificationSoundTypes.contains(type))
      .toList();

  Widget _volumePercentageLabel(double value) {
    return Text('${value.round()}%');
  }

  Widget _volumePercentageMarker(double value, {double? factoryDefault}) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final bool isFactoryDefault =
        factoryDefault != null && value == factoryDefault;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        '${value.round()}%',
        style: textStyles.smallText.copyWith(
          color: isFactoryDefault ? colors.textPositive : colors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _sliderIconButton({
    required VoidCallback? onPressed,
    required String tooltip,
    required Widget icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
      visualDensity: VisualDensity.compact,
      icon: icon,
    );
  }

  Widget _sliderResetButton({
    required bool canReset,
    required VoidCallback onReset,
    required String semanticLabel,
  }) {
    final colors = context.colors;
    return _sliderIconButton(
      onPressed: canReset ? onReset : null,
      tooltip: semanticLabel,
      icon: PhosphorIcon(
        PhosphorIconsBold.arrowsCounterClockwise,
        size: 16,
        color: canReset ? colors.textSecondary : colors.textTertiary,
      ),
    );
  }

  Widget _buildSoundToggleRow({
    required String soundType,
    required SoundPreferencesState soundPrefs,
    required SoundPreferences soundNotifier,
    required FluxerLocalizations l10n,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String label = notificationSoundTypeLabel(l10n, soundType);
    final bool allDisabled = soundPrefs.allSoundsDisabled;
    final bool enabled = soundPrefs.isSoundTypeEnabled(soundType);
    final FluxerSfxClip? clip = fluxerSfxClipForSoundType(soundType);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 68),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s4,
          vertical: layout.s3,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: textStyles.bodyMedium.copyWith(
                      color: allDisabled
                          ? colors.textTertiary
                          : colors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (clip != null)
                    FluxerTappable(
                      enabled: !allDisabled,
                      onTap: () => unawaited(
                        playFluxerSoundEffect(
                          prefs: soundPrefs,
                          sfx: ref.read(fluxerSfxProvider),
                          clip: clip,
                          soundType: soundType,
                          ignoreRingerPolicy: true,
                        ),
                      ),
                      semanticLabel: l10n.notificationsPreviewSound,
                      builder: (context, states) {
                        return Text(
                          l10n.notificationsPreviewSound,
                          style: textStyles.smallText.copyWith(
                            color: allDisabled
                                ? colors.textTertiary
                                : colors.textLink,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            FluxerSwitchControl(value: enabled, enabled: !allDisabled),
          ],
        ),
      ),
    );
  }

  Color _revealButtonBackground({
    required FluxerColorTheme colors,
    required bool isHovered,
  }) {
    final Color baseSecondary = colors.backgroundSecondary.withValues(
      alpha: 0.92,
    );
    final Color textTint = colors.textPrimary.withValues(
      alpha: isHovered ? 0.12 : 0.08,
    );
    return Color.alphaBlend(textTint, baseSecondary);
  }

  Widget _buildRevealSoundEffectsButton(FluxerLocalizations l10n) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String label = _additionalSoundsExpanded
        ? l10n.notificationsShowFewerSoundEffects
        : l10n.notificationsShowMoreSoundEffects;
    return Align(
      child: FluxerTappable(
        onTap: () => setState(
          () => _additionalSoundsExpanded = !_additionalSoundsExpanded,
        ),
        semanticLabel: label,
        button: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool isHovered = states.contains(WidgetState.hovered);
          return AnimatedContainer(
            duration: context.motion.normal,
            padding: EdgeInsets.symmetric(
              horizontal: layout.s3,
              vertical: layout.s1 + 1,
            ),
            decoration: BoxDecoration(
              color: _revealButtonBackground(
                colors: colors,
                isHovered: isHovered,
              ),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: isHovered
                    ? colors.backgroundModifierHover
                    : colors.backgroundModifierAccent,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: textStyles.smallText.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(width: layout.s1 + 2),
                AnimatedRotation(
                  turns: _additionalSoundsExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 80),
                  curve: Curves.easeOut,
                  child: PhosphorIcon(
                    PhosphorIconsBold.caretDown,
                    size: 16,
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSoundEffectsList({
    required SoundPreferencesState soundPrefs,
    required SoundPreferences soundNotifier,
    required FluxerLocalizations l10n,
  }) {
    final colors = context.colors;
    final layout = context.layout;
    final List<String> visibleSoundTypes = [
      ...kCommonNotificationSoundTypes,
      if (_additionalSoundsExpanded) ..._additionalSoundTypes,
    ];
    final bool hasAdditionalSounds = _additionalSoundTypes.isNotEmpty;
    final bool showListFade = hasAdditionalSounds && !_additionalSoundsExpanded;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: colors.backgroundSecondaryAlt,
              shape: RoundedRectangleBorder(
                borderRadius: layout.radiusXl,
                side: BorderSide(color: colors.backgroundModifierAccent),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < visibleSoundTypes.length; i++) ...[
                    if (i > 0) Divider(height: 1, color: colors.borderColor),
                    FluxerTappable(
                      enabled: !soundPrefs.allSoundsDisabled,
                      onTap: () => unawaited(
                        soundNotifier.setSoundTypeEnabled(
                          soundType: visibleSoundTypes[i],
                          enabled: !soundPrefs.isSoundTypeEnabled(
                            visibleSoundTypes[i],
                          ),
                        ),
                      ),
                      semanticLabel: notificationSoundTypeLabel(
                        l10n,
                        visibleSoundTypes[i],
                      ),
                      toggled: soundPrefs.isSoundTypeEnabled(
                        visibleSoundTypes[i],
                      ),
                      excludeChildSemantics: true,
                      builder: (context, states) {
                        return _buildSoundToggleRow(
                          soundType: visibleSoundTypes[i],
                          soundPrefs: soundPrefs,
                          soundNotifier: soundNotifier,
                          l10n: l10n,
                        );
                      },
                    ),
                  ],
                  if (showListFade) SizedBox(height: layout.s1),
                ],
              ),
            ),
            if (showListFade)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 64,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: layout.radiusXl.bottomLeft,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colors.backgroundSecondaryAlt.withValues(alpha: 0),
                          colors.backgroundSecondaryAlt.withValues(alpha: 0.88),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (hasAdditionalSounds)
          Transform.translate(
            offset: Offset(0, -layout.s1),
            child: _buildRevealSoundEffectsButton(l10n),
          ),
      ],
    );
  }

  Widget _buildPerSoundVolumeRow({
    required String soundType,
    required SoundPreferencesState soundPrefs,
    required SoundPreferences soundNotifier,
    required FluxerLocalizations l10n,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String label = notificationSoundTypeLabel(l10n, soundType);
    final bool hasOverride = soundPrefs.hasSoundOverride(soundType);
    final double effectiveValue = effectiveSoundVolumePercent(
      prefs: soundPrefs,
      soundType: soundType,
    );
    final bool soundEnabled = soundPrefs.isSoundTypeEnabled(soundType);
    final bool rowDisabled = soundPrefs.allSoundsDisabled || !soundEnabled;
    final String statusText = hasOverride
        ? '${effectiveValue.round()}%'
        : l10n.notificationsFollowingMasterVolume(effectiveValue.round());
    return Opacity(
      opacity: hasOverride ? 1 : 0.78,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s1,
          vertical: layout.s2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: rowDisabled ? colors.textTertiary : colors.textPrimary,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    statusText,
                    style: textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
                _sliderIconButton(
                  onPressed: rowDisabled
                      ? null
                      : () => unawaited(
                          soundNotifier.setSoundTypeEnabled(
                            soundType: soundType,
                            enabled: !soundEnabled,
                          ),
                        ),
                  tooltip: soundEnabled
                      ? l10n.notificationsMuteSound(label)
                      : l10n.notificationsUnmuteSound(label),
                  icon: PhosphorIcon(
                    soundEnabled
                        ? PhosphorIconsFill.speakerHigh
                        : PhosphorIconsFill.speakerX,
                    size: 14,
                    color: rowDisabled
                        ? colors.textTertiary
                        : colors.textSecondary,
                  ),
                ),
                _sliderResetButton(
                  canReset: !rowDisabled && hasOverride,
                  onReset: () =>
                      unawaited(soundNotifier.clearSoundOverride(soundType)),
                  semanticLabel: l10n.notificationsResetSoundToMasterVolume(
                    label,
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s2),
            FluxerSlider(
              defaultValue: effectiveValue,
              factoryDefaultValue: soundPrefs.masterVolume,
              maxValue: 200,
              disabled: rowDisabled,
              onValueRender: _volumePercentageLabel,
              onValueChange: (double value) => unawaited(
                soundNotifier.setSoundOverride(
                  soundType: soundType,
                  value: value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final soundPrefs = ref.watch(soundPreferencesProvider);
    final soundNotifier = ref.read(soundPreferencesProvider.notifier);
    final int overrideCount = soundPrefs.soundOverrides.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.notificationsMasterVolumeLabel,
                    style: textStyles.label.copyWith(color: colors.textPrimary),
                  ),
                  SizedBox(height: layout.s1),
                  Text(
                    l10n.notificationsMasterVolumeDescription,
                    style: textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            _sliderResetButton(
              canReset:
                  !soundPrefs.allSoundsDisabled &&
                  soundPrefs.masterVolume != _kMasterVolumeDefault,
              onReset: () => unawaited(
                soundNotifier.setMasterVolume(_kMasterVolumeDefault),
              ),
              semanticLabel: l10n.notificationsResetToDefaultVolume,
            ),
          ],
        ),
        FluxerSlider(
          defaultValue: soundPrefs.masterVolume,
          factoryDefaultValue: _kMasterVolumeDefault,
          maxValue: 200,
          markers: const [0, 50, 100, 150, 200],
          disabled: soundPrefs.allSoundsDisabled,
          onMarkerRender: (double value) => _volumePercentageMarker(
            value,
            factoryDefault: _kMasterVolumeDefault,
          ),
          onValueRender: _volumePercentageLabel,
          onValueChange: (double value) =>
              unawaited(soundNotifier.setMasterVolume(value)),
        ),
        FluxerSettingsSwitchItem(
          label: l10n.notificationsDisableAllSoundsLabel,
          description: l10n.notificationsDisableAllSoundsDescription,
          value: soundPrefs.allSoundsDisabled,
          onChanged: (bool value) =>
              unawaited(soundNotifier.setAllSoundsDisabled(value: value)),
        ),
        _buildSoundEffectsList(
          soundPrefs: soundPrefs,
          soundNotifier: soundNotifier,
          l10n: l10n,
        ),
        FluxerAccordion(
          key: ValueKey<bool>(overrideCount > 0),
          title: l10n.notificationsPerSoundVolumeTitle,
          description: overrideCount > 0
              ? l10n.notificationsPerSoundVolumeOverrideDescription(
                  overrideCount,
                )
              : l10n.notificationsPerSoundVolumeDescription,
          initiallyExpanded: overrideCount > 0,
          child: Padding(
            padding: EdgeInsets.only(top: layout.s2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < kAllNotificationSoundTypes.length; i++) ...[
                  if (i > 0) SizedBox(height: layout.s2),
                  _buildPerSoundVolumeRow(
                    soundType: kAllNotificationSoundTypes[i],
                    soundPrefs: soundPrefs,
                    soundNotifier: soundNotifier,
                    l10n: l10n,
                  ),
                ],
                if (overrideCount > 0 && !soundPrefs.allSoundsDisabled) ...[
                  SizedBox(height: layout.s2),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () =>
                          unawaited(soundNotifier.clearAllSoundOverrides()),
                      child: Text(l10n.notificationsResetAllOverrides),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
