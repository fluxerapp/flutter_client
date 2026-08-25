import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum FluxerGuildBadgeKind { partnered, verified, discoverable }

const String _verifiedFeature = 'VERIFIED';
const String _partneredFeature = 'PARTNERED';
const String _discoverableFeature = 'DISCOVERABLE';
const double _defaultBadgeSize = 20;
const String _partneredDarkAsset = 'assets/images/icons/partnered-dark.png';
const String _partneredLightAsset = 'assets/images/icons/partnered-light.png';
const String _discoverableDarkAsset =
    'assets/images/icons/discoverable-dark.png';
const String _discoverableLightAsset =
    'assets/images/icons/discoverable-light.png';

class FluxerGuildBadge extends StatelessWidget {
  final List<String>? features;
  final FluxerGuildBadgeKind? forcedKind;
  final double size;
  final List<Shadow>? shadows;
  final Color? color;
  final Brightness? forceBrightness;

  const FluxerGuildBadge({
    required List<String> this.features,
    super.key,
    this.size = _defaultBadgeSize,
    this.shadows,
    this.color,
    this.forceBrightness,
  }) : forcedKind = null;

  const FluxerGuildBadge.forced({
    required FluxerGuildBadgeKind kind,
    super.key,
    this.size = _defaultBadgeSize,
    this.shadows,
    this.color,
    this.forceBrightness,
  }) : features = null,
       forcedKind = kind;

  @override
  Widget build(BuildContext context) {
    final FluxerGuildBadgeKind? kind = _resolveKind();
    if (kind == null) {
      return const SizedBox.shrink();
    }
    final bool isDark =
        (forceBrightness ?? Theme.of(context).brightness) == Brightness.dark;
    switch (kind) {
      case FluxerGuildBadgeKind.partnered:
        return _buildPartnered(isDark);
      case FluxerGuildBadgeKind.verified:
        return _buildVerified(context);
      case FluxerGuildBadgeKind.discoverable:
        return _buildDiscoverable(isDark);
    }
  }

  FluxerGuildBadgeKind? _resolveKind() {
    if (forcedKind != null) {
      return forcedKind;
    }
    final List<String> list = features ?? const <String>[];
    if (list.contains(_partneredFeature)) {
      return FluxerGuildBadgeKind.partnered;
    }
    if (list.contains(_verifiedFeature)) {
      return FluxerGuildBadgeKind.verified;
    }
    if (list.contains(_discoverableFeature)) {
      return FluxerGuildBadgeKind.discoverable;
    }
    return null;
  }

  Widget _buildPartnered(bool isDark) =>
      _buildImageBadge(isDark ? _partneredDarkAsset : _partneredLightAsset);

  Widget _buildVerified(BuildContext context) => Icon(
    PhosphorIconsFill.sealCheck,
    color: color ?? context.colors.textChat,
    size: size,
    shadows: shadows,
  );

  Widget _buildDiscoverable(bool isDark) => _buildImageBadge(
    isDark ? _discoverableDarkAsset : _discoverableLightAsset,
  );

  Widget _buildImageBadge(String asset) {
    final Widget image = Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
    final List<Shadow> current = shadows ?? const <Shadow>[];
    if (current.isEmpty) {
      return image;
    }
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: _toBoxShadows(current)),
      child: image,
    );
  }

  List<BoxShadow> _toBoxShadows(List<Shadow> source) => source
      .map(
        (s) => BoxShadow(
          color: s.color,
          offset: s.offset,
          blurRadius: s.blurRadius,
        ),
      )
      .toList(growable: false);
}
