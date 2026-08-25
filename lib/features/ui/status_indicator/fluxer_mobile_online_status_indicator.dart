import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/avatar_status_layout.dart';
import 'package:fluxer_app/material_ui.dart';

const String kMobileOnlineStatusSvgAsset =
    'assets/images/icons/mobile-online-status.svg';

class FluxerMobileOnlineStatusIndicator extends StatelessWidget {
  const FluxerMobileOnlineStatusIndicator({
    required this.width,
    required this.height,
    required this.borderWidth,
    this.borderColor,
    super.key,
  });

  final double width;
  final double height;
  final double borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final Color border = borderColor ?? context.colors.backgroundSecondary;
    final Color statusColor = context.colors.statusOnline;
    final double cornerRx = width * kMobileCornerRadius;
    final double cornerRy = height * kMobileCornerRadius * kMobileAspectRatio;
    final BorderRadius phoneRadius = BorderRadius.only(
      topLeft: Radius.elliptical(cornerRx, cornerRy),
      topRight: Radius.elliptical(cornerRx, cornerRy),
      bottomLeft: Radius.elliptical(cornerRx, cornerRy),
      bottomRight: Radius.elliptical(cornerRx, cornerRy),
    );
    return ExcludeSemantics(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: border,
                borderRadius: phoneRadius,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(borderWidth),
              child: SvgPicture.asset(
                kMobileOnlineStatusSvgAsset,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(statusColor, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
