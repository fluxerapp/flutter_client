import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_status_slate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_text.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_disable_invites_button.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_empty_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_error_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_list_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_invites_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_invites_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

class GuildInvitesWidget extends ConsumerStatefulWidget {
  const GuildInvitesWidget({
    required this.guildId,
    required this.state,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildInvitesState state;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildInvitesWidget> createState() => _GuildInvitesWidgetState();
}

class _GuildInvitesWidgetState extends ConsumerState<GuildInvitesWidget> {
  bool _showCreatedDate = false;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
  }

  @override
  void dispose() {
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildInvitesState state = widget.state;
    final bool isMobile = isMobileLayout(context);
    if (usesDesktopPointerUi(context)) {
      return _buildDesktopPointer(context, l10n, state);
    }
    if (state.loadStatus == GuildInvitesLoadStatus.error) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          GuildDisableInvitesButton(guildId: widget.guildId),
          Expanded(
            child: GuildInvitesErrorState(
              l10n: l10n,
              onRetry: () => unawaited(
                ref
                    .read(guildInvitesProvider(widget.guildId).notifier)
                    .reload(),
              ),
            ),
          ),
        ],
      );
    }
    if (state.invites.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          GuildDisableInvitesButton(guildId: widget.guildId),
          Expanded(child: GuildInvitesEmptyState(l10n: l10n)),
        ],
      );
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(child: _buildHeader(context, l10n)),
        SliverToBoxAdapter(
          child: GuildDisableInvitesButton(guildId: widget.guildId),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.layout.s4,
              0,
              context.layout.s4,
              context.layout.s4,
            ),
            child: FluxerCheckbox(
              value: _showCreatedDate,
              label: l10n.guildSettingsInvitesShowCreatedDate,
              onChanged: (bool? value) {
                setState(() => _showCreatedDate = value ?? false);
              },
            ),
          ),
        ),
        if (!isMobile)
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              context.layout.s4,
              0,
              context.layout.s4,
              context.layout.s2,
            ),
            sliver: SliverToBoxAdapter(
              child: _buildDesktopListHeader(context, l10n),
            ),
          ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            0,
            context.layout.s4,
            kSettingsScrollBottomPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final GuildInviteEntry entry = state.invites[index];
              return Padding(
                padding: EdgeInsets.only(bottom: context.layout.s2),
                child: _buildInviteItem(context, l10n, entry, isMobile),
              );
            }, childCount: state.invites.length),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopPointer(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildInvitesState state,
  ) {
    final List<Widget> top = <Widget>[
      DesktopSettingsPageTitle(
        title: l10n.guildSettingsInvitesTitle,
        description: l10n.guildSettingsInvitesDescription,
      ),
      const SizedBox(height: 16),
      GuildDisableInvitesButton(guildId: widget.guildId, embedded: true),
      const SizedBox(height: 16),
    ];
    final Widget? status = switch (state.loadStatus) {
      GuildInvitesLoadStatus.error => DesktopSettingsStatusSlate(
        icon: PhosphorIconsRegular.warningCircle,
        title: l10n.guildSettingsInvitesLoadFailedTitle,
        description: l10n.guildSettingsInvitesLoadFailedDescription,
        fullHeight: true,
        actions: <Widget>[
          FluxerButton.primary(
            label: l10n.guildSettingsInvitesTryAgain,
            fitContent: true,
            onPressed: () => unawaited(
              ref.read(guildInvitesProvider(widget.guildId).notifier).reload(),
            ),
          ),
        ],
      ),
      _ when state.invites.isEmpty => DesktopSettingsStatusSlate(
        icon: PhosphorIconsRegular.userPlus,
        title: l10n.guildSettingsInvitesEmpty,
        description: l10n.guildSettingsInvitesEmptyDescription,
        fullHeight: true,
      ),
      _ => null,
    };
    final Widget list;
    if (status != null) {
      list = SliverToBoxAdapter(child: status);
    } else {
      list = SliverList.list(
        children: <Widget>[
          FluxerCheckbox(
            value: _showCreatedDate,
            label: l10n.guildSettingsInvitesShowCreatedDate,
            onChanged: (bool? value) {
              setState(() => _showCreatedDate = value ?? false);
            },
          ),
          const SizedBox(height: 12),
          _buildDesktopPointerListHeader(context, l10n),
          for (int i = 0; i < state.invites.length; i++) ...<Widget>[
            if (i > 0) const SizedBox(height: 8),
            _buildInviteItem(context, l10n, state.invites[i], false),
          ],
        ],
      );
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverList.list(children: top),
        SliverPadding(
          padding: const EdgeInsets.only(
            bottom: kDesktopSettingsScrollBottomPadding,
          ),
          sliver: list,
        ),
      ],
    );
  }

  Widget _buildDesktopPointerListHeader(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w600,
      color: context.colors.textPrimaryMuted,
    );
    Widget column(String label) => Text(
      label.toUpperCase(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: guildInvitesDesktopPointerGrid(
        showChannel: true,
        cells: <Widget>[
          column(l10n.guildSettingsInvitesTableInviter),
          column(l10n.guildSettingsInvitesTableChannel),
          column(l10n.guildSettingsInvitesTableCode),
          column(l10n.guildSettingsInvitesTableUses),
          column(
            _showCreatedDate
                ? l10n.guildSettingsInvitesTableCreated
                : l10n.guildSettingsInvitesTableExpires,
          ),
        ],
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
            l10n.guildSettingsInvitesTitle,
            style: context.textStyles.heading.copyWith(
              fontSize: 18,
              color: context.colors.textChat,
            ),
          ),
          SizedBox(height: context.layout.s1),
          Text(
            l10n.guildSettingsInvitesDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopListHeader(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s3,
        0,
        context.layout.s3,
        context.layout.s2,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Text(
              l10n.guildSettingsInvitesTableInviter,
              style: context.textStyles.categoryName,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            flex: 15,
            child: Text(
              l10n.guildSettingsInvitesTableChannel,
              style: context.textStyles.categoryName,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            flex: 18,
            child: Text(
              l10n.guildSettingsInvitesTableCode,
              style: context.textStyles.categoryName,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            flex: 10,
            child: Text(
              l10n.guildSettingsInvitesTableUses,
              style: context.textStyles.categoryName,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            flex: 16,
            child: Text(
              _showCreatedDate
                  ? l10n.guildSettingsInvitesTableCreated
                  : l10n.guildSettingsInvitesTableExpires,
              style: context.textStyles.categoryName,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteItem(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildInviteEntry entry,
    bool isMobile,
  ) {
    final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
    final Map<String, Channel> channelsById = _buildChannelsById();
    final String inviteUrl = GuildInvitesUtils.buildInviteUrl(
      inviteBaseUrl: inviteBase,
      code: entry.code,
    );
    return GuildInvitesListItem(
      entry: entry,
      l10n: l10n,
      showCreatedDate: _showCreatedDate,
      isMobile: isMobile,
      categoryName: _resolveCategoryName(entry, channelsById),
      onCopy: () => unawaited(_copyInvite(context, inviteUrl)),
      onRevoke: () => unawaited(_confirmRevoke(context, l10n, entry)),
      onTap: isMobile ? () => unawaited(_copyInvite(context, inviteUrl)) : null,
      onMenuPressed: isMobile
          ? (Offset position) =>
                unawaited(_showMobileMenu(context, l10n, entry, position))
          : null,
    );
  }

  Map<String, Channel> _buildChannelsById() {
    final AsyncValue<List<Channel>> channelsAsync = ref.watch(
      guildSettingsChannelsProvider(widget.guildId),
    );
    final List<Channel>? channels = channelsAsync.value;
    if (channels == null) {
      return <String, Channel>{};
    }
    return <String, Channel>{
      for (final Channel channel in channels) channel.id: channel,
    };
  }

  String? _resolveCategoryName(
    GuildInviteEntry entry,
    Map<String, Channel> channelsById,
  ) {
    final Channel? channel = channelsById[entry.channelId];
    final String? parentId = channel?.parentId;
    if (parentId == null || parentId.isEmpty) {
      return null;
    }
    return channelsById[parentId]?.name;
  }

  Future<void> _copyInvite(BuildContext context, String inviteUrl) async {
    await copyToClipboard(context: context, value: inviteUrl);
  }

  Future<void> _showMobileMenu(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildInviteEntry entry,
    Offset position,
  ) async {
    final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
    final String inviteUrl = GuildInvitesUtils.buildInviteUrl(
      inviteBaseUrl: inviteBase,
      code: entry.code,
    );
    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
        FluxerMenuItem(
          label: l10n.guildSettingsInvitesCopyLink,
          icon: PhosphorIconsBold.clipboard,
          onPressed: () {
            close();
            unawaited(_copyInvite(context, inviteUrl));
          },
        ),
        FluxerMenuItem(
          label: l10n.guildSettingsInvitesRevoke,
          icon: PhosphorIconsBold.x,
          isDanger: true,
          onPressed: () {
            close();
            unawaited(_confirmRevoke(context, l10n, entry));
          },
        ),
      ],
    );
  }

  Future<void> _confirmRevoke(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildInviteEntry entry,
  ) async {
    await FluxerConfirmModal.show(
      context,
      title: l10n.guildSettingsInvitesRevoke,
      description: l10n.channelSettingsDeleteInviteConfirm,
      confirmLabel: l10n.guildSettingsInvitesRevoke,
      isDanger: true,
      onConfirm: () => unawaited(_revokeInvite(context, l10n, entry)),
    );
  }

  Future<void> _revokeInvite(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildInviteEntry entry,
  ) async {
    try {
      await ref
          .read(guildInvitesProvider(widget.guildId).notifier)
          .revokeInvite(entry.code);
    } on Object catch (error) {
      if (!context.mounted) {
        return;
      }
      await showApiError(context, ApiErrorAction.revokeInvite, error);
    }
  }
}
