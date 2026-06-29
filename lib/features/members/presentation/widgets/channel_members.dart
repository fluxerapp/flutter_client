import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_member_row.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_dart/gateway.dart';

const double _kPanelWidth = 264;

class ChannelMembers extends ConsumerStatefulWidget {
  const ChannelMembers({super.key});

  @override
  ConsumerState<ChannelMembers> createState() => _ChannelMembersState();
}

class _ChannelMembersState extends ConsumerState<ChannelMembers> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(memberListPanelActiveProvider.notifier).active = true;
    _scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String? guildId = ref.read(activeGuildIdProvider);
      if (guildId != null) {
        prefetchGuildRolesIfMissing(
          database: ref.read(fluxerDatabaseProvider),
          repository: ref.read(memberRepositoryProvider),
          guildId: guildId,
        );
      }
      _updateDesiredRanges();
    });
  }

  @override
  void deactivate() {
    ref.read(memberListPanelActiveProvider.notifier).active = false;
    super.deactivate();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    _updateDesiredRanges();
  }

  void _updateDesiredRanges() {
    final String? guildId = ref.read(activeGuildIdProvider);
    final String? channelId = ref.read(activeChannelIdProvider);
    if (guildId == null || channelId == null) {
      return;
    }
    final MemberListViewportListState? listState = ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: guildId, channelId: channelId);
    final int totalRows = listState?.totalRows ?? 0;
    if (!_scrollController.hasClients) {
      ref
          .read(memberListDesiredRangesProvider.notifier)
          .setRanges(
            guildId: guildId,
            channelId: channelId,
            ranges: kMemberListInitialSubscriptionRanges,
          );
      return;
    }
    final List<MemberListGroupLayout> layouts = listState != null
        ? buildMemberListLayout(listState.groups)
        : const <MemberListGroupLayout>[];
    final List<MemberListRange> ranges = buildMemberListRangeWindow(
      scrollTop: _scrollController.position.pixels,
      clientHeight: _scrollController.position.viewportDimension,
      rowHeight: kMemberListRowHeight,
      totalRows: totalRows > 0 ? totalRows : null,
      layouts: layouts.isNotEmpty ? layouts : null,
    );
    ref
        .read(memberListDesiredRangesProvider.notifier)
        .setRanges(
          guildId: guildId,
          channelId: channelId,
          ranges: ranges.isEmpty
              ? kMemberListInitialSubscriptionRanges
              : ranges,
        );
  }

  @override
  Widget build(BuildContext context) {
    final String? guildId = ref.watch(activeGuildIdProvider);
    final String? channelId = ref.watch(activeChannelIdProvider);
    if (guildId == null || channelId == null) {
      return const _ChannelMembersPanel(child: SizedBox.shrink());
    }
    ref.watch(memberListViewportProvider);
    final MemberListViewportListState? listState = ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: guildId, channelId: channelId);
    final Map<String, db.Role> rolesById =
        ref.watch(guildRolesByIdProvider(guildId)).value ?? <String, db.Role>{};
    if (listState == null || !listState.hasReceivedInitialPayload) {
      return _ChannelMembersPanel(
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            top: 10,
            left: context.layout.s2,
            right: context.layout.s2,
            bottom: context.layout.s4,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return MemberListSkeletonItem(index: index);
          },
        ),
      );
    }
    final List<MemberListGroupLayout> layouts = buildMemberListLayout(
      listState.groups,
    );
    final int totalRows = listState.totalRows > 0
        ? listState.totalRows
        : getTotalRowsFromLayout(layouts);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateDesiredRanges());
    return _ChannelMembersPanel(
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(
          top: 10,
          left: context.layout.s2,
          right: context.layout.s2,
          bottom: context.layout.s4,
        ),
        itemCount: totalRows,
        itemBuilder: (BuildContext context, int rowIndex) {
          final MemberListGroupHeaderData? header =
              resolveMemberListGroupHeader(
                groups: listState.groups,
                layouts: layouts,
                rowIndex: rowIndex,
                rolesById: rolesById,
              );
          if (header != null) {
            return MemberListSidebarGroupHeader(
              groupName: header.name,
              count: header.count,
            );
          }
          final MemberListViewportRow? row = listState.rows[rowIndex];
          if (row == null || row.type != MemberListViewportRowType.member) {
            return const MemberListSkeletonRow();
          }
          final MemberListMember? listMember = row.listMember;
          if (listMember == null || row.userId == null) {
            return const MemberListSkeletonRow();
          }
          return MemberListSidebarMemberRow(
            guildId: guildId,
            listMember: listMember,
            userId: row.userId!,
            rolesById: rolesById,
          );
        },
      ),
    );
  }
}

class _ChannelMembersPanel extends StatelessWidget {
  const _ChannelMembersPanel({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kPanelWidth,
      decoration: BoxDecoration(
        color: context.colors.memberListBackground,
        border: Border(left: BorderSide(color: context.colors.borderColor)),
      ),
      child: child,
    );
  }
}
