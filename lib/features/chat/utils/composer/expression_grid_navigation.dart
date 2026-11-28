import 'package:flutter/services.dart';
import 'package:fluxer_app/material_ui.dart';

typedef ExpressionGridKeyHandler = KeyEventResult Function(KeyEvent event);

class ExpressionGridKeyboard {
  final List<ExpressionGridKeyHandler> _handlers = <ExpressionGridKeyHandler>[];

  void attach(ExpressionGridKeyHandler handler) {
    _handlers
      ..remove(handler)
      ..add(handler);
  }

  void detach(ExpressionGridKeyHandler handler) => _handlers.remove(handler);

  KeyEventResult handle(KeyEvent event) =>
      _handlers.isEmpty ? KeyEventResult.ignored : _handlers.last(event);
}

@immutable
class ExpressionGridPosition {
  const ExpressionGridPosition(this.row, this.column);

  final int row;
  final int column;

  @override
  bool operator ==(Object other) =>
      other is ExpressionGridPosition &&
      other.row == row &&
      other.column == column;

  @override
  int get hashCode => Object.hash(row, column);
}

sealed class ExpressionGridKeyResult {
  const ExpressionGridKeyResult();
}

final class ExpressionGridMove extends ExpressionGridKeyResult {
  const ExpressionGridMove(this.position);

  final ExpressionGridPosition position;
}

final class ExpressionGridPick extends ExpressionGridKeyResult {
  const ExpressionGridPick(this.position);

  final ExpressionGridPosition position;
}

ExpressionGridKeyResult? resolveExpressionGridKey({
  required KeyEvent event,
  required List<int> rowLengths,
  required ExpressionGridPosition? current,
}) {
  if (event is KeyUpEvent || rowLengths.isEmpty) {
    return null;
  }
  final LogicalKeyboardKey key = event.logicalKey;
  final bool hasSelection = current != null;
  int row = current?.row ?? -1;
  int column = current?.column ?? -1;
  int lengthOf(int index) => rowLengths[index.clamp(0, rowLengths.length - 1)];
  if (key == LogicalKeyboardKey.arrowDown) {
    if (row == -1) {
      row = 0;
      column = 0;
    } else {
      row = (row + 1).clamp(0, rowLengths.length - 1);
      if (column >= lengthOf(row)) {
        column = lengthOf(row) - 1;
      }
    }
  } else if (key == LogicalKeyboardKey.arrowUp) {
    row -= 1;
    if (row < 0) {
      row = 0;
      column = 0;
    } else if (column >= lengthOf(row)) {
      column = lengthOf(row) - 1;
    }
  } else if (key == LogicalKeyboardKey.arrowLeft) {
    if (!hasSelection) {
      return null;
    }
    column -= 1;
    if (column < 0) {
      row -= 1;
      if (row >= 0) {
        column = lengthOf(row) - 1;
      } else {
        row = 0;
        column = 0;
      }
    }
  } else if (key == LogicalKeyboardKey.arrowRight) {
    if (!hasSelection) {
      return null;
    }
    column += 1;
    if (column >= lengthOf(row)) {
      row += 1;
      column = 0;
      if (row >= rowLengths.length) {
        row = rowLengths.length - 1;
        column = lengthOf(row) - 1;
      }
    }
  } else if (key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter) {
    if (event is KeyRepeatEvent) {
      return null;
    }
    return ExpressionGridPick(
      ExpressionGridPosition(row < 0 ? 0 : row, column < 0 ? 0 : column),
    );
  } else {
    return null;
  }
  return ExpressionGridMove(ExpressionGridPosition(row, column));
}

void ensureExpressionGridRowVisible(
  ScrollController controller, {
  required double top,
  required double height,
}) {
  if (!controller.hasClients) {
    return;
  }
  final ScrollPosition position = controller.position;
  final double viewport = position.viewportDimension;
  final double offset = position.pixels;
  double? target;
  if (top < offset) {
    target = top;
  } else if (top + height > offset + viewport) {
    target = top + height - viewport;
  }
  if (target == null) {
    return;
  }
  controller.jumpTo(
    target.clamp(position.minScrollExtent, position.maxScrollExtent),
  );
}

class ExpressionGridRow<T> {
  const ExpressionGridRow({
    required this.top,
    required this.height,
    required this.items,
  });

  final double top;
  final double height;
  final List<T> items;
}

List<ExpressionGridRow<T>> chunkExpressionGridRows<T>(
  List<T> items, {
  required int columns,
  required double top,
  required double rowHeight,
  double rowGap = 0,
}) {
  final int step = columns < 1 ? 1 : columns;
  return <ExpressionGridRow<T>>[
    for (var start = 0; start < items.length; start += step)
      ExpressionGridRow<T>(
        top: top + (start ~/ step) * (rowHeight + rowGap),
        height: rowHeight,
        items: items.sublist(
          start,
          start + step > items.length ? items.length : start + step,
        ),
      ),
  ];
}

class ExpressionGridNavigator<T> {
  List<ExpressionGridRow<T>> rows = const [];
  ExpressionGridPosition? position;

  void reset() => position = null;

  T? _itemAt(ExpressionGridPosition? at) {
    if (at == null ||
        at.row >= rows.length ||
        at.column >= rows[at.row].items.length) {
      return null;
    }
    return rows[at.row].items[at.column];
  }

  KeyEventResult handleKey(
    KeyEvent event, {
    required ScrollController scrollController,
    required ValueChanged<T> onHighlight,
    required ValueChanged<T> onPick,
  }) {
    final ExpressionGridKeyResult? result = resolveExpressionGridKey(
      event: event,
      rowLengths: <int>[
        for (final ExpressionGridRow<T> row in rows) row.items.length,
      ],
      current: _itemAt(position) == null ? null : position,
    );
    switch (result) {
      case null:
        return KeyEventResult.ignored;
      case ExpressionGridMove(position: final ExpressionGridPosition next):
        final T? item = _itemAt(next);
        if (item == null) {
          return KeyEventResult.ignored;
        }
        position = next;
        final ExpressionGridRow<T> row = rows[next.row];
        onHighlight(item);
        ensureExpressionGridRowVisible(
          scrollController,
          top: row.top,
          height: row.height,
        );
        return KeyEventResult.handled;
      case ExpressionGridPick(position: final ExpressionGridPosition target):
        final T? item = _itemAt(target);
        if (item == null) {
          return KeyEventResult.ignored;
        }
        onPick(item);
        return KeyEventResult.handled;
    }
  }
}

mixin ExpressionGridKeyboardBinding<W extends StatefulWidget> on State<W> {
  ExpressionGridKeyboard? gridKeyboardOf(W widget);

  KeyEventResult handleGridKey(KeyEvent event);

  @override
  void initState() {
    super.initState();
    gridKeyboardOf(widget)?.attach(handleGridKey);
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    super.didUpdateWidget(oldWidget);
    final ExpressionGridKeyboard? previous = gridKeyboardOf(oldWidget);
    final ExpressionGridKeyboard? next = gridKeyboardOf(widget);
    if (previous != next) {
      previous?.detach(handleGridKey);
      next?.attach(handleGridKey);
    }
  }

  @override
  void dispose() {
    gridKeyboardOf(widget)?.detach(handleGridKey);
    super.dispose();
  }
}
