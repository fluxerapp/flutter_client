import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/service/composer_slash_session.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class SlashCommandComposer extends StatefulWidget {
  const SlashCommandComposer({
    required this.session,
    required this.enabled,
    required this.style,
    required this.onSubmit,
    this.onKeyEvent,
    super.key,
  });

  final ComposerSlashSession session;
  final bool enabled;
  final TextStyle style;
  final VoidCallback onSubmit;
  final KeyEventResult Function(KeyEvent event)? onKeyEvent;

  @override
  State<SlashCommandComposer> createState() => _SlashCommandComposerState();
}

class _SlashCommandComposerState extends State<SlashCommandComposer> {
  final List<TextEditingController> _controllers = <TextEditingController>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];
  int _syncedLength = -1;

  @override
  void initState() {
    super.initState();
    widget.session.addListener(_onSession);
    _syncControllers();
  }

  @override
  void didUpdateWidget(SlashCommandComposer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.session != widget.session) {
      oldWidget.session.removeListener(_onSession);
      widget.session.addListener(_onSession);
      _syncControllers();
    }
  }

  @override
  void dispose() {
    widget.session.removeListener(_onSession);
    _disposeEditors();
    super.dispose();
  }

  void _disposeEditors() {
    for (final TextEditingController c in _controllers) {
      c.dispose();
    }
    for (final FocusNode n in _focusNodes) {
      n.dispose();
    }
    _controllers.clear();
    _focusNodes.clear();
  }

  void _onSession() {
    if (!mounted) {
      return;
    }
    _syncControllers();
    setState(() {});
    _restoreFocus();
  }

  void _syncControllers() {
    final int n = widget.session.slots.length;
    if (n == _syncedLength && _controllers.length == n) {
      for (int i = 0; i < n; i++) {
        final String text = widget.session.slots[i].text;
        if (_controllers[i].text != text) {
          _controllers[i].value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
        }
      }
      return;
    }
    _disposeEditors();
    for (int i = 0; i < n; i++) {
      final ComposerSlashSlotState slot = widget.session.slots[i];
      _controllers.add(TextEditingController(text: slot.text));
      final FocusNode node = FocusNode();
      final int index = i;
      node.addListener(() {
        if (node.hasFocus) {
          widget.session.focusSlot(index);
        } else {
          widget.session.unfocusSlot(index);
        }
      });
      _focusNodes.add(node);
    }
    _syncedLength = n;
  }

  void _restoreFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      if (widget.session.focus == ComposerSlashFocus.slot &&
          widget.session.focusedSlotIndex < _focusNodes.length) {
        _focusNodes[widget.session.focusedSlotIndex].requestFocus();
      }
    });
  }

  KeyEventResult _onSlotKey(int index, KeyEvent event) {
    final KeyEventResult autocomplete =
        widget.onKeyEvent?.call(event) ?? KeyEventResult.ignored;
    if (autocomplete == KeyEventResult.handled) {
      return autocomplete;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final LogicalKeyboardKey key = event.logicalKey;
    if (key == LogicalKeyboardKey.tab) {
      if (HardwareKeyboard.instance.isShiftPressed) {
        widget.session.focusPreviousSlot();
      } else {
        widget.session.focusNextSlot();
      }
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index == 0) {
      if (widget.session.backspaceOnEmptyFirstSlot()) {
        return KeyEventResult.handled;
      }
    }
    if ((key == LogicalKeyboardKey.enter ||
            key == LogicalKeyboardKey.numpadEnter) &&
        !HardwareKeyboard.instance.isShiftPressed) {
      if (!widget.session.focusNextSlot()) {
        widget.onSubmit();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final ComposerActionSlashCommand? command = widget.session.command;
    if (command == null) {
      return const SizedBox.shrink();
    }
    final TextStyle commandStyle = widget.style.copyWith(
      fontWeight: FontWeight.w700,
      color: context.colors.textChat,
    );
    return Wrap(
      spacing: 2,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(command.name, style: commandStyle),
        for (int i = 0; i < widget.session.slots.length; i++)
          _SlashSlotField(
            slot: widget.session.slots[i],
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            enabled: widget.enabled,
            style: widget.style,
            focused:
                widget.session.focus == ComposerSlashFocus.slot &&
                widget.session.focusedSlotIndex == i,
            onChanged: (String value) => widget.session.setSlotText(i, value),
            onKeyEvent: (KeyEvent e) => _onSlotKey(i, e),
          ),
        if (widget.session.absentOptional.isNotEmpty)
          GestureDetector(
            onTap: widget.session.focusOptionalHint,
            child: Text(
              FluxerLocalizations.of(context).composerCommandOptionalMore(
                widget.session.absentOptional.length,
              ),
              style: widget.style.copyWith(
                fontSize: (widget.style.fontSize ?? 16) * 0.8125,
                fontWeight: FontWeight.w500,
                color: context.colors.textPrimaryMuted.withValues(alpha: 0.7),
              ),
            ),
          ),
      ],
    );
  }
}

class _SlashSlotField extends StatelessWidget {
  const _SlashSlotField({
    required this.slot,
    required this.controller,
    required this.focusNode,
    required this.enabled,
    required this.style,
    required this.focused,
    required this.onChanged,
    required this.onKeyEvent,
  });

  final ComposerSlashSlotState slot;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final TextStyle style;
  final bool focused;
  final ValueChanged<String> onChanged;
  final KeyEventResult Function(KeyEvent event) onKeyEvent;

  @override
  Widget build(BuildContext context) {
    final Color accent = context.colors.backgroundModifierAccent;
    final Color danger = context.colors.statusDanger;
    Color border = accent;
    if (slot.invalid) {
      border = danger;
    } else if (focused) {
      border = context.colors.textPrimaryMuted.withValues(
        alpha: context.colors.textPrimaryMuted.a * 0.4,
      );
    }
    final Color prefixBg = slot.invalid
        ? Color.lerp(danger, context.colors.backgroundTertiary, 0.85)!
        : Color.lerp(
            context.colors.backgroundTextarea,
            context.colors.backgroundTertiary,
            0.4,
          )!;
    final Color prefixFg = slot.invalid
        ? Color.lerp(danger, context.colors.textPrimary, 0.3)!
        : context.colors.textPrimaryMuted;
    final double fontSize = (style.fontSize ?? 16) * 0.8125;
    final TextStyle slotStyle = style.copyWith(
      fontSize: fontSize,
      color: context.colors.textChat,
      height: 1.375,
    );
    const InputBorder noBorder = InputBorder.none;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Material(
        color: context.colors.backgroundTertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: border),
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: prefixBg,
                  border: Border(right: BorderSide(color: border)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Center(
                    child: Text(
                      slot.option.name,
                      style: slotStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: prefixFg,
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 10, maxWidth: 220),
                child: IntrinsicWidth(
                  child: Focus(
                    onKeyEvent: (FocusNode _, KeyEvent event) =>
                        onKeyEvent(event),
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      enabled: enabled,
                      style: slotStyle,
                      cursorColor: context.colors.textChat,
                      decoration: const InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        filled: false,
                        border: noBorder,
                        enabledBorder: noBorder,
                        focusedBorder: noBorder,
                        disabledBorder: noBorder,
                        errorBorder: noBorder,
                        focusedErrorBorder: noBorder,
                        contentPadding: EdgeInsets.fromLTRB(7, 2, 7, 2),
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
