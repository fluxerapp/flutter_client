import 'dart:io';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:window_manager/window_manager.dart';

const kNativeTitlebarHeight = 32.0;

const double _kTitlebarInset = 12;
const double _kControlWidth = 48;
const double _kControlIconSize = 17;
const double _kWordmarkHeight = 13;
const Duration _kControlTransition = Duration(milliseconds: 120);
const Color _kCloseHoverColor = Color(0xFFE81123);
const Color _kClosePressedColor = Color(0xFFB50D1A);

enum _ControlIcon {
  minimize(
    'M228,128a12,12,0,0,1-12,12H40a12,12,0,0,1,0-24H216A12,12,0,0,1,228,128Z',
  ),
  maximize(
    'M208,28H48A20,20,0,0,0,28,48V208a20,20,0,0,0,20,20H208a20,20,0,0,0,20-20V48A20,20,0,0,0,208,28Zm-4,176H52V52H204Z',
  ),
  restore(
    'M180,64H40A12,12,0,0,0,28,76V216a12,12,0,0,0,12,12H180a12,12,0,0,0,12-12V76A12,12,0,0,0,180,64ZM168,204H52V88H168ZM228,40V180a12,12,0,0,1-24,0V52H76a12,12,0,0,1,0-24H216A12,12,0,0,1,228,40Z',
  ),
  close(
    'M208.49,191.51a12,12,0,0,1-17,17L128,145,64.49,208.49a12,12,0,0,1-17-17L111,128,47.51,64.49a12,12,0,0,1,17-17L128,111l63.51-63.52a12,12,0,0,1,17,17L145,128Z',
  );

  const _ControlIcon(this.path);

  final String path;

  String get svg =>
      '<svg viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg"><path d="$path"/></svg>';
}

class NativeTitlebar extends StatelessWidget {
  const NativeTitlebar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMacOS = Platform.isMacOS;

    return ColoredBox(
      color: context.colors.backgroundSecondary,
      child: FluxerGestureDetector(
        onSecondaryTap: popUpDesktopMainWindowMenu,
        child: SizedBox(
          height: kNativeTitlebarHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const DragToMoveArea(child: SizedBox.expand()),
              Row(
                children: isMacOS
                    ? const [
                        Spacer(),
                        _Wordmark(),
                        SizedBox(width: _kTitlebarInset),
                      ]
                    : const [
                        SizedBox(width: _kTitlebarInset),
                        _Wordmark(),
                        Spacer(),
                        _WindowButton(
                          icon: _ControlIcon.minimize,
                          onPressed: minimizeDesktopMainWindow,
                        ),
                        _MaximizeButton(),
                        _WindowButton(
                          icon: _ControlIcon.close,
                          isClose: true,
                          onPressed: closeDesktopMainWindow,
                        ),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark();

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.textPrimaryMuted;
    return IgnorePointer(
      child: SvgPicture.asset(
        Assets.fluxerLogoText,
        height: _kWordmarkHeight,
        colorFilter: ColorFilter.mode(
          color.withValues(alpha: color.a * 0.8),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class _MaximizeButton extends StatelessWidget {
  const _MaximizeButton();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: desktopMainWindow,
      builder: (BuildContext context, _) => _WindowButton(
        icon: desktopMainWindow.isMaximized
            ? _ControlIcon.restore
            : _ControlIcon.maximize,
        onPressed: toggleMaximizeDesktopMainWindow,
      ),
    );
  }
}

class _WindowButton extends StatefulWidget {
  const _WindowButton({
    required this.icon,
    required this.onPressed,
    this.isClose = false,
  });

  final _ControlIcon icon;
  final VoidCallback onPressed;
  final bool isClose;

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  Color _backgroundColor(BuildContext context) {
    if (_isPressed) {
      return widget.isClose
          ? _kClosePressedColor
          : context.colors.backgroundModifierSelected;
    }
    if (_isHovered) {
      return widget.isClose
          ? _kCloseHoverColor
          : context.colors.backgroundModifierHover;
    }
    return Colors.transparent;
  }

  Color _iconColor(BuildContext context) {
    if (!_isHovered && !_isPressed) {
      return context.colors.textSecondary;
    }
    return widget.isClose ? Colors.white : context.colors.textPrimary;
  }

  void _setPressed(bool value) {
    if (_isPressed != value) {
      setState(() => _isPressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: _kControlTransition,
          curve: Curves.ease,
          width: _kControlWidth,
          height: kNativeTitlebarHeight,
          color: _backgroundColor(context),
          alignment: Alignment.center,
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: _iconColor(context)),
            duration: _kControlTransition,
            curve: Curves.ease,
            builder: (BuildContext context, Color? color, Widget? _) =>
                SvgPicture.string(
                  widget.icon.svg,
                  width: _kControlIconSize,
                  height: _kControlIconSize,
                  colorFilter: color == null
                      ? null
                      : ColorFilter.mode(color, BlendMode.srcIn),
                ),
          ),
        ),
      ),
    );
  }
}
