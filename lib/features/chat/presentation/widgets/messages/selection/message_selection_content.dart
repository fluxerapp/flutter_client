import 'package:flutter/rendering.dart' show SelectionRegistrar;
import 'package:fluxer_app/features/chat/presentation/widgets/messages/selection/message_list_selection_area.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageSelectionContent extends StatefulWidget {
  const MessageSelectionContent({
    required this.registrar,
    required this.child,
    super.key,
  });

  final SelectionRegistrar registrar;
  final Widget child;

  @override
  State<MessageSelectionContent> createState() =>
      _MessageSelectionContentState();
}

class _MessageSelectionContentState extends State<MessageSelectionContent>
    implements MessageSelectionContentEntry {
  final StaticSelectionContainerDelegate _delegate =
      StaticSelectionContainerDelegate();
  MessageListSelectionAreaState? _area;

  @override
  String get selectedText => _delegate.getSelectedContent()?.plainText ?? '';

  @override
  double? get globalTop {
    if (!mounted) {
      return null;
    }
    final RenderObject? box = context.findRenderObject();
    if (box is! RenderBox || !box.attached || !box.hasSize) {
      return null;
    }
    return box.localToGlobal(Offset.zero).dy;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MessageListSelectionAreaState? area =
        MessageListSelectionArea.maybeOf(context);
    if (area != _area) {
      _area?.unregister(this);
      _area = area?..register(this);
    }
  }

  @override
  void dispose() {
    _area?.unregister(this);
    _delegate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionRegistrarScope(
      registrar: widget.registrar,
      child: SelectionContainer(
        delegate: _delegate,
        child: MouseRegion(
          cursor: SystemMouseCursors.text,
          child: widget.child,
        ),
      ),
    );
  }
}
