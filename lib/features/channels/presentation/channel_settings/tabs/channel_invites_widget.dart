import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_settings_status_slate.dart';
import 'package:fluxer_app/features/channels/presentation/modals/show_channel_invite_modal.dart';
import 'package:fluxer_app/features/channels/providers/channel_invites_provider.dart';
import 'package:fluxer_app/features/channels/utils/channel_invite_capability.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_disable_invites_button.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_list_item.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelInvitesWidget extends ConsumerStatefulWidget {
  const ChannelInvitesWidget({
    required this.channel,
    required this.permissions,
    this.scrollController,
    super.key,
  });

  final Channel channel;
  final int permissions;
  final ScrollController? scrollController;

  @override
  ConsumerState<ChannelInvitesWidget> createState() =>
      _ChannelInvitesWidgetState();
}

class _ChannelInvitesWidgetState extends ConsumerState<ChannelInvitesWidget> {
  bool _showCreatedDate = false;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  bool get _canInvite => resolveChannelInviteCapability(
    permissionBits: widget.permissions,
    channel: widget.channel,
    guildId: widget.channel.guildId,
  ).canInvite;

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

  Future<void> _copyInviteUrl(String inviteUrl) async {
    await copyToClipboard(context: context, value: inviteUrl);
  }

  Future<void> _copyInviteCode(String code) async {
    await copyToClipboard(context: context, value: code);
  }

  Future<void> _revokeInvite(GuildInviteEntry invite) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      await ref
          .read(channelInvitesProvider(widget.channel.id).notifier)
          .revokeInvite(invite.code);
    } on Object {
      if (!mounted) {
        return;
      }
      await FluxerModal.show<void>(
        context,
        title: l10n.guildSettingsInvitesRevokeFailedTitle,
        centered: true,
        builder: (BuildContext dialogContext, VoidCallback close) {
          return Text(
            l10n.guildSettingsInvitesRevokeFailedDescription,
            style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
          );
        },
      );
    }
  }

  Future<void> _confirmRevoke(GuildInviteEntry invite) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmSheet.show(
      context,
      title: l10n.channelSettingsDeleteInvite,
      description: l10n.channelSettingsDeleteInviteConfirm,
      confirmLabel: l10n.channelSettingsDeleteInvite,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }
    await _revokeInvite(invite);
  }

  Future<void> _showMobileInviteActions(
    GuildInviteEntry invite,
    String inviteUrl,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerBottomSheet.show<void>(
      context,
      title: invite.code,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          child: FluxerMenuGroup(
            children: <Widget>[
              FluxerBottomSheetMenuItem(
                label: l10n.channelSettingsCopyInviteCode,
                icon: PhosphorIconsBold.copy,
                onTap: () {
                  close();
                  unawaited(_copyInviteCode(invite.code));
                },
              ),
              FluxerBottomSheetMenuItem(
                label: l10n.channelSettingsCopyInviteUrl,
                icon: PhosphorIconsBold.link,
                onTap: () {
                  close();
                  unawaited(_copyInviteUrl(inviteUrl));
                },
              ),
              FluxerBottomSheetMenuItem(
                label: l10n.channelSettingsDeleteInvite,
                icon: PhosphorIconsBold.trash,
                isDanger: true,
                onTap: () {
                  close();
                  unawaited(_confirmRevoke(invite));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _createInvite() async {
    await showChannelInviteModal(
      context,
      ref,
      channelId: widget.channel.id,
      channelName: widget.channel.name,
      guildId: widget.channel.guildId,
      useVanityUrl: false,
    );
    if (!mounted) {
      return;
    }
    await ref.read(channelInvitesProvider(widget.channel.id).notifier).reload();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final AsyncValue<GuildInvitesState> invitesAsync = ref.watch(
      channelInvitesProvider(widget.channel.id),
    );
    return invitesAsync.when(
      loading: () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(context, l10n),
          _buildButtonGroup(context, l10n, isLoading: true),
          const Expanded(child: Center(child: FluxerLoadingSpinner())),
        ],
      ),
      error: (Object error, StackTrace stackTrace) => _buildShell(
        context,
        l10n: l10n,
        isLoading: false,
        child: ChannelSettingsStatusSlate(
          icon: PhosphorIconsFill.warningOctagon,
          title: l10n.guildSettingsInvitesLoadFailedTitle,
          description: l10n.channelSettingsInvitesLoadFailedDescription,
          actionLabel: l10n.guildSettingsInvitesTryAgain,
          onAction: () =>
              ref.invalidate(channelInvitesProvider(widget.channel.id)),
        ),
      ),
      data: (GuildInvitesState state) {
        if (state.loadStatus == GuildInvitesLoadStatus.error) {
          return _buildShell(
            context,
            l10n: l10n,
            isLoading: false,
            child: ChannelSettingsStatusSlate(
              icon: PhosphorIconsFill.warningOctagon,
              title: l10n.guildSettingsInvitesLoadFailedTitle,
              description: l10n.channelSettingsInvitesLoadFailedDescription,
              actionLabel: l10n.guildSettingsInvitesTryAgain,
              onAction: () =>
                  ref.invalidate(channelInvitesProvider(widget.channel.id)),
            ),
          );
        }
        if (state.invites.isEmpty) {
          return _buildShell(
            context,
            l10n: l10n,
            isLoading: false,
            child: ChannelSettingsStatusSlate(
              icon: PhosphorIconsFill.userPlus,
              title: l10n.channelSettingsInvitesEmpty,
              description: l10n.channelSettingsInvitesEmptyDescription,
              actionLabel: _canInvite
                  ? l10n.channelSettingsInvitesCreate
                  : null,
              onAction: _canInvite ? () => unawaited(_createInvite()) : null,
            ),
          );
        }
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(child: _buildHeader(context, l10n)),
            SliverToBoxAdapter(child: _buildButtonGroup(context, l10n)),
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
                context.layout.s4,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((
                  BuildContext context,
                  int index,
                ) {
                  final GuildInviteEntry invite = state.invites[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.layout.s2),
                    child: _buildInviteItem(
                      context,
                      l10n: l10n,
                      invite: invite,
                      isMobile: isMobile,
                    ),
                  );
                }, childCount: state.invites.length),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShell(
    BuildContext context, {
    required FluxerLocalizations l10n,
    required bool isLoading,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildHeader(context, l10n),
        _buildButtonGroup(context, l10n, isLoading: isLoading),
        Expanded(child: child),
      ],
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
            l10n.channelSettingsTabInvites,
            style: context.textStyles.heading.copyWith(
              fontSize: 18,
              color: context.colors.textChat,
            ),
          ),
          SizedBox(height: context.layout.s1),
          Text(
            l10n.channelSettingsInvitesDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonGroup(
    BuildContext context,
    FluxerLocalizations l10n, {
    bool isLoading = false,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        0,
        context.layout.s4,
        context.layout.s4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FluxerButton.primary(
            onPressed: !_canInvite || isLoading
                ? null
                : () => unawaited(_createInvite()),
            label: l10n.channelSettingsInvitesCreate,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            child: GuildDisableInvitesButton(
              guildId: widget.channel.guildId,
              embedded: true,
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
            flex: 24,
            child: Text(
              l10n.guildSettingsInvitesTableInviter,
              style: context.textStyles.categoryName,
            ),
          ),
          SizedBox(width: context.layout.s2),
          Expanded(
            flex: 22,
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
            flex: 18,
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
    BuildContext context, {
    required FluxerLocalizations l10n,
    required GuildInviteEntry invite,
    required bool isMobile,
  }) {
    final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
    final String inviteUrl = GuildInvitesUtils.buildInviteUrl(
      inviteBaseUrl: inviteBase,
      code: invite.code,
    );
    return GuildInvitesListItem(
      entry: invite,
      l10n: l10n,
      inviteUrl: inviteUrl,
      showCreatedDate: _showCreatedDate,
      isMobile: isMobile,
      showChannel: false,
      categoryName: null,
      onCopy: () => unawaited(_copyInviteUrl(inviteUrl)),
      onRevoke: () => unawaited(_confirmRevoke(invite)),
      onTap: isMobile
          ? () => unawaited(_showMobileInviteActions(invite, inviteUrl))
          : null,
    );
  }
}
