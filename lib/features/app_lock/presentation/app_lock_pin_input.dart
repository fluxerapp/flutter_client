import 'dart:async';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class AppLockPinInput extends StatefulWidget {
  const AppLockPinInput({
    required this.label,
    required this.onCompleted,
    this.enabled = true,
    this.autofocus = true,
    this.errorSignal = 0,
    super.key,
  });

  final String label;
  final ValueChanged<String> onCompleted;
  final bool enabled;
  final bool autofocus;
  final int errorSignal;

  @override
  State<AppLockPinInput> createState() => _AppLockPinInputState();
}

class _AppLockPinInputState extends State<AppLockPinInput>
    with SingleTickerProviderStateMixin {
  static const Duration _digitDuration = Duration(milliseconds: 180);
  static const Duration _resetDelay = Duration(milliseconds: 280);
  static const Duration _shakeDuration = Duration(milliseconds: 420);
  static const Duration _keyboardRetryDelay = Duration(milliseconds: 350);

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final AnimationController _shake = AnimationController(
    vsync: this,
    duration: _shakeDuration,
  );
  late final AppLifecycleListener _lifecycle;
  Timer? _resetTimer;
  Timer? _keyboardTimer;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
    _lifecycle = AppLifecycleListener(onResume: _showKeyboard);
    if (widget.autofocus) {
      _keyboardTimer = Timer(_keyboardRetryDelay, _showKeyboard);
    }
  }

  @override
  void didUpdateWidget(covariant AppLockPinInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.errorSignal != oldWidget.errorSignal) {
      _shake.forward(from: 0);
    }
    if (widget.enabled && !oldWidget.enabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _focusNode.requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _keyboardTimer?.cancel();
    _resetTimer?.cancel();
    _shake.dispose();
    _controller.dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  void _showKeyboard() {
    if (widget.enabled && _focusNode.hasFocus) {
      unawaited(SystemChannels.textInput.invokeMethod<void>('TextInput.show'));
    }
  }

  void _onChanged(String value) {
    setState(() {});
    if (value.length != appLockPinLength) {
      return;
    }
    widget.onCompleted(value);
    _resetTimer?.cancel();
    _resetTimer = Timer(
      MediaQuery.disableAnimationsOf(context) ? Duration.zero : _resetDelay,
      () {
        if (mounted) {
          setState(_controller.clear);
        }
      },
    );
  }

  double _shakeOffset(double t) => sin(t * 4 * pi) * 10 * (1 - t);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final int filled = _controller.text.length;
    final int activeIndex = _focusNode.hasFocus && filled < appLockPinLength
        ? filled
        : -1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ExcludeSemantics(
          child: Padding(
            padding: EdgeInsets.only(bottom: layout.s1_5),
            child: Text(
              widget.label,
              style: textStyles.label.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _shake,
          builder: (BuildContext context, Widget? child) {
            final double offset = reduceMotion ? 0 : _shakeOffset(_shake.value);
            return Transform.translate(offset: Offset(offset, 0), child: child);
          },
          child: Stack(
            children: [
              ExcludeSemantics(
                child: Row(
                  children: [
                    for (int index = 0; index < appLockPinLength; index++) ...[
                      if (index > 0) SizedBox(width: layout.s2),
                      Expanded(
                        child: _DigitBox(
                          filled: index < filled,
                          active: index == activeIndex,
                          duration: reduceMotion
                              ? Duration.zero
                              : _digitDuration,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: 0,
                  alwaysIncludeSemantics: true,
                  child: Semantics(
                    label: widget.label,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      enabled: widget.enabled,
                      autofocus: widget.autofocus,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(appLockPinLength),
                      ],
                      autocorrect: false,
                      enableSuggestions: false,
                      enableInteractiveSelection: false,
                      showCursor: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: _onChanged,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DigitBox extends StatelessWidget {
  const _DigitBox({
    required this.filled,
    required this.active,
    required this.duration,
  });

  final bool filled;
  final bool active;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeOut,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusLg,
        border: Border.all(
          color: active
              ? colors.accentPrimary
              : colors.backgroundModifierAccent,
          width: active ? 2 : 1,
        ),
      ),
      child: AnimatedScale(
        scale: filled ? 1 : 0,
        duration: duration,
        curve: Curves.easeOutBack,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.textPrimary,
          ),
          child: const SizedBox.square(dimension: 12),
        ),
      ),
    );
  }
}
