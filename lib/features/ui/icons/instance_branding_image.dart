import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';
import 'package:fluxer_app/material_ui.dart';

class InstanceBrandMark extends ConsumerWidget {
  const InstanceBrandMark({
    required this.size,
    this.backgroundColor,
    this.symbolColor,
    super.key,
  });

  final double size;
  final Color? backgroundColor;
  final Color? symbolColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ({String? compactMarkUrl, String? themeColorHex}) branding = ref
        .watch(
          instanceRuntimeConfigProvider.select(
            (InstanceRuntimeConfig config) => (
              compactMarkUrl: config.compactMarkUrl,
              themeColorHex: config.themeColorHex,
            ),
          ),
        );
    final Color fill =
        backgroundColor ??
        parseCssHexColor(branding.themeColorHex) ??
        context.colors.brandPrimary;
    final String? imageUrl = branding.compactMarkUrl;
    final FluxerBrandLogo fallback = FluxerBrandLogo(
      size: size,
      backgroundColor: fill,
      symbolColor: symbolColor,
    );
    if (imageUrl == null) {
      return fallback;
    }
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: ColoredBox(
          color: fill,
          child: _RemoteBrandImage(
            url: imageUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
            error: fallback,
          ),
        ),
      ),
    );
  }
}

class InstanceWordmark extends ConsumerWidget {
  const InstanceWordmark({required this.height, this.color, super.key});

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ({String? wordmarkUrl, String productName}) branding = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) =>
            (wordmarkUrl: config.wordmarkUrl, productName: config.productName),
      ),
    );
    final Color tint = color ?? context.colors.textPrimary;
    final String? wordmarkUrl = branding.wordmarkUrl;
    if (wordmarkUrl != null) {
      return SizedBox(
        height: height,
        child: _RemoteBrandImage(
          url: wordmarkUrl,
          height: height,
          fit: BoxFit.contain,
          error: _FallbackWordmark(
            height: height,
            color: tint,
            productName: branding.productName,
          ),
        ),
      );
    }
    return _FallbackWordmark(
      height: height,
      color: tint,
      productName: branding.productName,
    );
  }
}

class _RemoteBrandImage extends StatelessWidget {
  const _RemoteBrandImage({
    required this.url,
    required this.fit,
    required this.error,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit fit;
  final Widget error;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (_isSvgUrl(url)) {
      return SvgPicture.network(
        url,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (_) => const SizedBox.shrink(),
        errorBuilder: (BuildContext context, Object error, StackTrace? _) {
          return this.error;
        },
      );
    }
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (BuildContext context, Object error, StackTrace? _) {
        return this.error;
      },
    );
  }
}

bool _isSvgUrl(String url) {
  final String path = Uri.tryParse(url)?.path ?? url;
  return path.toLowerCase().endsWith('.svg');
}

class _FallbackWordmark extends StatelessWidget {
  const _FallbackWordmark({
    required this.height,
    required this.color,
    required this.productName,
  });

  final double height;
  final Color color;
  final String productName;

  @override
  Widget build(BuildContext context) {
    if (productName == InstanceConstants.defaultProductName) {
      return SvgPicture.asset(
        Assets.fluxerWordmarkMonochrome,
        height: height,
        theme: SvgTheme(currentColor: color),
      );
    }
    return Text(
      productName,
      style: context.textStyles.heading.copyWith(
        color: color,
        fontSize: height * 0.7,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
    );
  }
}
