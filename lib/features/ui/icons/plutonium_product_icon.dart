import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const IconData kPlutoniumProductIcon = PhosphorIconsFill.atom;

class PlutoniumProductIcon extends StatelessWidget {
  const PlutoniumProductIcon({required this.size, this.color, super.key});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PhosphorIcon(kPlutoniumProductIcon, size: size, color: color);
  }
}
