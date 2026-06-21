import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InstanceDomainIcon extends StatelessWidget {
  const InstanceDomainIcon({
    required this.isOfficial,
    this.size = 12,
    super.key,
  });

  final bool isOfficial;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (isOfficial) {
      return PhosphorIcon(
        PhosphorIconsFill.sealCheck,
        size: size,
        color: colors.textTertiary,
      );
    }
    return PhosphorIcon(
      PhosphorIconsFill.globe,
      size: size,
      color: colors.textTertiary,
    );
  }
}
