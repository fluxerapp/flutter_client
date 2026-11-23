import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class DiscoveryFilters extends ConsumerStatefulWidget {
  const DiscoveryFilters({super.key});

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
    return Container(
      color: colors.brandPrimary,
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      child: TapRegion(
        onTapOutside: (_) => _searchFocusNode.unfocus(),
        child: PickerSearchInput.inline(
          controller: _searchController,
          focusNode: _searchFocusNode,
          hintText: l10n.discoverySearchCommunities,
          onChanged: ref.read(discoveryControllerProvider.notifier).setQuery,
        ),
      ),
    );
  }
}
