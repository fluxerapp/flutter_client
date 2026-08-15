import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';

class ChannelUnreadIndicator extends StatelessWidget {
  const ChannelUnreadIndicator({this.faded = false, super.key});

  final bool faded;

  static Widget positioned({required bool faded, Key? key}) => Positioned(
    key: key,
    left: 1,
    top: 0,
    bottom: 0,
    child: Center(child: ChannelUnreadIndicator(faded: faded)),
  );

  @override
  Widget build(BuildContext context) {
    final Widget indicator = Container(
      width: 4,
      height: 8,
      decoration: BoxDecoration(
        color: context.colors.textPrimary,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(9999),
          bottomRight: Radius.circular(9999),
        ),
      ),
    );
    if (!faded) {
      return indicator;
    }
    return Opacity(opacity: 0.4, child: indicator);
  }
}
