import 'package:flutter/widgets.dart';

class DeferHorizontalDragWhileCoasting extends InheritedWidget {
  const DeferHorizontalDragWhileCoasting({
    required this.defer,
    required super.child,
    super.key,
  });

  final bool defer;

  static bool of(BuildContext context) {
    final DeferHorizontalDragWhileCoasting? scope = context
        .getInheritedWidgetOfExactType<DeferHorizontalDragWhileCoasting>();
    return scope?.defer ?? false;
  }

  @override
  bool updateShouldNotify(DeferHorizontalDragWhileCoasting oldWidget) {
    return defer != oldWidget.defer;
  }
}
