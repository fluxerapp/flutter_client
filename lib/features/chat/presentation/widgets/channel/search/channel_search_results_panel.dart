import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_result_group_header.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_result_message_card.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_header_search_provider.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kChannelSearchResultsPanelWidth = 420;

class ChannelSearchResultsPanel extends ConsumerWidget {
  const ChannelSearchResultsPanel({
    required this.channelId,
    required this.guildId,
    required this.onClose,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChannelSearchState state = ref.watch(
      channelSearchProvider(channelId, guildId),
    );
    final ChannelHeaderSearchState headerState = ref.watch(
      channelHeaderSearchProvider,
    );
    final bool isGuildChannel = guildId != null;
    final bool showGuildMeta = shouldShowGuildMetaForSearchScope(
      state.query.scope,
    );

    return SizedBox(
      width: kChannelSearchResultsPanelWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondary,
          border: Border(
            left: BorderSide(color: context.colors.backgroundModifierHover),
          ),
        ),
        child: Column(
          children: <Widget>[
            _SearchResultsHeader(
              l10n: l10n,
              state: state,
              headerScope: headerState.scope,
              headerSort: headerState.sort,
              isGuildChannel: isGuildChannel,
              onScopeTap: (Offset position) => unawaited(
                _openScopeMenu(
                  context: context,
                  ref: ref,
                  anchorPosition: position,
                  isGuildChannel: isGuildChannel,
                  currentScope: headerState.scope,
                ),
              ),
              onSortTap: (Offset position) => unawaited(
                _openSortMenu(
                  context: context,
                  ref: ref,
                  anchorPosition: position,
                  currentSort: headerState.sort,
                ),
              ),
            ),
            Expanded(
              child: _SearchResultsBody(
                l10n: l10n,
                state: state,
                showGuildMeta: showGuildMeta,
                contextChannelId: channelId,
                onRetry: () => unawaited(_retrySearch(ref)),
                onJump: (Message message, {String? guildId}) => unawaited(
                  _jumpToMessage(
                    ref: ref,
                    context: context,
                    message: message,
                    guildId: guildId,
                    onClose: onClose,
                  ),
                ),
                onNavigateToChannel:
                    (String targetChannelId, String? targetGuildId) =>
                        unawaited(
                          _navigateToChannel(
                            ref: ref,
                            context: context,
                            channelId: targetChannelId,
                            guildId: targetGuildId,
                          ),
                        ),
                onPageSelected: (int page) => unawaited(
                  ref
                      .read(channelSearchProvider(channelId, guildId).notifier)
                      .goToPage(page),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _retrySearch(WidgetRef ref) async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(channelId, guildId),
    );
    await ref
        .read(channelSearchProvider(channelId, guildId).notifier)
        .search(query: state.query);
  }

  Future<void> _jumpToMessage({
    required WidgetRef ref,
    required BuildContext context,
    required Message message,
    required VoidCallback onClose,
    String? guildId,
  }) async {
    // Captured before the awaits: the panel is dismissed mid-jump, and a ref
    // read after that would be dead.
    final ProviderContainer container = ref.container;
    final db.FluxerDatabase database = container.read(fluxerDatabaseProvider);
    await database.messageDao.upsertMessage(message.toCompanion());
    final String? resolvedGuildId =
        guildId ??
        (await database.channelDao.getChannelById(message.channelId))?.guildId;
    if (!context.mounted) {
      return;
    }
    final ChannelJumpLink link = MessageJumpLink(
      scope: resolvedGuildId != null && resolvedGuildId.isNotEmpty
          ? resolvedGuildId
          : '@me',
      channelId: message.channelId,
      messageId: message.id,
    );
    await navigateToChannelJumpLink(
      container: container,
      context: context,
      link: link,
    );
    onClose();
  }

  Future<void> _navigateToChannel({
    required WidgetRef ref,
    required BuildContext context,
    required String channelId,
    String? guildId,
  }) async {
    final ChannelJumpLink link = ChannelJumpLink(
      scope: guildId ?? '@me',
      channelId: channelId,
    );
    await navigateToChannelJumpLink(
      container: ref.container,
      context: context,
      link: link,
    );
  }

  Future<void> _openScopeMenu({
    required BuildContext context,
    required WidgetRef ref,
    required Offset anchorPosition,
    required bool isGuildChannel,
    required MessageSearchScopeFilter currentScope,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<MessageSearchScopeFilter> options = channelSearchScopeOptions(
      isGuildChannel: isGuildChannel,
    );
    final MessageSearchScopeFilter? selected = isMobileLayout(context)
        ? await _showScopeBottomSheet(
            context: context,
            l10n: l10n,
            options: options,
            isGuildChannel: isGuildChannel,
            currentScope: currentScope,
          )
        : await _showScopeActionMenu(
            context: context,
            l10n: l10n,
            anchorPosition: anchorPosition,
            options: options,
            isGuildChannel: isGuildChannel,
            currentScope: currentScope,
          );
    if (selected == null || selected == currentScope) {
      return;
    }
    ref.read(channelHeaderSearchProvider.notifier).setScope(selected);
    final ChannelSearchState state = ref.read(
      channelSearchProvider(channelId, guildId),
    );
    await ref
        .read(channelSearchProvider(channelId, guildId).notifier)
        .search(query: state.query.copyWith(uiScope: selected, page: 1));
  }

  Future<void> _openSortMenu({
    required BuildContext context,
    required WidgetRef ref,
    required Offset anchorPosition,
    required MessageSearchSortFilter currentSort,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MessageSearchSortFilter? selected = isMobileLayout(context)
        ? await _showSortBottomSheet(
            context: context,
            l10n: l10n,
            currentSort: currentSort,
          )
        : await _showSortActionMenu(
            context: context,
            l10n: l10n,
            anchorPosition: anchorPosition,
            currentSort: currentSort,
          );
    if (selected == null || selected == currentSort) {
      return;
    }
    ref.read(channelHeaderSearchProvider.notifier).setSort(selected);
    final ChannelSearchState state = ref.read(
      channelSearchProvider(channelId, guildId),
    );
    await ref
        .read(channelSearchProvider(channelId, guildId).notifier)
        .search(query: state.query.copyWith(uiSort: selected, page: 1));
  }

  Future<MessageSearchScopeFilter?> _showScopeBottomSheet({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required List<MessageSearchScopeFilter> options,
    required bool isGuildChannel,
    required MessageSearchScopeFilter currentScope,
  }) {
    return FluxerBottomSheet.show<MessageSearchScopeFilter>(
      context,
      title: l10n.channelDetailsSearchIn,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final MessageSearchScopeFilter value in options) ...<Widget>[
                ListTile(
                  leading: PhosphorIcon(channelSearchScopeIcon(value)),
                  title: Text(
                    channelSearchScopeLabel(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                  ),
                  subtitle: Text(
                    channelSearchScopeDescription(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                  ),
                  selected: currentScope == value,
                  onTap: () => Navigator.of(sheetContext).pop(value),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<MessageSearchScopeFilter?> _showScopeActionMenu({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required Offset anchorPosition,
    required List<MessageSearchScopeFilter> options,
    required bool isGuildChannel,
    required MessageSearchScopeFilter currentScope,
  }) async {
    MessageSearchScopeFilter? selected;
    await FluxerActionMenu.show(
      context,
      position: anchorPosition,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        for (final MessageSearchScopeFilter value in options)
          FluxerMenuRadioItem(
            label: channelSearchScopeLabel(
              l10n,
              value,
              isGuildChannel: isGuildChannel,
            ),
            hint: channelSearchScopeDescription(
              l10n,
              value,
              isGuildChannel: isGuildChannel,
            ),
            isSelected: currentScope == value,
            onPressed: () {
              selected = value;
              close();
            },
          ),
      ],
    );
    return selected;
  }

  Future<MessageSearchSortFilter?> _showSortBottomSheet({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required MessageSearchSortFilter currentSort,
  }) {
    return FluxerBottomSheet.show<MessageSearchSortFilter>(
      context,
      title: l10n.channelDetailsSearchSortBy,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final MessageSearchSortFilter value
                  in MessageSearchSortFilter.values) ...<Widget>[
                ListTile(
                  leading: PhosphorIcon(channelSearchSortIcon(value)),
                  title: Text(channelSearchSortLabel(l10n, value)),
                  subtitle: Text(channelSearchSortDescription(l10n, value)),
                  selected: currentSort == value,
                  onTap: () => Navigator.of(sheetContext).pop(value),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Future<MessageSearchSortFilter?> _showSortActionMenu({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required Offset anchorPosition,
    required MessageSearchSortFilter currentSort,
  }) async {
    MessageSearchSortFilter? selected;
    await FluxerActionMenu.show(
      context,
      position: anchorPosition,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        for (final MessageSearchSortFilter value
            in MessageSearchSortFilter.values)
          FluxerMenuRadioItem(
            label: channelSearchSortLabel(l10n, value),
            hint: channelSearchSortDescription(l10n, value),
            isSelected: currentSort == value,
            onPressed: () {
              selected = value;
              close();
            },
          ),
      ],
    );
    return selected;
  }
}

class _SearchResultsHeader extends StatelessWidget {
  const _SearchResultsHeader({
    required this.l10n,
    required this.state,
    required this.headerScope,
    required this.headerSort,
    required this.isGuildChannel,
    required this.onScopeTap,
    required this.onSortTap,
  });

  final FluxerLocalizations l10n;
  final ChannelSearchState state;
  final MessageSearchScopeFilter headerScope;
  final MessageSearchSortFilter headerSort;
  final bool isGuildChannel;
  final void Function(Offset anchorPosition) onScopeTap;
  final void Function(Offset anchorPosition) onSortTap;

  @override
  Widget build(BuildContext context) {
    final bool showActions = !state.isSearching && !state.indexing;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.backgroundModifierHover),
        ),
      ),
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              if (state.isSearching || state.indexing)
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: FluxerLoadingSpinner(),
                  ),
                ),
              Expanded(
                child: Text(
                  _title(l10n, state),
                  style: context.textStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.colors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (showActions) ...<Widget>[
                Builder(
                  builder: (BuildContext buttonContext) {
                    return FluxerButton.secondary(
                      icon: channelSearchScopeIcon(headerScope),
                      size: FluxerButtonSize.compact,
                      isSquare: true,
                      fitContent: true,
                      semanticLabel: channelSearchScopeLabel(
                        l10n,
                        headerScope,
                        isGuildChannel: isGuildChannel,
                      ),
                      onPressed: () {
                        final RenderBox? box =
                            buttonContext.findRenderObject() as RenderBox?;
                        if (box == null) {
                          return;
                        }
                        onScopeTap(
                          box.localToGlobal(
                            Offset(box.size.width, box.size.height),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(width: 8),
                Builder(
                  builder: (BuildContext buttonContext) {
                    return FluxerButton.secondary(
                      icon: channelSearchSortIcon(headerSort),
                      size: FluxerButtonSize.compact,
                      isSquare: true,
                      fitContent: true,
                      semanticLabel: l10n.channelDetailsSearchSortBy,
                      onPressed: () {
                        final RenderBox? box =
                            buttonContext.findRenderObject() as RenderBox?;
                        if (box == null) {
                          return;
                        }
                        onSortTap(
                          box.localToGlobal(
                            Offset(box.size.width, box.size.height),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _title(FluxerLocalizations l10n, ChannelSearchState state) {
    if (state.isSearching) {
      return l10n.channelDetailsSearchTitle;
    }
    if (state.indexing) {
      return l10n.channelDetailsSearchIndexingTitle;
    }
    if (state.hasSearched && state.errorMessage == null) {
      return l10n.channelDetailsSearchResultCount(state.total);
    }
    return l10n.channelDetailsSearchResultTitle;
  }
}

class _SearchResultsBody extends StatelessWidget {
  const _SearchResultsBody({
    required this.l10n,
    required this.state,
    required this.showGuildMeta,
    required this.contextChannelId,
    required this.onRetry,
    required this.onJump,
    required this.onNavigateToChannel,
    required this.onPageSelected,
  });

  final FluxerLocalizations l10n;
  final ChannelSearchState state;
  final bool showGuildMeta;
  final String contextChannelId;
  final VoidCallback onRetry;
  final void Function(Message message, {String? guildId}) onJump;
  final void Function(String channelId, String? guildId) onNavigateToChannel;
  final ValueChanged<int> onPageSelected;

  @override
  Widget build(BuildContext context) {
    if (!state.hasSearched) {
      return _emptyState(
        context,
        icon: PhosphorIconsFill.magnifyingGlass,
        title: l10n.channelDetailsSearchEmptyTitle,
        body: l10n.channelDetailsSearchEmptyBody,
      );
    }
    if (state.isSearching && state.results.isEmpty) {
      return const SizedBox.shrink();
    }
    if (state.errorMessage != null) {
      return _errorState(context, state.errorMessage!);
    }
    if (state.indexing) {
      return _emptyState(
        context,
        icon: PhosphorIconsFill.clockCounterClockwise,
        title: l10n.channelDetailsSearchIndexingTitle,
        body: l10n.channelDetailsSearchIndexingBody,
        iconSize: 64,
      );
    }
    if (state.results.isEmpty) {
      return _emptyState(
        context,
        icon: PhosphorIconsFill.magnifyingGlass,
        title: l10n.channelDetailsSearchNoResultsTitle,
        body: l10n.channelDetailsSearchNoResultsBody,
        iconSize: 80,
      );
    }

    final Map<String, List<MessageSearchResultEntry>> grouped =
        <String, List<MessageSearchResultEntry>>{};
    for (final MessageSearchResultEntry entry in state.results) {
      grouped
          .putIfAbsent(
            entry.message.channelId,
            () => <MessageSearchResultEntry>[],
          )
          .add(entry);
    }

    const int hitsPerPage = kMessageSearchPageSize;
    final int totalPages = math.max(1, (state.total / hitsPerPage).ceil());
    final int currentPage = state.query.page;

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            children: <Widget>[
              for (final MapEntry<String, List<MessageSearchResultEntry>> group
                  in grouped.entries) ...<Widget>[
                ChannelSearchResultGroupHeader(
                  channelId: group.key,
                  showGuildMeta: showGuildMeta,
                  isFirst: group.key == grouped.keys.first,
                  onTap: () =>
                      onNavigateToChannel(group.key, group.value.first.guildId),
                ),
                for (final MessageSearchResultEntry entry in group.value)
                  ChannelSearchResultMessageCard(
                    message: entry.message,
                    guildId: entry.guildId,
                    onJump: () => onJump(entry.message, guildId: entry.guildId),
                  ),
              ],
            ],
          ),
        ),
        if (totalPages > 1)
          _SearchPaginationBar(
            currentPage: currentPage,
            totalPages: totalPages,
            onPageSelected: onPageSelected,
          ),
      ],
    );
  }

  Widget _emptyState(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String body,
    double iconSize = 40,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(
              icon,
              size: iconSize,
              color: context.colors.textTertiary,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              body,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _errorState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              message,
              style: context.textStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FluxerButton.secondary(label: l10n.retry, onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}

class _SearchPaginationBar extends StatelessWidget {
  const _SearchPaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageSelected;

  @override
  Widget build(BuildContext context) {
    final List<int> pages = _visiblePages(currentPage, totalPages);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (final int page in pages) ...<Widget>[
            _PageButton(
              page: page,
              isActive: page == currentPage,
              onTap: () => onPageSelected(page),
            ),
            if (page != pages.last) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }

  List<int> _visiblePages(int current, int total) {
    if (total <= 7) {
      return List<int>.generate(total, (int index) => index + 1);
    }
    final int start = math.max(1, current - 2);
    final int end = math.min(total, start + 4);
    return List<int>.generate(end - start + 1, (int index) => start + index);
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.page,
    required this.isActive,
    required this.onTap,
  });

  final int page;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? context.colors.brandPrimary
          : context.colors.backgroundTertiary,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: Text(
              '$page',
              style: context.textStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
