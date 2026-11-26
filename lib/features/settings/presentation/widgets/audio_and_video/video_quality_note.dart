import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/icons/plutonium_product_icon.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceVideoQualityNote extends StatelessWidget {
  const VoiceVideoQualityNote({
    required this.text,
    this.premium = false,
    super.key,
  });

  final String text;
  final bool premium;

  static const double _kIconSize = 14;
  static const double _kFontSize = 13;
  static const double _kDesktopTopOffset = -4;
  static const double _kDesktopBottomMargin = 8;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final bool mobile = isMobileLayout(context);
    final Widget note = Row(
      crossAxisAlignment: mobile
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      spacing: layout.s1,
      children: <Widget>[
        if (premium)
          Padding(
            padding: EdgeInsets.only(top: mobile ? 2 : 0),
            child: PlutoniumProductIcon(
              size: _kIconSize,
              color: colors.textTertiary,
            ),
          ),
        Flexible(
          child: Text(
            text,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: _kFontSize,
              height: mobile ? 1.4 : null,
              color: mobile ? colors.textTertiary : colors.textPrimaryMuted,
            ),
          ),
        ),
      ],
    );
    if (mobile) {
      return note;
    }
    return Transform.translate(
      offset: const Offset(0, _kDesktopTopOffset),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: _kDesktopBottomMargin + _kDesktopTopOffset,
        ),
        child: note,
      ),
    );
  }
}
