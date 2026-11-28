import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/roving_focus/fluxer_roving_focus_item.dart';
import 'package:fluxer_app/features/ui/roving_focus/fluxer_roving_focus_policy.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerRovingFocusList extends StatefulWidget {
  const FluxerRovingFocusList({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final bool enabled;

  static final Set<LogicalKeyboardKey> _kKeys = <LogicalKeyboardKey>{
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.home,
    LogicalKeyboardKey.end,
  };

  static bool claimsKeyEvent(KeyEvent event) {
    if (!_kKeys.contains(event.logicalKey)) {
      return false;
    }
    final BuildContext? focusContext =
        FocusManager.instance.primaryFocus?.context;
    if (focusContext == null) {
      return false;
    }
    final _FluxerRovingFocusListState? list = focusContext
        .findAncestorStateOfType<_FluxerRovingFocusListState>();
    return list != null && list._targetFor(event) != null;
  }

  @override
  State<FluxerRovingFocusList> createState() => _FluxerRovingFocusListState();
}

class _FluxerRovingFocusListState extends State<FluxerRovingFocusList> {
  static final ReadingOrderTraversalPolicy _kReadingOrder =
      ReadingOrderTraversalPolicy();

  final FocusNode _node = FocusNode(
    debugLabel: 'FluxerRovingFocusList',
    canRequestFocus: false,
    skipTraversal: true,
  );
  late final FluxerRovingFocusPolicy _policy = FluxerRovingFocusPolicy(
    skippedNodes: _skippedNodes,
  );
  FocusNode? _lastFocused;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.addListener(_handlePrimaryFocusChange);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_handlePrimaryFocusChange);
    _node.dispose();
    super.dispose();
  }

  void _handlePrimaryFocusChange() {
    if (!_node.hasFocus) {
      return;
    }
    final FocusNode? item = _itemContaining(
      FocusManager.instance.primaryFocus,
      _items(),
    );
    if (item != null) {
      _lastFocused = item;
    }
  }

  List<FocusNode> _items() {
    final Iterable<FocusNode> sorted = _kReadingOrder.sortDescendants(
      _node.traversalDescendants,
      _node,
    );
    final Map<Element, FocusNode> byItem = <Element, FocusNode>{};
    final Set<Element> foreign = <Element>{};
    for (final FocusNode node in sorted) {
      final BuildContext? nodeContext = node.context;
      if (nodeContext == null) {
        continue;
      }
      final Element? item = FluxerRovingFocusItem.itemElementOf(nodeContext);
      if (item == null || foreign.contains(item)) {
        continue;
      }
      final FocusNode? existing = byItem[item];
      if (existing == null) {
        if (item.findAncestorStateOfType<_FluxerRovingFocusListState>() !=
            this) {
          foreign.add(item);
          continue;
        }
        byItem[item] = node;
      } else if (node.ancestors.length < existing.ancestors.length) {
        byItem[item] = node;
      }
    }
    final Set<FocusNode> chosen = byItem.values.toSet();
    return sorted.where(chosen.contains).toList();
  }

  FocusNode? _itemContaining(FocusNode? focus, List<FocusNode> items) {
    if (focus == null) {
      return null;
    }
    for (final FocusNode item in items) {
      if (item == focus || focus.ancestors.contains(item)) {
        return item;
      }
    }
    return null;
  }

  FocusNode? _activeItem(List<FocusNode> items) {
    if (items.isEmpty) {
      return null;
    }
    final FocusNode? focused = _itemContaining(
      FocusManager.instance.primaryFocus,
      items,
    );
    if (focused != null) {
      return focused;
    }
    final FocusNode? last = _lastFocused;
    if (last != null && items.contains(last)) {
      return last;
    }
    return items.first;
  }

  Set<FocusNode> _skippedNodes() {
    final List<FocusNode> items = _items();
    final FocusNode? active = _activeItem(items);
    return <FocusNode>{
      for (final FocusNode item in items)
        if (item != active) item,
    };
  }

  bool _isTextEntryFocused() {
    final BuildContext? focusContext =
        FocusManager.instance.primaryFocus?.context;
    return focusContext?.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  bool _hasModifier() {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    return keyboard.isAltPressed ||
        keyboard.isControlPressed ||
        keyboard.isMetaPressed ||
        keyboard.isShiftPressed;
  }

  FocusNode? _targetFor(KeyEvent event) {
    if (!widget.enabled ||
        event is KeyUpEvent ||
        !FluxerRovingFocusList._kKeys.contains(event.logicalKey) ||
        _hasModifier() ||
        _isTextEntryFocused()) {
      return null;
    }
    final List<FocusNode> items = _items();
    if (items.isEmpty) {
      return null;
    }
    final FocusNode? anchor =
        _itemContaining(FocusManager.instance.primaryFocus, items) ??
        _lastFocused;
    final int current = anchor == null ? -1 : items.indexOf(anchor);
    final LogicalKeyboardKey key = event.logicalKey;
    final int next;
    if (key == LogicalKeyboardKey.home) {
      next = 0;
    } else if (key == LogicalKeyboardKey.end) {
      next = items.length - 1;
    } else if (current == -1) {
      next = key == LogicalKeyboardKey.arrowDown ? 0 : items.length - 1;
    } else {
      next = key == LogicalKeyboardKey.arrowDown ? current + 1 : current - 1;
    }
    if (next == current) {
      return null;
    }
    return items[(next + items.length) % items.length];
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    final FocusNode? target = _targetFor(event);
    if (target == null) {
      return KeyEventResult.ignored;
    }
    _lastFocused = target;
    FocusTraversalPolicy.defaultTraversalRequestFocusCallback(target);
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: _policy,
      child: Focus(
        focusNode: _node,
        includeSemantics: false,
        onKeyEvent: _handleKeyEvent,
        child: widget.child,
      ),
    );
  }
}
