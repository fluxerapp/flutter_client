import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_section_scroll.dart';

/// Vertical density of the section's children.
///
/// Use [comfortable] for form fields and complex cards (the default).
/// Use [compact] for flat tile/card lists where rows should sit close together.
enum FluxerSettingsSectionDensity { comfortable, compact }

class FluxerSettingsSection extends StatelessWidget {
  const FluxerSettingsSection({
    required this.title,
    required this.children,
    super.key,
    this.description,
    this.isFirst = false,
    this.density = FluxerSettingsSectionDensity.comfortable,
    this.sectionId,
  });

  final String title;
  final String? description;
  final bool isFirst;
  final List<Widget> children;
  final FluxerSettingsSectionDensity density;
  final String? sectionId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final childGap = switch (density) {
      FluxerSettingsSectionDensity.comfortable => layout.s8,
      FluxerSettingsSectionDensity.compact => layout.s2,
    };

    return KeyedSubtree(
      key: sectionId == null
          ? null
          : UserSettingsSectionScrollKeys.keyFor(sectionId!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isFirst) ...[
            Divider(color: colors.borderColor),
            SizedBox(height: layout.s8),
          ],
          Semantics(
            header: true,
            child: Text(
              title,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
            ),
          ),
          if (description != null) ...[
            SizedBox(height: layout.s1),
            Text(
              description!,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ],
          SizedBox(height: layout.s4),
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) SizedBox(height: childGap),
          ],
          SizedBox(height: layout.s8),
        ],
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSettingsSection')
Widget fluxerSettingsSectionPreview() {
  return const FluxerSettingsSection(
    title: 'Connections',
    description: 'Control who can send you friend requests and direct messages',
    isFirst: true,
    children: [Text('Subsection content goes here')],
  );
}

@FluxerWidgetPreview(name: 'Compact', group: 'FluxerSettingsSection')
Widget fluxerSettingsSectionCompactPreview() {
  return const FluxerSettingsSection(
    title: 'Blocked Users',
    description:
        "Blocked users can't send you friend requests or message you "
        'directly.',
    isFirst: true,
    density: FluxerSettingsSectionDensity.compact,
    children: [Text('Row 1'), Text('Row 2'), Text('Row 3')],
  );
}
