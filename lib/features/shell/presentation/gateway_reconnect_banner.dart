import 'dart:ui' show lerpDouble;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

double _reconnectMarkBounce(double t) {
  final double clamped = t.clamp(0.0, 1.0);
  return clamped < 1 ? (1 - clamped) * clamped * 4 : 0;
}

Size _measureLabel(BuildContext context, String text, TextStyle style) {
  final DefaultTextStyle defaults = DefaultTextStyle.of(context);
  final TextPainter painter = TextPainter(
    text: TextSpan(text: text, style: defaults.style.merge(style)),
    textDirection: Directionality.of(context),
    textScaler: MediaQuery.textScalerOf(context),
    maxLines: 1,
  )..layout();
  final Size size = painter.size;
  painter.dispose();
  return size;
}

class GatewayReconnectBannerOverlay extends StatelessWidget {
  const GatewayReconnectBannerOverlay({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Positioned(
          left: layout.s4,
          right: layout.s4,
          top: mediaQuery.padding.top + layout.s4,
          child: const IgnorePointer(
            child: Center(child: _GatewayReconnectBanner()),
          ),
        ),
      ],
    );
  }
}

class _GatewayReconnectBanner extends ConsumerStatefulWidget {
  const _GatewayReconnectBanner();

  @override
  ConsumerState<_GatewayReconnectBanner> createState() =>
      _GatewayReconnectBannerState();
}

class _GatewayReconnectBannerState
    extends ConsumerState<_GatewayReconnectBanner>
    with TickerProviderStateMixin {
  static const double _markSize = 28;
  static const Duration _pulseDuration = Duration(milliseconds: 1300);
  static const Duration _celebrateDuration = Duration(milliseconds: 700);
  static const Duration _phaseDuration = Duration(milliseconds: 420);
  static const Color _labelColor = Color(0xFFD6D0EC);
  static const Color _scrimColor = Color(0x9905040D);

  late final AnimationController _enterController;
  late final AnimationController _pulseController;
  late final AnimationController _celebrateController;
  late final AnimationController _labelController;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  GatewayReconnectBannerPhase _contentPhase =
      GatewayReconnectBannerPhase.hidden;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.panelDuration,
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: _pulseDuration,
    );
    _celebrateController = AnimationController(
      vsync: this,
      duration: _celebrateDuration,
    );
    _labelController = AnimationController(
      vsync: this,
      duration: _phaseDuration,
    );
    final CurvedAnimation enterCurve = CurvedAnimation(
      parent: _enterController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(enterCurve);
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(enterCurve);
    _enterController.addStatusListener((AnimationStatus status) {
      if (status != AnimationStatus.dismissed || !mounted) {
        return;
      }
      _contentPhase = GatewayReconnectBannerPhase.hidden;
      _labelController.value = 0;
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _enterController.duration = context.motion.panel;
    _labelController.duration = animationsEnabled
        ? _phaseDuration
        : Duration.zero;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncControllers();
      }
    });
  }

  @override
  void dispose() {
    _enterController.dispose();
    _pulseController.dispose();
    _celebrateController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _setController({
    required AnimationController controller,
    required bool active,
    required bool animationsEnabled,
    bool restart = false,
  }) {
    if (!animationsEnabled) {
      controller.value = active ? 1 : 0;
      return;
    }
    if (!active) {
      controller.reverse();
      return;
    }
    if (restart &&
        controller.status != AnimationStatus.forward &&
        controller.status != AnimationStatus.completed) {
      controller.forward(from: 0);
      return;
    }
    controller.forward();
  }

  void _syncControllers() {
    final GatewayReconnectBannerPhase phase = ref.read(
      gatewayReconnectBannerProvider,
    );
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    if (phase != GatewayReconnectBannerPhase.hidden) {
      _contentPhase = phase;
    }
    if (phase == GatewayReconnectBannerPhase.hidden) {
      if (_enterController.value > 0) {
        _setController(
          controller: _enterController,
          active: false,
          animationsEnabled: animationsEnabled,
        );
      }
      _pulseController.stop();
      return;
    }
    _setController(
      controller: _enterController,
      active: true,
      animationsEnabled: animationsEnabled,
    );
    _pulseController.syncWithVisibility(
      isVisible: phase == GatewayReconnectBannerPhase.reconnecting,
      animationsEnabled: animationsEnabled,
    );
    final bool connected = phase == GatewayReconnectBannerPhase.connected;
    _setController(
      controller: _celebrateController,
      active: connected,
      animationsEnabled: animationsEnabled,
      restart: true,
    );
    _setController(
      controller: _labelController,
      active: connected,
      animationsEnabled: animationsEnabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final GatewayReconnectBannerPhase phase = ref.watch(
      gatewayReconnectBannerProvider,
    );
    ref.listen<GatewayReconnectBannerPhase>(gatewayReconnectBannerProvider, (
      GatewayReconnectBannerPhase? previous,
      GatewayReconnectBannerPhase next,
    ) {
      _syncControllers();
    });
    if (phase != GatewayReconnectBannerPhase.hidden) {
      _contentPhase = phase;
    }
    if (_contentPhase == GatewayReconnectBannerPhase.hidden &&
        _enterController.value == 0) {
      return const SizedBox.shrink();
    }

    final FluxerColorTheme colors = context.colors;
    final FluxerLayoutTheme layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String reconnectingMessage = l10n.gatewayReconnectingToast;
    final String connectedMessage = l10n.gatewayConnectedToast;
    final bool connected =
        _contentPhase == GatewayReconnectBannerPhase.connected;
    final BorderRadius pillRadius = layout.radiusFull;
    final TextStyle reconnectingStyle = context.textStyles.bodyMedium.copyWith(
      fontWeight: FontWeight.w600,
      color: _labelColor,
    );
    final TextStyle connectedStyle = reconnectingStyle.copyWith(
      color: Color.lerp(_labelColor, colors.accentSuccess, 0.55),
    );

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Semantics(
          liveRegion: true,
          label: connected ? connectedMessage : reconnectingMessage,
          child: ExcludeSemantics(
            child: Material(
              type: MaterialType.transparency,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: pillRadius,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.28),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: pillRadius,
                  child: Stack(
                    children: [
                      const Positioned.fill(
                        child: RepaintBoundary(
                          child: ClipRect(child: StarfieldBackground()),
                        ),
                      ),
                      const Positioned.fill(
                        child: ColoredBox(color: _scrimColor),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: pillRadius,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: layout.s4,
                          vertical: layout.s2,
                        ),
                        child: AnimatedBuilder(
                          animation: _labelController,
                          builder: (BuildContext context, Widget? mark) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ?mark,
                                SizedBox(width: layout.s3),
                                _PhaseLabel(
                                  progress: _labelController.value,
                                  reconnectingMessage: reconnectingMessage,
                                  connectedMessage: connectedMessage,
                                  reconnectingStyle: reconnectingStyle,
                                  connectedStyle: connectedStyle,
                                  reconnectingSize: _measureLabel(
                                    context,
                                    reconnectingMessage,
                                    reconnectingStyle,
                                  ),
                                  connectedSize: _measureLabel(
                                    context,
                                    connectedMessage,
                                    connectedStyle,
                                  ),
                                ),
                              ],
                            );
                          },
                          child: _ReconnectBrandMark(
                            size: _markSize,
                            pulse: _pulseController,
                            celebrate: _celebrateController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhaseLabel extends StatelessWidget {
  const _PhaseLabel({
    required this.progress,
    required this.reconnectingMessage,
    required this.connectedMessage,
    required this.reconnectingStyle,
    required this.connectedStyle,
    required this.reconnectingSize,
    required this.connectedSize,
  });

  final double progress;
  final String reconnectingMessage;
  final String connectedMessage;
  final TextStyle reconnectingStyle;
  final TextStyle connectedStyle;
  final Size reconnectingSize;
  final Size connectedSize;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaults = DefaultTextStyle.of(context);
    final TextStyle reconnectingStyle = defaults.style.merge(
      this.reconnectingStyle,
    );
    final TextStyle connectedStyle = defaults.style.merge(this.connectedStyle);
    final double t = Curves.easeInOutCubic.transform(progress);
    return SizedBox(
      width:
          (lerpDouble(reconnectingSize.width, connectedSize.width, t) ??
                  connectedSize.width)
              .ceilToDouble(),
      child: ClipRect(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            if (t < 1)
              Opacity(
                opacity: 1 - t,
                child: Text(
                  reconnectingMessage,
                  style: reconnectingStyle,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
            if (t > 0)
              Opacity(
                opacity: t,
                child: Text(
                  connectedMessage,
                  style: connectedStyle,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ReconnectBrandMark extends StatelessWidget {
  const _ReconnectBrandMark({
    required this.size,
    required this.pulse,
    required this.celebrate,
  });

  final double size;
  final Animation<double> pulse;
  final Animation<double> celebrate;

  static const double _startScale = 0.4;
  static const double _endScale = 1.4;

  @override
  Widget build(BuildContext context) {
    final Color brand = context.colors.brandPrimary;
    final Color success = context.colors.accentSuccess;
    return SizedBox(
      width: size * 1.5,
      height: size * 1.5,
      child: AnimatedBuilder(
        animation: Listenable.merge(<Listenable>[pulse, celebrate]),
        builder: (BuildContext context, Widget? child) {
          final double pulseT = pulse.value;
          final double celebrateT = celebrate.value;
          final double pulseOpacity =
              (1 - Curves.easeIn.transform(pulseT)) * 0.5 * (1 - celebrateT);
          final double celebrateOpacity =
              (1 - Curves.easeIn.transform(celebrateT)) * 0.55;
          final double markScale =
              1 +
              (0.08 *
                  Curves.easeOut.transform(_reconnectMarkBounce(celebrateT)));
          return Stack(
            alignment: Alignment.center,
            children: [
              if (pulseOpacity > 0.01)
                _pulseRing(
                  size: size,
                  scale: _ringScale(pulseT, Curves.easeOut),
                  color: brand.withValues(alpha: pulseOpacity),
                ),
              if (celebrateOpacity > 0.01 && celebrateT > 0)
                _pulseRing(
                  size: size,
                  scale: _ringScale(celebrateT, Curves.easeOutCubic),
                  color: Color.lerp(
                    brand,
                    success,
                    celebrateT,
                  )!.withValues(alpha: celebrateOpacity),
                ),
              Transform.scale(scale: markScale, child: child),
            ],
          );
        },
        child: InstanceBrandMark(size: size, backgroundColor: brand),
      ),
    );
  }

  static double _ringScale(double t, Curve curve) {
    return _startScale + (_endScale - _startScale) * curve.transform(t);
  }

  static Widget _pulseRing({
    required double size,
    required double scale,
    required Color color,
  }) {
    return Transform.scale(
      scale: scale,
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: SizedBox(width: size, height: size),
      ),
    );
  }
}
