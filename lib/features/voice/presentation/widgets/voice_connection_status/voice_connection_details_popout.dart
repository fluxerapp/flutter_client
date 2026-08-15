import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceConnectionDetailsPopout extends ConsumerStatefulWidget {
  const VoiceConnectionDetailsPopout({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  ConsumerState<VoiceConnectionDetailsPopout> createState() =>
      _VoiceConnectionDetailsPopoutState();
}

class _VoiceConnectionDetailsPopoutState
    extends ConsumerState<VoiceConnectionDetailsPopout> {
  bool _advancedExpanded = false;

  String _formatDuration(FluxerLocalizations l10n, Duration? duration) {
    if (duration == null) {
      return l10n.voiceConnectionUnavailable;
    }
    return l10n.voiceConnectionDuration(
      duration.inMinutes,
      duration.inSeconds % 60,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final VoiceConnectionStats stats = ref.watch(voiceConnectionStatsProvider);
    final String unavailable = l10n.voiceConnectionUnavailable;

    return SizedBox(
      width: layout.sidebarWidth,
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    l10n.voiceConnectionTitle,
                    style: context.textStyles.categoryName.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: widget.onClose,
                  tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  icon: PhosphorIcon(
                    PhosphorIconsRegular.x,
                    size: 16,
                    color: colors.textPrimaryMuted,
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            _Section(
              title: l10n.voiceConnectionSessionSection,
              children: <Widget>[
                _Row(
                  label: l10n.voiceConnectionDurationLabel,
                  value: _formatDuration(l10n, stats.sessionDuration),
                ),
                _Row(
                  label: l10n.voiceConnectionParticipantsLabel,
                  value: stats.participantCount?.toString() ?? unavailable,
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            _Section(
              title: l10n.voiceConnectionNetworkSection,
              children: <Widget>[
                _Row(
                  label: l10n.voiceConnectionPingLabel,
                  value: stats.currentLatencyMs == null
                      ? unavailable
                      : l10n.voiceConnectionLatencyMs(stats.currentLatencyMs!),
                ),
                _Row(
                  label: l10n.voiceConnectionJitterLabel,
                  value: stats.jitterMs == null
                      ? unavailable
                      : l10n.voiceConnectionJitterMs(
                          stats.jitterMs!.toStringAsFixed(1),
                        ),
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            Semantics(
              button: true,
              expanded: _advancedExpanded,
              label: l10n.voiceConnectionAdvancedStats,
              child: InkWell(
                onTap: () =>
                    setState(() => _advancedExpanded = !_advancedExpanded),
                child: ExcludeSemantics(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          l10n.voiceConnectionAdvancedStats,
                          style: context.textStyles.smallText.copyWith(
                            color: colors.textTertiary,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      PhosphorIcon(
                        _advancedExpanded
                            ? PhosphorIconsRegular.caretUp
                            : PhosphorIconsRegular.caretDown,
                        size: 12,
                        color: colors.textTertiary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_advancedExpanded) ...<Widget>[
              SizedBox(height: layout.s2),
              _Row(
                label: l10n.voiceConnectionSendLabel,
                value: stats.sendBandwidthBps == null
                    ? unavailable
                    : l10n.voiceConnectionBandwidthKbps(
                        (stats.sendBandwidthBps! / 1000).toStringAsFixed(1),
                      ),
              ),
              _Row(
                label: l10n.voiceConnectionReceiveLabel,
                value: stats.receiveBandwidthBps == null
                    ? unavailable
                    : l10n.voiceConnectionBandwidthKbps(
                        (stats.receiveBandwidthBps! / 1000).toStringAsFixed(1),
                      ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textTertiary,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.layout.s2),
        ...children,
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s1),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: context.textStyles.timestamp.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
