import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class NativeDownloadsIcon extends StatelessWidget {
  const NativeDownloadsIcon({
    required this.icon,
    required this.size,
    required this.color,
    required this.duration,
    super.key,
  });

  final IconData icon;
  final double size;
  final Color color;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(end: color),
      duration: duration,
      curve: Curves.ease,
      builder: (BuildContext context, Color? color, Widget? _) =>
          PhosphorIcon(icon, size: size, color: color),
    );
  }
}
