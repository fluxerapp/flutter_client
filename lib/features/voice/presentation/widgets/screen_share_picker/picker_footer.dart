import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/video_quality_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/stream_settings_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_settings_view_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceScreenSharePickerFooter extends ConsumerWidget {
  const VoiceScreenSharePickerFooter({
    required this.loading,
    required this.onCancel,
    required this.onOpenSettings,
    super.key,
  });

  final bool loading;
  final VoidCallback onCancel;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ScreenSharePickerMetrics metrics = ScreenSharePickerMetrics.of(
      MediaQuery.sizeOf(context),
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(
        metrics.padding,
        kScreenSharePickerFooterTopPadding,
        metrics.padding,
        metrics.padding,
      ),
      child: Row(
        spacing: kScreenSharePickerFooterGap,
        children: <Widget>[
          Expanded(child: loading ? const SizedBox.shrink() : _Summary()),
          if (loading)
            FluxerButton.secondary(
              label: l10n.cancel,
              fitContent: true,
              onPressed: onCancel,
            )
          else
            Builder(
              builder: (BuildContext anchor) => FluxerTooltip(
                message: l10n.voiceScreenSharePickerStreamSettings,
                child: FluxerButton.secondary(
                  icon: PhosphorIconsFill.gear,
                  isSquare: true,
                  semanticLabel: l10n.voiceScreenSharePickerStreamSettings,
                  onPressed: () => unawaited(
                    showVoiceHudMenu(
                      anchor,
                      ref,
                      placement: FluxerDesktopPlacement.aboveEnd,
                      builder: (VoidCallback close) => VoiceStreamSettingsMenu(
                        onClose: close,
                        onOpenSettings: onOpenSettings,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Summary extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ScreenShareSettingsView view = ref.watch(
      screenShareSettingsViewProvider,
    );
    final List<String> details = <String>[
      ?streamingModeHint(l10n, view.mode),
      screenShareResolutionLabel(l10n, view.quality.resolution),
      screenShareFrameRateLabel(l10n, view.quality.frameRate),
      screenShareAudioSummary(l10n),
    ];
    final TextStyle detailStyle = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
      fontSize: kScreenSharePickerSummaryDetailFontSize,
      fontWeight: FontWeight.w500,
      height:
          kScreenSharePickerSummaryDetailLineHeight /
          kScreenSharePickerSummaryDetailFontSize,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: kScreenSharePickerSummaryGap,
      children: <Widget>[
        Text(
          streamingModeLabel(l10n, view.mode),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimary,
            fontSize: kScreenSharePickerSummaryTitleFontSize,
            fontWeight: FontWeight.w700,
            height:
                kScreenSharePickerSummaryTitleLineHeight /
                kScreenSharePickerSummaryTitleFontSize,
          ),
        ),
        Row(
          children: <Widget>[
            for (int i = 0; i < details.length; i++) ...<Widget>[
              if (i > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kScreenSharePickerSummarySeparatorGap,
                  ),
                  child: Text(
                    '•',
                    style: detailStyle.copyWith(
                      color: context.colors.textTertiary.withValues(
                        alpha: kScreenSharePickerSummarySeparatorAlpha,
                      ),
                    ),
                  ),
                ),
              Flexible(
                child: Text(
                  details[i],
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: detailStyle,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
