import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerNagbarContent extends StatelessWidget {
  const FluxerNagbarContent({
    required this.message,
    required this.isMobile,
    this.actions,
    this.onDismiss,
    super.key,
  });

  final String message;
  final bool isMobile;
  final Widget? actions;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showMobileDismiss = isMobile && onDismiss != null;
    final Widget? actionRow = (actions != null || showMobileDismiss)
        ? Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: layout.s2,
            runSpacing: layout.s1,
            children: <Widget>[
              if (showMobileDismiss)
                TextButton(
                  onPressed: onDismiss,
                  style: TextButton.styleFrom(
                    foregroundColor: DefaultTextStyle.of(context).style.color,
                    padding: EdgeInsets.symmetric(
                      horizontal: layout.s3,
                      vertical: layout.s2,
                    ),
                    textStyle: context.textStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(l10n.chatClientSystemDismiss),
                ),
              ?actions,
            ],
          )
        : null;
    if (isMobile) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(message, textAlign: TextAlign.center),
          if (actionRow != null) ...<Widget>[
            SizedBox(height: layout.s2),
            actionRow,
          ],
        ],
      );
    }
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: layout.s3,
      runSpacing: layout.s1,
      children: <Widget>[
        Text(message, textAlign: TextAlign.center),
        ?actionRow,
      ],
    );
  }
}
