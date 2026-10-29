import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_guild_badges_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

class FluxerGuildBadge extends ConsumerWidget {
  final List<String> features;
  final List<String> badgeIds;
  final int? customBadgeLimit;
  final double size;
  final List<Shadow>? shadows;
  final Color? color;
  final Brightness? forceBrightness;

  const FluxerGuildBadge({
    required this.features,
    this.badgeIds = const <String>[],
    this.customBadgeLimit,
    this.size = _defaultBadgeSize,
    this.shadows,
    this.color,
    this.forceBrightness,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerGuildBadgeKind? kind = _resolveKind(features);
    final List<InstanceGuildBadgeSchema> customBadges =
        resolveGuildCustomBadges(
          badgeIds: badgeIds,
          catalog: ref.watch(instanceGuildBadgesProvider),
          limit: customBadgeLimit,
        );

    final Widget? builtIn = kind == null
        ? null
        : _BuiltInGuildBadge(
            kind: kind,
            size: size,
            shadows: shadows,
            color: color,
            forceBrightness: forceBrightness,
          );

    if (builtIn == null && customBadges.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ?builtIn,
        for (final InstanceGuildBadgeSchema badge in customBadges) ...[
          if (builtIn != null) const SizedBox(width: 4),
          _CustomGuildBadge(badge: badge, size: size),
        ],
      ],
    );
  }

  static FluxerGuildBadgeKind? _resolveKind(List<String> features) {
    if (features.contains(_partneredFeature)) {
      return FluxerGuildBadgeKind.partnered;
    }
    if (features.contains(_verifiedFeature)) {
      return FluxerGuildBadgeKind.verified;
    }
    if (features.contains(_discoverableFeature)) {
      return FluxerGuildBadgeKind.discoverable;
    }
    return null;
  }
}

class _BuiltInGuildBadge extends StatelessWidget {
  const _BuiltInGuildBadge({
    required this.kind,
    required this.size,
    this.shadows,
    this.color,
    this.forceBrightness,
  });

  final FluxerGuildBadgeKind kind;
  final double size;
  final List<Shadow>? shadows;
  final Color? color;
  final Brightness? forceBrightness;

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        (forceBrightness ?? Theme.of(context).brightness) == Brightness.dark;
    return switch (kind) {
      FluxerGuildBadgeKind.partnered => _buildImageBadge(
        isDark ? _partneredDarkAsset : _partneredLightAsset,
      ),
      FluxerGuildBadgeKind.verified => Icon(
        PhosphorIconsFill.sealCheck,
        color: color ?? context.colors.textChat,
        size: size,
        shadows: shadows,
      ),
      FluxerGuildBadgeKind.discoverable => _buildImageBadge(
        isDark ? _discoverableDarkAsset : _discoverableLightAsset,
      ),
    };
  }

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

class _CustomGuildBadge extends StatelessWidget {
  const _CustomGuildBadge({required this.badge, required this.size});

  final InstanceGuildBadgeSchema badge;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = customBadgeImageUrl(badge.assetUrl);
    final Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: BoxFit.contain,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
    );

    final String? href = badge.href?.trim();
    final Widget child = href != null && href.isNotEmpty
        ? GestureDetector(onTap: () => launchUrl(Uri.parse(href)), child: image)
        : image;

    final String? description = badge.description?.trim();
    final String tooltip = description == null || description.isEmpty
        ? badge.name
        : '${badge.name}\n$description';

    return FluxerTooltip(message: tooltip, child: child);
  }
}
