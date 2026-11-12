import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const double _kCardWidth = 320;
const double _kCardHeight = 400;
const double _kViewportMargin = 24;
const double _kDragThreshold = 6;
const Cubic _kCardCurve = Cubic(0.32, 0.72, 0, 1);
const Duration _kActionDuration = Duration(milliseconds: 120);

abstract final class _Palette {
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0x8CEBEBF5);
  static const Color textTertiary = Color(0x80EBEBF5);
  static const Color textAction = Color(0xB3EBEBF5);
  static const Color acceptBg = Color(0xFF34C759);
  static const Color acceptBgHover = Color(0xFF3AD360);
  static const Color acceptShadow = Color(0x7334C759);
  static const Color rejectBg = Color(0xFFFF3B30);
  static const Color rejectBgHover = Color(0xFFFF4E44);
  static const Color rejectShadow = Color(0x73FF3B30);
  static const Color cardBorder = Color(0x14FFFFFF);
  static const Color cardTop = Color(0xFF2C2C2E);
  static const Color cardBottom = Color(0xFF1C1C1E);
  static const Color cardShadowFar = Color(0x8C000000);
  static const Color cardShadowNear = Color(0x59000000);
  static const Color highlight = Color(0x0FFFFFFF);
  static const Color clearWhite = Color(0x00FFFFFF);
  static const Color avatarRing = Color(0x0AFFFFFF);
  static const Color avatarShadow = Color(0x73000000);
  static const Color handle = Color(0x47EBEBF5);
}

Offset? _lastCardPosition;

Future<String?> showIncomingVoiceCallDesktopCard(
  BuildContext context, {
  required String callerName,
  required Widget avatar,
  required Stream<void> remoteDismiss,
  required String remoteDismissResult,
}) {
  final OverlayState overlay = Overlay.of(context, rootOverlay: true);
  final Completer<String?> completer = Completer<String?>();
  late final OverlayEntry entry;
  StreamSubscription<void>? subscription;
  void finish(String? result) {
    if (completer.isCompleted) {
      return;
    }
    unawaited(subscription?.cancel());
    entry.remove();
    completer.complete(result);
  }

  entry = OverlayEntry(
    builder: (BuildContext overlayContext) {
      return Material(
        type: MaterialType.transparency,
        child: _IncomingVoiceCallDesktopOverlay(
          callerName: callerName,
          avatar: avatar,
          onResult: finish,
        ),
      );
    },
  );
  overlay.insert(entry);
  subscription = remoteDismiss.listen((_) => finish(remoteDismissResult));
  return completer.future;
}

class _IncomingVoiceCallDesktopOverlay extends StatefulWidget {
  const _IncomingVoiceCallDesktopOverlay({
    required this.callerName,
    required this.avatar,
    required this.onResult,
  });

  final String callerName;
  final Widget avatar;
  final ValueChanged<String?> onResult;

  @override
  State<_IncomingVoiceCallDesktopOverlay> createState() =>
      _IncomingVoiceCallDesktopOverlayState();
}

class _IncomingVoiceCallDesktopOverlayState
    extends State<_IncomingVoiceCallDesktopOverlay> {
  final ValueNotifier<Offset?> _position = ValueNotifier<Offset?>(
    _lastCardPosition,
  );
  final ValueNotifier<bool> _dragging = ValueNotifier<bool>(false);
  Offset? _dragStart;
  Offset? _dragOrigin;

  @override
  void dispose() {
    _position.dispose();
    _dragging.dispose();
    super.dispose();
  }

  Offset _clamp(Offset value, Size viewport) {
    final double maxX = math.max(0, viewport.width - _kCardWidth);
    final double maxY = math.max(0, viewport.height - _kCardHeight);
    return Offset(value.dx.clamp(0, maxX), value.dy.clamp(0, maxY));
  }

  Offset _resolvedPosition(Size viewport) => _clamp(
    _position.value ??
        Offset(
          viewport.width / 2 - _kCardWidth / 2,
          viewport.height / 2 - _kCardHeight / 2,
        ),
    viewport,
  );

  @override
  Widget build(BuildContext context) {
    final Size viewport = MediaQuery.sizeOf(context);
    final double width = math.min(
      _kCardWidth,
      viewport.width - _kViewportMargin,
    );
    final Widget card = _IncomingVoiceCallDesktopCard(
      callerName: widget.callerName,
      avatar: widget.avatar,
      onAccept: () => widget.onResult('accept'),
      onReject: () => widget.onResult('reject'),
      onIgnore: () => widget.onResult('ignore'),
      onDragStart: (Offset global) {
        _dragStart = global;
        _dragOrigin = _resolvedPosition(viewport);
      },
      onDragUpdate: (Offset global) {
        final Offset? start = _dragStart;
        final Offset? origin = _dragOrigin;
        if (start == null || origin == null) {
          return;
        }
        final Offset delta = global - start;
        if (!_dragging.value && delta.distance <= _kDragThreshold) {
          return;
        }
        _dragging.value = true;
        _position.value = _clamp(origin + delta, viewport);
      },
      onDragEnd: () {
        if (_dragging.value) {
          _lastCardPosition = _position.value;
        }
        _dragging.value = false;
        _dragStart = null;
        _dragOrigin = null;
      },
    );
    return ListenableBuilder(
      listenable: Listenable.merge(<Listenable>[_position, _dragging]),
      builder: (BuildContext context, Widget? child) {
        final Offset position = _resolvedPosition(viewport);
        return Stack(
          children: <Widget>[
            Positioned(
              left: position.dx,
              top: position.dy,
              width: width,
              child: MouseRegion(
                cursor: _dragging.value
                    ? SystemMouseCursors.grabbing
                    : MouseCursor.defer,
                child: child,
              ),
            ),
          ],
        );
      },
      child: card,
    );
  }
}

class _IncomingVoiceCallDesktopCard extends StatefulWidget {
  const _IncomingVoiceCallDesktopCard({
    required this.callerName,
    required this.avatar,
    required this.onAccept,
    required this.onReject,
    required this.onIgnore,
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
  });

  final String callerName;
  final Widget avatar;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final VoidCallback onIgnore;
  final ValueChanged<Offset>? onDragStart;
  final ValueChanged<Offset>? onDragUpdate;
  final VoidCallback? onDragEnd;

  @override
  State<_IncomingVoiceCallDesktopCard> createState() =>
      _IncomingVoiceCallDesktopCardState();
}

class _IncomingVoiceCallDesktopCardState
    extends State<_IncomingVoiceCallDesktopCard>
    with TickerProviderStateMixin {
  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2200),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      _entrance.value = 1;
      _pulse.stop();
    } else {
      if (_entrance.value == 0 && !_entrance.isAnimating) {
        _entrance.forward();
      }
      if (!_pulse.isAnimating) {
        _pulse.repeat();
      }
    }
  }

  @override
  void dispose() {
    _entrance.dispose();
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle base = context.textStyles.bodyMedium.copyWith(
      color: _Palette.textPrimary,
      letterSpacing: 0,
      decoration: TextDecoration.none,
    );
    final Widget card = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _Palette.cardBorder),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[_Palette.cardTop, _Palette.cardBottom],
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: _Palette.cardShadowFar,
            offset: Offset(0, 24),
            blurRadius: 60,
          ),
          BoxShadow(
            color: _Palette.cardShadowNear,
            offset: Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: Stack(
          children: <Widget>[
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 1.4,
                    colors: <Color>[_Palette.highlight, _Palette.clearWhite],
                    stops: <double>[0, 0.6],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: SizedBox(
                height: 1,
                child: ColoredBox(color: _Palette.highlight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 26, 24, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const PhosphorIcon(
                        PhosphorIconsFill.phoneIncoming,
                        size: 14,
                        color: _Palette.textSecondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        l10n.incomingVoiceCallLabel,
                        style: base.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _Palette.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: _Palette.avatarShadow,
                          offset: Offset(0, 12),
                          blurRadius: 28,
                        ),
                      ],
                    ),
                    child: AnimatedBuilder(
                      animation: _pulse,
                      builder: (BuildContext context, Widget? child) {
                        final double t = _pulse.value <= 0.5
                            ? _pulse.value * 2
                            : (1 - _pulse.value) * 2;
                        final double eased = Curves.easeInOut.transform(t);
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _Palette.avatarRing,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.18 * (1 - eased),
                                ),
                                spreadRadius: 10 * eased,
                              ),
                            ],
                          ),
                          child: child,
                        );
                      },
                      child: SizedBox.square(
                        dimension: 96,
                        child: Center(child: widget.avatar),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.callerName,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: base.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: -0.22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.incomingVoiceCallSubtitle,
                    textAlign: TextAlign.center,
                    style: base.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: _Palette.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 56,
                    children: <Widget>[
                      _IncomingCallAction(
                        label: l10n.incomingVoiceCallDecline,
                        background: _Palette.rejectBg,
                        hoverBackground: _Palette.rejectBgHover,
                        shadowColor: _Palette.rejectShadow,
                        iconTurns: 135 / 360,
                        textStyle: base,
                        onPressed: widget.onReject,
                      ),
                      _IncomingCallAction(
                        label: l10n.incomingVoiceCallAccept,
                        background: _Palette.acceptBg,
                        hoverBackground: _Palette.acceptBgHover,
                        shadowColor: _Palette.acceptShadow,
                        iconTurns: 0,
                        textStyle: base,
                        autofocus: true,
                        onPressed: widget.onAccept,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14 + 6),
                  _IncomingCallIgnoreLink(
                    label: l10n.incomingVoiceCallIgnore,
                    textStyle: base,
                    onPressed: widget.onIgnore,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 18,
              child: MouseRegion(
                cursor: SystemMouseCursors.grab,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanStart: (DragStartDetails details) =>
                      widget.onDragStart?.call(details.globalPosition),
                  onPanUpdate: (DragUpdateDetails details) =>
                      widget.onDragUpdate?.call(details.globalPosition),
                  onPanEnd: (_) => widget.onDragEnd?.call(),
                  onPanCancel: () => widget.onDragEnd?.call(),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Container(
                        width: 36,
                        height: 5,
                        decoration: BoxDecoration(
                          color: _Palette.handle,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    final Animation<double> curved = CurvedAnimation(
      parent: _entrance,
      curve: _kCardCurve,
    );
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: l10n.incomingVoiceCallTitle,
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.escape): widget.onIgnore,
        },
        child: FocusScope(
          autofocus: true,
          child: AnimatedBuilder(
            animation: curved,
            builder: (BuildContext context, Widget? child) {
              final double t = curved.value;
              return Opacity(
                opacity: t.clamp(0, 1),
                child: Transform.translate(
                  offset: Offset(0, 8 * (1 - t)),
                  child: Transform.scale(scale: 0.94 + 0.06 * t, child: child),
                ),
              );
            },
            child: card,
          ),
        ),
      ),
    );
  }
}

class _IncomingCallAction extends StatefulWidget {
  const _IncomingCallAction({
    required this.label,
    required this.background,
    required this.hoverBackground,
    required this.shadowColor,
    required this.iconTurns,
    required this.textStyle,
    required this.onPressed,
    this.autofocus = false,
  });

  final String label;
  final Color background;
  final Color hoverBackground;
  final Color shadowColor;
  final double iconTurns;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  State<_IncomingCallAction> createState() => _IncomingCallActionState();
}

class _IncomingCallActionState extends State<_IncomingCallAction> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : _kActionDuration;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Semantics(
          button: true,
          label: widget.label,
          excludeSemantics: true,
          child: FocusableActionDetector(
            autofocus: widget.autofocus,
            mouseCursor: SystemMouseCursors.click,
            onShowHoverHighlight: (bool value) =>
                setState(() => _hovered = value),
            actions: <Type, Action<Intent>>{
              ActivateIntent: CallbackAction<ActivateIntent>(
                onInvoke: (_) {
                  widget.onPressed();
                  return null;
                },
              ),
            },
            child: GestureDetector(
              onTapDown: (_) => setState(() => _pressed = true),
              onTapCancel: () => setState(() => _pressed = false),
              onTapUp: (_) => setState(() => _pressed = false),
              onTap: widget.onPressed,
              child: AnimatedSlide(
                duration: duration,
                curve: Curves.easeOut,
                offset: Offset(0, _pressed ? 1 / 64 : 0),
                child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.easeOut,
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _hovered
                        ? widget.hoverBackground
                        : widget.background,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: widget.shadowColor,
                        offset: const Offset(0, 6),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Center(
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation<double>(widget.iconTurns),
                      child: const PhosphorIcon(
                        PhosphorIconsFill.phone,
                        size: 28,
                        color: _Palette.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.label,
          style: widget.textStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _Palette.textAction,
          ),
        ),
      ],
    );
  }
}

class _IncomingCallIgnoreLink extends StatelessWidget {
  const _IncomingCallIgnoreLink({
    required this.label,
    required this.textStyle,
    required this.onPressed,
  });

  final String label;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : _kActionDuration;
    return Actions(
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            onPressed();
            return null;
          },
        ),
      },
      child: FluxerTappable(
        onTap: onPressed,
        semanticLabel: label,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = states.contains(WidgetState.hovered);
          return AnimatedContainer(
            duration: duration,
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: hovered ? _Palette.highlight : _Palette.clearWhite,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              label,
              style: textStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: hovered ? _Palette.textPrimary : _Palette.textTertiary,
              ),
            ),
          );
        },
      ),
    );
  }
}
