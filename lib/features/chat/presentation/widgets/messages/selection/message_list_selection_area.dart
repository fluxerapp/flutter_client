import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart' show SelectionRegistrar;
import 'package:flutter/services.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration _kSnapshotLifetime = Duration(seconds: 2);

abstract interface class MessageSelectionContentEntry {
  String get selectedText;
  double? get globalTop;
}

class MessageListSelectionArea extends StatefulWidget {
  const MessageListSelectionArea({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final bool enabled;

  static MessageListSelectionAreaState? maybeOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<_MessageListSelectionScope>()
      ?.state;

  static SelectionRegistrar? registrarOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_MessageListRegistrarScope>()
      ?.registrar;

  @override
  State<MessageListSelectionArea> createState() =>
      MessageListSelectionAreaState();
}

class MessageListSelectionAreaState extends State<MessageListSelectionArea> {
  final GlobalKey _contentKey = GlobalKey(debugLabel: 'MessageListContent');
  late final FocusNode _focusNode = FocusNode(
    debugLabel: 'MessageListSelection',
    onKeyEvent: _handleKeyEvent,
  );
  final Set<MessageSelectionContentEntry> _entries =
      <MessageSelectionContentEntry>{};
  String? _secondarySnapshot;
  DateTime? _secondarySnapshotAt;

  void register(MessageSelectionContentEntry entry) => _entries.add(entry);

  void unregister(MessageSelectionContentEntry entry) => _entries.remove(entry);

  String selectedText() {
    final List<(double, String)> parts = <(double, String)>[];
    for (final MessageSelectionContentEntry entry in _entries) {
      final String text = entry.selectedText;
      if (text.trim().isEmpty) {
        continue;
      }
      parts.add((entry.globalTop ?? 0, text));
    }
    parts.sort(
      ((double, String) a, (double, String) b) => a.$1.compareTo(b.$1),
    );
    return parts.map(((double, String) part) => part.$2).join('\n').trim();
  }

  String takeSelectionSnapshot() {
    final String? snapshot = _secondarySnapshot;
    final DateTime? takenAt = _secondarySnapshotAt;
    _secondarySnapshot = null;
    _secondarySnapshotAt = null;
    final bool fresh =
        takenAt != null &&
        DateTime.now().difference(takenAt) < _kSnapshotLifetime;
    return (fresh ? snapshot : null) ?? selectedText();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent || event.logicalKey != LogicalKeyboardKey.keyC) {
      return KeyEventResult.ignored;
    }
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    final bool isMac = defaultTargetPlatform == TargetPlatform.macOS;
    final bool modifier = isMac
        ? keyboard.isMetaPressed && !keyboard.isControlPressed
        : keyboard.isControlPressed && !keyboard.isMetaPressed;
    if (!modifier || keyboard.isAltPressed || keyboard.isShiftPressed) {
      return KeyEventResult.ignored;
    }
    final String text = selectedText();
    if (text.isEmpty) {
      return KeyEventResult.ignored;
    }
    unawaited(Clipboard.setData(ClipboardData(text: text)));
    return KeyEventResult.handled;
  }

  void _handlePointerDown(PointerDownEvent event) {
    if ((event.buttons & kSecondaryMouseButton) == 0) {
      return;
    }
    final String text = selectedText();
    _secondarySnapshot = text.isEmpty ? null : text;
    _secondarySnapshotAt = DateTime.now();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = SelectionContainer.disabled(
      child: KeyedSubtree(key: _contentKey, child: widget.child),
    );
    return _MessageListSelectionScope(
      state: this,
      child: widget.enabled
          ? Listener(
              onPointerDown: _handlePointerDown,
              child: SelectionArea(
                focusNode: _focusNode,
                contextMenuBuilder: (BuildContext _, SelectableRegionState _) =>
                    const SizedBox.shrink(),
                child: _MessageListRegistrarCapture(child: content),
              ),
            )
          : content,
    );
  }
}

class _MessageListRegistrarCapture extends StatelessWidget {
  const _MessageListRegistrarCapture({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _MessageListRegistrarScope(
      registrar: SelectionContainer.maybeOf(context),
      child: child,
    );
  }
}

class _MessageListRegistrarScope extends InheritedWidget {
  const _MessageListRegistrarScope({
    required this.registrar,
    required super.child,
  });

  final SelectionRegistrar? registrar;

  @override
  bool updateShouldNotify(_MessageListRegistrarScope oldWidget) =>
      registrar != oldWidget.registrar;
}

class _MessageListSelectionScope extends InheritedWidget {
  const _MessageListSelectionScope({required this.state, required super.child});

  final MessageListSelectionAreaState state;

  @override
  bool updateShouldNotify(_MessageListSelectionScope oldWidget) =>
      state != oldWidget.state;
}
