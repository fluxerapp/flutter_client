import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_settings_control_row.dart';
import 'package:fluxer_app/features/channels/utils/channel_slowmode_duration_label.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelSlowmodeSlider extends StatelessWidget {
  const ChannelSlowmodeSlider({
    required this.l10n,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    super.key,
  });

  final FluxerLocalizations l10n;
  final int value;
  final ValueChanged<int> onChanged;
  final String? label;
  final String? description;

  static final List<double> _markers = kSlowmodeOptionsSeconds
      .map((int seconds) => seconds.toDouble())
      .toList();

  @override
  Widget build(BuildContext context) {
    final String slowmodeLabel = label ?? l10n.channelSettingsSlowmode;
    final String slowmodeDescription =
        description ??
        l10n.channelSettingsSlowmodeDescription(
          permissionTitle(l10n, Permission.bypassSlowmode),
        );
    final int snapped = snapSlowmodeSeconds(value);
    return ChannelSettingsControlRow(
      label: slowmodeLabel,
      description: slowmodeDescription,
      child: FluxerSlider(
        defaultValue: snapped.toDouble(),
        value: snapped.toDouble(),
        factoryDefaultValue: 0,
        minValue: kSlowmodeOptionsSeconds.first.toDouble(),
        maxValue: kSlowmodeOptionsSeconds.last.toDouble(),
        markers: _markers,
        equidistant: true,
        stickToMarkers: true,
        markerLabelWidth: 60,
        markerAreaHeight: 32,
        shrinkMarkerLabels: false,
        markerVisible: (double markerValue) =>
            kSlowmodeSliderMarkerSeconds.contains(markerValue.round()),
        semanticLabel: slowmodeLabel,
        onMarkerRender: (double markerValue) =>
            _markerLabel(context, markerValue.round()),
        onValueRender: (double markerValue) =>
            Text(channelSlowmodeDurationLabel(l10n, markerValue.round())),
        onValueChange: (double markerValue) => onChanged(markerValue.round()),
      ),
    );
  }

  Widget _markerLabel(BuildContext context, int seconds) {
    final bool isOff = seconds == 0;
    return Text(
      channelSlowmodeDurationLabel(l10n, seconds),
      style: context.textStyles.bodySmall.copyWith(
        fontWeight: FontWeight.w500,
        color: isOff
            ? context.colors.textPositive
            : context.colors.textSecondary,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
