import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceScreenSharePickerTabs extends StatelessWidget {
  const VoiceScreenSharePickerTabs({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  final ScreenSharePickerTab selected;
  final ValueChanged<ScreenSharePickerTab> onChanged;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        borderRadius: BorderRadius.circular(kScreenSharePickerTabsRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kScreenSharePickerTabsPadding),
        child: Row(
          spacing: kScreenSharePickerTabsGap,
          children: <Widget>[
            for (final ScreenSharePickerTab tab in ScreenSharePickerTab.values)
              Expanded(
                child: _Tab(
                  label: switch (tab) {
                    ScreenSharePickerTab.applications =>
                      l10n.voiceScreenSharePickerApplicationsTab,
                    ScreenSharePickerTab.entireScreen =>
                      l10n.voiceScreenSharePickerEntireScreenTab,
                  },
                  icon: switch (tab) {
                    ScreenSharePickerTab.applications =>
                      PhosphorIconsFill.appWindow,
                    ScreenSharePickerTab.entireScreen =>
                      PhosphorIconsFill.monitor,
                  },
                  selected: tab == selected,
                  onTap: () => onChanged(tab),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final PhosphorIconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ScreenSharePickerMetrics metrics = ScreenSharePickerMetrics.of(
      MediaQuery.sizeOf(context),
    );
    return FluxerTappable(
      onTap: onTap,
      selected: selected,
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final Color foreground =
            selected || states.contains(WidgetState.hovered)
            ? context.colors.textPrimary
            : context.colors.textSecondary;
        return AnimatedContainer(
          duration: kScreenSharePickerTransition,
          curve: Curves.ease,
          padding: EdgeInsets.symmetric(
            vertical: kScreenSharePickerTabVerticalPadding,
            horizontal: metrics.tabHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: selected
                ? context.colors.backgroundSecondary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(kScreenSharePickerTabRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: metrics.tabLabelGap,
            children: <Widget>[
              PhosphorIcon(
                icon,
                size: kScreenSharePickerTabIconSize,
                color: foreground,
              ),
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: kScreenSharePickerTransition,
                  curve: Curves.ease,
                  style: context.textStyles.label.copyWith(
                    color: foreground,
                    fontSize: metrics.tabFontSize,
                    fontWeight: FontWeight.w600,
                    height:
                        kScreenSharePickerTabLineHeight / metrics.tabFontSize,
                  ),
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
