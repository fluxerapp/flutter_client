import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_supported_languages.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<FluxerSelectItem<String?>> buildDiscoveryLanguageSelectItems(
  FluxerLocalizations l10n,
) {
  return <FluxerSelectItem<String?>>[
    FluxerSelectItem<String?>(value: null, label: l10n.discoveryAllLanguages),
    ...sortedDiscoveryLanguages().map(
      (DiscoveryLanguage language) => FluxerSelectItem<String?>(
        value: language.code,
        label: language.displayLabel,
        searchText: '${language.name} ${language.nativeName} ${language.code}',
      ),
    ),
  ];
}

DiscoveryLanguage? discoveryLanguageForCode(String code) {
  for (final DiscoveryLanguage language in discoverySupportedLanguages) {
    if (language.code == code) {
      return language;
    }
  }
  return null;
}

String discoveryLanguageCompactLabel(String? languageCode) {
  if (languageCode == null) {
    return '';
  }
  final DiscoveryLanguage? language = discoveryLanguageForCode(languageCode);
  if (language == null) {
    return languageCode.split('-').first.toUpperCase();
  }
  return language.code.split('-').first.toUpperCase();
}

class _DiscoveryLanguagePickerResult {
  const _DiscoveryLanguagePickerResult(this.languageCode);

  final String? languageCode;
}

Future<void> showDiscoveryLanguagePicker({
  required BuildContext context,
  required String? value,
  required ValueChanged<String?> onChanged,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final List<FluxerSelectItem<String?>> items =
      buildDiscoveryLanguageSelectItems(l10n);
  final _DiscoveryLanguagePickerResult? result =
      await FluxerBottomSheet.showScrollable<_DiscoveryLanguagePickerResult>(
        context,
        title: l10n.discoveryFilterByLanguage,
        builder:
            (BuildContext sheetContext, ScrollController scrollController, _) {
              return _DiscoveryLanguageSelectSheet(
                items: items,
                value: value,
                scrollController: scrollController,
              );
            },
      );
  if (result != null) {
    onChanged(result.languageCode);
  }
}

class DiscoveryLanguageAppBarAction extends ConsumerWidget {
  const DiscoveryLanguageAppBarAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String? language = ref.watch(discoveryControllerProvider).language;
    final String compactLabel = discoveryLanguageCompactLabel(language);
    final bool hasFilter = language != null;
    void openPicker() => showDiscoveryLanguagePicker(
      context: context,
      value: language,
      onChanged: ref.read(discoveryControllerProvider.notifier).setLanguage,
    );
    if (!hasFilter) {
      return IconButton(
        onPressed: openPicker,
        tooltip: l10n.discoveryFilterByLanguage,
        icon: const PhosphorIcon(PhosphorIconsBold.globe, color: Colors.white),
      );
    }
    return TextButton(
      onPressed: openPicker,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: layout.s2),
        minimumSize: const Size(0, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const PhosphorIcon(PhosphorIconsBold.funnel, size: 16),
          SizedBox(width: layout.s1),
          Text(
            compactLabel,
            style: textStyles.label.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 2),
          const PhosphorIcon(PhosphorIconsBold.caretDown, size: 12),
        ],
      ),
    );
  }
}

class _DiscoveryLanguageSelectSheet extends StatefulWidget {
  const _DiscoveryLanguageSelectSheet({
    required this.items,
    required this.value,
    required this.scrollController,
  });

  final List<FluxerSelectItem<String?>> items;
  final String? value;
  final ScrollController scrollController;

  @override
  State<_DiscoveryLanguageSelectSheet> createState() =>
      _DiscoveryLanguageSelectSheetState();
}

class _DiscoveryLanguageSelectSheetState
    extends State<_DiscoveryLanguageSelectSheet> {
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
    final List<FluxerSelectItem<String?>> filteredItems = widget.items
        .where(_matchesQuery)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerBottomSheetSection(
          child: FluxerInput(
            controller: _searchController,
            hint: l10n.uiSearchPlaceholder,
            autofocus: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: PhosphorIcon(
                PhosphorIconsBold.magnifyingGlass,
                size: 18,
                color: colors.textSecondary,
              ),
            ),
            onChanged: (String value) => setState(() => _query = value),
          ),
        ),
        SizedBox(height: layout.s3),
        Expanded(
          child: filteredItems.isEmpty
              ? FluxerBottomSheetContent(
                  scrollable: false,
                  child: Center(
                    child: Text(
                      l10n.uiNoOptionsFound,
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
                  children: <Widget>[
                    FluxerBottomSheetSection(
                      child: FluxerMenuGroup(
                        children: <Widget>[
                          for (final FluxerSelectItem<String?> item
                              in filteredItems)
                            FluxerBottomSheetMenuItem(
                              label: item.label,
                              isSelected: item.value == widget.value,
                              onTap: () => Navigator.of(
                                context,
                              ).pop(_DiscoveryLanguagePickerResult(item.value)),
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

  bool _matchesQuery(FluxerSelectItem<String?> item) {
    final String query = _query.trim().toLowerCase();
    if (query.isEmpty) {
      return true;
    }
    final List<String> haystacks = <String>[
      item.label,
      if (item.searchText != null) item.searchText!,
    ];
    return haystacks.any((String value) => value.toLowerCase().contains(query));
  }
}
