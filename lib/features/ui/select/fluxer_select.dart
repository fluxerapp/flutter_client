import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/shell/utils/shell_popup_presentation.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerSelectItem<T> {
  const FluxerSelectItem({
    required this.value,
    required this.label,
    this.leading,
    this.icon,
    this.description,
    this.searchText,
    this.enabled = true,
  });

  final T value;
  final String label;
  final Widget? leading;
  final IconData? icon;
  final String? description;
  final String? searchText;
  final bool enabled;
}

const double _kMobileTriggerMinHeight = 44;

class FluxerSelect<T> extends StatefulWidget {
  FluxerSelect({
    required this.items,
    required ValueChanged<T> onChanged,
    this.value,
    this.label,
    this.sheetTitle,
    this.hint,
    this.description,
    this.errorText,
    this.searchHint,
    this.emptyLabel,
    this.enableSearch = true,
    this.enabled = true,
    this.stretch = false,
    this.scrollableSheet = false,
    this.useRootNavigator,
    super.key,
  }) : _onChanged = ((value) => onChanged(value as T));

  final List<FluxerSelectItem<T>> items;
  final ValueChanged<Object?> _onChanged;
  final T? value;
  final String? label;
  final String? sheetTitle;
  final String? hint;
  final String? description;
  final String? errorText;
  final String? searchHint;
  final String? emptyLabel;
  final bool enableSearch;
  final bool enabled;
  final bool stretch;

  final bool scrollableSheet;

  final bool? useRootNavigator;

  @override
  State<FluxerSelect<T>> createState() => _FluxerSelectState<T>();
}

class _FluxerSelectState<T> extends State<FluxerSelect<T>> {
  bool _isOpen = false;

  List<FluxerSelectItem<T>> get items => widget.items;
  ValueChanged<Object?> get _onChanged => widget._onChanged;
  T? get value => widget.value;
  String? get label => widget.label;
  String? get sheetTitle => widget.sheetTitle ?? widget.label;
  String? get hint => widget.hint;
  String? get description => widget.description;
  String? get errorText => widget.errorText;
  String? get searchHint => widget.searchHint;
  String? get emptyLabel => widget.emptyLabel;
  bool get enableSearch => widget.enableSearch;
  bool get enabled => widget.enabled;
  bool get stretch => widget.stretch;
  bool get scrollableSheet => widget.scrollableSheet;
  bool? get useRootNavigator => widget.useRootNavigator;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    final selectedItem = items.cast<FluxerSelectItem<T>?>().firstWhere(
      (FluxerSelectItem<T>? item) => item!.value == value,
      orElse: () => null,
    );

    final String triggerLabel = label ?? hint ?? l10n.uiSelectPlaceholder;

    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, selectedItem, triggerLabel);
    }

    return Column(
      crossAxisAlignment: stretch
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: layout.s1_5),
            child: Text(
              label!,
              style: textStyles.label.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        FluxerTappable(
          enabled: enabled,
          onTap: () => _showOptions(context),
          semanticLabel: triggerLabel,
          expanded: _isOpen,
          builder: (context, states) {
            final bool hovered =
                enabled && states.contains(WidgetState.hovered);
            return Container(
              width: stretch ? double.infinity : null,
              constraints: isMobileLayout(context)
                  ? const BoxConstraints(minHeight: _kMobileTriggerMinHeight)
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: hovered
                    ? colors.backgroundModifierHover
                    : colors.backgroundTertiary,
                borderRadius: layout.radiusLg,
                border: Border.all(
                  color: errorText != null
                      ? colors.statusDanger
                      : colors.backgroundModifierAccent,
                ),
              ),
              child: Row(
                mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  if (selectedItem?.leading case final leading?) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: leading),
                    ),
                    SizedBox(width: layout.s2),
                  ],
                  Flexible(
                    fit: stretch ? FlexFit.tight : FlexFit.loose,
                    child: Text(
                      selectedItem?.label ?? hint ?? '',
                      style: selectedItem != null
                          ? textStyles.bodySmall.copyWith(
                              color: colors.textPrimary,
                            )
                          : textStyles.bodySmall.copyWith(
                              color: colors.textTertiary,
                            ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: layout.s2),
                  Icon(
                    PhosphorIconsBold.caretDown,
                    size: 16,
                    color: colors.textSecondary,
                  ),
                ],
              ),
            );
          },
        ),
        if (description != null)
          Padding(
            padding: EdgeInsets.only(top: layout.s1_5),
            child: Text(
              description!,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: layout.s1_5),
            child: Text(
              errorText!,
              style: textStyles.bodySmall.copyWith(color: colors.statusDanger),
            ),
          ),
      ],
    );
  }

  Widget _buildDesktop(
    BuildContext context,
    FluxerSelectItem<T>? selectedItem,
    String triggerLabel,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final TextStyle textStyle = textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 20 / 14,
      color: colors.textPrimary,
    );
    final Color borderColor = errorText != null
        ? colors.statusDanger
        : _isOpen
        ? colors.backgroundModifierAccentFocus
        : colors.backgroundModifierAccent;

    Widget trigger = FluxerTappable(
      enabled: enabled,
      onTap: () => _showOptions(context),
      semanticLabel: triggerLabel,
      expanded: _isOpen,
      builder: (context, states) {
        final bool hovered = enabled && states.contains(WidgetState.hovered);
        return AnimatedContainer(
          duration: context.motion.normal,
          curve: Curves.ease,
          width: stretch ? double.infinity : null,
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsetsDirectional.only(start: 17, end: 7),
          decoration: BoxDecoration(
            color: fluxerFormSurfaceBackground(context),
            borderRadius: context.layout.radiusLg,
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (selectedItem?.leading case final leading?) ...[
                SizedBox(width: 20, height: 20, child: Center(child: leading)),
                const SizedBox(width: 8),
              ],
              Flexible(
                fit: stretch ? FlexFit.tight : FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: Text(
                    selectedItem?.label ?? hint ?? '',
                    style: selectedItem != null
                        ? textStyle
                        : textStyle.copyWith(color: colors.textTertiary),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: hovered
                      ? colors.backgroundModifierHover
                      : Colors.transparent,
                  borderRadius: context.layout.radiusMd,
                ),
                child: AnimatedRotation(
                  turns: _isOpen ? 0.5 : 0,
                  duration: context.motion.panel,
                  curve: Curves.ease,
                  child: Icon(
                    PhosphorIconsBold.caretDown,
                    size: 16,
                    color: hovered ? colors.textPrimary : colors.textTertiary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    if (!enabled) {
      trigger = Opacity(opacity: 0.5, child: trigger);
    }

    final TextStyle supportStyle = textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 20 / 14,
    );
    return Column(
      crossAxisAlignment: stretch
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (label != null)
          Text(
            label!,
            style: textStyles.label.copyWith(
              color: colors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
            ),
          ),
        trigger,
        if (description != null)
          Text(
            description!,
            style: supportStyle.copyWith(color: colors.textPrimaryMuted),
          ),
        if (errorText != null)
          Text(
            errorText!,
            style: supportStyle.copyWith(color: colors.statusDanger),
          ),
      ],
    );
  }

  Widget _buildStaticSelectBody(
    BuildContext sheetContext, {
    required ValueChanged<T> onSelected,
  }) {
    return _FluxerSelectList<T>(
      items: items,
      value: value,
      shrinkWrap: true,
      onSelected: onSelected,
    );
  }

  double _desktopMenuWidth(BuildContext context) {
    final RenderObject? box = context.findRenderObject();
    final double triggerWidth = box is RenderBox && box.hasSize
        ? box.size.width
        : kFluxerDesktopMenuDefaultWidth;
    return math.max(kFluxerDesktopMenuMinWidth, triggerWidth);
  }

  Future<void> _showOptions(BuildContext context) async {
    setState(() => _isOpen = true);

    var didSelect = false;
    void handleSelected(BuildContext sheetContext, T selected) {
      didSelect = true;
      _onChanged(selected);
      Navigator.of(
        sheetContext,
        rootNavigator:
            useRootNavigator ?? resolveShellPopupUseRootNavigator(context),
      ).pop(selected);
    }

    late final Future<T?> sheetFuture;
    if (enableSearch || scrollableSheet) {
      sheetFuture = FluxerBottomSheet.showScrollable<T>(
        context,
        title: usesDesktopPointerUi(context) ? null : sheetTitle,
        useRootNavigator: useRootNavigator,
        desktop: FluxerDesktopPresentation(
          surface: FluxerDesktopSurface.menu,
          width: _desktopMenuWidth(context),
          anchorContext: context,
        ),
        initialChildSize: enableSearch
            ? FluxerBottomSheet.scrollableSheetSize
            : FluxerBottomSheet.scrollableSheetHalfSize,
        builder: (sheetContext, scrollController, close) {
          return _FluxerSelectSheet<T>(
            items: items,
            value: value,
            searchHint: searchHint,
            emptyLabel: emptyLabel,
            enableSearch: enableSearch,
            scrollController: scrollController,
            onSelected: (selected) => handleSelected(sheetContext, selected),
          );
        },
      );
    } else {
      sheetFuture = FluxerBottomSheet.show<T>(
        context,
        title: usesDesktopPointerUi(context) ? null : sheetTitle,
        maxHeight: 0.58,
        useRootNavigator: useRootNavigator,
        variant: FluxerBottomSheetVariant.menu,
        desktop: FluxerDesktopPresentation(
          width: _desktopMenuWidth(context),
          anchorContext: context,
        ),
        builder: (sheetContext, close) => _buildStaticSelectBody(
          sheetContext,
          onSelected: (selected) => handleSelected(sheetContext, selected),
        ),
      );
    }

    final T? result = await sheetFuture;

    if (mounted) {
      setState(() => _isOpen = false);
    }

    if (!didSelect && result != null) {
      _onChanged(result);
    }
  }
}

class _FluxerSelectSheet<T> extends StatefulWidget {
  _FluxerSelectSheet({
    required this.items,
    required ValueChanged<T> onSelected,
    required this.scrollController,
    super.key,
    this.value,
    this.searchHint,
    this.emptyLabel,
    this.enableSearch = true,
  }) : _onSelected = ((value) => onSelected(value as T));

  final List<FluxerSelectItem<T>> items;
  final T? value;
  final String? searchHint;
  final String? emptyLabel;
  final bool enableSearch;
  final ScrollController scrollController;
  final ValueChanged<Object?> _onSelected;

  @override
  State<_FluxerSelectSheet<T>> createState() => _FluxerSelectSheetState<T>();
}

class _FluxerSelectSheetState<T> extends State<_FluxerSelectSheet<T>> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  late List<List<String>> _searchKeys = _buildSearchKeys(widget.items);

  @override
  void didUpdateWidget(_FluxerSelectSheet<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.items, widget.items)) {
      _searchKeys = _buildSearchKeys(widget.items);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final filteredItems = _filterItems();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.enableSearch)
          FluxerBottomSheetSection(
            child: PickerSearchInput.inline(
              controller: _searchController,
              hintText: widget.searchHint ?? l10n.uiSearchPlaceholder,
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
        if (widget.enableSearch)
          SizedBox(
            height: FluxerDesktopSurfaceScope.isMenu(context)
                ? kFluxerDesktopMenuPadding
                : layout.s3,
          ),
        Expanded(
          child: filteredItems.isEmpty
              ? FluxerBottomSheetContent(
                  scrollable: false,
                  child: Center(
                    child: Text(
                      widget.emptyLabel ?? l10n.uiNoOptionsFound,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ),
                )
              : _FluxerSelectList<T>(
                  items: filteredItems,
                  value: widget.value,
                  controller: widget.scrollController,
                  onSelected: widget._onSelected,
                ),
        ),
      ],
    );
  }

  List<FluxerSelectItem<T>> _filterItems() {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) {
      return widget.items;
    }
    return [
      for (var i = 0; i < widget.items.length; i++)
        if (_searchKeys[i].any((key) => key.contains(query))) widget.items[i],
    ];
  }

  List<List<String>> _buildSearchKeys(List<FluxerSelectItem<T>> items) => [
    for (final item in items)
      [
        item.label.toLowerCase(),
        if (item.description case final description?) description.toLowerCase(),
        if (item.searchText case final searchText?) searchText.toLowerCase(),
      ],
  ];
}

class _FluxerSelectList<T> extends StatelessWidget {
  _FluxerSelectList({
    required this.items,
    required this.value,
    required ValueChanged<T> onSelected,
    this.controller,
    this.shrinkWrap = false,
  }) : _onSelected = ((value) => onSelected(value as T));

  final List<FluxerSelectItem<T>> items;
  final T? value;
  final ValueChanged<Object?> _onSelected;
  final ScrollController? controller;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final Color cardColor = FluxerBottomSheet.cardColorOf(context);
    final Radius radius = layout.radiusXxl.topLeft;
    final int lastIndex = items.length - 1;

    if (FluxerDesktopSurfaceScope.isMenu(context)) {
      return ListView.separated(
        controller: controller,
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.zero,
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 1),
        itemBuilder: (BuildContext context, int index) {
          final FluxerSelectItem<T> item = items[index];
          return _FluxerSelectDesktopRow(
            item: item,
            selected: item.value == value,
            onTap: () => _onSelected(item.value),
          );
        },
      );
    }

    return ListView.separated(
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: layout.pageGutter),
      ),
      itemCount: items.length,
      separatorBuilder: (context, _) => ColoredBox(
        color: cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.groupRowInset),
          child: Divider(
            height: 1,
            thickness: 1,
            color: context.colors.backgroundModifierAccent,
          ),
        ),
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Material(
          color: cardColor,
          surfaceTintColor: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: index == 0 ? radius : Radius.zero,
            bottom: index == lastIndex ? radius : Radius.zero,
          ),
          clipBehavior: Clip.antiAlias,
          child: FluxerBottomSheetMenuItem(
            label: item.label,
            hint: item.description,
            leading: item.leading,
            icon: item.icon,
            enabled: item.enabled,
            isSelected: item.value == value,
            onTap: () => _onSelected(item.value),
          ),
        );
      },
    );
  }
}

class _FluxerSelectDesktopRow extends StatelessWidget {
  const _FluxerSelectDesktopRow({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final FluxerSelectItem<Object?> item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final TextStyle baseStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 14,
      height: 20 / 14,
    );
    return FluxerTappable(
      enabled: item.enabled,
      onTap: onTap,
      selected: selected,
      semanticLabel: item.description != null
          ? '${item.label}. ${item.description}'
          : item.label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered =
            item.enabled && states.contains(WidgetState.hovered);
        final Color foreground = selected
            ? colors.brandPrimaryFill
            : colors.textPrimary;
        final Widget? leading = switch ((item.leading, item.icon)) {
          (final Widget leadingWidget, _) => IconTheme.merge(
            data: IconThemeData(color: foreground, size: 16),
            child: SizedBox(
              width: 20,
              height: 20,
              child: Center(child: leadingWidget),
            ),
          ),
          (_, final IconData iconData) => PhosphorIcon(
            iconData,
            color: foreground,
            size: 16,
          ),
          _ => null,
        };
        return Container(
          constraints: const BoxConstraints(minHeight: 32),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? colors.brandPrimary
                : hovered
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: context.layout.radiusMd,
          ),
          child: Row(
            spacing: 8,
            children: [
              SizedBox.square(
                dimension: 16,
                child: selected
                    ? PhosphorIcon(
                        PhosphorIconsBold.check,
                        color: foreground,
                        size: 16,
                      )
                    : null,
              ),
              ?leading,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.label,
                      style: baseStyle.copyWith(color: foreground),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.description case final description?)
                      Text(
                        description,
                        style: baseStyle.copyWith(
                          fontSize: 12,
                          height: 16 / 12,
                          color: selected
                              ? foreground
                              : colors.textPrimaryMuted,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Closed', group: 'FluxerSelect')
Widget fluxerSelectPreview() {
  return FluxerSelect<String>(
    label: 'Theme accent',
    hint: 'Choose a preset',
    enableSearch: false,
    items: const [
      FluxerSelectItem(value: 'a', label: 'Blurple'),
      FluxerSelectItem(value: 'b', label: 'Teal'),
      FluxerSelectItem(value: 'c', label: 'Rose'),
    ],
    value: 'b',
    onChanged: (_) {},
  );
}

@FluxerWidgetPreview(name: 'With error', group: 'FluxerSelect')
Widget fluxerSelectErrorPreview() {
  return FluxerSelect<String>(
    hint: 'Select an option',
    errorText: 'This field is required.',
    enableSearch: false,
    items: const [
      FluxerSelectItem(value: 'x', label: 'One'),
      FluxerSelectItem(value: 'y', label: 'Two'),
    ],
    onChanged: (_) {},
  );
}
