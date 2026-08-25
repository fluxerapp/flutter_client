import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_language_select.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double discoveryFiltersMaxContentWidth = 400;

class DiscoveryFilters extends ConsumerStatefulWidget {
  const DiscoveryFilters({
    this.autofocusSearch = false,
    this.showLanguageFilter = true,
    this.maxContentWidth,
    super.key,
  });

  final bool autofocusSearch;
  final bool showLanguageFilter;
  final double? maxContentWidth;

  @override
  ConsumerState<DiscoveryFilters> createState() => _DiscoveryFiltersState();
}

class _DiscoveryFiltersState extends ConsumerState<DiscoveryFilters> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final DiscoveryState state = ref.watch(discoveryControllerProvider);
    final List<FluxerSelectItem<String?>> languageItems =
        buildDiscoveryLanguageSelectItems(l10n);
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TapRegion(
          onTapOutside: (_) => _searchFocusNode.unfocus(),
          child: FluxerInput(
            controller: _searchController,
            focusNode: _searchFocusNode,
            hint: l10n.discoverySearchCommunities,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            autofocus: widget.autofocusSearch,
            onChanged: ref.read(discoveryControllerProvider.notifier).setQuery,
          ),
        ),
        if (widget.showLanguageFilter) ...<Widget>[
          SizedBox(height: layout.s2),
          FluxerSelect<String?>(
            value: state.language,
            label: l10n.discoveryFilterByLanguage,
            hint: l10n.discoveryAllLanguages,
            items: languageItems,
            stretch: true,
            onChanged: ref
                .read(discoveryControllerProvider.notifier)
                .setLanguage,
          ),
        ],
      ],
    );
    final double? maxContentWidth = widget.maxContentWidth;
    if (maxContentWidth != null) {
      content = Align(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: content,
        ),
      );
    }
    return Container(
      color: colors.brandPrimary,
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      child: content,
    );
  }
}
