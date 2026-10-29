import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/splash_exit_allowed_provider.dart';
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
    final bool splashRevealComplete = ref.watch(splashRevealCompleteProvider);
    if (!hasIphoneDuoSideStrip(context) ||
        !showsIphoneDuoWindowBackground(
          isAuthenticated: isAuthenticated,
          location: location,
          splashExitAllowed: splashExitAllowed,
          splashRevealComplete: splashRevealComplete,
        )) {
      return child;
    }
    final Color background = context.colors.backgroundPrimary;
    return ColoredBox(color: background, child: child);
  }
}
