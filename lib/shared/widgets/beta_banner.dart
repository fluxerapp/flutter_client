import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/material_ui.dart';

const Color _kCanaryIconColor = Color.from(
  alpha: 1,
  red: 0.95215,
  green: 0.66553,
  blue: 0.23462,
);

class BetaBanner extends ConsumerWidget {
  const BetaBanner({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isCanary = AppBuildConfig.isCanary;
    return Banner(
      location: BannerLocation.topEnd,
      message: isCanary ? 'CANARY' : 'BETA',
      color: isCanary
          ? _kCanaryIconColor
          : Theme.of(context).colorScheme.primary,
      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 10,
        color: isCanary ? Colors.black : Colors.white,
        fontWeight: FontWeight.w600,
      ),
      child: child,
    );
  }
}
