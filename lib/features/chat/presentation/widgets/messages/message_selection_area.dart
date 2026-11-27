import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart' show SelectedContent;
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class MessageSelectionArea extends StatefulWidget {
  const MessageSelectionArea({
    required this.child,
    required this.contextMenuBuilder,
    this.onSecondaryTapUpWithoutSelection,
    super.key,
  });

  final Widget child;
  final FluxerSelectionContextMenuBuilder contextMenuBuilder;
  final GestureTapUpCallback? onSecondaryTapUpWithoutSelection;

  @override
  State<MessageSelectionArea> createState() => _MessageSelectionAreaState();
}

class _MessageSelectionAreaState extends State<MessageSelectionArea> {
  bool _hasSelection = false;

  void _handleSelectionChanged(SelectedContent? content) {
    _hasSelection = content != null && content.plainText.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final GestureTapUpCallback? onSecondaryTapUp =
        widget.onSecondaryTapUpWithoutSelection;
    Widget child = MouseRegion(
      cursor: SystemMouseCursors.text,
      child: widget.child,
    );
    if (onSecondaryTapUp != null) {
      child = RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          _UnselectedSecondaryTapRecognizer:
              GestureRecognizerFactoryWithHandlers<
                _UnselectedSecondaryTapRecognizer
              >(
                () => _UnselectedSecondaryTapRecognizer(
                  hasSelection: () => _hasSelection,
                  debugOwner: this,
                ),
                (_UnselectedSecondaryTapRecognizer instance) {
                  instance.onSecondaryTapUp = onSecondaryTapUp;
                },
              ),
        },
        child: child,
      );
    }
    return SelectionArea(
      contextMenuBuilder: widget.contextMenuBuilder,
      onSelectionChanged: _handleSelectionChanged,
      child: child,
    );
  }
}

class _UnselectedSecondaryTapRecognizer extends TapGestureRecognizer {
  _UnselectedSecondaryTapRecognizer({
    required this.hasSelection,
    super.debugOwner,
  });

  final bool Function() hasSelection;

  @override
  bool isPointerAllowed(PointerDownEvent event) {
    if (hasSelection()) {
      return false;
    }
    return super.isPointerAllowed(event);
  }
}
