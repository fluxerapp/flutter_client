import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/splash_reveal_overlay.dart';
import 'package:material_ui/material_ui.dart';

class SplashShellSettle extends ConsumerStatefulWidget {
  const SplashShellSettle({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<SplashShellSettle> createState() => _SplashShellSettleState();
}

class _SplashShellSettleState extends ConsumerState<SplashShellSettle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _started = false;
  bool _resolvedInitial = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SplashRevealOverlay.totalDuration,
      value: 1,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_resolvedInitial) {
      return;
    }
    _resolvedInitial = true;
    if (ref.read(splashExitAllowedProvider)) {
      _maybeStart();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _maybeStart() {
    if (_started) {
      return;
    }
    _started = true;
    if (MediaQuery.disableAnimationsOf(context) ||
        !ref.read(
          appearancePreferencesProvider.select(
            (AppearancePreferencesState state) =>
                state.mobileSplashZoomAnimation,
          ),
        )) {
      _controller.value = 1;
      return;
    }
    _controller.forward(from: 0);
  }

  void _reset() {
    _started = false;
    _controller.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(splashExitAllowedProvider, (bool? previous, bool next) {
      if (next) {
        _maybeStart();
      } else {
        _reset();
      }
    });

    final bool useLogoZoomTransition = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.mobileSplashZoomAnimation,
      ),
    );

    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final bool reducedMotion = MediaQuery.disableAnimationsOf(context);
        final double scale = splashRevealShellScale(
          _controller.value,
          reducedMotion: reducedMotion,
          useLogoZoomTransition: useLogoZoomTransition,
        );
        if (scale == 1) {
          return child!;
        }
        return Transform.scale(
          scale: scale,
          filterQuality: FilterQuality.low,
          child: child,
        );
      },
    );
  }
}
