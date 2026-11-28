import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/sidebar_sections/sidebar_section_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class SettingsSidebarExpandChevron extends StatelessWidget {
  const SettingsSidebarExpandChevron({
    required this.expanded,
    required this.visible,
    required this.emphasized,
    super.key,
  });

  final bool expanded;
  final bool visible;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final bool rtl = Directionality.of(context) == TextDirection.rtl;
    return Opacity(
      opacity: visible ? 1 : 0,
      child: AnimatedRotation(
        turns: expanded ? (rtl ? -0.25 : 0.25) : 0,
        duration: context.motion.panel,
        curve: kSettingsSidebarSectionCurve,
        child: PhosphorIcon(
          rtl
              ? PhosphorIconsRegular.caretLeft
              : PhosphorIconsRegular.caretRight,
          size: kSettingsSidebarExpandChevronSize,
          color: emphasized
              ? context.colors.textPrimary
              : context.colors.textTertiary,
        ),
      ),
    );
  }
}
