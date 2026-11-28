import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class InlineEditFooterLink extends StatelessWidget {
  const InlineEditFooterLink({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool enabled = onPressed != null;
    return FluxerTappable(
      onTap: onPressed,
      enabled: enabled,
      link: true,
      semanticLabel: label,
      hitTestBehavior: HitTestBehavior.deferToChild,
      builder: (BuildContext context, Set<WidgetState> states) {
        final Color color = enabled
            ? context.colors.textLink
            : context.colors.textTertiary;
        final bool underline =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.focused);
        return Text(
          label,
          style: DefaultTextStyle.of(context).style.copyWith(
            color: color,
            decoration: underline
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: color,
          ),
        );
      },
    );
  }
}
