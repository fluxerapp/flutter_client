import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/providers/layout/shell_sidebar_width_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

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

    final double sidebarWidth = watchResolvedShellChannelSidebarWidth(
      ref,
      context,
    );

    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, l10n, stats, sidebarWidth);
    }

    return SizedBox(
      width: sidebarWidth,
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

  Widget _buildDesktop(
    BuildContext context,
    FluxerLocalizations l10n,
    VoiceConnectionStats stats,
    double width,
  ) {
    final colors = context.colors;
    final String unavailable = l10n.voiceConnectionUnavailable;
    const Widget gap = SizedBox(height: 12);
    return ClipRRect(
      borderRadius: context.layout.radiusLg,
      child: ColoredBox(
        color: fluxerFormSurfaceBackground(context),
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        l10n.voiceConnectionTitle,
                        style: context.textStyles.label.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    FluxerButton.desktop(
                      icon: PhosphorIconsBold.x,
                      semanticLabel: MaterialLocalizations.of(
                        context,
                      ).closeButtonTooltip,
                      onPressed: widget.onClose,
                    ),
                  ],
                ),
                gap,
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _DesktopSection(
                          title: l10n.voiceConnectionSessionSection,
                          children: <Widget>[
                            _DesktopRow(
                              label: l10n.voiceConnectionPingLabel,
                              value: stats.currentLatencyMs == null
                                  ? unavailable
                                  : l10n.voiceConnectionLatencyMs(
                                      stats.currentLatencyMs!,
                                    ),
                            ),
                            _DesktopRow(
                              label: l10n.voiceConnectionDurationLabel,
                              value: _formatDuration(
                                l10n,
                                stats.sessionDuration,
                              ),
                            ),
                            _DesktopRow(
                              label: l10n.voiceConnectionParticipantsLabel,
                              value:
                                  stats.participantCount?.toString() ??
                                  unavailable,
                            ),
                          ],
                        ),
                        gap,
                        _DesktopAdvancedAccordion(
                          title: l10n.voiceConnectionAdvancedStats,
                          expanded: _advancedExpanded,
                          onToggle: () => setState(
                            () => _advancedExpanded = !_advancedExpanded,
                          ),
                          child: _DesktopSection(
                            title: l10n.voiceConnectionNetworkSection,
                            children: <Widget>[
                              _DesktopRow(
                                label: l10n.voiceConnectionSendLabel,
                                value: stats.sendBandwidthBps == null
                                    ? unavailable
                                    : l10n.voiceConnectionBandwidthKbps(
                                        (stats.sendBandwidthBps! / 1000)
                                            .toStringAsFixed(1),
                                      ),
                              ),
                              _DesktopRow(
                                label: l10n.voiceConnectionReceiveLabel,
                                value: stats.receiveBandwidthBps == null
                                    ? unavailable
                                    : l10n.voiceConnectionBandwidthKbps(
                                        (stats.receiveBandwidthBps! / 1000)
                                            .toStringAsFixed(1),
                                      ),
                              ),
                              _DesktopRow(
                                label: l10n.voiceConnectionJitterLabel,
                                value: stats.jitterMs == null
                                    ? unavailable
                                    : l10n.voiceConnectionJitterMs(
                                        stats.jitterMs!.toStringAsFixed(1),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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

TextStyle _desktopSectionTitleStyle(BuildContext context) =>
    context.textStyles.smallText.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      height: 14 / 11,
      letterSpacing: 0,
      color: context.colors.textTertiary,
    );

class _DesktopSection extends StatelessWidget {
  const _DesktopSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      if (i > 0) {
        rows.add(const SizedBox(height: 4));
      }
      rows.add(children[i]);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title, style: _desktopSectionTitleStyle(context)),
        const SizedBox(height: 8),
        ...rows,
      ],
    );
  }
}

class _DesktopRow extends StatelessWidget {
  const _DesktopRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: <Widget>[
        Text(
          label,
          maxLines: 1,
          style: context.textStyles.timestamp.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: context.textStyles.timestamp.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _DesktopAdvancedAccordion extends StatelessWidget {
  const _DesktopAdvancedAccordion({
    required this.title,
    required this.expanded,
    required this.onToggle,
    required this.child,
  });

  static const Duration _duration = Duration(milliseconds: 240);

  final String title;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final Duration duration = reduceMotion ? Duration.zero : _duration;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FluxerTappable(
              onTap: onToggle,
              expanded: expanded,
              semanticLabel: title,
              excludeChildSemantics: true,
              builder: (BuildContext context, Set<WidgetState> states) {
                final Color foreground = states.contains(WidgetState.hovered)
                    ? colors.textSecondary
                    : colors.textTertiary;
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: _desktopSectionTitleStyle(
                          context,
                        ).copyWith(color: foreground),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: duration,
                      curve: Curves.easeOut,
                      child: PhosphorIcon(
                        PhosphorIconsBold.caretDown,
                        size: 16,
                        color: foreground,
                      ),
                    ),
                  ],
                );
              },
            ),
            ClipRect(
              child: AnimatedSize(
                duration: duration,
                curve: Curves.easeOut,
                alignment: Alignment.topCenter,
                child: expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: child,
                      )
                    : const SizedBox(width: double.infinity),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
