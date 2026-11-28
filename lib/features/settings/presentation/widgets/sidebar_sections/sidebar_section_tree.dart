import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/sidebar_sections/sidebar_section_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/sidebar_sections/sidebar_section_style.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_section_outline_entry.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsSidebarSectionTree extends StatefulWidget {
  const SettingsSidebarSectionTree({
    required this.sections,
    required this.expanded,
    required this.activeSectionId,
    required this.onSectionTap,
    super.key,
  });

  final List<FluxerSectionOutlineEntry> sections;
  final bool expanded;
  final String? activeSectionId;
  final ValueChanged<String> onSectionTap;

  @override
  State<SettingsSidebarSectionTree> createState() =>
      _SettingsSidebarSectionTreeState();
}

class _SettingsSidebarSectionTreeState extends State<SettingsSidebarSectionTree>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: kSettingsSidebarSectionTreeDuration,
    value: widget.expanded ? 1 : 0,
  );
  late final CurvedAnimation _size = CurvedAnimation(
    parent: _controller,
    curve: kSettingsSidebarSectionCurve,
  );
  late final CurvedAnimation _opacity = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0, 0.8, curve: Curves.ease),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.duration = settingsSidebarSectionTreeDuration(context);
  }

  @override
  void didUpdateWidget(SettingsSidebarSectionTree oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expanded == widget.expanded) {
      return;
    }
    if (widget.expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _size.dispose();
    _opacity.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int activeIndex = widget.sections.indexWhere(
      (FluxerSectionOutlineEntry section) =>
          section.id == widget.activeSectionId,
    );
    return ExcludeFocus(
      excluding: !widget.expanded,
      child: ExcludeSemantics(
        excluding: !widget.expanded,
        child: ClipRect(
          child: SizeTransition(
            sizeFactor: _size,
            alignment: AlignmentDirectional.topStart,
            child: FadeTransition(
              opacity: _opacity,
              child: Padding(
                padding: kSettingsSidebarSectionTreeMargin,
                child: _SettingsSidebarSectionTreeBody(
                  activeIndex: activeIndex,
                  children: <Widget>[
                    for (final FluxerSectionOutlineEntry section
                        in widget.sections)
                      SettingsSidebarSectionItem(
                        label: section.title,
                        active: section.id == widget.activeSectionId,
                        onTap: () => widget.onSectionTap(section.id),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsSidebarSectionTreeBody extends StatelessWidget {
  const _SettingsSidebarSectionTreeBody({
    required this.activeIndex,
    required this.children,
  });

  final int activeIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final BorderRadius lineRadius = BorderRadius.circular(999);
    final bool hasActive = activeIndex >= 0;
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: kSettingsSidebarSectionTreeLineX,
      ),
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            start: 0,
            top: 0,
            bottom: 0,
            width: kSettingsSidebarSectionTreeLineWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.backgroundModifierAccent,
                borderRadius: lineRadius,
              ),
            ),
          ),
          AnimatedPositionedDirectional(
            duration: settingsSidebarSectionTreeDuration(context),
            curve: kSettingsSidebarSectionCurve,
            start: 0,
            top: hasActive ? settingsSidebarSectionItemTop(activeIndex) : 0,
            height: hasActive ? kSettingsSidebarSectionItemHeight : 0,
            width: kSettingsSidebarSectionTreeLineWidth,
            child: Opacity(
              opacity: hasActive ? 1 : 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.textPrimary,
                  borderRadius: lineRadius,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: kSettingsSidebarSectionTreeContentGap,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                for (int i = 0; i < children.length; i++) ...<Widget>[
                  if (i > 0)
                    const SizedBox(height: kSettingsSidebarSectionItemGap),
                  children[i],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
