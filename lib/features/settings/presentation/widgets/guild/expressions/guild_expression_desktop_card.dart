import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_desktop_hover_card.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildExpressionDesktopCard extends StatelessWidget {
  const GuildExpressionDesktopCard({
    required this.child,
    required this.deleteLabel,
    this.onDelete,
    super.key,
  });

  final Widget child;
  final String deleteLabel;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final VoidCallback? onDelete = this.onDelete;
    return GuildDesktopHoverCard(
      overhang: 12,
      cornerButton: onDelete == null
          ? null
          : GuildDesktopRoundActionButton(
              label: deleteLabel,
              onPressed: onDelete,
            ),
      builder: (BuildContext context, {required bool hovered}) =>
          AnimatedContainer(
            duration: context.motion.normal,
            curve: Curves.ease,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.backgroundSecondary,
              borderRadius: context.layout.radiusMd,
              border: Border.all(
                color: hovered
                    ? colors.backgroundModifierAccent
                    : colors.backgroundHeaderSecondary,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: hovered
                      ? const Color(0x66000000)
                      : const Color(0x00000000),
                  offset: const Offset(0, 10),
                  blurRadius: 25,
                  spreadRadius: -18,
                ),
              ],
            ),
            child: child,
          ),
    );
  }
}

class GuildExpressionInlineNameEdit extends StatefulWidget {
  const GuildExpressionInlineNameEdit({
    required this.value,
    required this.style,
    required this.onSave,
    this.affix = ':',
    this.maxLength = 32,
    super.key,
  });

  final String value;
  final TextStyle style;
  final Future<void> Function(String value) onSave;
  final String affix;
  final int maxLength;

  @override
  State<GuildExpressionInlineNameEdit> createState() =>
      _GuildExpressionInlineNameEditState();
}

class _GuildExpressionInlineNameEditState
    extends State<GuildExpressionInlineNameEdit> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );
  final FocusNode _focusNode = FocusNode();
  bool _editing = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant GuildExpressionInlineNameEdit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_editing && oldWidget.value != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus && _editing && !_saving) {
      unawaited(_commit());
    }
  }

  void _startEditing() {
    _controller
      ..text = widget.value
      ..selection = TextSelection(
        baseOffset: 0,
        extentOffset: widget.value.length,
      );
    setState(() => _editing = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  void _cancel() {
    _controller.text = widget.value;
    setState(() => _editing = false);
  }

  Future<void> _commit() async {
    final String next = _controller.text.trim();
    if (next.isEmpty || next == widget.value) {
      _cancel();
      return;
    }
    setState(() => _saving = true);
    try {
      await widget.onSave(next);
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
          _editing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Widget content = _editing
        ? Row(
            children: <Widget>[
              Text(widget.affix, style: widget.style),
              Flexible(
                child: CallbackShortcuts(
                  bindings: <ShortcutActivator, VoidCallback>{
                    const SingleActivator(LogicalKeyboardKey.escape): _cancel,
                  },
                  child: EditableText(
                    controller: _controller,
                    focusNode: _focusNode,
                    style: widget.style,
                    cursorColor: colors.textPrimary,
                    backgroundCursorColor: colors.textTertiary,
                    selectionColor: colors.brandPrimary.withValues(alpha: 0.3),
                    readOnly: _saving,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(widget.maxLength),
                    ],
                    onSubmitted: (_) => unawaited(_commit()),
                  ),
                ),
              ),
              Text(widget.affix, style: widget.style),
            ],
          )
        : Text(
            '${widget.affix}${widget.value}${widget.affix}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.style,
          );
    return FluxerTappable(
      onTap: _editing ? null : _startEditing,
      builder: (BuildContext context, Set<WidgetState> states) => MouseRegion(
        cursor: _editing ? SystemMouseCursors.text : MouseCursor.defer,
        child: AnimatedContainer(
          duration: context.motion.fast,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(
            color: _editing
                ? colors.backgroundTertiary
                : states.contains(WidgetState.hovered)
                ? colors.backgroundSecondary
                : Colors.transparent,
            borderRadius: context.layout.radiusSm,
          ),
          child: content,
        ),
      ),
    );
  }
}
