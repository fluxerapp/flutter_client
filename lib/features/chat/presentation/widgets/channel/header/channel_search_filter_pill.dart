import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_input_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSearchFilterPill extends StatefulWidget {
  const ChannelSearchFilterPill({
    required this.segment,
    required this.textColor,
    required this.onRemove,
    required this.onEdit,
    super.key,
  });

  final ChannelSearchSegment segment;
  final Color textColor;
  final VoidCallback onRemove;
  final VoidCallback onEdit;

  @override
  State<ChannelSearchFilterPill> createState() =>
      _ChannelSearchFilterPillState();
}

class _ChannelSearchFilterPillState extends State<ChannelSearchFilterPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final String label = channelSearchPillLabel(widget.segment);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Material(
        color: _hovered
            ? context.colors.backgroundModifierHover
            : context.colors.backgroundSecondaryAlt,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: context.colors.backgroundModifierAccent),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: widget.onEdit,
          hoverColor: context.colors.backgroundModifierHover,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${widget.segment.filterKey}:',
                    style: context.textStyles.bodySmall.copyWith(
                      fontSize: 13,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.bodySmall.copyWith(
                        fontSize: 13,
                        height: 1.5,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                    height: 20,
                    child: Opacity(
                      opacity: _hovered ? 1 : 0,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        iconSize: 10,
                        tooltip: MaterialLocalizations.of(
                          context,
                        ).closeButtonTooltip,
                        onPressed: widget.onRemove,
                        icon: PhosphorIcon(
                          PhosphorIconsBold.x,
                          size: 10,
                          color: context.colors.textTertiary,
                        ),
                      ),
                    ),
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
