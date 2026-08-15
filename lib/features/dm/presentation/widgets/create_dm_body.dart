import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/create_dm_restriction_empty_state.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/friend_selector.dart';
import 'package:material_ui/material_ui.dart';

class CreateDmBody extends ConsumerStatefulWidget {
  const CreateDmBody({
    required this.controller,
    required this.scrollController,
    required this.showInlineSearch,
    this.listHeight,
    super.key,
  });

  final CreateDmController controller;
  final ScrollController scrollController;
  final bool showInlineSearch;
  final double? listHeight;

  @override
  ConsumerState<CreateDmBody> createState() => _CreateDmBodyState();
}

class _CreateDmBodyState extends ConsumerState<CreateDmBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: widget.controller.searchQuery,
    );
    _searchController.addListener(_handleSearchChanged);
    widget.controller.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    _searchController
      ..removeListener(_handleSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _handleSearchChanged() {
    widget.controller.setSearchQuery(_searchController.text);
  }

  void _handleControllerChanged() {
    if (!mounted) {
      return;
    }
    if (_searchController.text != widget.controller.searchQuery) {
      _searchController.value = _searchController.value.copyWith(
        text: widget.controller.searchQuery,
        selection: TextSelection.collapsed(
          offset: widget.controller.searchQuery.length,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final CreateDmController controller = widget.controller;
    final CreateDmRestriction? restriction = controller.restriction;
    if (restriction != null) {
      return CreateDmRestrictionEmptyState(restriction: restriction);
    }
    final friends = ref.watch(friendsListProvider).value ?? const [];
    final Widget selector = FriendSelector(
      friends: friends,
      selectedUserIds: controller.selectedUserIds,
      onToggle: controller.toggleUser,
      searchQuery: controller.searchQuery,
      l10n: l10n,
      scrollController: widget.scrollController,
      maxSelections: controller.maxSelections,
      stickyUserIds: controller.options.initialSelectedUserIds,
      showSelectedPills: !widget.showInlineSearch,
    );
    final List<Widget> children = <Widget>[
      if (widget.showInlineSearch)
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            0,
            context.layout.s4,
            context.layout.s3,
          ),
          child: PickerSearchInput(
            controller: _searchController,
            hintText: l10n.createDmSearchFriends,
            topPadding: 0,
            bottomPadding: 0,
          ),
        ),
      if (controller.isCreating)
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Center(child: FluxerLoadingSpinner()),
        ),
      if (widget.listHeight != null)
        SizedBox(height: widget.listHeight, child: selector)
      else
        Expanded(child: selector),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
