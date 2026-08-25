import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/material_ui.dart';

class BetaBanner extends ConsumerWidget {
  const BetaBanner({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Banner(
      location: BannerLocation.topEnd,
      message: 'BETA',
      color: Theme.of(context).colorScheme.primary,
      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      child: child,
    );
  }
}
