import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_settings_control_row.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

class ChannelOverviewVoiceSection extends StatelessWidget {
  const ChannelOverviewVoiceSection({
    required this.l10n,
    required this.bitrateKbps,
    required this.userLimit,
    required this.voiceConnectionLimit,
    required this.rtcRegion,
    required this.canManageChannel,
    required this.canUpdateRtcRegion,
    required this.rtcRegionsAsync,
    required this.onBitrateChanged,
    required this.onUserLimitChanged,
    required this.onVoiceConnectionLimitChanged,
    required this.onRtcRegionChanged,
    super.key,
  });

  final FluxerLocalizations l10n;
  final int bitrateKbps;
  final int userLimit;
  final int voiceConnectionLimit;
  final String? rtcRegion;
  final bool canManageChannel;
  final bool canUpdateRtcRegion;
  final AsyncValue<List<RtcRegionResponse>> rtcRegionsAsync;
  final ValueChanged<int> onBitrateChanged;
  final ValueChanged<int> onUserLimitChanged;
  final ValueChanged<int> onVoiceConnectionLimitChanged;
  final ValueChanged<String?> onRtcRegionChanged;

  static const List<double> _participantLimitMarkers = <double>[
    0,
    25,
    50,
    75,
    99,
  ];

  static const List<double> _connectionLimitMarkers = <double>[
    1,
    5,
    25,
    50,
    75,
    100,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (canManageChannel) ...<Widget>[
          ChannelSettingsControlRow(
            label: l10n.channelSettingsVoiceQuality,
            description: l10n.channelSettingsVoiceQualityDescription,
            child: FluxerSlider(
              defaultValue: bitrateKbps.toDouble(),
              factoryDefaultValue: 64,
              minValue: kBitrateOptionsKbps.first.toDouble(),
              maxValue: kBitrateOptionsKbps.last.toDouble(),
              markers: kBitrateOptionsKbps
                  .map((int kbps) => kbps.toDouble())
                  .toList(),
              stickToMarkers: true,
              markerLabelWidth: 60,
              markerAreaHeight: 32,
              shrinkMarkerLabels: false,
              semanticLabel: l10n.channelSettingsVoiceQuality,
              onMarkerRender: (double value) => _bitrateMarker(context, value),
              onValueRender: (double value) =>
                  Text(l10n.channelSettingsVoiceQualityKbps(value.round())),
              onValueChange: (double value) => onBitrateChanged(value.round()),
            ),
          ),
          SizedBox(height: context.layout.s4),
          ChannelSettingsControlRow(
            label: l10n.channelSettingsParticipantLimit,
            description: l10n.channelSettingsParticipantLimitDescription,
            child: FluxerSlider(
              defaultValue: userLimit.toDouble(),
              factoryDefaultValue: 0,
              maxValue: kVoiceUserLimitMax.toDouble(),
              markers: _participantLimitMarkers,
              step: 1,
              semanticLabel: l10n.channelSettingsParticipantLimit,
              onMarkerRender: (double value) =>
                  _participantLimitMarker(context, value),
              onValueRender: (double value) => Text(
                l10n.channelSettingsParticipantLimitValue(value.round()),
              ),
              onValueChange: (double value) =>
                  onUserLimitChanged(value.round()),
            ),
          ),
          SizedBox(height: context.layout.s4),
          ChannelSettingsControlRow(
            label: l10n.channelSettingsConnectionLimit,
            description: l10n.channelSettingsConnectionLimitDescription,
            child: FluxerSlider(
              defaultValue: voiceConnectionLimit.toDouble(),
              factoryDefaultValue: kDefaultVoiceConnectionLimit.toDouble(),
              minValue: kVoiceConnectionLimitMin.toDouble(),
              maxValue: kVoiceConnectionLimitMax.toDouble(),
              markers: _connectionLimitMarkers,
              step: 1,
              semanticLabel: l10n.channelSettingsConnectionLimit,
              onMarkerRender: (double value) =>
                  _connectionLimitMarker(context, value),
              onValueRender: (double value) =>
                  Text(l10n.channelSettingsConnectionLimitValue(value.round())),
              onValueChange: (double value) =>
                  onVoiceConnectionLimitChanged(value.round()),
            ),
          ),
        ],
        if (canUpdateRtcRegion) ...<Widget>[
          if (canManageChannel) SizedBox(height: context.layout.s4),
          rtcRegionsAsync.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (Object error, StackTrace stackTrace) {
              return _buildRtcRegionSelect(
                context,
                regions: const <RtcRegionResponse>[],
              );
            },
            data: (List<RtcRegionResponse> regions) {
              return _buildRtcRegionSelect(context, regions: regions);
            },
          ),
        ],
      ],
    );
  }

  Widget _buildRtcRegionSelect(
    BuildContext context, {
    required List<RtcRegionResponse> regions,
  }) {
    final List<RtcRegionResponse> sortedRegions =
        List<RtcRegionResponse>.from(regions)..sort(
          (RtcRegionResponse a, RtcRegionResponse b) =>
              a.name.compareTo(b.name),
        );
    final List<FluxerSelectItem<String?>> items = <FluxerSelectItem<String?>>[
      FluxerSelectItem<String?>(
        value: null,
        label: l10n.channelSettingsVoiceRegionAutomatic,
      ),
      for (final RtcRegionResponse region in sortedRegions)
        FluxerSelectItem<String?>(
          value: region.id,
          label: region.name,
          leading: UnicodeEmojiWidget(emoji: region.emoji, size: 18),
          searchText: '${region.name} ${region.id}',
        ),
    ];
    return ChannelSettingsControlRow(
      label: l10n.channelSettingsVoiceRegion,
      description: l10n.channelSettingsVoiceRegionDescription,
      child: FluxerSelect<String?>(
        value: rtcRegion,
        hint: l10n.channelSettingsVoiceRegionAutomatic,
        stretch: true,
        items: items,
        onChanged: onRtcRegionChanged,
      ),
    );
  }

  Widget _bitrateMarker(BuildContext context, double value) {
    final bool isFactoryDefault = value.round() == 64;
    return Text(
      l10n.channelSettingsVoiceQualityKbps(value.round()),
      style: context.textStyles.bodySmall.copyWith(
        fontWeight: FontWeight.w500,
        color: isFactoryDefault
            ? context.colors.textPositive
            : context.colors.textSecondary,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }

  Widget _participantLimitMarker(BuildContext context, double value) {
    final bool isFactoryDefault = value.round() == 0;
    final String label = value.round() == 0 ? '∞' : value.round().toString();
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        label,
        style: context.textStyles.smallText.copyWith(
          color: isFactoryDefault
              ? context.colors.textPositive
              : context.colors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _connectionLimitMarker(BuildContext context, double value) {
    if (value.round() == kVoiceConnectionLimitMin) {
      return const SizedBox.shrink();
    }
    final bool isFactoryDefault = value.round() == kDefaultVoiceConnectionLimit;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        value.round().toString(),
        style: context.textStyles.smallText.copyWith(
          color: isFactoryDefault
              ? context.colors.textPositive
              : context.colors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
