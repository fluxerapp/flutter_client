import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class MacPermissionAllowedLabel extends StatelessWidget {
  const MacPermissionAllowedLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.accentSuccess;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : const Duration(milliseconds: 160),
      curve: Curves.easeOut,
      builder: (BuildContext context, double opacity, Widget? child) =>
          Opacity(opacity: opacity, child: child),
      child: Semantics(
        liveRegion: true,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: context.layout.s2,
          children: [
            PhosphorIcon(PhosphorIconsFill.checkCircle, size: 22, color: color),
            Text(
              FluxerLocalizations.of(context).macPermissionAllowed,
              style: context.textStyles.label.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.25,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
