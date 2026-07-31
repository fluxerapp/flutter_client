import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/theme/color_utils.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

class FluxerBrandLogo extends StatelessWidget {
  const FluxerBrandLogo({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final brandColor = context.colors.brandPrimary;
    final symbolColor = ColorUtils.bestContrastColor(brandColor.toARGB32());
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: brandColor,
            ),
          ),
          SvgPicture.asset(
            Assets.fluxerSymbol,
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(symbolColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
