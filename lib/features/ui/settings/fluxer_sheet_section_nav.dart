import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';

class FluxerSheetSectionItem {
  const FluxerSheetSectionItem({required this.id, required this.label});

  final String id;
  final String label;
}

class FluxerSheetSectionNav extends StatefulWidget {
  const FluxerSheetSectionNav({
    required this.sections,
    required this.activeSection,
    required this.onSectionTap,
    super.key,
  });

  final List<FluxerSheetSectionItem> sections;
  final String activeSection;
  final ValueChanged<String> onSectionTap;

  @override
  State<FluxerSheetSectionNav> createState() => _FluxerSheetSectionNavState();
}

class _FluxerSheetSectionNavState extends State<FluxerSheetSectionNav> {
  final Map<String, GlobalKey> _keys = {};

  @override
  void initState() {
    super.initState();
    _syncKeys();
  }

  @override
  void didUpdateWidget(FluxerSheetSectionNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncKeys();
    if (oldWidget.activeSection != widget.activeSection) {
      _scrollToActive();
    }
  }

  void _syncKeys() {
    for (final section in widget.sections) {
      _keys.putIfAbsent(section.id, GlobalKey.new);
    }
    _keys.removeWhere((id, _) {
      return !widget.sections.any((s) => s.id == id);
    });
  }

  void _scrollToActive() {
    final key = _keys[widget.activeSection];
    if (key == null) {
      return;
    }
    final ctx = key.currentContext;
    if (ctx == null) {
      return;
    }
    final motion = context.motion;
    Scrollable.ensureVisible(
      ctx,
      alignment: 0.5,
      duration: motion.normal,
      curve: motion.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        itemCount: widget.sections.length,
        separatorBuilder: (_, _) => SizedBox(width: layout.s2),
        itemBuilder: (context, index) {
          final section = widget.sections[index];
          final isActive = section.id == widget.activeSection;

          return _SheetSectionPill(
            key: _keys[section.id],
            section: section,
            isActive: isActive,
            onTap: () => widget.onSectionTap(section.id),
          );
        },
      ),
    );
  }
}

class _SheetSectionPill extends StatelessWidget {
  const _SheetSectionPill({
    required this.section,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final FluxerSheetSectionItem section;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final motion = context.motion;

    return FluxerTappable(
      onTap: onTap,
      selected: isActive,
      semanticLabel: section.label,
      excludeChildSemantics: true,
      builder: (context, states) {
        return AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          padding: EdgeInsets.symmetric(
            horizontal: layout.s3,
            vertical: layout.s2,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? colors.brandPrimary
                : colors.backgroundSecondaryAlt,
            borderRadius: layout.radiusFull,
          ),
          child: AnimatedDefaultTextStyle(
            duration: motion.fast,
            curve: motion.curve,
            style: textStyles.bodySmall.copyWith(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive
                  ? colors.textOnBrandPrimary
                  : colors.textSecondary,
            ),
            child: Text(section.label),
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSheetSectionNav')
Widget fluxerSheetSectionNavPreview() {
  return FluxerSheetSectionNav(
    sections: const [
      FluxerSheetSectionItem(id: 'general', label: 'General'),
      FluxerSheetSectionItem(id: 'privacy', label: 'Privacy'),
      FluxerSheetSectionItem(id: 'audio', label: 'Audio'),
    ],
    activeSection: 'privacy',
    onSectionTap: (_) {},
  );
}
