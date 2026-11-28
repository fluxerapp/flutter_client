import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart'
    show
        FluxerBottomSheet,
        FluxerBottomSheetCheckboxItem,
        FluxerBottomSheetGroupColumn,
        FluxerBottomSheetMenuItem,
        FluxerBottomSheetMenuRadioItem,
        FluxerBottomSheetSection,
        FluxerBottomSheetSubmenuItem,
        FluxerBottomSheetVariant,
        FluxerMenuGroup;
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

typedef FluxerActionMenuBuilder =
    List<Widget> Function(BuildContext context, VoidCallback close);

typedef FluxerMenuChildrenBuilder = List<Widget> Function(BuildContext context);

class FluxerActionMenu {
  FluxerActionMenu._();

  static Future<void> show(
    BuildContext context, {
    required Offset position,
    required FluxerActionMenuBuilder builder,
    Rect? anchorRect,
    FluxerDesktopPlacement placement = FluxerDesktopPlacement.belowStart,
  }) {
    if (!usesDesktopPointerUi(context)) {
      return _showAsBottomSheet(context, builder: builder);
    }
    return _showAsOverlay(
      context,
      position: position,
      anchorRect: anchorRect,
      placement: placement,
      builder: builder,
    );
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
    required Rect? anchorRect,
    required FluxerDesktopPlacement placement,
    required FluxerActionMenuBuilder builder,
  }) {
    return pushFluxerDesktopMenu<void>(
      context,
      position: position,
      anchorRect: anchorRect,
      placement: placement,
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
            onTap: widget.onPressed ?? () {},
            onSelect: widget.onSelect,
          ),
        );
      case FluxerMenuRadioItem():
        currentItems.add(
          FluxerBottomSheetMenuRadioItem(
            label: widget.label,
            icon: widget.icon,
            hint: widget.hint,
            isSelected: widget.isSelected,
            enabled: widget.enabled,
            onTap: widget.onPressed,
          ),
        );
      case FluxerMenuCheckboxItem():
        currentItems.add(
          FluxerBottomSheetCheckboxItem(
            label: widget.label,
            isChecked: widget.isChecked,
            onTap: widget.onPressed,
          ),
        );
      case FluxerMenuSubmenuItem(:final VoidCallback onPressed?):
        currentItems.add(
          FluxerBottomSheetSubmenuItem(
            label: widget.label,
            hint: widget.hint,
            enabled: widget.enabled,
            isDanger: widget.isDanger,
            onTap: onPressed,
          ),
        );
      case FluxerMenuSubmenuItem(
        :final FluxerMenuChildrenBuilder submenuBuilder?,
      ):
        flush();
        currentTitle = widget.label;
        currentItems.add(
          Builder(
            builder: (BuildContext itemContext) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: submenuBuilder(itemContext),
            ),
          ),
        );
        flush();
      case FluxerMenuSliderItem():
        currentItems.add(widget);
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
    this.onPressed,
    this.onSelect,
    this.icon,
    this.iconColor,
    this.trailingIcon,
    this.hint,
    this.shortcut,
    this.enabled = true,
    this.isDanger = false,
    super.key,
  }) : assert(
         onPressed != null || onSelect != null,
         'FluxerMenuItem needs onPressed or onSelect',
       );

  final String label;
  final VoidCallback? onPressed;
  final FluxerSelectCallback? onSelect;
  final PhosphorIconData? icon;
  final PhosphorIconData? trailingIcon;
  final Color? iconColor;
  final String? hint;
  final String? shortcut;
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
      onSelect: onSelect,
      shortcut: shortcut,
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
    this.icon,
    this.hint,
    this.enabled = true,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final PhosphorIconData? icon;
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
      leading: icon == null
          ? null
          : PhosphorIcon(icon!, size: kFluxerDesktopMenuRadioIconSize),
      trailing: FluxerDesktopMenuRadio(selected: isSelected),
    );
  }
}

class FluxerMenuCheckboxItem extends StatelessWidget {
  const FluxerMenuCheckboxItem({
    required this.label,
    required this.onPressed,
    required this.isChecked,
    this.onSelect,
    this.hint,
    this.enabled = true,
    this.isDanger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final FluxerSelectCallback? onSelect;
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
      onSelect: onSelect,
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
    this.submenuBuilder,
    this.onPressed,
    this.onTriggerSelect,
    this.hint,
    this.enabled = true,
    this.isDanger = false,
    this.width,
    super.key,
  }) : assert(
         submenuBuilder != null || onPressed != null,
         'FluxerMenuSubmenuItem needs submenuBuilder or onPressed',
       );

  final String label;
  final FluxerMenuChildrenBuilder? submenuBuilder;
  final VoidCallback? onPressed;
  final FluxerSelectCallback? onTriggerSelect;
  final String? hint;
  final bool enabled;
  final bool isDanger;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final FluxerMenuChildrenBuilder? submenuBuilder = this.submenuBuilder;
    if (submenuBuilder == null) {
      return FluxerDesktopMenuRow(
        label: label,
        hint: hint,
        enabled: enabled,
        isDanger: isDanger,
        onTap: onPressed,
        trailing: PhosphorIcon(
          PhosphorIconsBold.caretRight,
          size: kFluxerDesktopMenuCaretSize,
          color: enabled
              ? context.colors.textTertiary
              : context.colors.interactiveMuted,
        ),
      );
    }
    return FluxerDesktopSubmenuRow(
      label: label,
      hint: hint,
      enabled: enabled,
      isDanger: isDanger,
      width: width,
      onTriggerSelect: onTriggerSelect,
      builder: (BuildContext submenuContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: submenuBuilder(submenuContext),
      ),
    );
  }
}

class FluxerMenuSliderItem extends StatelessWidget {
  const FluxerMenuSliderItem({
    required this.label,
    required this.value,
    this.minValue = 0,
    this.maxValue = 100,
    this.step = 1,
    this.enabled = true,
    this.onChanged,
    this.onChangeEnd,
    this.formatValue,
    super.key,
  });

  final String label;
  final double value;
  final double minValue;
  final double maxValue;
  final double step;
  final bool enabled;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final String Function(double value)? formatValue;

  @override
  Widget build(BuildContext context) {
    if (FluxerDesktopSurfaceScope.isMenu(context)) {
      return FluxerDesktopMenuSlider(
        label: label,
        value: value,
        minValue: minValue,
        maxValue: maxValue,
        step: step,
        enabled: enabled,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
        formatValue: formatValue,
      );
    }
    final colors = context.colors;
    final layout = context.layout;
    final String formatted = (formatValue ?? fluxerDesktopMenuSliderPercent)(
      value,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: layout.groupRowInset,
        vertical: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.username.copyWith(
                    color: enabled ? colors.textPrimary : colors.textTertiary,
                  ),
                ),
              ),
              Text(
                formatted,
                style: context.textStyles.timestamp.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
          SizedBox(height: layout.s2),
          FluxerSlider(
            defaultValue: value,
            value: value,
            minValue: minValue,
            maxValue: maxValue,
            step: step,
            disabled: !enabled,
            semanticLabel: label,
            semanticValue: formatValue ?? fluxerDesktopMenuSliderPercent,
            asValueChanges: onChanged,
            onValueChange: onChangeEnd ?? onChanged,
          ),
        ],
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

@FluxerWidgetPreview(name: 'Slider item', group: 'FluxerActionMenu')
Widget fluxerMenuSliderItemPreview() {
  return FluxerMenuSliderItem(
    label: 'User volume',
    value: 80,
    onChanged: (_) {},
  );
}
