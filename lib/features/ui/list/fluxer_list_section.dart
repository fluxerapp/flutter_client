import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/list/fluxer_list_row.dart';
import 'package:fluxer_app/material_ui.dart';

/// Grouped-list section: optional header above a rounded card of children.
class FluxerListSection extends StatelessWidget {
  const FluxerListSection({
    required this.children,
    this.header,
    this.headerColor,
    this.dividers = true,
    this.backgroundColor,
    super.key,
  });

  final List<Widget> children;
  final String? header;
  final Color? headerColor;
  final Color? backgroundColor;

  final bool dividers;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dividerColor = colors.backgroundHeaderSecondary.withValues(
      alpha: 0.3,
    );

    final body = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      body.add(children[i]);
      if (dividers && i < children.length - 1) {
        body.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1, thickness: 1, color: dividerColor),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null && header!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(
              top: context.layout.s3,
              bottom: context.layout.s1,
              left: context.layout.s4,
              right: context.layout.s4,
            ),
            child: Semantics(
              header: true,
              child: Text(
                header!,
                style: context.textStyles.categoryName.copyWith(
                  color: headerColor ?? colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        if (children.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor ?? colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: body,
              ),
            ),
          ),
      ],
    );
  }
}

@FluxerWidgetPreview(name: 'With header', group: 'FluxerListSection')
Widget fluxerListSectionPreview() {
  return FluxerListSection(
    header: 'Online — 2',
    children: [
      FluxerListRow(
        leading: const SizedBox.square(dimension: 40),
        title: 'Alice',
        onTap: () {},
      ),
      FluxerListRow(
        leading: const SizedBox.square(dimension: 40),
        title: 'Bob',
        onTap: () {},
      ),
    ],
  );
}
