import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/providers/group_dm_invites_provider.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GroupDmInvitesContent extends ConsumerStatefulWidget {
  const GroupDmInvitesContent({
    required this.dm,
    this.scrollController,
    super.key,
  });

  final DmConversation dm;
  final ScrollController? scrollController;

  @override
  ConsumerState<GroupDmInvitesContent> createState() =>
      _GroupDmInvitesContentState();
}

class _GroupDmInvitesContentState extends ConsumerState<GroupDmInvitesContent> {
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
    final String? currentUserId = ref.watch(currentUserIdProvider);
    if (!isGroupDmOwner(
      ownerId: widget.dm.ownerId,
      currentUserId: currentUserId,
    )) {
      return _buildCenteredScrollable(
        Text(l10n.groupDmInvitesOwnerOnly, style: _secondaryBodyStyle(context)),
      );
    }
    final AsyncValue<GuildInvitesState> invitesAsync = ref.watch(
      groupDmInvitesProvider(widget.dm.id),
    );
    return invitesAsync.when(
      loading: () => _buildCenteredScrollable(
        Text(l10n.groupDmLoadingInvites, style: _secondaryBodyStyle(context)),
      ),
      error: (Object _, StackTrace _) => _buildErrorState(l10n),
      data: (GuildInvitesState state) {
        if (state.loadStatus == GuildInvitesLoadStatus.error) {
          return _buildErrorState(l10n);
        }
        if (state.hasSuccessfulEmptyLoad) {
          return _buildCenteredScrollable(
            Text(
              l10n.groupDmNoInvitesCreated,
              style: _secondaryBodyStyle(context),
            ),
          );
        }
        final String inviteBase = ref.watch(instanceInviteBaseUrlProvider);
        return ListView.separated(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: FluxerBottomSheet.scrollViewPadding(
            context,
            padding: EdgeInsets.all(context.layout.s4),
          ),
          itemCount: state.invites.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: context.layout.s2),
          itemBuilder: (BuildContext context, int index) {
            final GuildInviteEntry entry = state.invites[index];
            final String inviteUrl = GuildInvitesUtils.buildInviteUrl(
              inviteBaseUrl: inviteBase,
              code: entry.code,
            );
            return _GroupDmInviteRow(
              entry: entry,
              inviteUrl: inviteUrl,
              l10n: l10n,
              isRevoking: state.revokingCode == entry.code,
              onCopy: () => unawaited(_copyLink(inviteUrl, l10n)),
              onRevoke: () => unawaited(_confirmRevoke(entry.code, l10n)),
            );
          },
        );
      },
    );
  }

  TextStyle _secondaryBodyStyle(BuildContext context) {
    return context.textStyles.bodyMedium.copyWith(
      color: context.colors.textSecondary,
    );
  }

  Widget _buildCenteredScrollable(Widget child) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: FluxerBottomSheet.scrollViewPadding(
            context,
            padding: EdgeInsets.all(context.layout.s4),
          ),
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - context.layout.s4 * 2,
              ),
              child: Center(child: child),
            ),
          ],
        );
      },
    );
  }

  Widget _buildErrorState(FluxerLocalizations l10n) {
    return _buildCenteredScrollable(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            l10n.groupDmInvitesLoadFailed,
            textAlign: TextAlign.center,
            style: _secondaryBodyStyle(context),
          ),
          SizedBox(height: context.layout.s3),
          FluxerButton.secondary(
            label: l10n.guildSettingsInvitesTryAgain,
            fitContent: true,
            onPressed: () => unawaited(
              ref.read(groupDmInvitesProvider(widget.dm.id).notifier).reload(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _copyLink(String inviteUrl, FluxerLocalizations l10n) async {
    await copyToClipboard(
      context: context,
      value: inviteUrl,
      message: l10n.guildNavbarCopied,
    );
  }

  Future<void> _confirmRevoke(String code, FluxerLocalizations l10n) async {
    await FluxerConfirmModal.show(
      context,
      title: l10n.guildSettingsInvitesRevoke,
      description: l10n.groupDmInvitesRevokeConfirm,
      confirmLabel: l10n.guildSettingsInvitesRevoke,
      isDanger: true,
      onConfirm: () async {
        try {
          await ref
              .read(groupDmInvitesProvider(widget.dm.id).notifier)
              .revokeInvite(code);
          if (!mounted) {
            return;
          }
          ref
              .read(toastProvider.notifier)
              .show(FluxerToast(message: l10n.groupDmInviteRevoked));
        } on Object {
          if (!mounted) {
            return;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.guildSettingsInvitesRevokeFailedDescription,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      },
    );
  }
}

class _GroupDmInviteRow extends StatelessWidget {
  const _GroupDmInviteRow({
    required this.entry,
    required this.inviteUrl,
    required this.l10n,
    required this.isRevoking,
    required this.onCopy,
    required this.onRevoke,
  });

  final GuildInviteEntry entry;
  final String inviteUrl;
  final FluxerLocalizations l10n;
  final bool isRevoking;
  final VoidCallback onCopy;
  final VoidCallback onRevoke;

  @override
  Widget build(BuildContext context) {
    final String inviterName = resolveDisplayName(
      username:
          entry.inviterGlobalName ??
          entry.inviterUsername ??
          l10n.guildSettingsInvitesUnknown,
    );
    final InviteCountdownState countdown = GuildInvitesUtils.resolveCountdown(
      expiresAt: entry.expiresAt,
      expiredLabel: l10n.guildSettingsInvitesExpired,
    );
    return Container(
      padding: EdgeInsets.all(context.layout.s3),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.colors.backgroundHeaderSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            inviteUrl,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          SizedBox(height: context.layout.s2),
          Text(
            l10n.groupDmInviteCreatedByExpires(
              inviterName,
              countdown.text ?? l10n.guildSettingsInvitesNever,
            ),
            style: context.textStyles.timestamp.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: context.layout.s3),
          Row(
            children: <Widget>[
              FluxerButton.secondary(
                label: l10n.guildSettingsInvitesCopyLink,
                size: FluxerButtonSize.small,
                fitContent: true,
                onPressed: onCopy,
              ),
              SizedBox(width: context.layout.s2),
              FluxerButton.dangerSecondary(
                icon: PhosphorIconsFill.trash,
                size: FluxerButtonSize.small,
                isLoading: isRevoking,
                onPressed: isRevoking ? null : onRevoke,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
