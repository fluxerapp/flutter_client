import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_member_search_row.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_date_range_sheet.dart';
import 'package:fluxer_app/features/members/providers/guild_members_search_provider.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMembersMobileListView extends ConsumerStatefulWidget {
  const GuildMembersMobileListView({
    required this.guildId,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildMembersMobileListView> createState() =>
      _GuildMembersMobileListViewState();
}

class _GuildMembersMobileListViewState
    extends ConsumerState<GuildMembersMobileListView> {
  late final TextEditingController _searchController;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _ownedScrollController = widget.scrollController == null
        ? ScrollController()
        : null;
    _ownedScrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final double max = _scrollController.position.maxScrollExtent;
    if (_scrollController.offset >= max - 200) {
      unawaited(
        ref
            .read(guildMembersSearchProvider(widget.guildId).notifier)
            .loadMore(),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _ownedScrollController?.removeListener(_onScroll);
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildMembersSearchState state = ref.watch(
      guildMembersSearchProvider(widget.guildId),
    );
    final GuildMembersSearch notifier = ref.read(
      guildMembersSearchProvider(widget.guildId).notifier,
    );
    final InstanceConfigSnapshot instance = ref.watch(activeInstanceProvider);
    final String productName = instance.instanceDisplayName ?? 'Fluxer';
    final String? ownerId = ref
        .watch(guildByIdProvider(widget.guildId))
        .value
        ?.ownerId;
    final Map<String, drift_db.Role> roles =
        ref.watch(guildRolesByIdProvider(widget.guildId)).value ??
        const <String, drift_db.Role>{};

    return FluxerRefreshScrollView(
      controller: _scrollController,
      onRefresh: () => ref
          .read(guildMembersSearchProvider(widget.guildId).notifier)
          .reload(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  l10n.guildMembersRecentTitle,
                  style: context.textStyles.heading,
                ),
                if (state.initialLoadDone && !state.hasError) ...<Widget>[
                  const SizedBox(height: 4),
                  Text(
                    l10n.guildSettingsMembersResultsTitle(state.totalCount),
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                FluxerInput(
                  controller: _searchController,
                  hint: l10n.guildSettingsMembersSearchHint,
                  enabled: !state.indexing,
                  prefixIcon: PhosphorIcon(
                    PhosphorIconsBold.magnifyingGlass,
                    size: 20,
                    color: context.colors.textSecondary,
                  ),
                  onChanged: notifier.setSearchQuery,
                ),
                if (state.indexing) ...<Widget>[
                  const SizedBox(height: 8),
                  Text(
                    l10n.guildMembersIndexing,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                  LinearProgressIndicator(
                    color: context.colors.brandPrimary,
                    backgroundColor: context.colors.backgroundSecondaryAlt,
                  ),
                ],
                const SizedBox(height: 8),
                _MobileFilterChips(
                  guildId: widget.guildId,
                  state: state,
                  productName: productName,
                  roles: roles,
                ),
              ],
            ),
          ),
        ),
        if (state.showProgress && state.members.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
            ),
          )
        else if (state.showError)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.guildMembersLoadError,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textPrimaryMuted,
                  ),
                ),
              ),
            ),
          )
        else if (state.showEmptySearch)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                l10n.guildMembersEmptySearch,
                style: TextStyle(color: context.colors.textPrimaryMuted),
              ),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index >= state.members.length) {
                  return state.isLoadingMore
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: FluxerLoadingSpinner(
                              color: context.colors.brandPrimary,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }
                final GuildMemberDisplayData member = state.members[index];
                return RepaintBoundary(
                  key: ValueKey<String>(member.userId),
                  child: GuildMemberSearchRow(
                    guildId: widget.guildId,
                    member: member,
                    compact: true,
                    isOwner: ownerId == member.userId,
                    onTap: () => unawaited(
                      FluxerUserProfileSheet.show(
                        context,
                        userId: member.userId,
                        guildId: widget.guildId,
                      ),
                    ),
                  ),
                );
              },
              childCount: state.members.length + (state.isLoadingMore ? 1 : 0),
              findChildIndexCallback: (Key key) {
                if (key is! ValueKey<String>) {
                  return null;
                }
                final int index = state.members.indexWhere(
                  (GuildMemberDisplayData member) => member.userId == key.value,
                );
                return index == -1 ? null : index;
              },
            ),
          ),
      ],
    );
  }
}

class _MobileFilterChips extends ConsumerWidget {
  const _MobileFilterChips({
    required this.guildId,
    required this.state,
    required this.productName,
    required this.roles,
  });

  final String guildId;
  final GuildMembersSearchState state;
  final String productName;
  final Map<String, drift_db.Role> roles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildMembersSearch notifier = ref.read(
      guildMembersSearchProvider(guildId).notifier,
    );
    final List<_MembersFilterChipConfig> chips = <_MembersFilterChipConfig>[
      _MembersFilterChipConfig(
        label: l10n.guildMembersSort,
        isActive: state.sortMode != GuildMembersSortMode.newest,
        onTap: state.indexing
            ? null
            : () => unawaited(_showSortSheet(context, notifier)),
      ),
      _MembersFilterChipConfig(
        label: l10n.guildMembersColumnMemberSince,
        isActive: state.memberSinceFilter.isActive,
        onTap: state.indexing
            ? null
            : () => unawaited(
                _showDateSheet(
                  context,
                  l10n.guildMembersFilterMemberSince,
                  state.memberSinceFilter,
                  notifier.setMemberSinceFilter,
                ),
              ),
      ),
      _MembersFilterChipConfig(
        label: l10n.guildMembersColumnJoinedProduct(productName),
        isActive: state.joinedProductFilter.isActive,
        onTap: state.indexing
            ? null
            : () => unawaited(
                _showDateSheet(
                  context,
                  l10n.guildMembersFilterJoinedProduct,
                  state.joinedProductFilter,
                  notifier.setJoinedProductFilter,
                ),
              ),
      ),
      _MembersFilterChipConfig(
        label: l10n.guildMembersColumnJoinMethod,
        isActive: state.joinMethodFilter.isActive,
        onTap: state.indexing
            ? null
            : () => unawaited(_showJoinMethodSheet(context, ref)),
      ),
      _MembersFilterChipConfig(
        label: l10n.guildMembersColumnRoles,
        isActive: state.roleFilter.isNotEmpty,
        onTap: state.indexing
            ? null
            : () => unawaited(_showRolesSheet(context, ref, roles)),
      ),
    ];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: context.layout.s2),
        itemBuilder: (BuildContext context, int index) {
          final _MembersFilterChipConfig chip = chips[index];
          return _MembersFilterPill(
            label: chip.label,
            isActive: chip.isActive,
            onTap: chip.onTap,
          );
        },
      ),
    );
  }

  Future<void> _showSortSheet(
    BuildContext context,
    GuildMembersSearch notifier,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildMembersSortMode current = state.sortMode;
    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.guildMembersSort,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerBottomSheetGroupColumn(
            children: <Widget>[
              FluxerMenuGroup(
                children: <Widget>[
                  FluxerBottomSheetMenuItem(
                    label: l10n.guildSettingsMembersSortNewest,
                    isSelected: current == GuildMembersSortMode.newest,
                    onTap: () {
                      notifier.setSortMode(GuildMembersSortMode.newest);
                      close();
                    },
                  ),
                  FluxerBottomSheetMenuItem(
                    label: l10n.guildMembersSortOldest,
                    isSelected: current == GuildMembersSortMode.oldest,
                    onTap: () {
                      notifier.setSortMode(GuildMembersSortMode.oldest);
                      close();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDateSheet(
    BuildContext context,
    String title,
    GuildMembersDateRangeFilter filter,
    ValueChanged<GuildMembersDateRangeFilter> onSelected,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: title,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return _MembersFilterOptionsList(
              sheetContext: sheetContext,
              scrollController: scrollController,
              children: <Widget>[
                for (final GuildMembersDatePreset preset
                    in guildMembersDatePresets(l10n))
                  FluxerBottomSheetMenuItem(
                    label: preset.label,
                    isSelected: isDateFilterPresetActive(filter, preset),
                    onTap: () {
                      close();
                      if (preset.custom) {
                        unawaited(
                          GuildMembersDateRangeSheet.show(
                            context,
                            initial: filter,
                            onApply: onSelected,
                          ),
                        );
                        return;
                      }
                      if (preset.duration == null) {
                        onSelected(GuildMembersDateRangeFilter.empty);
                        return;
                      }
                      onSelected(datePresetToFilter(preset.duration!));
                    },
                  ),
              ],
            );
          },
    );
  }

  Future<void> _showJoinMethodSheet(BuildContext context, WidgetRef ref) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildMembersSearch notifier = ref.read(
      guildMembersSearchProvider(guildId).notifier,
    );
    final GuildMembersJoinMethodFilter filter = state.joinMethodFilter;
    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.guildMembersFilterJoinMethod,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return _MembersFilterOptionsList(
              sheetContext: sheetContext,
              scrollController: scrollController,
              children: <Widget>[
                FluxerBottomSheetMenuItem(
                  label: l10n.guildMembersFilterAll,
                  isSelected: !filter.isActive,
                  onTap: () {
                    notifier.setJoinMethodFilter(
                      GuildMembersJoinMethodFilter.empty,
                    );
                    close();
                  },
                ),
                for (final JoinSourceType type in JoinSourceType.$valuesDefined)
                  FluxerBottomSheetMenuItem(
                    label: _joinSourceLabel(l10n, type),
                    isSelected: filter.sourceTypes.contains(type),
                    onTap: () {
                      final List<JoinSourceType> next =
                          List<JoinSourceType>.from(filter.sourceTypes);
                      if (next.contains(type)) {
                        next.remove(type);
                      } else {
                        next.add(type);
                      }
                      notifier.setJoinMethodFilter(
                        filter.copyWith(sourceTypes: next),
                      );
                    },
                  ),
              ],
            );
          },
    );
  }

  Future<void> _showRolesSheet(
    BuildContext context,
    WidgetRef ref,
    Map<String, drift_db.Role> roles,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildMembersSearch notifier = ref.read(
      guildMembersSearchProvider(guildId).notifier,
    );
    final List<String> selected = state.roleFilter;
    final List<drift_db.Role> sorted = roles.values.toList()
      ..sort(
        (drift_db.Role a, drift_db.Role b) => b.position.compareTo(a.position),
      );
    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.guildMembersFilterRoles,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return _MembersFilterOptionsList(
              sheetContext: sheetContext,
              scrollController: scrollController,
              children: <Widget>[
                FluxerBottomSheetMenuItem(
                  label: l10n.guildMembersClearAll,
                  isSelected: selected.isEmpty,
                  onTap: () {
                    notifier.setRoleFilter(<String>[]);
                    close();
                  },
                ),
                for (final drift_db.Role role in sorted)
                  FluxerBottomSheetMenuItem(
                    label: role.name,
                    isSelected: selected.contains(role.id),
                    onTap: () {
                      final List<String> next = List<String>.from(selected);
                      if (next.contains(role.id)) {
                        next.remove(role.id);
                      } else {
                        next.add(role.id);
                      }
                      notifier.setRoleFilter(next);
                    },
                  ),
              ],
            );
          },
    );
  }

  String _joinSourceLabel(FluxerLocalizations l10n, JoinSourceType type) {
    return switch (type) {
      JoinSourceType.creator => l10n.guildMembersJoinSourceCreator,
      JoinSourceType.instantInvite => l10n.guildMembersJoinSourceInvite,
      JoinSourceType.vanityUrl => l10n.guildMembersJoinSourceVanityUrl,
      JoinSourceType.botInvite => l10n.guildMembersJoinSourceBotInvite,
      JoinSourceType.adminForceAdd => l10n.guildMembersJoinSourcePlatformAdmin,
      JoinSourceType.discovery => l10n.guildMembersJoinSourceDiscovery,
      JoinSourceType.$unknown => l10n.guildMembersJoinMethodUnknown,
    };
  }
}

class _MembersFilterChipConfig {
  const _MembersFilterChipConfig({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback? onTap;
}

class _MembersFilterOptionsList extends StatelessWidget {
  const _MembersFilterOptionsList({
    required this.sheetContext,
    required this.scrollController,
    required this.children,
  });

  final BuildContext sheetContext;
  final ScrollController scrollController;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final layout = sheetContext.layout;
    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        sheetContext,
        padding: EdgeInsets.only(bottom: layout.s4),
      ),
      children: <Widget>[
        FluxerBottomSheetSection(child: FluxerMenuGroup(children: children)),
      ],
    );
  }
}

class _MembersFilterPill extends StatelessWidget {
  const _MembersFilterPill({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = isActive
        ? colors.brandPrimary
        : colors.backgroundSecondaryAlt;
    final borderColor = isActive ? colors.brandPrimary : colors.borderColor;
    final labelColor = isActive ? Colors.white : colors.textSecondary;

    final Widget chip = Material(
      color: background,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          alignment: Alignment.center,
          child: Text(
            label,
            style: context.textStyles.label.copyWith(
              color: labelColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    if (onTap == null) {
      return Opacity(opacity: 0.5, child: chip);
    }
    return chip;
  }
}
