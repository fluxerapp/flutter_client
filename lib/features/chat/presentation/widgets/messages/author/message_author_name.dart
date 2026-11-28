import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class MessageAuthorName extends StatefulWidget {
  const MessageAuthorName({
    required this.name,
    required this.style,
    this.underlineOnHover = true,
    super.key,
  });

  final String name;
  final TextStyle style;
  final bool underlineOnHover;

  @override
  State<MessageAuthorName> createState() => _MessageAuthorNameState();
}

class _MessageAuthorNameState extends State<MessageAuthorName> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered != value) {
      setState(() => _hovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool underline =
        widget.underlineOnHover && _hovered && usesDesktopPointerUi(context);
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: Text(
        widget.name,
        style: underline
            ? widget.style.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: widget.style.color,
              )
            : widget.style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
