import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerConnectionIcon extends StatelessWidget {
  const FluxerConnectionIcon({required this.type, super.key, this.size = 20});

  final ConnectionType type;
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: Center(
      child: type == ConnectionType.bluesky
          ? ExcludeSemantics(
              child: SvgPicture.asset(
                'assets/images/connections/bluesky.svg',
                width: size,
                height: size,
              ),
            )
          : PhosphorIcon(
              PhosphorIconsBold.globeSimple,
              size: size,
              color: Colors.black,
            ),
    ),
  );
}

class FluxerConnectionIconTile extends StatelessWidget {
  const FluxerConnectionIconTile({
    required this.type,
    required this.borderRadius,
    super.key,
  });

  static const double size = 28;

  final ConnectionType type;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
    child: FluxerConnectionIcon(type: type),
  );
}
