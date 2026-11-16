import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/export.dart';

class FluxerConnectionIcon extends ConsumerWidget {
  const FluxerConnectionIcon({
    required this.type,
    super.key,
    this.providerId,
    this.size = 20,
  });

  final ConnectionType type;
  final String? providerId;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox.square(
    dimension: size,
    child: Center(child: _glyph(ref)),
  );

  Widget _glyph(WidgetRef ref) {
    switch (type) {
      case ConnectionType.bluesky:
        return ExcludeSemantics(
          child: SvgPicture.asset(
            'assets/images/connections/bluesky.svg',
            width: size,
            height: size,
          ),
        );
      case ConnectionType.oauth:
        final InstanceConnectionProviderSchema? provider = ref.watch(
          instanceRuntimeConfigProvider.select(
            (config) => config.connectionProviderFor(type, providerId),
          ),
        );
        if (provider == null) {
          return _phosphor(PhosphorIconsBold.linkBreak);
        }
        final String? iconUrl = provider.iconUrl?.trim();
        if (iconUrl == null || iconUrl.isEmpty) {
          return _phosphor(PhosphorIconsBold.plugsConnected);
        }
        return ExcludeSemantics(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: iconUrl,
              width: size,
              height: size,
              fit: BoxFit.contain,
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              errorBuilder: (context, error, stackTrace) =>
                  _phosphor(PhosphorIconsBold.plugsConnected),
            ),
          ),
        );
      case ConnectionType.domain:
      case ConnectionType.$unknown:
        return _phosphor(PhosphorIconsBold.globeSimple);
    }
  }

  Widget _phosphor(IconData icon) =>
      PhosphorIcon(icon, size: size, color: Colors.black);
}

class FluxerConnectionIconTile extends StatelessWidget {
  const FluxerConnectionIconTile({
    required this.type,
    required this.borderRadius,
    super.key,
    this.providerId,
  });

  static const double size = 28;

  final ConnectionType type;
  final String? providerId;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
    child: FluxerConnectionIcon(type: type, providerId: providerId),
  );
}
