import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ChannelSearchAutocompleteSection {
  filters,
  history,
  users,
  channels,
  filterValues,
  dates,
}

class ChannelSearchAutocompleteEntry {
  const ChannelSearchAutocompleteEntry({
    required this.section,
    required this.label,
    this.subtitle,
    this.icon,
    this.filterKey,
    this.userId,
    this.channelId,
    this.channelType,
    this.avatarImageUrl,
    this.avatarColor,
    this.value,
    this.historyText,
    this.selectable = true,
    this.isSectionHeader = false,
    this.sectionActionLabel,
    this.onSectionAction,
    this.isDefault = false,
    this.useValueLayout = false,
  });

  final ChannelSearchAutocompleteSection section;
  final String label;
  final String? subtitle;
  final IconData? icon;
  final String? filterKey;
  final String? userId;
  final String? channelId;
  final ChannelType? channelType;
  final String? avatarImageUrl;
  final int? avatarColor;
  final String? value;
  final String? historyText;
  final bool selectable;
  final bool isSectionHeader;
  final String? sectionActionLabel;
  final VoidCallback? onSectionAction;
  final bool isDefault;
  final bool useValueLayout;
}

class ChannelHeaderSearchAutocomplete extends StatelessWidget {
  const ChannelHeaderSearchAutocomplete({
    required this.entries,
    required this.selectedIndex,
    required this.listboxId,
    required this.onEntrySelected,
    required this.onEntryHover,
    required this.touchPrimary,
    this.maxHeight,
    this.maxWidth,
    super.key,
  });

  final List<ChannelSearchAutocompleteEntry> entries;
  final int selectedIndex;
  final String listboxId;
  final ValueChanged<ChannelSearchAutocompleteEntry> onEntrySelected;
  final ValueChanged<int> onEntryHover;
  final bool touchPrimary;
  final double? maxHeight;
  final double? maxWidth;

  static const double absoluteMaxHeight = 420;
  static const double absoluteMaxWidth = 480;
  static const double absoluteMinWidth = 280;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }

    final double panelHeight = math.min(
      maxHeight ?? absoluteMaxHeight,
      absoluteMaxHeight,
    );
    final double panelWidth = math.min(
      maxWidth ?? absoluteMaxWidth,
      absoluteMaxWidth,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundTextarea,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.backgroundModifierAccent),
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0x33000000), offset: Offset(0, 2)),
          BoxShadow(
            color: Color(0x47000000),
            offset: Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: panelHeight),
          child: SizedBox(
            width: panelWidth,
            height: panelHeight,
            child: Semantics(
              container: true,
              identifier: listboxId,
              child: ListView.builder(
                padding: const EdgeInsets.all(4),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  final ChannelSearchAutocompleteEntry entry = entries[index];
                  if (entry.isSectionHeader) {
                    return _SectionHeaderRow(entry: entry);
                  }
                  final bool isSelected =
                      entry.selectable && index == selectedIndex;
                  return _AutocompleteRow(
                    entry: entry,
                    isSelected: isSelected,
                    touchPrimary: touchPrimary,
                    onTap: entry.selectable
                        ? () => onEntrySelected(entry)
                        : null,
                    onHover: entry.selectable
                        ? () => onEntryHover(index)
                        : null,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeaderRow extends StatelessWidget {
  const _SectionHeaderRow({required this.entry});

  final ChannelSearchAutocompleteEntry entry;

  @override
  Widget build(BuildContext context) {
    final Color muted = context.colors.textPrimaryMuted;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Row(
        children: <Widget>[
          if (entry.icon != null) ...<Widget>[
            PhosphorIcon(entry.icon!, size: 12, color: muted),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              entry.label.toUpperCase(),
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.48,
                color: muted,
              ),
            ),
          ),
          if (entry.sectionActionLabel != null && entry.onSectionAction != null)
            TextButton(
              onPressed: entry.onSectionAction,
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PhosphorIcon(PhosphorIconsFill.trash, size: 10, color: muted),
                  const SizedBox(width: 4),
                  Text(
                    entry.sectionActionLabel!,
                    style: context.textStyles.bodySmall.copyWith(
                      fontSize: 12,
                      color: muted,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _AutocompleteRow extends StatefulWidget {
  const _AutocompleteRow({
    required this.entry,
    required this.isSelected,
    required this.touchPrimary,
    this.onTap,
    this.onHover,
  });

  final ChannelSearchAutocompleteEntry entry;
  final bool isSelected;
  final bool touchPrimary;
  final VoidCallback? onTap;
  final VoidCallback? onHover;

  @override
  State<_AutocompleteRow> createState() => _AutocompleteRowState();
}

class _AutocompleteRowState extends State<_AutocompleteRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ChannelSearchAutocompleteEntry entry = widget.entry;
    final bool isActive = widget.isSelected || _hovered;
    final Color bg = widget.isSelected
        ? context.colors.surfaceInteractiveSelectedBg
        : Colors.transparent;
    final Color textColor = widget.isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : context.colors.textPrimary;
    final Color mutedColor = widget.isSelected
        ? context.colors.surfaceInteractiveSelectedColor.withValues(alpha: 0.7)
        : context.colors.textPrimaryMuted;

    return Semantics(
      button: widget.onTap != null,
      selected: widget.isSelected,
      label: entry.label,
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _hovered = true);
          widget.onHover?.call();
        },
        onExit: (_) => setState(() => _hovered = false),
        child: Material(
          color: bg,
          child: InkWell(
            onTap: widget.onTap,
            hoverColor: context.colors.surfaceInteractiveHoverBg,
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: widget.touchPrimary ? 6 : 3,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _AutocompleteLabel(
                      entry: entry,
                      textColor: textColor,
                      mutedColor: mutedColor,
                    ),
                  ),
                  PhosphorIcon(
                    PhosphorIconsBold.plus,
                    size: 14,
                    color: isActive ? textColor : context.colors.textTertiary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AutocompleteLabel extends StatelessWidget {
  const _AutocompleteLabel({
    required this.entry,
    required this.textColor,
    required this.mutedColor,
  });

  final ChannelSearchAutocompleteEntry entry;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    if (entry.section == ChannelSearchAutocompleteSection.filters &&
        entry.filterKey != null) {
      return _FilterChipLabel(
        syntaxLabel: entry.label,
        description: entry.subtitle,
        textColor: textColor,
        mutedColor: mutedColor,
      );
    }
    if (entry.useValueLayout) {
      return _ValueOptionLabel(
        label: entry.label,
        description: entry.subtitle,
        isDefault: entry.isDefault,
        textColor: textColor,
        mutedColor: mutedColor,
      );
    }
    return switch (entry.section) {
      ChannelSearchAutocompleteSection.history => Text(
        entry.label,
        style: context.textStyles.bodySmall.copyWith(
          fontSize: 13,
          height: 18 / 13,
          color: mutedColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      ChannelSearchAutocompleteSection.users => _UserOptionLabel(
        entry: entry,
        textColor: textColor,
        mutedColor: mutedColor,
      ),
      ChannelSearchAutocompleteSection.channels => _ChannelOptionLabel(
        entry: entry,
        textColor: textColor,
        mutedColor: mutedColor,
      ),
      ChannelSearchAutocompleteSection.dates => _IconTextOptionLabel(
        label: entry.label,
        icon: entry.icon,
        iconSize: 20,
        textColor: textColor,
        mutedColor: mutedColor,
        fontWeight: FontWeight.w500,
      ),
      _ => Text(
        entry.label,
        style: context.textStyles.bodySmall.copyWith(
          fontSize: 15,
          height: 1.25,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    };
  }
}

class _UserOptionLabel extends StatelessWidget {
  const _UserOptionLabel({
    required this.entry,
    required this.textColor,
    required this.mutedColor,
  });

  final ChannelSearchAutocompleteEntry entry;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = entry.subtitle;
    return Row(
      children: <Widget>[
        FluxerAvatar.user(
          imageUrl: entry.avatarImageUrl,
          fallbackText: entry.label,
          userId: entry.userId ?? '',
          avatarColor: entry.avatarColor,
          size: 20,
          showStatus: false,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            entry.label,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: 15,
              height: 1.25,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (subtitle != null && subtitle.isNotEmpty) ...<Widget>[
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              subtitle,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 1.25,
                color: mutedColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}

class _ChannelOptionLabel extends StatelessWidget {
  const _ChannelOptionLabel({
    required this.entry,
    required this.textColor,
    required this.mutedColor,
  });

  final ChannelSearchAutocompleteEntry entry;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    final ChannelType? type = entry.channelType;
    return Row(
      children: <Widget>[
        if (type != null)
          ChannelIcon(type: type, size: 16, color: mutedColor)
        else
          PhosphorIcon(
            entry.icon ?? PhosphorIconsBold.hash,
            size: 16,
            color: mutedColor,
          ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            entry.label,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: 15,
              height: 1.25,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _IconTextOptionLabel extends StatelessWidget {
  const _IconTextOptionLabel({
    required this.label,
    required this.textColor,
    required this.mutedColor,
    this.icon,
    this.iconSize = 20,
    this.fontWeight,
  });

  final String label;
  final IconData? icon;
  final double iconSize;
  final Color textColor;
  final Color mutedColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (icon != null) ...<Widget>[
          PhosphorIcon(icon!, size: iconSize, color: mutedColor),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: 15,
              height: 1.25,
              fontWeight: fontWeight,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _SyntaxChip extends StatelessWidget {
  const _SyntaxChip({
    required this.label,
    required this.textColor,
    this.compact = false,
  });

  final String label;
  final Color textColor;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 6 : 8,
          vertical: compact ? 2 : 3,
        ),
        child: Text(
          label,
          style: context.textStyles.bodySmall.copyWith(
            fontSize: compact ? 11 : 13,
            height: compact ? 1 : 1.2,
            color: textColor,
            fontWeight: compact ? FontWeight.w600 : FontWeight.w500,
            letterSpacing: compact ? 0.55 : null,
            fontFeatures: compact
                ? null
                : const <FontFeature>[FontFeature.disable('liga')],
          ),
        ),
      ),
    );
  }
}

class _FilterChipLabel extends StatelessWidget {
  const _FilterChipLabel({
    required this.syntaxLabel,
    required this.description,
    required this.textColor,
    required this.mutedColor,
  });

  final String syntaxLabel;
  final String? description;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _SyntaxChip(label: syntaxLabel, textColor: textColor),
          ),
          if (description != null && description!.isNotEmpty)
            TextSpan(
              text: ' — $description',
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 1,
                color: mutedColor.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ValueOptionLabel extends StatelessWidget {
  const _ValueOptionLabel({
    required this.label,
    required this.description,
    required this.isDefault,
    required this.textColor,
    required this.mutedColor,
  });

  final String label;
  final String? description;
  final bool isDefault;
  final Color textColor;
  final Color mutedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Wrap(
          spacing: 4,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            _SyntaxChip(label: label, textColor: textColor),
            if (isDefault)
              _SyntaxChip(
                label: FluxerLocalizations.of(
                  context,
                ).channelHeaderSearchDefaultBadge.toUpperCase(),
                textColor: mutedColor,
                compact: true,
              ),
          ],
        ),
        if (description != null && description!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              description!,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 1,
                color: mutedColor.withValues(alpha: 0.7),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
