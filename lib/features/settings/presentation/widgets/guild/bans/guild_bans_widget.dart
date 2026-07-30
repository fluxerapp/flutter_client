import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_ban_actions_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_ban_details_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/bans/guild_bans_empty_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/bans/guild_bans_list_item.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_bans_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildBansWidget extends ConsumerStatefulWidget {
  const GuildBansWidget({
    required this.guildId,
    required this.state,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildBansState state;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildBansWidget> createState() => _GuildBansWidgetState();
}

class _GuildBansWidgetState extends ConsumerState<GuildBansWidget> {
  late final TextEditingController _searchController;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.state.searchQuery);
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
  }

  @override
  void didUpdateWidget(covariant GuildBansWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.searchQuery != _searchController.text) {
      _searchController.text = widget.state.searchQuery;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildBansState state = widget.state;
    final bool hasScrollableList = state.filteredIndices.isNotEmpty;
    if (!hasScrollableList) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          Expanded(child: _buildStaticBody(context, l10n, state)),
        ],
      );
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(child: _buildHeader(context, l10n)),
        SliverPadding(
          padding: EdgeInsets.only(bottom: context.layout.s4),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final GuildBanEntry entry = state.banAtFilteredIndex(index);
              final int itemCount = state.filteredIndices.length;
              final bool isMobile = isMobileLayout(context);
              return MemberListDetailsMemberShell(
                isFirstInGroup: index == 0,
                isLastInGroup: index == itemCount - 1,
                child: GuildBansListItem(
                  key: ValueKey<String>(entry.userId),
                  entry: entry,
                  isMobile: isMobile,
                  onTap: isMobile ? () => _handleRowTap(context, entry) : null,
                  onMenuPressed: (Offset position) =>
                      _showBanMenu(context, entry, position),
                ),
              );
            }, childCount: state.filteredIndices.length),
          ),
        ),
      ],
    );
  }

  Widget _buildStaticBody(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildBansState state,
  ) {
    if (state.bans.isEmpty && state.hasSuccessfulEmptyLoad) {
      return GuildBansEmptyState(l10n: l10n);
    }
    if (state.bans.isEmpty) {
      return const Center(child: FluxerLoadingSpinner());
    }
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s4),
        child: Text(
          l10n.guildSettingsBansNoSearchResults,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, FluxerLocalizations l10n) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.guildSettingsBannedUsersTitle,
            style: context.textStyles.heading.copyWith(
              fontSize: 18,
              color: context.colors.textChat,
            ),
          ),
          SizedBox(height: context.layout.s1),
          Text(
            l10n.guildSettingsBansDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: context.layout.s4),
          FluxerInput(
            controller: _searchController,
            hint: l10n.guildSettingsBansSearchHint,
            prefixIcon: PhosphorIcon(
              PhosphorIconsBold.magnifyingGlass,
              size: 18,
              color: context.colors.textPrimaryMuted,
            ),
            onChanged: (String value) {
              ref
                  .read(guildBansProvider(widget.guildId).notifier)
                  .setSearchQuery(value);
            },
          ),
        ],
      ),
    );
  }

  void _handleRowTap(BuildContext context, GuildBanEntry entry) {
    unawaited(
      GuildBanActionsSheet.show(
        context,
        ref,
        entry: entry,
        onViewDetails: () => unawaited(_showBanDetails(context, entry)),
        onRevokeBan: () => unawaited(_confirmRevokeBan(context, entry)),
      ),
    );
  }

  Future<void> _showBanMenu(
    BuildContext context,
    GuildBanEntry entry,
    Offset position,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        FluxerMenuItem(
          label: l10n.guildSettingsBanViewDetails,
          icon: PhosphorIconsBold.eye,
          onPressed: () {
            close();
            unawaited(_showBanDetails(context, entry));
          },
        ),
        FluxerMenuItem(
          label: l10n.guildSettingsRevokeBanTitle,
          icon: PhosphorIconsBold.prohibit,
          isDanger: true,
          onPressed: () {
            close();
            unawaited(_confirmRevokeBan(context, entry));
          },
        ),
      ],
    );
  }

  Future<void> _showBanDetails(BuildContext context, GuildBanEntry entry) {
    return GuildBanDetailsSheet.show(
      context,
      ref,
      entry: entry,
      onRevokeBan: () => _revokeBan(context, entry),
    );
  }

  Future<void> _confirmRevokeBan(
    BuildContext context,
    GuildBanEntry entry,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = resolveDisplayName(
      username: entry.ban.user.username,
      globalName: entry.ban.user.globalName,
    );
    await FluxerConfirmModal.show(
      context,
      title: l10n.guildSettingsRevokeBanTitle,
      description: l10n.guildSettingsRevokeBanDescription(displayName),
      confirmLabel: l10n.guildSettingsRevokeBanTitle,
      isDanger: true,
      onConfirm: () => unawaited(_revokeBan(context, entry)),
    );
  }

  Future<void> _revokeBan(BuildContext context, GuildBanEntry entry) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = resolveDisplayName(
      username: entry.ban.user.username,
      globalName: entry.ban.user.globalName,
    );
    try {
      await ref
          .read(guildBansProvider(widget.guildId).notifier)
          .unban(entry.userId);
      if (!context.mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.guildSettingsRevokeBanSuccess(displayName),
            ),
          );
    } on Object {
      if (!context.mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsRevokeBanError));
    }
  }
}
