import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_change_formatters.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_summary_builder.dart';
import 'package:fluxer_app/features/settings/utils/guild_audit_log_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildAuditLogEntryCard extends StatelessWidget {
  const GuildAuditLogEntryCard({
    required this.entry,
    required this.actorName,
    required this.actorAvatarUrl,
    required this.isExpanded,
    required this.onToggle,
    required this.l10n,
    required this.locale,
    required this.use12Hour,
    required this.channelNames,
    required this.channelsById,
    required this.roleNames,
    required this.userNames,
    this.actorAvatarColor,
    this.actorUserId,
    super.key,
  });

  final GuildAuditLogEntry entry;
  final String actorName;
  final String? actorAvatarUrl;
  final int? actorAvatarColor;
  final String? actorUserId;
  final bool isExpanded;
  final VoidCallback onToggle;
  final FluxerLocalizations l10n;
  final String locale;
  final bool use12Hour;
  final Map<String, String> channelNames;
  final Map<String, Channel> channelsById;
  final Map<String, String> roleNames;
  final Map<String, String> userNames;

  @override
  Widget build(BuildContext context) {
    final AuditLogActionKind actionKind = GuildAuditLogConstants.getActionKind(
      entry.actionType,
    );
    final IconData actionIcon = GuildAuditLogConstants.getActionIcon(
      entry.actionType,
    );
    final _AuditLogIconStyle iconStyle = _resolveIconStyle(context, actionKind);
    final Channel? channelForIcon = _resolveChannelForIcon();
    final GuildAuditLogSummaryParts summary =
        GuildAuditLogSummaryBuilder.buildSummary(
          entry: entry,
          l10n: l10n,
          userNames: userNames,
          channelNames: channelNames,
          roleNames: roleNames,
        );
    final DateTime? createdAt = entry.createdAt;
    final String timestamp = createdAt == null
        ? ''
        : GuildAuditLogUtils.formatAuditLogTimestamp(
            createdAt,
            l10n,
            locale,
            use12Hour: use12Hour,
          );
    final List<String> changeLines = _buildChangeLines();
    final List<String> optionLines = _buildOptionLines(changeLines);
    final String? rawReason = entry.reason?.trim();
    final String reasonText = rawReason == null || rawReason.isEmpty
        ? l10n.guildSettingsAuditLogNoReason
        : GuildAuditLogUtils.maybeUrlDecodeReason(rawReason);
    final bool hasReason = rawReason != null && rawReason.isNotEmpty;
    final bool isExpandable =
        hasReason || changeLines.isNotEmpty || optionLines.isNotEmpty;
    return ClipRRect(
      borderRadius: context.layout.radiusXl,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.backgroundTextarea,
          border: Border.all(color: context.colors.backgroundModifierAccent),
          borderRadius: context.layout.radiusXl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FluxerTappable(
              onTap: isExpandable ? onToggle : null,
              semanticLabel: summary.text,
              builder: (BuildContext context, Set<WidgetState> states) {
                final bool isHovered = states.contains(WidgetState.hovered);
                final Color headerColor = isExpanded || isHovered
                    ? context.colors.backgroundModifierHover
                    : Colors.transparent;
                return ColoredBox(
                  color: headerColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.layout.s3,
                      vertical: context.layout.s2,
                    ),
                    child: Row(
                      children: <Widget>[
                        _AuditLogActionIcon(
                          actionType: entry.actionType,
                          phosphorIcon: actionIcon,
                          iconStyle: iconStyle,
                          channel: channelForIcon,
                        ),
                        SizedBox(width: context.layout.s2),
                        FluxerAvatar.user(
                          imageUrl: actorAvatarUrl,
                          fallbackText: actorName,
                          userId: actorUserId,
                          avatarColor: actorAvatarColor,
                          size: 32,
                          showStatus: false,
                        ),
                        SizedBox(width: context.layout.s2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _SummaryText(
                                summary: summary,
                                style: context.textStyles.bodySmall.copyWith(
                                  color: context.colors.textPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (timestamp.isNotEmpty)
                                Text(
                                  timestamp,
                                  style: context.textStyles.timestamp,
                                ),
                            ],
                          ),
                        ),
                        if (isExpandable)
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 150),
                            child: PhosphorIcon(
                              PhosphorIconsBold.caretDown,
                              size: 20,
                              color: context.colors.textTertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (isExpanded && isExpandable)
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: context.colors.backgroundModifierAccent,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(context.layout.s3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (hasReason) ...<Widget>[
                        Text(
                          l10n.guildSettingsAuditLogReason,
                          style: context.textStyles.bodySmall.copyWith(
                            color: context.colors.textPrimaryMuted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: context.layout.s1),
                        Text(
                          reasonText,
                          style: context.textStyles.bodySmall.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        if (changeLines.isNotEmpty || optionLines.isNotEmpty)
                          SizedBox(height: context.layout.s3),
                      ],
                      for (final String line in changeLines)
                        _DetailRow(text: line, tone: _ChangeTone.add),
                      for (final String line in optionLines)
                        _DetailRow(text: line, tone: _ChangeTone.add),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Channel? _resolveChannelForIcon() {
    if (!GuildAuditLogConstants.usesChannelIcon(entry.actionType)) {
      return null;
    }
    final String? channelId = entry.options?.channelId ?? entry.targetId;
    if (channelId == null) {
      return null;
    }
    return channelsById[channelId];
  }

  _AuditLogIconStyle _resolveIconStyle(
    BuildContext context,
    AuditLogActionKind kind,
  ) {
    final FluxerColorTheme colors = context.colors;
    final Color hover = colors.backgroundModifierHover;
    final Color muted = colors.textPrimaryMuted;
    return switch (kind) {
      AuditLogActionKind.create => _AuditLogIconStyle(
        backgroundColor: Color.lerp(hover, colors.statusOnline, 0.08)!,
        foregroundColor: muted,
      ),
      AuditLogActionKind.update => _AuditLogIconStyle(
        backgroundColor: Color.lerp(hover, colors.statusWarning, 0.08)!,
        foregroundColor: muted,
      ),
      AuditLogActionKind.delete => _AuditLogIconStyle(
        backgroundColor: Color.lerp(hover, colors.statusDanger, 0.08)!,
        foregroundColor: muted,
      ),
      AuditLogActionKind.other => _AuditLogIconStyle(
        backgroundColor: hover,
        foregroundColor: muted,
      ),
    };
  }

  List<String> _buildChangeLines() {
    final List<String> lines = <String>[];
    for (final GuildAuditLogChange change in entry.changes) {
      if (change.key.isEmpty) {
        continue;
      }
      lines.add(
        GuildAuditLogChangeFormatters.formatChange(
          change: change,
          actionType: entry.actionType,
          l10n: l10n,
          channelNames: channelNames,
          roleNames: roleNames,
          userNames: userNames,
        ),
      );
    }
    return lines;
  }

  List<String> _buildOptionLines(List<String> changeLines) {
    final GuildAuditLogEntryOptions? options = entry.options;
    if (options == null) {
      return const <String>[];
    }
    final Set<String> renderedKeys = entry.changes
        .map((GuildAuditLogChange change) => change.key)
        .toSet();
    final List<String> lines = <String>[];
    void addOption(String key, Object? value) {
      if (value == null || renderedKeys.contains(key)) {
        return;
      }
      if (key != 'channel_id' &&
          key != 'message_id' &&
          key != 'inviter_id' &&
          (key == 'id' || key.endsWith('_id'))) {
        return;
      }
      lines.add(
        GuildAuditLogChangeFormatters.formatOption(
          key: key,
          value: value,
          l10n: l10n,
          channelNames: channelNames,
          userNames: userNames,
        ),
      );
    }

    addOption('channel_id', options.channelId);
    addOption('message_id', options.messageId);
    addOption('inviter_id', options.inviterId);
    addOption('count', options.count);
    addOption('members_removed', options.membersRemoved);
    addOption('max_age', options.maxAge);
    addOption('temporary', options.temporary);
    addOption('uses', options.uses);
    return lines;
  }
}

class _AuditLogIconStyle {
  const _AuditLogIconStyle({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
}

class _AuditLogActionIcon extends StatelessWidget {
  const _AuditLogActionIcon({
    required this.actionType,
    required this.phosphorIcon,
    required this.iconStyle,
    this.channel,
  });

  final AuditLogActionType actionType;
  final IconData phosphorIcon;
  final _AuditLogIconStyle iconStyle;
  final Channel? channel;

  @override
  Widget build(BuildContext context) {
    final bool useChannelIcon = GuildAuditLogConstants.usesChannelIcon(
      actionType,
    );
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: iconStyle.backgroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: useChannelIcon
          ? ChannelIcon(
              type: channel?.type ?? ChannelType.guildText,
              channel: channel,
              color: iconStyle.foregroundColor,
            )
          : PhosphorIcon(
              phosphorIcon,
              size: 20,
              color: iconStyle.foregroundColor,
            ),
    );
  }
}

class _SummaryText extends StatelessWidget {
  const _SummaryText({required this.summary, required this.style});

  final GuildAuditLogSummaryParts summary;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final String text = summary.text;
    final String actor = summary.actorLabel;
    final String target = summary.targetLabel;
    final List<TextSpan> spans = <TextSpan>[];
    int index = 0;
    void appendBold(String label) {
      final int start = text.indexOf(label, index);
      if (start < 0) {
        return;
      }
      if (start > index) {
        spans.add(TextSpan(text: text.substring(index, start)));
      }
      spans.add(
        TextSpan(
          text: label,
          style: style.copyWith(fontWeight: FontWeight.w600),
        ),
      );
      index = start + label.length;
    }

    appendBold(actor);
    appendBold(target);
    if (index < text.length) {
      spans.add(TextSpan(text: text.substring(index)));
    }
    if (spans.isEmpty) {
      return Text(text, style: style);
    }
    return Text.rich(TextSpan(style: style, children: spans));
  }
}

enum _ChangeTone { add, remove }

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.text, required this.tone});

  final String text;
  final _ChangeTone tone;

  @override
  Widget build(BuildContext context) {
    final Color accentColor = tone == _ChangeTone.remove
        ? context.colors.statusDanger
        : context.colors.statusOnline;
    final Color bulletBackground = Color.lerp(
      context.colors.backgroundModifierHover,
      accentColor,
      0.08,
    )!;
    final Color bulletForeground = Color.lerp(
      context.colors.textPrimaryMuted,
      accentColor,
      0.7,
    )!;
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: bulletBackground,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: PhosphorIcon(
              tone == _ChangeTone.remove
                  ? PhosphorIconsBold.minus
                  : PhosphorIconsBold.plus,
              size: 12,
              color: bulletForeground,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
