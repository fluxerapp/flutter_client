import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

abstract final class MobileComposerLayout {
  const MobileComposerLayout._();
  static const double sideInset = 16;
  static const double nekoInsetEnd =
      sideInset +
      WideComposerLayout.mobileStatusRailPaddingInline -
      WideComposerLayout.boxInset;
  static const double statusTrailingInsetEnd = sideInset + rowPaddingEnd;
  static const double topInset = WideComposerLayout.mobileComposerTopInset;
  static const double bottomGap = kMobileComposerBottomGap;
  static const double radius = 16;
  static const double minHeight = 58;
  static const double buttonExtent = 32;
  static const double sendExtent = 36;
  static const double sendRadius = 10;
  static const double iconSize = 20;
  static const double sendIconSize = 18;
  static const double rowPaddingStart = 12;
  static const double rowPaddingEnd = 10;
  static const double rowPaddingVertical = 10;
  static const EdgeInsetsDirectional rowPadding =
      EdgeInsetsDirectional.fromSTEB(
        rowPaddingStart,
        rowPaddingVertical,
        rowPaddingEnd,
        rowPaddingVertical,
      );
  static const double attachGap = 2;
  static const double trailingGap = 8;
  static const double textInsetX = 6;
  static const double textInsetY = 7;
  static const int maxLines = 5;
  static const double headerHeight = 32;
  static const double headerMaxFraction = 0.35;
  static const double headerInsetStart = 13;
  static const double headerInsetEnd = 10;
  static const double pressedOpacity = 0.3;
  static const double attachOpenTurns = 0.125;
  static const double sendPopFromScale = 0.7;
  static const Duration resize = Duration(milliseconds: 100);
  static const Duration attachRotation = Duration(milliseconds: 130);
  static const Duration sendPop = Duration(milliseconds: 180);
  static const Duration pressFade = Duration(milliseconds: 60);
}

double mobileComposerHeaderMaxHeight({
  required double screenHeight,
  required double topInset,
  required double keyboardHeight,
}) {
  final double available = screenHeight - topInset - keyboardHeight;
  return math.max(
    MobileComposerLayout.headerHeight,
    available * MobileComposerLayout.headerMaxFraction,
  );
}

class MobileComposerBar extends StatelessWidget {
  const MobileComposerBar({
    required this.child,
    this.header,
    this.headerMaxHeight = double.infinity,
    this.maxHeight = double.infinity,
    super.key,
  });

  final Widget? header;
  final double headerMaxHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool bounded = maxHeight.isFinite;
    final double barMaxHeight = math.max(
      MobileComposerLayout.minHeight,
      maxHeight,
    );
    final double headerCap = bounded
        ? math.min(
            headerMaxHeight,
            barMaxHeight - MobileComposerLayout.minHeight,
          )
        : headerMaxHeight;
    return Container(
      constraints: BoxConstraints(
        minHeight: MobileComposerLayout.minHeight,
        maxHeight: barMaxHeight,
      ),
      decoration: ShapeDecoration(
        color: context.colors.backgroundTextarea,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(MobileComposerLayout.radius),
          side: BorderSide(
            color: wideComposerRingColor(context, focused: false),
          ),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedSize(
            duration: context.motion.panel,
            curve: Curves.easeOutCubic,
            alignment: Alignment.bottomCenter,
            child: header == null
                ? const SizedBox(width: double.infinity, height: 0)
                : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: headerCap),
                    child: SingleChildScrollView(
                      key: const ValueKey<String>('mobile-composer-header'),
                      physics: const ClampingScrollPhysics(),
                      child: header,
                    ),
                  ),
          ),
          if (bounded) Flexible(child: child) else child,
        ],
      ),
    );
  }
}

class MobileComposerTextGrowth extends StatelessWidget {
  const MobileComposerTextGrowth({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: MobileComposerLayout.resize,
      curve: Curves.easeOut,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}

class MobileComposerHeader extends StatelessWidget {
  const MobileComposerHeader({
    required this.title,
    required this.closeLabel,
    required this.onClose,
    this.leading,
    this.trailing,
    super.key,
  });

  final Widget title;
  final String closeLabel;
  final VoidCallback onClose;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MobileComposerLayout.headerHeight,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: MobileComposerLayout.headerInsetStart,
          end: MobileComposerLayout.headerInsetEnd,
          top: 4,
        ),
        child: Row(
          children: <Widget>[
            if (leading != null) ...<Widget>[
              leading!,
              const SizedBox(width: 6),
            ],
            Expanded(child: title),
            if (trailing != null) ...<Widget>[
              trailing!,
              const SizedBox(width: 6),
              SizedBox(
                height: 18,
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: context.colors.backgroundModifierAccent,
                ),
              ),
            ],
            Semantics(
              button: true,
              label: closeLabel,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onClose,
                child: SizedBox(
                  width: 32,
                  height: 26,
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsFill.xCircle,
                      size: 16,
                      color: context.colors.interactiveNormal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileComposerIconButton extends StatefulWidget {
  const MobileComposerIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    this.turns = 0,
    super.key,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final double turns;

  @override
  State<MobileComposerIconButton> createState() =>
      _MobileComposerIconButtonState();
}

class _MobileComposerIconButtonState extends State<MobileComposerIconButton> {
  bool _pressed = false;

  void _setPressed(bool pressed) {
    if (_pressed != pressed) {
      setState(() => _pressed = pressed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;
    return Semantics(
      button: true,
      enabled: enabled,
      label: widget.semanticLabel,
      onTap: widget.onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? (_) => _setPressed(true) : null,
        onTapUp: enabled ? (_) => _setPressed(false) : null,
        onTapCancel: enabled ? () => _setPressed(false) : null,
        onTap: widget.onPressed,
        child: SizedBox.square(
          dimension: MobileComposerLayout.buttonExtent,
          child: AnimatedOpacity(
            opacity: _pressed ? MobileComposerLayout.pressedOpacity : 1,
            duration: MobileComposerLayout.pressFade,
            child: AnimatedRotation(
              turns: widget.turns,
              duration: MobileComposerLayout.attachRotation,
              curve: Curves.easeOut,
              child: MobileComposerGlyph(icon: widget.icon),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileComposerGlyph extends StatelessWidget {
  const MobileComposerGlyph({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MobileComposerLayout.buttonExtent,
      child: Center(
        child: PhosphorIcon(
          icon,
          size: MobileComposerLayout.iconSize,
          color: context.colors.interactiveNormal,
        ),
      ),
    );
  }
}

class MobileComposerSendButton extends StatelessWidget {
  const MobileComposerSendButton({
    required this.semanticLabel,
    required this.onPressed,
    super.key,
  });

  final String semanticLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: semanticLabel,
      onTap: onPressed,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: DecoratedBox(
          key: const ValueKey<String>('mobile-composer-send'),
          decoration: ShapeDecoration(
            color: context.colors.brandPrimary,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(
                MobileComposerLayout.sendRadius,
              ),
            ),
          ),
          child: SizedBox.square(
            dimension: MobileComposerLayout.sendExtent,
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsFill.paperPlaneRight,
                size: MobileComposerLayout.sendIconSize,
                color: context.colors.brandPrimaryFill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileComposerPopSwitcher extends StatelessWidget {
  const MobileComposerPopSwitcher({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: MobileComposerLayout.sendPop,
      layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
        return Center(child: currentChild);
      },
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.5, curve: Curves.easeOut),
          ),
          child: ScaleTransition(
            scale:
                Tween<double>(
                  begin: MobileComposerLayout.sendPopFromScale,
                  end: 1,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
                ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
