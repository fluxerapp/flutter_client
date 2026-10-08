import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

class ForumEmoji extends StatelessWidget {
  const ForumEmoji({
    required this.emojiId,
    required this.emojiName,
    this.size = 16,
    super.key,
  });

  final String? emojiId;
  final String? emojiName;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String? id = emojiId;
    if (id != null && id.isNotEmpty) {
      return SizedBox(
        width: size,
        height: size,
        child: CachedNetworkImage(
          imageUrl: FluxerMediaUrl.customEmoji(id: id, size: 96),
          fit: BoxFit.contain,
          fadeInDuration: Duration.zero,
          errorBuilder: (_, _, _) => SizedBox(width: size, height: size),
        ),
      );
    }
    final String name = emojiName ?? '';
    if (name.isEmpty) {
      return const SizedBox.shrink();
    }
    return Text(name, style: TextStyle(fontSize: size * 0.9, height: 1.1));
  }
}

class ForumTagChip extends StatelessWidget {
  const ForumTagChip({
    required this.tag,
    this.selected = false,
    this.onTap,
    this.compact = false,
    super.key,
  });

  final ForumTagResponse tag;
  final bool selected;
  final VoidCallback? onTap;
  final bool compact;

  static double rowHeight(BuildContext context, {bool compact = false}) {
    final TextStyle style = compact
        ? context.textStyles.smallText
        : context.textStyles.label;
    final TextScaler scaler = MediaQuery.textScalerOf(context);
    final TextPainter painter = TextPainter(
      text: TextSpan(text: 'Ag', style: style),
      textScaler: scaler,
      textDirection: Directionality.of(context),
      maxLines: 1,
    )..layout();
    final double lineHeight = painter.height;
    painter.dispose();
    final double verticalPadding = compact ? 4 : 16;
    const double border = 2;
    final double emojiSize = compact ? 12 : 14;
    return math.max(lineHeight, emojiSize) + verticalPadding + border;
  }

  static double pinnedHeaderExtent(BuildContext context) {
    final layout = context.layout;
    return layout.s2 + rowHeight(context) + layout.s2;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Widget body = Container(
      padding: compact
          ? EdgeInsets.symmetric(horizontal: layout.s2, vertical: 2)
          : const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? colors.brandPrimary
            : compact
            ? colors.backgroundModifierHover
            : colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(compact ? 999 : 20),
        border: Border.all(
          color: selected ? colors.brandPrimary : colors.borderColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (tag.emojiId != null ||
              (tag.emojiName ?? '').isNotEmpty) ...<Widget>[
            ForumEmoji(
              emojiId: tag.emojiId,
              emojiName: tag.emojiName,
              size: compact ? 12 : 14,
            ),
            SizedBox(width: compact ? layout.s1 : 6),
          ],
          Flexible(
            child: Text(
              tag.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  (compact
                          ? context.textStyles.smallText
                          : context.textStyles.label)
                      .copyWith(
                        color: selected
                            ? colors.textOnBrandPrimary
                            : colors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
            ),
          ),
        ],
      ),
    );
    final VoidCallback? handler = onTap;
    if (handler == null) {
      return body;
    }
    return FluxerTappable(
      onTap: handler,
      toggled: selected,
      semanticLabel: tag.name,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) => body,
    );
  }
}

class ForumTagSelector extends StatelessWidget {
  const ForumTagSelector({
    required this.tags,
    required this.selected,
    required this.onToggle,
    this.maxSelected,
    super.key,
  });

  final List<ForumTagResponse> tags;
  final List<String> selected;
  final ValueChanged<String> onToggle;
  final int? maxSelected;

  @override
  Widget build(BuildContext context) {
    final int? max = maxSelected;
    return Wrap(
      spacing: context.layout.s2,
      runSpacing: context.layout.s2,
      children: <Widget>[
        for (final ForumTagResponse tag in tags)
          ForumTagChip(
            tag: tag,
            selected: selected.contains(tag.id),
            onTap:
                selected.contains(tag.id) ||
                    max == null ||
                    selected.length < max
                ? () => onToggle(tag.id)
                : null,
          ),
      ],
    );
  }
}
