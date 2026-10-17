import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/material_ui.dart';

class IphoneDuoAppBackground extends ConsumerWidget {
  const IphoneDuoAppBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isAuthenticated = ref.watch(authStateProvider);
    final String location = ref.watch(currentLocationProvider);
    final bool splashExitAllowed = ref.watch(splashExitAllowedProvider);
    if (!usesIphoneDuoHostedUi(context) ||
        !showsIphoneDuoWindowBackground(
          isAuthenticated: isAuthenticated,
          location: location,
          splashExitAllowed: splashExitAllowed,
        )) {
      return child;
    }
    final Color background = context.colors.backgroundPrimary;
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
    return ColoredBox(
      color: background,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          child,
          if (viewPadding.right > 0)
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              width: viewPadding.right,
              child: ColoredBox(color: background),
            ),
          if (viewPadding.left > 0)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              width: viewPadding.left,
              child: ColoredBox(color: background),
            ),
        ],
      ),
    );
  }
}
