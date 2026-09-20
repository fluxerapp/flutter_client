import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/material_ui.dart';

const Color _kCanaryIconColor = Color.from(
  alpha: 1,
  red: 0.95215,
  green: 0.66553,
  blue: 0.23462,
);

class BetaBanner extends StatelessWidget {
  const BetaBanner({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!AppBuildConfig.isCanary) {
      return child;
    }
    return Banner(
      location: BannerLocation.topEnd,
      message: 'CANARY',
      color: _kCanaryIconColor,
      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      child: child,
    );
  }
}
