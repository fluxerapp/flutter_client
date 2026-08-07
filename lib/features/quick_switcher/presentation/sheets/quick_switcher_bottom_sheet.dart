import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_result_unread_state.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/widgets/quick_switcher_friends_list.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/widgets/quick_switcher_result_row.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/widgets/quick_switcher_segmented_tabs.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_provider.dart';
import 'package:fluxer_app/features/quick_switcher/utils/quick_switcher_navigation.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class QuickSwitcherBottomSheet {
  QuickSwitcherBottomSheet._();

  static Future<void> show(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    ref.read(quickSwitcherProvider.notifier).open(l10n);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (sheetContext, scrollController, close) {
        return _QuickSwitcherSheetBody(
          scrollController: scrollController,
          onClose: () {
            ref.read(quickSwitcherProvider.notifier).close();
            close();
          },
        );
      },
    ).whenComplete(() {
      if (ref.read(quickSwitcherProvider).isOpen) {
        ref.read(quickSwitcherProvider.notifier).close();
      }
    });
  }
}

class _QuickSwitcherSheetBody extends ConsumerStatefulWidget {
  const _QuickSwitcherSheetBody({
    required this.scrollController,
    required this.onClose,
  });

  final ScrollController scrollController;
  final VoidCallback onClose;

  @override
  ConsumerState<_QuickSwitcherSheetBody> createState() =>
      _QuickSwitcherSheetBodyState();
}

class _QuickSwitcherSheetBodyState
    extends ConsumerState<_QuickSwitcherSheetBody> {
  late final TextEditingController _searchController;
  late final TextEditingController _friendsSearchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _friendsSearchController = TextEditingController();
    _searchController.addListener(_handleSearchChanged);
    _friendsSearchController.addListener(_handleFriendsSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FocusScope.of(context).requestFocus(_searchFocusNode);
      }
    });
  }

  void _handleSearchChanged() {
    ref.read(quickSwitcherProvider.notifier).setQuery(_searchController.text);
  }

  void _handleFriendsSearchChanged() {
    ref
        .read(quickSwitcherProvider.notifier)
        .setFriendsSearchQuery(_friendsSearchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _friendsSearchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  final FocusNode _searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final state = ref.watch(quickSwitcherProvider);
    final notifier = ref.read(quickSwitcherProvider.notifier);
    final bool isSearchTab = state.activeTab == QuickSwitcherSheetTab.search;
    _syncSearchControllers(state);
    return ColoredBox(
      color: context.colors.backgroundSecondary,
      child: Column(
        children: <Widget>[
          SizedBox(height: context.layout.s2),
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.layout.s3,
              context.layout.s1,
              context.layout.s3,
              0,
            ),
            child: QuickSwitcherSegmentedTabs(
              tabs: <String>[
                l10n.quickSwitcherTabSearch,
                l10n.quickSwitcherTabFriends,
              ],
              selectedIndex: isSearchTab ? 0 : 1,
              onChanged: (int index) {
                notifier.setActiveTab(
                  index == 0
                      ? QuickSwitcherSheetTab.search
                      : QuickSwitcherSheetTab.friends,
                );
              },
            ),
          ),
          SizedBox(height: context.layout.s3),
          Expanded(
            child: isSearchTab
                ? _buildSearchPanel(context, state, notifier, l10n)
                : _buildFriendsPanel(context, state, notifier, l10n),
          ),
        ],
      ),
    );
  }

  void _syncSearchControllers(QuickSwitcherState state) {
    if (_searchController.text != state.query) {
      _searchController.value = _searchController.value.copyWith(
        text: state.query,
        selection: TextSelection.collapsed(offset: state.query.length),
      );
    }
    if (_friendsSearchController.text != state.friendsSearchQuery) {
      _friendsSearchController.value = _friendsSearchController.value.copyWith(
        text: state.friendsSearchQuery,
        selection: TextSelection.collapsed(
          offset: state.friendsSearchQuery.length,
        ),
      );
    }
  }

  Widget _buildSearchPanel(
    BuildContext context,
    QuickSwitcherState state,
    QuickSwitcher notifier,
    FluxerLocalizations l10n,
  ) {
    return Column(
      children: <Widget>[
        PickerSearchInput(
          controller: _searchController,
          hintText: l10n.quickSwitcherSearchPlaceholder,
          topPadding: 0,
          bottomPadding: 0,
          onSubmitted: (_) => _confirmSelection(state),
        ),
        SizedBox(height: context.layout.s3),
        Expanded(child: _buildSearchResults(context, state, l10n)),
      ],
    );
  }

  Widget _buildFriendsPanel(
    BuildContext context,
    QuickSwitcherState state,
    QuickSwitcher notifier,
    FluxerLocalizations l10n,
  ) {
    return Column(
      children: <Widget>[
        PickerSearchInput(
          controller: _friendsSearchController,
          hintText: l10n.quickSwitcherSearchFriends,
          topPadding: 0,
          bottomPadding: 0,
          onSubmitted: (_) {},
        ),
        SizedBox(height: context.layout.s3),
        Expanded(
          child: QuickSwitcherFriendsList(
            searchQuery: state.friendsSearchQuery,
            scrollController: widget.scrollController,
            onFriendSelected: widget.onClose,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    QuickSwitcherState state,
    FluxerLocalizations l10n,
  ) {
    if (state.candidateSets == null) {
      return _buildScrollablePlaceholder(
        context,
        child: const Center(child: FluxerLoadingSpinner()),
      );
    }
    if (state.results.isEmpty) {
      return _buildScrollablePlaceholder(
        context,
        child: _buildEmptyState(
          context,
          l10n,
          hasQuery: state.query.trim().isNotEmpty,
        ),
      );
    }
    final Map<String, QuickSwitcherUnreadChannel> unreadByChannelId =
        state.unreadByChannelId;
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < state.results.length; i++) {
      final QuickSwitcherResult result = state.results[i];
      // Headers only appear once the user types; default results have none.
      if (result is QuickSwitcherHeaderResult) {
        children.add(
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.layout.s3,
              context.layout.s2,
              context.layout.s3,
              context.layout.s1 + 2,
            ),
            child: Text(
              result.title,
              style: context.textStyles.smallText.copyWith(letterSpacing: 0.64),
            ),
          ),
        );
        continue;
      }
      children.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.layout.s3),
          child: QuickSwitcherResultRow(
            result: result,
            unreadState: quickSwitcherUnreadStateForResult(
              result: result,
              unreadByChannelId: unreadByChannelId,
              isActive: i == state.selectedIndex,
            ),
            onTap: () => unawaited(
              executeQuickSwitcherResult(
                context: context,
                ref: ref,
                result: result,
                onClose: widget.onClose,
              ),
            ),
          ),
        ),
      );
    }
    return ListView(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.only(bottom: context.layout.s5),
      ),
      children: children,
    );
  }

  Widget _buildScrollablePlaceholder(
    BuildContext context, {
    required Widget child,
  }) {
    return ListView(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.only(bottom: context.layout.s5),
      ),
      children: <Widget>[
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.25,
          child: child,
        ),
      ],
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    FluxerLocalizations l10n, {
    required bool hasQuery,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (hasQuery)
              Text(
                l10n.quickSwitcherNoMatchesFound,
                textAlign: TextAlign.center,
                style: context.textStyles.label.copyWith(
                  color: context.colors.textTertiary,
                  height: 20 / 14,
                ),
              ),
            if (hasQuery) const SizedBox(height: 4),
            Text(
              l10n.quickSwitcherEmptyHint,
              textAlign: TextAlign.center,
              style: hasQuery
                  ? context.textStyles.timestamp.copyWith(height: 16 / 12)
                  : context.textStyles.label.copyWith(
                      color: context.colors.textTertiary,
                      height: 20 / 14,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmSelection(QuickSwitcherState state) {
    if (state.selectedIndex < 0 ||
        state.selectedIndex >= state.results.length) {
      return;
    }
    final QuickSwitcherResult result = state.results[state.selectedIndex];
    if (!isQuickSwitcherExecutable(result)) {
      return;
    }
    unawaited(
      executeQuickSwitcherResult(
        context: context,
        ref: ref,
        result: result,
        onClose: widget.onClose,
      ),
    );
  }
}
