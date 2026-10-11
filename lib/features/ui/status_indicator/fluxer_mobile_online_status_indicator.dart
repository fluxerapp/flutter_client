import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const String kMobileOnlineStatusSvgAsset =
    'assets/images/icons/mobile-online-status.svg';

class FluxerMobileOnlineStatusIndicator extends StatelessWidget {
  const FluxerMobileOnlineStatusIndicator({
    required this.width,
    required this.height,
    this.color,
    super.key,
  });

  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: SizedBox(
        width: width,
        height: height,
        child: SvgPicture.asset(
          kMobileOnlineStatusSvgAsset,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            color ?? context.colors.statusOnline,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
