import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart'
    show
        FluxerBottomSheet,
        FluxerBottomSheetGroupColumn,
        FluxerBottomSheetMenuItem,
        FluxerBottomSheetMenuRadioItem,
        FluxerBottomSheetSection,
        FluxerBottomSheetSubmenuItem,
        FluxerBottomSheetVariant,
        FluxerMenuGroup;
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

typedef FluxerActionMenuBuilder =
    List<Widget> Function(BuildContext context, VoidCallback close);

class FluxerActionMenu {
  FluxerActionMenu._();

  static Future<void> show(
    BuildContext context, {
    required Offset position,
    required FluxerActionMenuBuilder builder,
  }) {
    if (!usesDesktopPointerUi(context)) {
      return _showAsBottomSheet(context, builder: builder);
    }
    return _showAsOverlay(context, position: position, builder: builder);
  }

  static Future<void> _showAsBottomSheet(
    BuildContext context, {
    required FluxerActionMenuBuilder builder,
  }) async {
    await FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        final sections = _buildMobileSections(builder(sheetContext, close));

        return ListView(
          shrinkWrap: true,
          padding: FluxerBottomSheet.scrollViewPadding(sheetContext),
          children: [
            FluxerBottomSheetGroupColumn(
              children: [
                for (final section in sections)
                  FluxerBottomSheetSection(
                    title: section.title,
                    child: FluxerMenuGroup(children: section.items),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  static Future<void> _showAsOverlay(
    BuildContext context, {
    required Offset position,
    required FluxerActionMenuBuilder builder,
  }) {
    return pushFluxerDesktopMenu<void>(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: builder(menuContext, close),
            ),
          ),
        );
      },
    );
  }
}

class _FluxerMenuSectionData {
  final String? title;
  final List<Widget> items;

  const _FluxerMenuSectionData({required this.title, required this.items});
}

List<_FluxerMenuSectionData> _buildMobileSections(List<Widget> widgets) {
  final sections = <_FluxerMenuSectionData>[];
  final currentItems = <Widget>[];
  String? currentTitle;

  void flush() {
    if (currentItems.isEmpty) {
      return;
    }

    sections.add(
      _FluxerMenuSectionData(
        title: currentTitle,
        items: List<Widget>.from(currentItems),
      ),
    );
    currentItems.clear();
    currentTitle = null;
  }

  for (final widget in widgets) {
    switch (widget) {
      case FluxerMenuSectionHeader():
        flush();
        currentTitle = widget.label;
      case FluxerMenuDivider():
        flush();
      case FluxerMenuItem():
        currentItems.add(
          FluxerBottomSheetMenuItem(
            label: widget.label,
            hint: widget.hint,
            icon: widget.icon,
            iconColor: widget.iconColor,
            isDanger: widget.isDanger,
            enabled: widget.enabled,
            onTap: widget.onPressed,
          ),
        );
      case FluxerMenuRadioItem():
        currentItems.add(
          FluxerBottomSheetMenuRadioItem(
            label: widget.label,
            hint: widget.hint,
            isSelected: widget.isSelected,
            enabled: widget.enabled,
            onTap: widget.onPressed,
          ),
        );
      case FluxerMenuSubmenuItem():
        currentItems.add(
          FluxerBottomSheetSubmenuItem(
            label: widget.label,
            hint: widget.hint,
            onTap: widget.onPressed,
          ),
        );
    }
  }

  flush();

  return sections;
}

class FluxerMenuSectionHeader extends StatelessWidget {
  final String label;

  const FluxerMenuSectionHeader({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopMenuGroupLabel(label: label);
  }
}

class FluxerMenuItem extends StatelessWidget {
  const FluxerMenuItem({
    required this.label,
    required this.onPressed,
    this.icon,
    this.iconColor,
    this.trailingIcon,
    this.hint,
    this.enabled = true,
    this.isDanger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final PhosphorIconData? icon;
  final PhosphorIconData? trailingIcon;
  final Color? iconColor;
  final String? hint;
  final bool enabled;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color foreground = !enabled
        ? colors.interactiveMuted
        : isDanger
        ? fluxerDesktopMenuDangerText(colors)
        : colors.textPrimary;
    final Color iconForeground = iconColor ?? foreground;
    final Widget? iconWidget = icon == null
        ? null
        : PhosphorIcon(
            icon!,
            size: kFluxerDesktopMenuIconSize,
            color: iconForeground,
          );
    final Widget? trailingIconWidget = trailingIcon == null
        ? null
        : PhosphorIcon(
            trailingIcon!,
            size: kFluxerDesktopMenuIconSize,
            color: iconForeground,
          );
    return FluxerDesktopMenuRow(
      label: label,
      hint: hint,
      onTap: onPressed,
      enabled: enabled,
      isDanger: isDanger,
      leading: trailingIconWidget == null ? null : iconWidget,
      trailing: trailingIconWidget ?? iconWidget,
    );
  }
}

class FluxerMenuRadioItem extends StatelessWidget {
  const FluxerMenuRadioItem({
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.hint,
    this.enabled = true,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final String? hint;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopMenuRow(
      label: label,
      hint: hint,
      onTap: onPressed,
      enabled: enabled,
      selected: isSelected,
      trailing: FluxerRadioIndicator(selected: isSelected),
    );
  }
}

class FluxerMenuCheckboxItem extends StatelessWidget {
  const FluxerMenuCheckboxItem({
    required this.label,
    required this.onPressed,
    required this.isChecked,
    this.hint,
    this.enabled = true,
    this.isDanger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isChecked;
  final String? hint;
  final bool enabled;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopMenuRow(
      label: label,
      hint: hint,
      onTap: onPressed,
      enabled: enabled,
      isDanger: isDanger,
      checked: isChecked,
      trailingBuilder: (BuildContext context, {required bool highlighted}) =>
          FluxerDesktopMenuCheckbox(
            isChecked: isChecked,
            dangerHighlighted: isDanger && highlighted,
          ),
    );
  }
}

class FluxerMenuSubmenuItem extends StatelessWidget {
  const FluxerMenuSubmenuItem({
    required this.label,
    required this.onPressed,
    this.hint,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return FluxerDesktopMenuRow(
      label: label,
      hint: hint,
      onTap: onPressed,
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: kFluxerDesktopMenuCaretSize,
        color: context.colors.textTertiary,
      ),
    );
  }
}

class FluxerMenuDivider extends StatelessWidget {
  const FluxerMenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const FluxerDesktopMenuSeparator();
  }
}

@FluxerWidgetPreview(name: 'Section header', group: 'FluxerActionMenu')
Widget fluxerMenuSectionHeaderPreview() {
  return const FluxerMenuSectionHeader(label: 'Message actions');
}

@FluxerWidgetPreview(name: 'Menu item', group: 'FluxerActionMenu')
Widget fluxerMenuItemPreview() {
  return FluxerMenuItem(
    label: 'Copy text',
    hint: 'Copy the selected message',
    icon: PhosphorIconsBold.copy,
    onPressed: () {},
  );
}

@FluxerWidgetPreview(name: 'Danger item', group: 'FluxerActionMenu')
Widget fluxerMenuItemDangerPreview() {
  return FluxerMenuItem(
    label: 'Delete message',
    icon: PhosphorIconsBold.trash,
    isDanger: true,
    onPressed: () {},
  );
}

@FluxerWidgetPreview(name: 'Divider', group: 'FluxerActionMenu')
Widget fluxerMenuDividerPreview() {
  return const FluxerMenuDivider();
}
