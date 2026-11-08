import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSettingsStatusBadge extends StatelessWidget {
  const FluxerSettingsStatusBadge.experimental({super.key});

  String get text => 'EXPERIMENTAL';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ExcludeSemantics(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.brandPrimary,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Text(
            text,
            maxLines: 1,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.brandPrimaryFill,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}

class FluxerLabelWithBadge extends StatelessWidget {
  const FluxerLabelWithBadge({required this.label, this.badge, super.key});

  final Widget label;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    final Widget? trailing = badge;
    if (trailing == null) {
      return label;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: label),
        const SizedBox(width: 6),
        trailing,
      ],
    );
  }
}
