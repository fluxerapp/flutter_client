import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double kExpressionPickerTabGap = 8;

class ExpressionPickerTabBar extends StatefulWidget {
  const ExpressionPickerTabBar({
    required this.tabs,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final List<ExpressionPickerTab> tabs;
  final ExpressionPickerTab selected;
  final void Function(ExpressionPickerTab tab, {required bool viaKeyboard})
  onSelected;

  @override
  State<ExpressionPickerTabBar> createState() => _ExpressionPickerTabBarState();
}

class _ExpressionPickerTabBarState extends State<ExpressionPickerTabBar> {
  final Map<ExpressionPickerTab, FocusNode> _nodes =
      <ExpressionPickerTab, FocusNode>{};

  FocusNode _nodeFor(ExpressionPickerTab tab) => _nodes.putIfAbsent(
    tab,
    () => FocusNode(debugLabel: 'expression-tab-${tab.name}'),
  );

  @override
  void dispose() {
    for (final FocusNode node in _nodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  KeyEventResult _handleKey(ExpressionPickerTab tab, KeyEvent event) {
    if (event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final LogicalKeyboardKey key = event.logicalKey;
    if (key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter ||
        key == LogicalKeyboardKey.space) {
      widget.onSelected(tab, viaKeyboard: true);
      return KeyEventResult.handled;
    }
    final int count = widget.tabs.length;
    final int index = widget.tabs.indexOf(tab);
    final int forward = Directionality.of(context) == TextDirection.rtl
        ? -1
        : 1;
    final int? next = count == 0
        ? null
        : key == LogicalKeyboardKey.home
        ? 0
        : key == LogicalKeyboardKey.end
        ? count - 1
        : key == LogicalKeyboardKey.arrowRight
        ? (index + forward) % count
        : key == LogicalKeyboardKey.arrowLeft
        ? (index - forward) % count
        : null;
    if (next == null) {
      return KeyEventResult.ignored;
    }
    final ExpressionPickerTab target = widget.tabs[next];
    widget.onSelected(target, viaKeyboard: true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _nodeFor(target).requestFocus();
      }
    });
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FocusTraversalGroup(
      child: Row(
        spacing: kExpressionPickerTabGap,
        children: <Widget>[
          for (final ExpressionPickerTab tab in widget.tabs)
            _ExpressionPickerTabButton(
              label: expressionTabLabel(tab, l10n),
              selected: tab == widget.selected,
              focusNode: _nodeFor(tab),
              onTap: () => widget.onSelected(tab, viaKeyboard: false),
              onKeyEvent: (KeyEvent event) => _handleKey(tab, event),
            ),
        ],
      ),
    );
  }
}

class _ExpressionPickerTabButton extends StatefulWidget {
  const _ExpressionPickerTabButton({
    required this.label,
    required this.selected,
    required this.focusNode,
    required this.onTap,
    required this.onKeyEvent,
  });

  final String label;
  final bool selected;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final KeyEventResult Function(KeyEvent event) onKeyEvent;

  @override
  State<_ExpressionPickerTabButton> createState() =>
      _ExpressionPickerTabButtonState();
}

class _ExpressionPickerTabButtonState
    extends State<_ExpressionPickerTabButton> {
  bool _hovered = false;
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final bool highlighted = !widget.selected && (_hovered || _focused);
    final Color background = widget.selected
        ? colors.backgroundModifierSelected
        : highlighted
        ? colors.backgroundModifierHover
        : Colors.transparent;
    final Color foreground = widget.selected || highlighted
        ? colors.textPrimary
        : colors.textPrimaryMuted;
    return Semantics(
      button: true,
      selected: widget.selected,
      child: Focus(
        focusNode: widget.focusNode,
        skipTraversal: !widget.selected,
        onFocusChange: (bool value) => setState(() => _focused = value),
        onKeyEvent: (FocusNode node, KeyEvent event) =>
            widget.onKeyEvent(event),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: EdgeInsets.symmetric(
                horizontal: layout.s2,
                vertical: layout.s1,
              ),
              decoration: BoxDecoration(
                color: background,
                borderRadius: layout.radiusMd,
              ),
              child: Text(
                widget.label,
                style: context.textStyles.categoryName.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 20 / 14,
                  color: foreground,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
