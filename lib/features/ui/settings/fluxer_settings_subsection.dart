import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_section.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerSettingsSubsection extends StatelessWidget {
  const FluxerSettingsSubsection({
    required this.children,
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    if (isMobileLayout(context)) {
      final List<Widget> items = groupSettingsMenuRows(children);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            SizedBox(height: layout.s2),
            FluxerSettingsGroupLabel(title: title!, description: description),
            SizedBox(height: layout.s2),
          ],
          for (int i = 0; i < items.length; i++) ...[
            items[i],
            if (i < items.length - 1) SizedBox(height: layout.s3),
          ],
        ],
      );
    }

    if (usesDesktopPointerUi(context)) {
      final bool hasHeader = title != null || description != null;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 22),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Semantics(
                  header: true,
                  child: Text(
                    title!,
                    style: context.textStyles.bodySmall.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          if (description != null) ...[
            if (title != null) const SizedBox(height: 4),
            Text(
              description!,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 1.4,
                color: colors.textTertiary,
              ),
            ),
          ],
          if (hasHeader) const SizedBox(height: 12),
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1) const SizedBox(height: 8),
          ],
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) ...[
          Semantics(
            header: true,
            child: Text(title!, style: context.textStyles.channelName),
          ),
          if (description != null) ...[
            SizedBox(height: layout.s1),
            Text(
              description!,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                color: colors.textTertiary,
              ),
            ),
          ],
          SizedBox(height: layout.s4),
        ],
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) SizedBox(height: layout.s3),
        ],
      ],
    );
  }
}

@FluxerWidgetPreview(
  name: 'With title and description',
  group: 'FluxerSettingsSubsection',
)
Widget fluxerSettingsSubsectionPreview() {
  return const FluxerSettingsSubsection(
    title: 'Friend Requests',
    description: 'Control who can send you friend requests',
    children: [Text('Switch item 1'), Text('Switch item 2')],
  );
}

@FluxerWidgetPreview(name: 'Title only', group: 'FluxerSettingsSubsection')
Widget fluxerSettingsSubsectionTitleOnlyPreview() {
  return const FluxerSettingsSubsection(
    title: 'Passkeys',
    children: [Text('Content goes here')],
  );
}
