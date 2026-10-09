import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class ThemeColorsPreviewCard extends StatelessWidget {
  const ThemeColorsPreviewCard({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  static EdgeInsets contentPadding(BuildContext context) {
    return EdgeInsets.all(context.layout.s2);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final Widget framed = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: layout.radiusXl,
        border: Border.all(color: colors.borderColor),
      ),
      child: ClipRRect(
        borderRadius: layout.radiusXl,
        child: padding == null
            ? child
            : Padding(padding: padding!, child: child),
      ),
    );

    return ExcludeSemantics(child: IgnorePointer(child: framed));
  }
}
