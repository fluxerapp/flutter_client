import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

typedef FluxerTappableBuilder =
    Widget Function(BuildContext context, Set<WidgetState> states);

class FluxerTappable extends StatefulWidget {
  const FluxerTappable({
    required this.builder,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.selected = false,
    this.toggled,
    this.checked,
    this.expanded,
    this.header = false,
    this.link = false,
    this.linkUrl,
    this.container = false,
    this.button,
    this.minSize,
    this.semanticLabel,
    this.excludeChildSemantics = false,
    this.hitTestBehavior = HitTestBehavior.opaque,
    super.key,
  });

  final FluxerTappableBuilder builder;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;
  final bool selected;
  final bool? toggled;
  final bool? checked;
  final bool? expanded;
  final bool header;
  final bool link;
  final Uri? linkUrl;
  final bool container;
  final bool? button;
  final Size? minSize;
  final String? semanticLabel;
  final bool excludeChildSemantics;
  final HitTestBehavior hitTestBehavior;

  @override
  State<FluxerTappable> createState() => _FluxerTappableState();
}

class _FluxerTappableState extends State<FluxerTappable> {
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  Set<WidgetState> get _states => {
    if (!widget.enabled) WidgetState.disabled,
    if (widget.selected) WidgetState.selected,
    if (_isHovered && widget.enabled) WidgetState.hovered,
    if (_isPressed && widget.enabled) WidgetState.pressed,
    if (_isFocused && widget.enabled) WidgetState.focused,
  };

  void _handleTapDown(TapDownDetails _) {
    if (!widget.enabled) {
      return;
    }
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final motion = context.motion;
    final content = widget.builder(context, _states);
    final constrainedContent = widget.minSize == null
        ? content
        : ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: widget.minSize!.width,
              minHeight: widget.minSize!.height,
            ),
            child: content,
          );

    final isInteractive = widget.onTap != null || widget.onLongPress != null;
    final semanticsChild = widget.excludeChildSemantics
        ? ExcludeSemantics(child: constrainedContent)
        : constrainedContent;

    return Semantics(
      label: widget.semanticLabel,
      button: widget.button ?? (isInteractive && !widget.link),
      link: widget.link,
      linkUrl: widget.linkUrl,
      enabled: widget.enabled,
      focusable: widget.enabled && isInteractive,
      selected: widget.selected,
      toggled: widget.toggled,
      checked: widget.checked,
      expanded: widget.expanded,
      header: widget.header,
      container: widget.container,
      child: MouseRegion(
        cursor: widget.enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) {
          setState(() {
            _isHovered = false;
            _isPressed = false;
          });
        },
        child: Focus(
          includeSemantics: false,
          onFocusChange: (focused) => setState(() => _isFocused = focused),
          child: GestureDetector(
            behavior: widget.hitTestBehavior,
            onTap: widget.enabled ? widget.onTap : null,
            onLongPress: widget.enabled ? widget.onLongPress : null,
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: AnimatedOpacity(
              opacity: _isPressed ? 0.7 : (widget.enabled ? 1.0 : 0.5),
              duration: _isPressed
                  ? Duration(milliseconds: motion.fast.inMilliseconds ~/ 2)
                  : motion.fast,
              curve: motion.curve,
              child: semanticsChild,
            ),
          ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerTappable')
Widget fluxerTappablePreview() {
  return FluxerTappable(
    onTap: () {},
    builder: (context, states) {
      final colors = context.colors;
      final hovered = states.contains(WidgetState.hovered);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: hovered
              ? colors.backgroundModifierHover
              : colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('Tappable row', style: context.textStyles.bodyMedium),
      );
    },
  );
}
