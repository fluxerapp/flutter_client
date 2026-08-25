import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/domain/member_list_layout.dart';
import 'package:fluxer_app/features/members/domain/member_list_range_utils.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_member_row.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_access_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/members/utils/member_list_access.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

class GuildMembersTabContent extends ConsumerStatefulWidget {
  const GuildMembersTabContent({
    required this.guildId,
    required this.channelId,
    required this.scrollController,
    super.key,
  });

  final String guildId;
  final String channelId;
  final ScrollController scrollController;

  @override
  ConsumerState<GuildMembersTabContent> createState() =>
      _GuildMembersTabContentState();
}

class _GuildMembersTabContentState
    extends ConsumerState<GuildMembersTabContent> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_handleScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      prefetchGuildRolesIfMissing(
        database: ref.read(fluxerDatabaseProvider),
        repository: ref.read(memberRepositoryProvider),
        guildId: widget.guildId,
      );
      _updateDesiredRanges();
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    _updateDesiredRanges();
  }

  void _updateDesiredRanges() {
    final MemberListAccess access = readMemberListAccess(
      ref,
      guildId: widget.guildId,
      channelId: widget.channelId,
    );
    if (!access.canSubscribe) {
      return;
    }
    final MemberListViewportListState? listState = ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: widget.guildId, channelId: widget.channelId);
    final int totalRows = listState?.totalRows ?? 0;
    if (!widget.scrollController.hasClients) {
      ref
          .read(memberListDesiredRangesProvider.notifier)
          .setRanges(
            guildId: widget.guildId,
            channelId: widget.channelId,
            ranges: kMemberListInitialSubscriptionRanges,
          );
      return;
    }
    final List<MemberListGroupLayout> layouts = listState != null
        ? buildMemberListLayout(listState.groups)
        : const <MemberListGroupLayout>[];
    final List<MemberListRange> ranges = buildMemberListRangeWindow(
      scrollTop: widget.scrollController.position.pixels,
      clientHeight: widget.scrollController.position.viewportDimension,
      rowHeight: kMemberListDetailsMemberRowHeight,
      totalRows: totalRows > 0 ? totalRows : null,
      layouts: layouts.isNotEmpty ? layouts : null,
      groupHeaderHeight: kMemberListDetailsGroupHeaderHeight,
    );
    ref
        .read(memberListDesiredRangesProvider.notifier)
        .setRanges(
          guildId: widget.guildId,
          channelId: widget.channelId,
          ranges: ranges.isEmpty
              ? kMemberListInitialSubscriptionRanges
              : ranges,
        );
  }

  @override
  Widget build(BuildContext context) {
    final MemberListAccess access = watchMemberListAccess(
      ref,
      guildId: widget.guildId,
      channelId: widget.channelId,
    );
    if (access.unavailableReason != null) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        padding: FluxerBottomSheet.scrollViewPadding(
          context,
          padding: EdgeInsets.zero,
        ),
        child: MemberListUnavailableFallback(reason: access.unavailableReason!),
      );
    }
    ref
      ..listen(
        memberListDetailsSubscriptionProvider(
          widget.guildId,
          widget.channelId,
          access.canSubscribe,
        ),
        (_, _) {},
      )
      ..watch(memberListViewportProvider);
    final MemberListViewportListState? listState = ref
        .read(memberListViewportProvider.notifier)
        .getList(guildId: widget.guildId, channelId: widget.channelId);
    final Map<String, db.Role> rolesById =
        ref.watch(guildRolesByIdProvider(widget.guildId)).value ??
        <String, db.Role>{};
    final guild = ref.watch(guildByIdProvider(widget.guildId)).asData?.value;
    final String? guildOwnerId = guild?.ownerId;
    if (listState == null || !listState.hasReceivedInitialPayload) {
      return ListView.builder(
        controller: widget.scrollController,
        padding: FluxerBottomSheet.scrollViewPadding(
          context,
          padding: EdgeInsets.zero,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return MemberListSkeletonItem(
            index: index,
            style: MemberListSkeletonStyle.details,
          );
        },
      );
    }
    final List<MemberListGroupLayout> layouts = buildMemberListLayout(
      listState.groups,
    );
    final int totalRows = listState.totalRows > 0
        ? listState.totalRows
        : getTotalRowsFromLayout(layouts);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateDesiredRanges());
    return ListView.builder(
      controller: widget.scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.zero,
      ),
      itemCount: totalRows,
      itemBuilder: (BuildContext context, int rowIndex) {
        final MemberListGroupHeaderData? header = resolveMemberListGroupHeader(
          groups: listState.groups,
          layouts: layouts,
          rowIndex: rowIndex,
          rolesById: rolesById,
        );
        if (header != null) {
          return MemberListDetailsGroupHeader(
            groupName: header.name,
            count: header.count,
          );
        }
        final MemberListViewportRow? row = listState.rows[rowIndex];
        if (row == null || row.type != MemberListViewportRowType.member) {
          return const SizedBox(height: kMemberListDetailsMemberRowHeight);
        }
        final MemberListMember? listMember = row.listMember;
        final String? userId = row.userId;
        if (listMember == null || userId == null) {
          return const SizedBox(height: kMemberListDetailsMemberRowHeight);
        }
        final MemberListGroupLayout? layout = getGroupLayoutForRow(
          layouts,
          rowIndex,
        );
        final bool dimmed = layout?.id == 'offline';
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: kMemberListDetailsMemberRowHeight,
          ),
          child: MemberListDetailsMemberShell(
            isFirstInGroup:
                layout != null && isFirstMemberRowInGroup(layout, rowIndex),
            isLastInGroup:
                layout != null && isLastMemberRowInGroup(layout, rowIndex),
            child: MemberListDetailsMemberRow(
              guildId: widget.guildId,
              listMember: listMember,
              userId: userId,
              rolesById: rolesById,
              dimmed: dimmed,
              isOwner: shouldShowOwnerCrown(
                isOwner: guildOwnerId != null && userId == guildOwnerId,
                features: guild?.features ?? const <String>[],
              ),
            ),
          ),
        );
      },
    );
  }
}
