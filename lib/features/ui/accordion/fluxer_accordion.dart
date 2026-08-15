import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerAccordion extends StatefulWidget {
  const FluxerAccordion({
    required this.title,
    required this.child,
    this.description,
    this.initiallyExpanded = false,
    super.key,
  });

  final String title;
  final String? description;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<FluxerAccordion> createState() => _FluxerAccordionState();
}

class _FluxerAccordionState extends State<FluxerAccordion>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late final AnimationController _controller;
  late final Animation<double> _sizeFactor;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: FluxerMotionTheme.slowDuration,
      vsync: this,
      value: _isExpanded ? 1.0 : 0.0,
    );
    _sizeFactor = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final motion = context.motion;
    _controller.duration = motion.slow;
    (_sizeFactor as CurvedAnimation).curve = motion.emphasizedCurve;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FluxerTappable(
          onTap: _toggle,
          semanticLabel: widget.title,
          expanded: _isExpanded,
          excludeChildSemantics: true,
          builder: (context, states) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: textStyles.label.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0.0,
                      duration: context.motion.slow,
                      curve: context.motion.emphasizedCurve,
                      child: PhosphorIcon(
                        PhosphorIconsBold.caretDown,
                        size: 16,
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (widget.description != null) ...[
                  SizedBox(height: context.layout.s1),
                  Text(
                    widget.description!,
                    style: textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ],
            );
          },
        ),
        SizeTransition(
          sizeFactor: _sizeFactor,
          alignment: AlignmentDirectional.topStart,
          child: widget.child,
        ),
      ],
    );
  }
}

@FluxerWidgetPreview(name: 'Collapsed', group: 'FluxerAccordion')
Widget fluxerAccordionCollapsedPreview() {
  return const FluxerAccordion(
    title: 'Advanced options',
    child: Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text('Hidden until expanded.'),
    ),
  );
}

@FluxerWidgetPreview(name: 'Expanded', group: 'FluxerAccordion')
Widget fluxerAccordionExpandedPreview() {
  return const FluxerAccordion(
    title: 'Advanced options',
    initiallyExpanded: true,
    child: Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text('Additional settings appear here.'),
    ),
  );
}
