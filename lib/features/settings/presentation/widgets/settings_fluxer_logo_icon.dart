import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsFluxerLogoIcon extends StatelessWidget {
  const SettingsFluxerLogoIcon({this.size = 20, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final Color color =
        IconTheme.of(context).color ?? context.colors.textPrimary;
    return ExcludeSemantics(
      child: SvgPicture.asset(
        Assets.fluxerLogoMonochrome,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
