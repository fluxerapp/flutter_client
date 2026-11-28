part of 'fluxer_desktop_surface.dart';

const Duration _kMenuTypeaheadReset = Duration(milliseconds: 750);

abstract interface class FluxerDesktopMenuEntry {
  FocusNode get menuFocusNode;
  String get menuLabel;
  String? get menuShortcut;
  bool get menuEnabled;
  BuildContext get menuContext;
  FluxerDesktopSubmenuHandle? get menuSubmenu;
  void menuActivate();
}

class FluxerDesktopMenuNavigator extends StatefulWidget {
  const FluxerDesktopMenuNavigator({
    required this.child,
    this.autofocus = true,
    this.focusFirstOnOpen,
    this.onDismiss,
    super.key,
  });

  final Widget child;
  final bool autofocus;
  final bool? focusFirstOnOpen;
  final VoidCallback? onDismiss;

  static final Set<LogicalKeyboardKey> _kNavigationKeys = <LogicalKeyboardKey>{
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
    LogicalKeyboardKey.home,
    LogicalKeyboardKey.end,
    LogicalKeyboardKey.pageUp,
    LogicalKeyboardKey.pageDown,
    LogicalKeyboardKey.enter,
    LogicalKeyboardKey.numpadEnter,
    LogicalKeyboardKey.space,
    LogicalKeyboardKey.escape,
  };

  static FluxerDesktopMenuNavigatorState? maybeOf(BuildContext context) =>
      context
          .getInheritedWidgetOfExactType<_FluxerDesktopMenuNavigatorScope>()
          ?.navigator;

  static bool claimsKeyEvent(KeyEvent event) {
    if (event is KeyUpEvent) {
      return false;
    }
    final FocusNode? focus = FocusManager.instance.primaryFocus;
    final BuildContext? focusContext = focus?.context;
    if (focusContext == null || maybeOf(focusContext) == null) {
      return false;
    }
    if (_isTextEntry(focusContext)) {
      return false;
    }
    if (_kNavigationKeys.contains(event.logicalKey)) {
      return true;
    }
    return _printableCharacter(event) != null;
  }

  static bool _isTextEntry(BuildContext context) =>
      context.findAncestorWidgetOfExactType<EditableText>() != null;

  static String? _printableCharacter(KeyEvent event) {
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    if (keyboard.isControlPressed ||
        keyboard.isMetaPressed ||
        keyboard.isAltPressed) {
      return null;
    }
    final String? character = event.character;
    if (character == null || character.length != 1) {
      return null;
    }
    final int code = character.codeUnitAt(0);
    if (code < 0x20 || code == 0x7f) {
      return null;
    }
    return character;
  }

  @override
  State<FluxerDesktopMenuNavigator> createState() =>
      FluxerDesktopMenuNavigatorState();
}

class FluxerDesktopMenuNavigatorState
    extends State<FluxerDesktopMenuNavigator> {
  final FocusNode _root = FocusNode(
    debugLabel: 'FluxerDesktopMenu',
    skipTraversal: true,
  );
  final List<FluxerDesktopMenuEntry> _entries = <FluxerDesktopMenuEntry>[];
  FluxerDesktopSubmenuHandle? _openSubmenu;
  String _typeahead = '';
  Timer? _typeaheadTimer;

  @override
  void initState() {
    super.initState();
    final bool focusFirstItem = widget.focusFirstOnOpen ?? _readKeyboardMode();
    if (!focusFirstItem && !widget.autofocus) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scheduleMicrotask(() {
        if (!mounted || textEntryFocused) {
          return;
        }
        if (focusFirstItem) {
          focusFirst();
        } else if (!_root.hasFocus) {
          _root.requestFocus();
        }
      });
    });
  }

  bool get textEntryFocused {
    final FocusNode? primary = FocusManager.instance.primaryFocus;
    final BuildContext? primaryContext = primary?.context;
    return primary != null &&
        primary != _root &&
        _root.hasFocus &&
        primaryContext != null &&
        FluxerDesktopMenuNavigator._isTextEntry(primaryContext);
  }

  @override
  void dispose() {
    _typeaheadTimer?.cancel();
    _root.dispose();
    super.dispose();
  }

  bool _readKeyboardMode() {
    try {
      return ProviderScope.containerOf(
        context,
        listen: false,
      ).read(keyboardModeProvider);
    } on Object {
      return false;
    }
  }

  void register(FluxerDesktopMenuEntry entry) {
    if (!_entries.contains(entry)) {
      _entries.add(entry);
    }
  }

  void unregister(FluxerDesktopMenuEntry entry) {
    _entries.remove(entry);
  }

  void focusRoot() {
    if (!_root.hasPrimaryFocus) {
      _root.requestFocus();
    }
  }

  void focusFirst() {
    final List<FluxerDesktopMenuEntry> items = _ordered();
    if (items.isNotEmpty) {
      _focus(items.first);
    } else {
      focusRoot();
    }
  }

  void didHighlight(FluxerDesktopMenuEntry entry, {required bool pointer}) {
    final FluxerDesktopSubmenuHandle? open = _openSubmenu;
    if (pointer || open == null || entry.menuSubmenu == open) {
      return;
    }
    open.close();
  }

  void didOpenSubmenu(FluxerDesktopSubmenuHandle submenu) {
    final FluxerDesktopSubmenuHandle? previous = _openSubmenu;
    if (previous != null && previous != submenu) {
      previous.close();
    }
    _openSubmenu = submenu;
  }

  void didCloseSubmenu(FluxerDesktopSubmenuHandle submenu) {
    if (_openSubmenu == submenu) {
      _openSubmenu = null;
    }
  }

  List<FluxerDesktopMenuEntry> _ordered() {
    final List<(FluxerDesktopMenuEntry, Offset)> placed =
        <(FluxerDesktopMenuEntry, Offset)>[];
    for (final FluxerDesktopMenuEntry entry in _entries) {
      if (!entry.menuEnabled || !entry.menuContext.mounted) {
        continue;
      }
      final RenderObject? box = entry.menuContext.findRenderObject();
      if (box is! RenderBox || !box.attached || !box.hasSize) {
        continue;
      }
      placed.add((entry, box.localToGlobal(Offset.zero)));
    }
    placed.sort((
      (FluxerDesktopMenuEntry, Offset) a,
      (FluxerDesktopMenuEntry, Offset) b,
    ) {
      final int byY = a.$2.dy.compareTo(b.$2.dy);
      return byY != 0 ? byY : a.$2.dx.compareTo(b.$2.dx);
    });
    return <FluxerDesktopMenuEntry>[
      for (final (FluxerDesktopMenuEntry, Offset) item in placed) item.$1,
    ];
  }

  int _indexOfFocused(List<FluxerDesktopMenuEntry> items) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].menuFocusNode.hasFocus) {
        return i;
      }
    }
    return -1;
  }

  void _focus(FluxerDesktopMenuEntry entry) {
    FocusTraversalPolicy.defaultTraversalRequestFocusCallback(
      entry.menuFocusNode,
    );
  }

  bool _owns(FocusNode? focus) {
    if (focus == null) {
      return false;
    }
    if (focus == _root) {
      return true;
    }
    final BuildContext? focusContext = focus.context;
    return focusContext != null &&
        FluxerDesktopMenuNavigator.maybeOf(focusContext) == this;
  }

  void _move(int delta) {
    final List<FluxerDesktopMenuEntry> items = _ordered();
    if (items.isEmpty) {
      return;
    }
    final int current = _indexOfFocused(items);
    final int next = current == -1
        ? (delta > 0 ? 0 : items.length - 1)
        : (current + delta) % items.length;
    _focus(items[next < 0 ? next + items.length : next]);
  }

  void _focusEdge({required bool last}) {
    final List<FluxerDesktopMenuEntry> items = _ordered();
    if (items.isNotEmpty) {
      _focus(last ? items.last : items.first);
    }
  }

  FluxerDesktopMenuEntry? _focusedEntry() {
    for (final FluxerDesktopMenuEntry entry in _entries) {
      if (entry.menuFocusNode.hasFocus) {
        return entry;
      }
    }
    return null;
  }

  void _handleCharacter(String character) {
    final String lower = character.toLowerCase();
    final List<FluxerDesktopMenuEntry> items = _ordered();
    if (_typeahead.isEmpty) {
      for (final FluxerDesktopMenuEntry entry in items) {
        final String? shortcut = entry.menuShortcut?.trim().toLowerCase();
        if (shortcut != null && shortcut == lower) {
          _focus(entry);
          entry.menuActivate();
          return;
        }
      }
      if (character == ' ') {
        return;
      }
    }
    _typeaheadTimer?.cancel();
    _typeahead += lower;
    _typeaheadTimer = Timer(_kMenuTypeaheadReset, () => _typeahead = '');
    if (items.isEmpty) {
      return;
    }
    final bool repeated = _typeahead
        .split('')
        .every((String c) => c == _typeahead[0]);
    final String query = repeated ? _typeahead[0] : _typeahead;
    final int current = _indexOfFocused(items);
    final int start = repeated || _typeahead.length == 1
        ? current + 1
        : (current < 0 ? 0 : current);
    for (int i = 0; i < items.length; i++) {
      final FluxerDesktopMenuEntry entry = items[(start + i) % items.length];
      if (entry.menuLabel.trim().toLowerCase().startsWith(query)) {
        _focus(entry);
        return;
      }
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    if (event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final FocusNode? primary = FocusManager.instance.primaryFocus;
    if (!_owns(primary)) {
      return KeyEventResult.ignored;
    }
    final BuildContext? primaryContext = primary?.context;
    if (primaryContext != null &&
        FluxerDesktopMenuNavigator._isTextEntry(primaryContext)) {
      return KeyEventResult.ignored;
    }
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    if (keyboard.isControlPressed ||
        keyboard.isMetaPressed ||
        keyboard.isAltPressed) {
      return KeyEventResult.ignored;
    }
    final bool rtl = Directionality.maybeOf(context) == TextDirection.rtl;
    final LogicalKeyboardKey key = event.logicalKey;
    final LogicalKeyboardKey openKey = rtl
        ? LogicalKeyboardKey.arrowLeft
        : LogicalKeyboardKey.arrowRight;
    final LogicalKeyboardKey closeKey = rtl
        ? LogicalKeyboardKey.arrowRight
        : LogicalKeyboardKey.arrowLeft;

    if (key == LogicalKeyboardKey.arrowDown) {
      _move(1);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp) {
      _move(-1);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.home || key == LogicalKeyboardKey.pageUp) {
      _focusEdge(last: false);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.end || key == LogicalKeyboardKey.pageDown) {
      _focusEdge(last: true);
      return KeyEventResult.handled;
    }
    if (key == openKey) {
      final FluxerDesktopSubmenuHandle? submenu = _focusedEntry()?.menuSubmenu;
      if (submenu != null) {
        submenu.open(focusFirst: true);
      }
      return KeyEventResult.handled;
    }
    if (key == closeKey) {
      widget.onDismiss?.call();
      return KeyEventResult.handled;
    }
    final String? character = FluxerDesktopMenuNavigator._printableCharacter(
      event,
    );
    if (character != null) {
      _handleCharacter(character);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return _FluxerDesktopMenuNavigatorScope(
      navigator: this,
      child: Focus(
        focusNode: _root,
        includeSemantics: false,
        onKeyEvent: _handleKeyEvent,
        child: widget.child,
      ),
    );
  }
}

class _FluxerDesktopMenuNavigatorScope extends InheritedWidget {
  const _FluxerDesktopMenuNavigatorScope({
    required this.navigator,
    required super.child,
  });

  final FluxerDesktopMenuNavigatorState navigator;

  @override
  bool updateShouldNotify(_FluxerDesktopMenuNavigatorScope oldWidget) =>
      navigator != oldWidget.navigator;
}

mixin _FluxerDesktopMenuEntryState<T extends StatefulWidget> on State<T>
    implements FluxerDesktopMenuEntry {
  FluxerDesktopMenuNavigatorState? _navigator;
  FocusNode? _listenedNode;
  bool _pointerFocus = false;
  bool _hoverWithoutFocus = false;

  bool get tracksMenuFocus => _navigator != null;

  @override
  BuildContext get menuContext => context;

  @override
  String? get menuShortcut => null;

  @override
  FluxerDesktopSubmenuHandle? get menuSubmenu => null;

  @override
  void menuActivate() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final FluxerDesktopMenuNavigatorState? navigator =
        FluxerDesktopMenuNavigator.maybeOf(context);
    if (navigator != _navigator) {
      _navigator?.unregister(this);
      _navigator = navigator?..register(this);
    }
    _listenToFocusNode();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    _listenToFocusNode();
  }

  @override
  void dispose() {
    _navigator?.unregister(this);
    _listenedNode?.removeListener(_handleMenuFocusChange);
    super.dispose();
  }

  void _listenToFocusNode() {
    final FocusNode node = menuFocusNode;
    if (node == _listenedNode) {
      return;
    }
    _listenedNode?.removeListener(_handleMenuFocusChange);
    _listenedNode = node..addListener(_handleMenuFocusChange);
  }

  void _handleMenuFocusChange() {
    if (menuFocusNode.hasFocus) {
      _navigator?.didHighlight(this, pointer: _pointerFocus);
    }
    _pointerFocus = false;
  }

  void handleMenuHover({required bool hovered}) {
    final FluxerDesktopMenuNavigatorState? navigator = _navigator;
    if (navigator == null) {
      return;
    }
    final FocusNode node = menuFocusNode;
    if (!hovered) {
      if (_hoverWithoutFocus) {
        setState(() => _hoverWithoutFocus = false);
      }
      if (node.hasFocus) {
        navigator.focusRoot();
      }
      return;
    }
    if (navigator.textEntryFocused) {
      if (menuEnabled) {
        setState(() => _hoverWithoutFocus = true);
      }
      return;
    }
    if (!menuEnabled) {
      navigator.focusRoot();
      return;
    }
    if (!node.hasFocus) {
      _pointerFocus = true;
      node.requestFocus();
    }
  }
}
