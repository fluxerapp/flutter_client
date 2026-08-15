import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:material_ui/material_ui.dart';

/// Single-row tile for member, friend, and similar lists.
class FluxerListRow extends StatelessWidget {
  const FluxerListRow({
    required this.leading,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.trailing,
    this.titleAdornments,
    this.tagsBelowTitle,
    this.dimmed = false,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final Widget leading;
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget? trailing;
  final List<Widget>? titleAdornments;

  final List<Widget>? tagsBelowTitle;
  final bool dimmed;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final hasSubtitleWidget = subtitleWidget != null;
    final hasSubtitle =
        hasSubtitleWidget || (subtitle != null && subtitle!.trim().isNotEmpty);
    final adornments = titleAdornments ?? const <Widget>[];
    final belowTags = tagsBelowTitle ?? const <Widget>[];

    final row = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: context.textStyles.username.copyWith(
                              color: context.colors.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        for (final adornment in adornments) ...[
                          const SizedBox(width: 6),
                          adornment,
                        ],
                      ],
                    ),
                    if (belowTags.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          for (var i = 0; i < belowTags.length; i++) ...[
                            if (i > 0) const SizedBox(width: 6),
                            belowTags[i],
                          ],
                        ],
                      ),
                    ],
                    if (hasSubtitleWidget) ...[
                      const SizedBox(height: 2),
                      subtitleWidget!,
                    ] else if (hasSubtitle) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
        ),
      ),
    );

    final Widget content = onTap != null || onLongPress != null
        ? Semantics(
            button: true,
            label: hasSubtitle ? '$title, $subtitle' : title,
            child: ExcludeSemantics(child: row),
          )
        : row;

    if (!dimmed) {
      return content;
    }
    return Opacity(opacity: 0.45, child: content);
  }
}

@FluxerWidgetPreview(name: 'Member row', group: 'FluxerListRow')
Widget fluxerListRowPreview() {
  return FluxerListRow(
    leading: const FluxerAvatar(fallbackText: 'A', size: 40),
    title: 'Alice',
    subtitle: 'Working on something cool',
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Offline (dimmed)', group: 'FluxerListRow')
Widget fluxerListRowDimmedPreview() {
  return FluxerListRow(
    leading: const FluxerAvatar(fallbackText: 'B', size: 40),
    title: 'Bob',
    dimmed: true,
    onTap: () {},
  );
}
