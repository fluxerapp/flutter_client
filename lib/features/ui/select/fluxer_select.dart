import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// An item in a [FluxerSelect] dropdown.
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

/// A dropdown select that uses a filled input-style trigger and opens
/// options in a [FluxerBottomSheet].
class FluxerSelect<T> extends StatefulWidget {
  FluxerSelect({
    required this.items,
    required ValueChanged<T> onChanged,
    this.value,
    this.label,
    this.hint,
    this.description,
    this.errorText,
    this.searchHint,
    this.emptyLabel,
    this.enableSearch = true,
    this.enabled = true,
    this.stretch = false,
    this.scrollableSheet = false,
    super.key,
  }) : _onChanged = ((value) => onChanged(value as T));

  final List<FluxerSelectItem<T>> items;
  final ValueChanged<Object?> _onChanged;
  final T? value;
  final String? label;
  final String? hint;
  final String? description;
  final String? errorText;
  final String? searchHint;
  final String? emptyLabel;
  final bool enableSearch;
  final bool enabled;
  final bool stretch;

  /// Opens the options in the scrollable (draggable) bottom-sheet variant even
  /// when [enableSearch] is false. Use for longer option lists that should
  /// behave like a full scrollable sheet rather than a content-sized menu.
  final bool scrollableSheet;

  @override
  State<FluxerSelect<T>> createState() => _FluxerSelectState<T>();
}

class _FluxerSelectState<T> extends State<FluxerSelect<T>> {
  bool _isOpen = false;

  List<FluxerSelectItem<T>> get items => widget.items;
  ValueChanged<Object?> get _onChanged => widget._onChanged;
  T? get value => widget.value;
  String? get label => widget.label;
  String? get hint => widget.hint;
  String? get description => widget.description;
  String? get errorText => widget.errorText;
  String? get searchHint => widget.searchHint;
  String? get emptyLabel => widget.emptyLabel;
  bool get enableSearch => widget.enableSearch;
  bool get enabled => widget.enabled;
  bool get stretch => widget.stretch;
  bool get scrollableSheet => widget.scrollableSheet;

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
          builder: (context, states) => Container(
            width: stretch ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: colors.backgroundTertiary,
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
          ),
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

  Widget _buildStaticSelectBody(BuildContext sheetContext) {
    final layout = sheetContext.layout;
    return Padding(
      padding: EdgeInsets.only(bottom: layout.s4),
      child: FluxerBottomSheetSection(
        child: FluxerMenuGroup(
          children: [
            for (final item in items)
              FluxerBottomSheetMenuItem(
                label: item.label,
                hint: item.description,
                leading: item.leading,
                icon: item.icon,
                enabled: item.enabled,
                isSelected: item.value == value,
                onTap: () => Navigator.of(sheetContext).pop(item.value),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _showOptions(BuildContext context) async {
    setState(() => _isOpen = true);
    late final Future<T?> sheetFuture;
    if (enableSearch || scrollableSheet) {
      sheetFuture = FluxerBottomSheet.showScrollable<T>(
        context,
        title: label,
        builder: (sheetContext, scrollController, close) {
          return _FluxerSelectSheet<T>(
            items: items,
            value: value,
            searchHint: searchHint,
            emptyLabel: emptyLabel,
            enableSearch: enableSearch,
            scrollController: scrollController,
            onSelected: (selected) => Navigator.of(sheetContext).pop(selected),
          );
        },
      );
    } else {
      sheetFuture = FluxerBottomSheet.show<T>(
        context,
        title: label,
        maxHeight: 0.58,
        builder: (sheetContext, close) =>
            SingleChildScrollView(child: _buildStaticSelectBody(sheetContext)),
      );
    }

    final T? result = await sheetFuture;

    if (mounted) {
      setState(() => _isOpen = false);
    }

    if (result != null) {
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
    final filteredItems = widget.items.where(_matchesQuery).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.enableSearch)
          FluxerBottomSheetSection(
            child: FluxerInput(
              controller: _searchController,
              hint: widget.searchHint ?? l10n.uiSearchPlaceholder,
              autofocus: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 18,
                  color: colors.textSecondary,
                ),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
        if (widget.enableSearch) SizedBox(height: layout.s3),
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
              : ListView(
                  controller: widget.scrollController,
                  padding: FluxerBottomSheet.scrollViewPadding(
                    context,
                    padding: EdgeInsets.only(bottom: layout.s4),
                  ),
                  children: [
                    FluxerBottomSheetSection(
                      child: FluxerMenuGroup(
                        children: [
                          for (final item in filteredItems)
                            FluxerBottomSheetMenuItem(
                              label: item.label,
                              hint: item.description,
                              leading: item.leading,
                              icon: item.icon,
                              enabled: item.enabled,
                              isSelected: item.value == widget.value,
                              onTap: () => widget._onSelected(item.value),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  bool _matchesQuery(FluxerSelectItem<T> item) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) {
      return true;
    }

    final haystacks = [
      item.label,
      if (item.description != null) item.description!,
      if (item.searchText != null) item.searchText!,
    ];

    return haystacks.any((value) => value.toLowerCase().contains(query));
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
