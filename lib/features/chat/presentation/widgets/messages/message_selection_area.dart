import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart' show SelectedContent;
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/markdown/selection_text_registry.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

typedef MessageSecondaryTapCallback =
    void Function(TapUpDetails details, String selectedText);

class MessageSelectionArea extends StatefulWidget {
  const MessageSelectionArea({
    required this.child,
    required this.contextMenuBuilder,
    this.onSecondaryTapUp,
    super.key,
  });

  final Widget child;
  final FluxerSelectionContextMenuBuilder contextMenuBuilder;
  final MessageSecondaryTapCallback? onSecondaryTapUp;

  @override
  State<MessageSelectionArea> createState() => _MessageSelectionAreaState();
}

class _MessageSelectionAreaState extends State<MessageSelectionArea> {
  final GlobalKey<SelectionAreaState> _areaKey =
      GlobalKey<SelectionAreaState>();
  String _selectedText = '';
  PointerDeviceKind _lastPointerKind = PointerDeviceKind.mouse;

  bool get _lastPointerWasTouch =>
      _lastPointerKind == PointerDeviceKind.touch ||
      _lastPointerKind == PointerDeviceKind.stylus ||
      _lastPointerKind == PointerDeviceKind.invertedStylus;

  void _handleSelectionChanged(SelectedContent? content) {
    _selectedText = content?.plainText ?? '';
    recordSelectableRegionText(
      _areaKey.currentState?.selectableRegion,
      _selectedText,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MessageSecondaryTapCallback? onSecondaryTapUp =
        widget.onSecondaryTapUp;
    Widget child = MouseRegion(
      cursor: SystemMouseCursors.text,
      child: widget.child,
    );
    if (onSecondaryTapUp != null) {
      child = RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          TapGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                () => TapGestureRecognizer(debugOwner: this),
                (TapGestureRecognizer instance) {
                  instance.onSecondaryTapUp = (TapUpDetails details) =>
                      onSecondaryTapUp(details, _selectedText.trim());
                },
              ),
        },
        child: child,
      );
    }
    return SelectionArea(
      key: _areaKey,
      contextMenuBuilder:
          (BuildContext menuContext, SelectableRegionState state) =>
              onSecondaryTapUp == null || _lastPointerWasTouch
              ? widget.contextMenuBuilder(menuContext, state)
              : const SizedBox.shrink(),
      onSelectionChanged: _handleSelectionChanged,
      child: Listener(
        onPointerDown: (PointerDownEvent event) =>
            _lastPointerKind = event.kind,
        child: child,
      ),
    );
  }
}
