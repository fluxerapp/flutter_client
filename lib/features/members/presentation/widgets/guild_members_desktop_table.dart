import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/presentation/menus/guild_member_context_menu.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_date_range_sheet.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_role_checkbox_item.dart';
import 'package:fluxer_app/features/members/providers/guild_members_search_provider.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/utils/guild_members_formatting.dart';
import 'package:fluxer_app/features/members/utils/guild_members_search_request_builder.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kTableMinWidth = 870;
const double _kActionsColumnWidth = 72;

class GuildMembersDesktopTable extends ConsumerStatefulWidget {
  const GuildMembersDesktopTable({required this.guildId, super.key});

  final String guildId;

  @override
  ConsumerState<GuildMembersDesktopTable> createState() =>
      _GuildMembersDesktopTableState();
}

class _GuildMembersDesktopTableState
    extends ConsumerState<GuildMembersDesktopTable> {
  late final TextEditingController _searchController;
  late final ScrollController _tableScrollController;
  late final ProviderSubscription<GuildMembersSearchState> _searchSubscription;
  bool? _activeEllipsisIsLeft;
  final TextEditingController _pageJumpController = TextEditingController();
  final FocusNode _pageJumpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _tableScrollController = ScrollController();
    _searchSubscription = ref.listenManual(
      guildMembersSearchProvider(widget.guildId),
      _handleSearchStateChange,
    );
  }

  void _handleSearchStateChange(
    GuildMembersSearchState? previous,
    GuildMembersSearchState next,
  ) {
    if (previous == null) {
      return;
    }
    final bool filtersChanged =
        previous.debouncedQuery != next.debouncedQuery ||
        previous.sortMode != next.sortMode ||
        previous.pageSize != next.pageSize ||
        previous.roleFilter != next.roleFilter ||
        previous.memberSinceFilter != next.memberSinceFilter ||
        previous.joinedProductFilter != next.joinedProductFilter ||
        previous.joinMethodFilter != next.joinMethodFilter;
    final bool pageChanged = previous.page != next.page;
    if (!filtersChanged && !pageChanged) {
      return;
    }
    _resetTableScroll();
    if (filtersChanged &&
        (_activeEllipsisIsLeft != null ||
            _pageJumpController.text.isNotEmpty)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          _activeEllipsisIsLeft = null;
          _pageJumpController.clear();
        });
      });
    }
  }

  @override
  void dispose() {
    _searchSubscription.close();
    _searchController.dispose();
    _tableScrollController.dispose();
    _pageJumpController.dispose();
    _pageJumpFocusNode.dispose();
    super.dispose();
  }

  void _resetTableScroll() {
    if (_tableScrollController.hasClients) {
      _tableScrollController.jumpTo(0);
    }
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
    final Guild? guild = ref
        .watch(guildByIdProvider(widget.guildId))
        .asData
        ?.value;
    final String? ownerId = guild?.ownerId;
    final List<String> guildFeatures = guild?.features ?? const <String>[];
    final Map<String, drift_db.Role> roles =
        ref.watch(guildRolesByIdProvider(widget.guildId)).value ??
        const <String, drift_db.Role>{};
    final List<String> inviteCodes = collectInviteCodesFromMembers(
      state.members,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _MembersTableToolbar(
            displayedCount: state.members.length,
            totalCount: state.totalCount,
            showFooter: state.showFooter,
            searchController: _searchController,
            indexing: state.indexing,
            onSearchChanged: notifier.setSearchQuery,
            onSortMenuOpen: (Offset position) => _showSortMenu(
              context,
              position: position,
              sortMode: state.sortMode,
              onChanged: notifier.setSortMode,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondaryAlt,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.colors.backgroundHeaderSecondary,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              final double tableWidth =
                                  constraints.maxWidth < _kTableMinWidth
                                  ? _kTableMinWidth
                                  : constraints.maxWidth;
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: tableWidth,
                                  height: constraints.maxHeight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      _MembersTableHeaderRow(
                                        productName: productName,
                                        memberSinceActive:
                                            state.memberSinceFilter.isActive,
                                        joinedProductActive:
                                            state.joinedProductFilter.isActive,
                                        joinMethodActive:
                                            state.joinMethodFilter.isActive,
                                        rolesActive:
                                            state.roleFilter.isNotEmpty,
                                        onMemberSinceFilterOpen:
                                            (
                                              Offset position,
                                            ) => _showDateFilterMenu(
                                              context,
                                              position: position,
                                              filter: state.memberSinceFilter,
                                              onSelected:
                                                  notifier.setMemberSinceFilter,
                                            ),
                                        onJoinedProductFilterOpen:
                                            (Offset position) =>
                                                _showDateFilterMenu(
                                                  context,
                                                  position: position,
                                                  filter:
                                                      state.joinedProductFilter,
                                                  onSelected: notifier
                                                      .setJoinedProductFilter,
                                                ),
                                        onJoinMethodFilterOpen:
                                            (
                                              Offset position,
                                            ) => _showJoinMethodFilterMenu(
                                              context,
                                              position: position,
                                              filter: state.joinMethodFilter,
                                              inviteCodes: inviteCodes,
                                              onSelected:
                                                  notifier.setJoinMethodFilter,
                                            ),
                                        onRolesFilterOpen: (Offset position) =>
                                            _showRolesFilterMenu(
                                              context,
                                              position: position,
                                              selectedRoleIds: state.roleFilter,
                                              roles: roles,
                                              onChanged: notifier.setRoleFilter,
                                            ),
                                      ),
                                      _MembersTableProgressSlot(
                                        visible: state.showTableProgress,
                                      ),
                                      Expanded(
                                        child: _buildTableBody(
                                          context,
                                          l10n,
                                          state,
                                          ownerId: ownerId,
                                          guildFeatures: guildFeatures,
                                          roles: roles,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                      ),
                    ),
                  ),
                  if (state.showFooter)
                    _MembersTableFooter(
                      state: state,
                      activeEllipsisIsLeft: _activeEllipsisIsLeft,
                      pageJumpController: _pageJumpController,
                      pageJumpFocusNode: _pageJumpFocusNode,
                      onPageChanged: notifier.setPage,
                      onPageSizeChanged: notifier.setPageSize,
                      onEllipsisTap: (bool isLeft) {
                        setState(() {
                          _activeEllipsisIsLeft = isLeft;
                          _pageJumpController.clear();
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _pageJumpFocusNode.requestFocus();
                        });
                      },
                      onEllipsisClose: () {
                        setState(() => _activeEllipsisIsLeft = null);
                      },
                      onPageJump: (int page) {
                        notifier.setPage(page);
                        setState(() => _activeEllipsisIsLeft = null);
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableBody(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildMembersSearchState state, {
    required String? ownerId,
    required List<String> guildFeatures,
    required Map<String, drift_db.Role> roles,
  }) {
    if (state.showError) {
      return _MembersTableEmptyState(message: l10n.guildMembersLoadError);
    }
    if (state.showEmptySearch) {
      return _MembersTableEmptyState(message: l10n.guildMembersEmptySearch);
    }
    if (state.showTableProgress && state.members.isEmpty) {
      return const SizedBox.expand();
    }
    return ListView.builder(
      controller: _tableScrollController,
      itemCount: state.members.length,
      itemBuilder: (BuildContext context, int index) {
        final GuildMemberDisplayData member = state.members[index];
        return _MembersDesktopTableRow(
          guildId: widget.guildId,
          member: member,
          roles: roles,
          members: state.members,
          showOwnerCrown: shouldShowOwnerCrown(
            isOwner: ownerId == member.userId,
            features: guildFeatures,
          ),
          onTap: () => unawaited(
            FluxerUserProfileSheet.show(
              context,
              userId: member.userId,
              guildId: widget.guildId,
            ),
          ),
          onActionsTap: (Offset position) => unawaited(
            GuildMemberContextMenu.show(
              context,
              ref,
              position: position,
              guildId: widget.guildId,
              member: member.toGuildMemberResponse(),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showSortMenu(
    BuildContext context, {
    required Offset position,
    required GuildMembersSortMode sortMode,
    required ValueChanged<GuildMembersSortMode> onChanged,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return <Widget>[
          FluxerMenuRadioItem(
            label: l10n.guildSettingsMembersSortNewest,
            isSelected: sortMode == GuildMembersSortMode.newest,
            onPressed: () {
              onChanged(GuildMembersSortMode.newest);
              close();
            },
          ),
          FluxerMenuRadioItem(
            label: l10n.guildMembersSortOldest,
            isSelected: sortMode == GuildMembersSortMode.oldest,
            onPressed: () {
              onChanged(GuildMembersSortMode.oldest);
              close();
            },
          ),
        ];
      },
    );
  }

  Future<void> _showDateFilterMenu(
    BuildContext context, {
    required Offset position,
    required GuildMembersDateRangeFilter filter,
    required ValueChanged<GuildMembersDateRangeFilter> onSelected,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return <Widget>[
          for (final GuildMembersDatePreset preset in guildMembersDatePresets(
            l10n,
          ))
            FluxerMenuRadioItem(
              label: preset.label,
              isSelected: isDateFilterPresetActive(filter, preset),
              onPressed: () {
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
        ];
      },
    );
  }

  Future<void> _showJoinMethodFilterMenu(
    BuildContext context, {
    required Offset position,
    required GuildMembersJoinMethodFilter filter,
    required List<String> inviteCodes,
    required ValueChanged<GuildMembersJoinMethodFilter> onSelected,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isAll = !filter.isActive;
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        final List<Widget> items = <Widget>[
          FluxerMenuRadioItem(
            label: l10n.guildMembersFilterAll,
            isSelected: isAll,
            onPressed: () {
              onSelected(GuildMembersJoinMethodFilter.empty);
              close();
            },
          ),
          for (final String code in inviteCodes)
            FluxerMenuRadioItem(
              label: l10n.guildMembersJoinSourceInviteCode(code),
              isSelected:
                  filter.inviteCodes.length == 1 &&
                  filter.inviteCodes.first == code,
              onPressed: () {
                onSelected(
                  GuildMembersJoinMethodFilter(inviteCodes: <String>[code]),
                );
                close();
              },
            ),
        ];
        return items;
      },
    );
  }

  Future<void> _showRolesFilterMenu(
    BuildContext context, {
    required Offset position,
    required List<String> selectedRoleIds,
    required Map<String, drift_db.Role> roles,
    required ValueChanged<List<String>> onChanged,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<drift_db.Role> sortedRoles = roles.values.toList()
      ..sort(
        (drift_db.Role a, drift_db.Role b) => b.position.compareTo(a.position),
      );
    List<String> localSelection = List<String>.from(selectedRoleIds);

    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return <Widget>[
          FluxerMenuItem(
            label: l10n.guildMembersClearAll,
            enabled: localSelection.isNotEmpty,
            onPressed: () {
              localSelection = <String>[];
              onChanged(localSelection);
            },
          ),
          for (final drift_db.Role role in sortedRoles)
            MemberRoleCheckboxItem(
              label: role.name,
              roleColor: guildRoleColorInt(role.color),
              isChecked: localSelection.contains(role.id),
              onTap: () {
                if (localSelection.contains(role.id)) {
                  localSelection = List<String>.from(localSelection)
                    ..remove(role.id);
                } else {
                  localSelection = List<String>.from(localSelection)
                    ..add(role.id);
                }
                onChanged(localSelection);
              },
            ),
        ];
      },
    );
  }
}

class _MembersTableToolbar extends StatelessWidget {
  const _MembersTableToolbar({
    required this.displayedCount,
    required this.totalCount,
    required this.showFooter,
    required this.searchController,
    required this.indexing,
    required this.onSearchChanged,
    required this.onSortMenuOpen,
  });

  final int displayedCount;
  final int totalCount;
  final bool showFooter;
  final TextEditingController searchController;
  final bool indexing;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<Offset> onSortMenuOpen;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  l10n.guildMembersRecentTitle,
                  style: context.textStyles.heading,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              if (showFooter) ...<Widget>[
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    l10n.guildMembersShowingCount(displayedCount, totalCount),
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textPrimaryMuted,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 224,
              child: FluxerInput(
                controller: searchController,
                hint: l10n.guildSettingsMembersSearchHint,
                enabled: !indexing,
                prefixIcon: PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 16,
                  color: context.colors.textSecondary,
                ),
                onChanged: onSearchChanged,
              ),
            ),
            const SizedBox(width: 8),
            Builder(
              builder: (BuildContext buttonContext) {
                return FluxerButton.secondary(
                  label: l10n.guildMembersSort,
                  icon: PhosphorIconsBold.sortAscending,
                  fitContent: true,
                  onPressed: indexing
                      ? null
                      : () => onSortMenuOpen(
                          contextMenuPositionAtPointer(buttonContext),
                        ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MembersTableHeaderRow extends StatelessWidget {
  const _MembersTableHeaderRow({
    required this.productName,
    required this.memberSinceActive,
    required this.joinedProductActive,
    required this.joinMethodActive,
    required this.rolesActive,
    required this.onMemberSinceFilterOpen,
    required this.onJoinedProductFilterOpen,
    required this.onJoinMethodFilterOpen,
    required this.onRolesFilterOpen,
  });

  final String productName;
  final bool memberSinceActive;
  final bool joinedProductActive;
  final bool joinMethodActive;
  final bool rolesActive;
  final ValueChanged<Offset> onMemberSinceFilterOpen;
  final ValueChanged<Offset> onJoinedProductFilterOpen;
  final ValueChanged<Offset> onJoinMethodFilterOpen;
  final ValueChanged<Offset> onRolesFilterOpen;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle labelStyle = context.textStyles.label.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.22,
      color: context.colors.textTertiary,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.backgroundHeaderSecondary),
        ),
      ),
      child: _MembersTableRowLayout(
        name: Text(l10n.guildMembersColumnName, style: labelStyle),
        memberSince: _HeaderFilterCell(
          label: l10n.guildMembersColumnMemberSince,
          labelStyle: labelStyle,
          isActive: memberSinceActive,
          semanticsLabel: l10n.guildMembersFilterMemberSince,
          onOpen: onMemberSinceFilterOpen,
        ),
        joinedProduct: _HeaderFilterCell(
          label: l10n.guildMembersColumnJoinedProduct(productName),
          labelStyle: labelStyle,
          isActive: joinedProductActive,
          semanticsLabel: l10n.guildMembersFilterJoinedProduct,
          onOpen: onJoinedProductFilterOpen,
        ),
        joinMethod: _HeaderFilterCell(
          label: l10n.guildMembersColumnJoinMethod,
          labelStyle: labelStyle,
          isActive: joinMethodActive,
          semanticsLabel: l10n.guildMembersFilterJoinMethod,
          onOpen: onJoinMethodFilterOpen,
        ),
        roles: _HeaderFilterCell(
          label: l10n.guildMembersColumnRoles,
          labelStyle: labelStyle,
          isActive: rolesActive,
          semanticsLabel: l10n.guildMembersFilterRoles,
          onOpen: onRolesFilterOpen,
        ),
        actions: const SizedBox.shrink(),
        isHeader: true,
      ),
    );
  }
}

class _HeaderFilterCell extends StatelessWidget {
  const _HeaderFilterCell({
    required this.label,
    required this.labelStyle,
    required this.isActive,
    required this.semanticsLabel,
    required this.onOpen,
  });

  final String label;
  final TextStyle labelStyle;
  final bool isActive;
  final String semanticsLabel;
  final ValueChanged<Offset> onOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            label,
            style: labelStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Builder(
          builder: (BuildContext buttonContext) {
            return Semantics(
              label: semanticsLabel,
              button: true,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                splashRadius: 14,
                onPressed: () =>
                    onOpen(contextMenuPositionAtPointer(buttonContext)),
                icon: PhosphorIcon(
                  isActive
                      ? PhosphorIconsFill.funnel
                      : PhosphorIconsBold.funnel,
                  size: 12,
                  color: isActive
                      ? context.colors.focusPrimary
                      : context.colors.textTertiary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _MembersTableProgressSlot extends StatefulWidget {
  const _MembersTableProgressSlot({required this.visible});

  final bool visible;

  @override
  State<_MembersTableProgressSlot> createState() =>
      _MembersTableProgressSlotState();
}

class _MembersTableProgressSlotState extends State<_MembersTableProgressSlot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.syncWithVisibility(
      isVisible: widget.visible,
      animationsEnabled: !MediaQuery.disableAnimationsOf(context),
    );
    return AnimatedContainer(
      duration: context.motion.normal,
      height: widget.visible ? 2 : 0,
      child: widget.visible
          ? ClipRect(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      final double width = constraints.maxWidth * 0.3;
                      final double travel = constraints.maxWidth + width;
                      final double left = -width + travel * _controller.value;
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            left: left,
                            top: 0,
                            width: width,
                            height: 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: context.colors.brandPrimary,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          : null,
    );
  }
}

class _MembersTableEmptyState extends StatelessWidget {
  const _MembersTableEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }
}

class _MembersDesktopTableRow extends ConsumerWidget {
  const _MembersDesktopTableRow({
    required this.guildId,
    required this.member,
    required this.roles,
    required this.members,
    required this.showOwnerCrown,
    required this.onTap,
    required this.onActionsTap,
  });

  final String guildId;
  final GuildMemberDisplayData member;
  final Map<String, drift_db.Role> roles;
  final List<GuildMemberDisplayData> members;
  final bool showOwnerCrown;
  final VoidCallback onTap;
  final ValueChanged<Offset> onActionsTap;

  String? _resolveInviterName() {
    final String? inviterId = member.inviterId;
    if (inviterId == null) {
      return null;
    }
    for (final GuildMemberDisplayData candidate in members) {
      if (candidate.userId == inviterId) {
        return resolveDisplayName(
          guildNickname: candidate.nickname,
          globalName: candidate.globalName,
          username: candidate.username,
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = resolveDisplayName(
      guildNickname: member.nickname,
      globalName: member.globalName,
      username: member.username,
    );
    final String? avatarUrl = member.avatarUrlFor(guildId);
    final int? avatarColor = member.avatarColor;
    final int? roleColor = resolveMemberHighestRoleColor(
      roleIds: member.roleIds,
      rolesById: roles,
      guildId: guildId,
    );
    final List<drift_db.Role> memberRoles =
        member.roleIds
            .map((String id) => roles[id])
            .whereType<drift_db.Role>()
            .toList()
          ..sort(
            (drift_db.Role a, drift_db.Role b) =>
                b.position.compareTo(a.position),
          );
    final drift_db.Role? topRole = memberRoles.isEmpty
        ? null
        : memberRoles.first;
    final int extraRolesCount = memberRoles.length > 1
        ? memberRoles.length - 1
        : 0;
    final String joinedRelative = formatGuildMemberTimestampRelative(
      context,
      member.joinedAt,
    );
    final String joinedAbsolute = formatGuildMemberTimestampAbsolute(
      member.joinedAt,
    );
    final DateTime? createdAt = member.userCreatedAt;
    final String? createdRelative = createdAt == null
        ? null
        : formatGuildMemberTimestampRelative(context, createdAt);
    final String? createdAbsolute = createdAt == null
        ? null
        : formatGuildMemberTimestampAbsolute(createdAt);
    final String joinMethodLabel = formatGuildMemberJoinMethodPillLabel(
      l10n,
      member,
    );
    final String? joinMethodTooltip = formatGuildMemberJoinMethodTooltip(
      l10n,
      member,
      inviterDisplayName: _resolveInviterName(),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: context.colors.backgroundModifierHover,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.colors.backgroundHeaderSecondary,
              ),
            ),
          ),
          child: _MembersTableRowLayout(
            name: Row(
              children: <Widget>[
                FluxerAvatar.userPresence(
                  fallbackText: displayName,
                  userId: member.userId,
                  imageUrl: avatarUrl,
                  avatarColor: avatarColor,
                  size: 32,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              displayName,
                              style: context.textStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: roleColor != null
                                    ? Color(roleColor)
                                    : context.colors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (showOwnerCrown) ...<Widget>[
                            const SizedBox(width: 4),
                            FluxerTooltip(
                              message: l10n.guildMembersCommunityOwner,
                              child: PhosphorIcon(
                                PhosphorIconsFill.crown,
                                size: 14,
                                color: context.colors.statusWarning,
                              ),
                            ),
                          ],
                        ],
                      ),
                      Text(
                        member.tag,
                        style: context.textStyles.bodySmall.copyWith(
                          fontSize: 12,
                          color: context.colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            memberSince: _TimestampCell(
              relative: joinedRelative,
              absolute: joinedAbsolute,
            ),
            joinedProduct: createdRelative == null
                ? const SizedBox.shrink()
                : _TimestampCell(
                    relative: createdRelative,
                    absolute: createdAbsolute!,
                  ),
            joinMethod: _JoinMethodPill(
              label: joinMethodLabel,
              tooltip: joinMethodTooltip,
            ),
            roles: _RolesCell(
              topRole: topRole,
              extraRolesCount: extraRolesCount,
              memberRoles: memberRoles,
              displayName: displayName,
            ),
            actions: Builder(
              builder: (BuildContext buttonContext) {
                return Center(
                  child: Material(
                    color: context.colors.backgroundSecondary,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 28,
                        minHeight: 28,
                      ),
                      tooltip: l10n.chatMessageMore,
                      onPressed: () => onActionsTap(
                        contextMenuPositionAtPointer(buttonContext),
                      ),
                      icon: PhosphorIcon(
                        PhosphorIconsBold.dotsThreeVertical,
                        size: 18,
                        color: context.colors.textTertiary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _MembersTableRowLayout extends StatelessWidget {
  const _MembersTableRowLayout({
    required this.name,
    this.memberSince,
    this.joinedProduct,
    this.joinMethod,
    this.roles,
    this.actions,
    this.isHeader = false,
  });

  final Widget name;
  final Widget? memberSince;
  final Widget? joinedProduct;
  final Widget? joinMethod;
  final Widget? roles;
  final Widget? actions;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = isHeader
        ? const EdgeInsets.symmetric(horizontal: 14, vertical: 5)
        : const EdgeInsets.symmetric(horizontal: 14);

    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(flex: 220, child: name),
          Expanded(flex: 100, child: memberSince ?? const SizedBox.shrink()),
          Expanded(flex: 100, child: joinedProduct ?? const SizedBox.shrink()),
          Expanded(flex: 115, child: joinMethod ?? const SizedBox.shrink()),
          Expanded(flex: 135, child: roles ?? const SizedBox.shrink()),
          SizedBox(
            width: _kActionsColumnWidth,
            child: actions ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _TimestampCell extends StatelessWidget {
  const _TimestampCell({required this.relative, required this.absolute});

  final String relative;
  final String absolute;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: FluxerTooltip(
          message: absolute,
          child: Text(
            relative,
            style: context.textStyles.bodySmall.copyWith(
              fontSize: 13,
              color: context.colors.textPrimaryMuted,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class _JoinMethodPill extends StatelessWidget {
  const _JoinMethodPill({required this.label, this.tooltip});

  final String label;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final Widget pill = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.textStyles.bodySmall.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: context.colors.textPrimaryMuted,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    return SizedBox(
      height: 48,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: tooltip == null
            ? pill
            : FluxerTooltip(message: tooltip, child: pill),
      ),
    );
  }
}

class _RolesCell extends StatelessWidget {
  const _RolesCell({
    required this.topRole,
    required this.extraRolesCount,
    required this.memberRoles,
    required this.displayName,
  });

  final drift_db.Role? topRole;
  final int extraRolesCount;
  final List<drift_db.Role> memberRoles;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    if (topRole == null) {
      return const SizedBox(height: 48);
    }

    final int roleColor = guildRoleColorInt(topRole!.color);
    final Color dotColor = Color(roleColor);
    final Color pillBackground = Color.alphaBlend(
      dotColor.withValues(alpha: 0.2),
      context.colors.backgroundSecondaryAlt,
    );

    return SizedBox(
      height: 48,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: pillBackground,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      topRole!.name,
                      style: context.textStyles.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (extraRolesCount > 0) ...<Widget>[
            const SizedBox(width: 4),
            Builder(
              builder: (BuildContext buttonContext) {
                return FluxerTooltip(
                  message: FluxerLocalizations.of(
                    context,
                  ).guildMembersViewAllRoles,
                  child: Material(
                    color: context.colors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(4),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () => _showAllRolesMenu(
                        context,
                        position: contextMenuPositionAtPointer(buttonContext),
                        memberRoles: memberRoles,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        child: Text(
                          '+$extraRolesCount',
                          style: context.textStyles.bodySmall.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: context.colors.textPrimaryMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _showAllRolesMenu(
    BuildContext context, {
    required Offset position,
    required List<drift_db.Role> memberRoles,
  }) async {
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return <Widget>[
          for (final drift_db.Role role in memberRoles)
            FluxerMenuItem(label: role.name, onPressed: close),
        ];
      },
    );
  }
}

class _MembersTableFooter extends StatelessWidget {
  const _MembersTableFooter({
    required this.state,
    required this.activeEllipsisIsLeft,
    required this.pageJumpController,
    required this.pageJumpFocusNode,
    required this.onPageChanged,
    required this.onPageSizeChanged,
    required this.onEllipsisTap,
    required this.onEllipsisClose,
    required this.onPageJump,
  });

  final GuildMembersSearchState state;
  final bool? activeEllipsisIsLeft;
  final TextEditingController pageJumpController;
  final FocusNode pageJumpFocusNode;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onPageSizeChanged;
  final ValueChanged<bool> onEllipsisTap;
  final VoidCallback onEllipsisClose;
  final ValueChanged<int> onPageJump;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<GuildMembersPaginationItem> pages =
        buildGuildMembersPaginationRange(
          currentPage: state.page,
          totalPages: state.totalPages,
        );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: context.colors.backgroundHeaderSecondary),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: <Widget>[
            Text(
              l10n.guildMembersRowsPerPage,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
            const SizedBox(width: 8),
            DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: state.pageSize,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textPrimary,
                ),
                items: guildMembersPageSizeOptions
                    .map(
                      (int size) => DropdownMenuItem<int>(
                        value: size,
                        child: Text('$size'),
                      ),
                    )
                    .toList(),
                onChanged: state.isSearching
                    ? null
                    : (int? value) {
                        if (value != null) {
                          onPageSizeChanged(value);
                        }
                      },
              ),
            ),
            const Spacer(),
            if (state.showPagination)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final GuildMembersPaginationItem item in pages)
                    switch (item) {
                      GuildMembersPageNumber(:final int page) => Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: _PageButton(
                          page: page,
                          isActive: page == state.page,
                          enabled: !state.isSearching,
                          onTap: () => onPageChanged(page),
                        ),
                      ),
                      GuildMembersPaginationEllipsis(:final bool isLeft) =>
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: activeEllipsisIsLeft == isLeft
                              ? SizedBox(
                                  width: 56,
                                  height: 32,
                                  child: TextField(
                                    controller: pageJumpController,
                                    focusNode: pageJumpFocusNode,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 8,
                                          ),
                                      filled: true,
                                      fillColor:
                                          context.colors.backgroundTertiary,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        borderSide: BorderSide(
                                          color: context
                                              .colors
                                              .backgroundModifierAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          999,
                                        ),
                                        borderSide: BorderSide(
                                          color: context
                                              .colors
                                              .backgroundModifierAccent,
                                        ),
                                      ),
                                    ),
                                    onSubmitted: (String value) {
                                      final int? page = int.tryParse(value);
                                      if (page != null &&
                                          page >= 1 &&
                                          page <= state.totalPages) {
                                        onPageJump(page);
                                      } else {
                                        onEllipsisClose();
                                      }
                                    },
                                    onEditingComplete: onEllipsisClose,
                                  ),
                                )
                              : _EllipsisButton(
                                  enabled: !state.isSearching,
                                  onTap: () => onEllipsisTap(isLeft),
                                ),
                        ),
                    },
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.page,
    required this.isActive,
    required this.enabled,
    required this.onTap,
  });

  final int page;
  final bool isActive;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? context.colors.brandPrimary
          : context.colors.backgroundTertiary,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: Text(
              '$page',
              style: context.textStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : context.colors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EllipsisButton extends StatelessWidget {
  const _EllipsisButton({required this.enabled, required this.onTap});

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.backgroundTertiary,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: Text(
              '…',
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
