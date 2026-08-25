import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

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
