import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserPrivacyDashboard extends ConsumerStatefulWidget {
  const UserPrivacyDashboard({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserPrivacyDashboard> createState() =>
      _UserPrivacyDashboardState();
}

class _UserPrivacyDashboardState extends ConsumerState<UserPrivacyDashboard> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final colors = context.colors;
    final layout = context.layout;

    if (state.isLoading) {
      return const Center(child: FluxerLoadingSpinner());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.error!,
              style: TextStyle(color: colors.textPrimaryMuted),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s4),
            SizedBox(
              width: double.infinity,
              child: FluxerButton.primary(
                label: 'Retry',
                onPressedAsync: ref
                    .read(privacyDashboardViewModelProvider.notifier)
                    .loadSettings,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildConnectionsSection(state, colors, layout),
          _buildCommunicationSection(state, colors, layout),
          _buildSensitiveContentSection(state, colors, layout),
          _buildDataExportSection(state, colors, layout),
          _buildDataDeletionSection(state, colors, layout),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Connections section
  // ---------------------------------------------------------------------------

  Widget _buildConnectionsSection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    return FluxerSettingsSection(
      title: 'Connections',
      description:
          'Control who can send you friend requests and direct messages',
      isFirst: true,
      children: [
        FluxerSettingsSubsection(
          title: 'Friend Requests',
          description: 'Control who can send you friend requests',
          children: [
            FluxerSwitchGroupItem(
              label: 'Everyone',
              description: 'Allow anyone to send you friend requests',
              value: state.everyoneCanFriendRequest,
              onChanged: (value) => unawaited(
                ref
                    .read(privacyDashboardViewModelProvider.notifier)
                    .updateFriendSourceFlag(
                      FriendSourceFlag.noRelation,
                      enabled: value,
                    ),
              ),
            ),
            FluxerSwitchGroupItem(
              label: 'Friends of Friends',
              description: 'Allow friends of your friends to send you requests',
              value: state.friendsOfFriendsCanFriend,
              enabled: !state.everyoneCanFriendRequest,
              onChanged: (value) => unawaited(
                ref
                    .read(privacyDashboardViewModelProvider.notifier)
                    .updateFriendSourceFlag(
                      FriendSourceFlag.mutualFriends,
                      enabled: value,
                    ),
              ),
            ),
            FluxerSwitchGroupItem(
              label: 'Community Members',
              description:
                  'Allow members from communities '
                  "you're in to send you requests",
              value: state.communityMembersCanFriend,
              enabled: !state.everyoneCanFriendRequest,
              onChanged: (value) => unawaited(
                ref
                    .read(privacyDashboardViewModelProvider.notifier)
                    .updateFriendSourceFlag(
                      FriendSourceFlag.mutualGuilds,
                      enabled: value,
                    ),
              ),
            ),
          ],
        ),
        FluxerSettingsSubsection(
          title: 'Direct Messages',
          description: 'Control who can send you direct messages',
          children: [
            FluxerSwitchGroupItem(
              label: 'Allow direct messages from community members',
              description:
                  'Allow members from communities '
                  "you're in to send you direct messages",
              value: !state.defaultGuildsRestricted,
              onChanged: (value) =>
                  _showDmConfirmationSheet(allowing: value, isBots: false),
            ),
            FluxerSwitchGroupItem(
              label: 'Allow direct messages from community bots',
              description:
                  'Allow bots from communities '
                  "you're in to send you direct messages",
              value: !state.botDefaultGuildsRestricted,
              onChanged: (value) =>
                  _showDmConfirmationSheet(allowing: value, isBots: true),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showDmConfirmationSheet({
    required bool allowing,
    required bool isBots,
  }) async {
    final colors = context.colors;
    final layout = context.layout;

    final String title;
    final String description;
    if (allowing && isBots) {
      title = 'Allow bots to send you direct messages?';
      description =
          'Do you also want to allow bots from your existing '
          'communities to send you direct messages?';
    } else if (allowing) {
      title = 'Allow direct messages from community members?';
      description =
          'Do you also want to allow direct messages from '
          'members of your existing communities?';
    } else if (isBots) {
      title = 'Block bots from sending you direct messages?';
      description =
          'Do you also want to block bots from your '
          'existing communities?';
    } else {
      title = 'Block direct messages from community members?';
      description =
          'Do you also want to block direct messages from '
          'members of your existing communities?';
    }

    final result = await FluxerBottomSheet.show<bool>(
      context,
      title: title,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s2),
              Text(
                'You can also change this setting per-community '
                'by long-pressing the community name and '
                'selecting Privacy Settings.',
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
              ),
              SizedBox(height: layout.s4),
              SizedBox(
                width: double.infinity,
                child: FluxerButton.primary(
                  label: allowing
                      ? 'Allow for all communities'
                      : 'Block for all communities',
                  onPressed: () =>
                      Navigator.of(sheetContext, rootNavigator: true).pop(true),
                ),
              ),
              SizedBox(height: layout.s2),
              SizedBox(
                width: double.infinity,
                child: FluxerButton.secondary(
                  label: 'Skip this step',
                  onPressed: () => Navigator.of(
                    sheetContext,
                    rootNavigator: true,
                  ).pop(false),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (result == null) {
      return;
    }

    final vm = ref.read(privacyDashboardViewModelProvider.notifier);
    if (isBots) {
      unawaited(
        vm.updateBotDefaultGuildsRestricted(
          restricted: !allowing,
          applyToAll: result,
        ),
      );
    } else {
      unawaited(
        vm.updateDefaultGuildsRestricted(
          restricted: !allowing,
          applyToAll: result,
        ),
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Communication section
  // ---------------------------------------------------------------------------

  Widget _buildCommunicationSection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    return FluxerSettingsSection(
      title: FluxerLocalizations.of(
        context,
      ).privacyDashboardCommunicationSection,
      description: 'Control who can call you and add you to group chats',
      children: [
        _buildIncomingCallsSubsection(state, colors, layout),
        _buildGroupDmSubsection(state, colors, layout),
      ],
    );
  }

  Widget _buildIncomingCallsSubsection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);
    final mode = state.incomingCallMode;

    return FluxerSettingsSubsection(
      title: 'Incoming Calls',
      description: 'Control who can call you',
      children: [
        FluxerRadioGroup<PermissionMode>(
          value: mode,
          items: const [
            FluxerRadioItem(
              value: PermissionMode.nobody,
              label: 'Nobody',
              description: 'Block all incoming calls',
            ),
            FluxerRadioItem(
              value: PermissionMode.friendsOnly,
              label: 'Friends Only',
              description: 'Only allow friends to call you (recommended)',
            ),
            FluxerRadioItem(
              value: PermissionMode.custom,
              label: 'Friends + Custom',
              description: 'Allow friends plus additional groups you choose',
            ),
            FluxerRadioItem(
              value: PermissionMode.everyone,
              label: 'Everyone',
              description: 'Allow anyone to call you, even strangers',
            ),
          ],
          onChanged: (newMode) {
            final silentFlag =
                state.incomingCallFlags & IncomingCallFlag.silentEveryone;
            int flags;
            switch (newMode) {
              case PermissionMode.nobody:
                flags = IncomingCallFlag.nobody;
              case PermissionMode.friendsOnly:
                flags = IncomingCallFlag.friendsOnly;
              case PermissionMode.custom:
                flags =
                    IncomingCallFlag.friendsOnly |
                    IncomingCallFlag.friendsOfFriends;
              case PermissionMode.everyone:
                flags = IncomingCallFlag.everyone;
            }
            flags |= silentFlag;
            unawaited(vm.updateIncomingCallFlags(flags));
          },
        ),
        if (mode == PermissionMode.custom)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FluxerSubsectionLabel('Additional Groups'),
              SizedBox(height: layout.s2),
              FluxerSwitchGroupItem(
                label: 'Friends of Friends',
                description:
                    'People who are friends with your friends can call you',
                value: state.callFriendsOfFriends,
                onChanged: (value) {
                  var flags = state.incomingCallFlags;
                  if (value) {
                    flags |= IncomingCallFlag.friendsOfFriends;
                  } else {
                    flags &= ~IncomingCallFlag.friendsOfFriends;
                  }
                  unawaited(vm.updateIncomingCallFlags(flags));
                },
              ),
              FluxerSwitchGroupItem(
                label: 'Community Members',
                description:
                    "People from communities you're both in can call you",
                value: state.callGuildMembers,
                onChanged: (value) {
                  var flags = state.incomingCallFlags;
                  if (value) {
                    flags |= IncomingCallFlag.guildMembers;
                  } else {
                    flags &= ~IncomingCallFlag.guildMembers;
                  }
                  unawaited(vm.updateIncomingCallFlags(flags));
                },
              ),
            ],
          ),
        if (mode != PermissionMode.nobody)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FluxerSubsectionLabel('Ring Behavior'),
              SizedBox(height: layout.s2),
              FluxerSwitchGroupItem(
                label: 'Silent calls from everyone',
                description:
                    'All calls will notify silently instead '
                    'of ringing. By default, calls from '
                    'non-friends are always silent.',
                value: state.silentCallsEnabled,
                onChanged: (value) {
                  var flags = state.incomingCallFlags;
                  if (value) {
                    flags |= IncomingCallFlag.silentEveryone;
                  } else {
                    flags &= ~IncomingCallFlag.silentEveryone;
                  }
                  unawaited(vm.updateIncomingCallFlags(flags));
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildGroupDmSubsection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);
    final mode = state.groupDmAddMode;

    return FluxerSettingsSubsection(
      title: 'Who Can Add You to Group Chats',
      description:
          'Control who can add you to group chats without asking. '
          'Anyone can still send you invite links to join.',
      children: [
        FluxerRadioGroup<PermissionMode>(
          value: mode,
          items: const [
            FluxerRadioItem(
              value: PermissionMode.nobody,
              label: 'Nobody',
              description:
                  "Don't let anyone add you to group chats without asking",
            ),
            FluxerRadioItem(
              value: PermissionMode.friendsOnly,
              label: 'Friends Only',
              description:
                  'Only allow friends to add you without asking (recommended)',
            ),
            FluxerRadioItem(
              value: PermissionMode.custom,
              label: 'Friends + Custom',
              description: 'Allow friends plus additional groups to add you',
            ),
            FluxerRadioItem(
              value: PermissionMode.everyone,
              label: 'Everyone',
              description:
                  'Allow anyone to add you to group chats without asking',
            ),
          ],
          onChanged: (newMode) {
            int flags;
            switch (newMode) {
              case PermissionMode.nobody:
                flags = GroupDmAddPermissionFlag.nobody;
              case PermissionMode.friendsOnly:
                flags = GroupDmAddPermissionFlag.friendsOnly;
              case PermissionMode.custom:
                flags =
                    GroupDmAddPermissionFlag.friendsOnly |
                    GroupDmAddPermissionFlag.friendsOfFriends;
              case PermissionMode.everyone:
                flags = GroupDmAddPermissionFlag.everyone;
            }
            unawaited(vm.updateGroupDmAddPermissionFlags(flags));
          },
        ),
        if (mode == PermissionMode.custom)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FluxerSubsectionLabel('Additional Groups'),
              SizedBox(height: layout.s2),
              FluxerSwitchGroupItem(
                label: 'Friends of Friends',
                description:
                    'People who are friends with your '
                    'friends can add you to group chats',
                value: state.groupDmFriendsOfFriends,
                onChanged: (value) {
                  var flags = state.groupDmAddPermissionFlags;
                  if (value) {
                    flags |= GroupDmAddPermissionFlag.friendsOfFriends;
                  } else {
                    flags &= ~GroupDmAddPermissionFlag.friendsOfFriends;
                  }
                  unawaited(vm.updateGroupDmAddPermissionFlags(flags));
                },
              ),
              FluxerSwitchGroupItem(
                label: 'Community Members',
                description:
                    'People from communities '
                    "you're both in can add you "
                    'to group chats',
                value: state.groupDmGuildMembers,
                onChanged: (value) {
                  var flags = state.groupDmAddPermissionFlags;
                  if (value) {
                    flags |= GroupDmAddPermissionFlag.guildMembers;
                  } else {
                    flags &= ~GroupDmAddPermissionFlag.guildMembers;
                  }
                  unawaited(vm.updateGroupDmAddPermissionFlags(flags));
                },
              ),
            ],
          ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Sensitive Content section
  // ---------------------------------------------------------------------------

  Widget _buildSensitiveContentSection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<FluxerRadioItem<int>> filterItems = <FluxerRadioItem<int>>[
      FluxerRadioItem(value: 0, label: l10n.sensitiveContentFilterShow),
      FluxerRadioItem(value: 1, label: l10n.sensitiveContentFilterBlur),
      FluxerRadioItem(value: 2, label: l10n.sensitiveContentFilterBlock),
    ];
    final List<FluxerRadioItem<int>> guildFilterItems = <FluxerRadioItem<int>>[
      FluxerRadioItem(value: 0, label: l10n.sensitiveContentFilterShow),
      FluxerRadioItem(value: 1, label: l10n.sensitiveContentFilterBlur),
    ];

    return FluxerSettingsSection(
      title: l10n.sensitiveContentSectionTitle,
      description: l10n.sensitiveContentSectionDescription,
      children: [
        FluxerSettingsSubsection(
          children: [
            FluxerRadioGroup<int>(
              label: l10n.sensitiveContentFriendDmLabel,
              value: state.effectiveFriendDmFilter,
              items: filterItems,
              onChanged: vm.editFriendDmFilter,
            ),
            Opacity(
              opacity: state.isAdult ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !state.isAdult,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentNonFriendDmLabel,
                  value: state.effectiveNonFriendDmFilter,
                  items: filterItems,
                  onChanged: vm.editNonFriendDmFilter,
                ),
              ),
            ),
            Opacity(
              opacity: state.isAdult ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !state.isAdult,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentGuildLabel,
                  value: state.effectiveGuildFilter,
                  items: guildFilterItems,
                  onChanged: vm.editGuildFilter,
                ),
              ),
            ),
            FluxerSwitchGroupItem(
              label: l10n.sensitiveContentBlurUnscannedLabel,
              description: state.isAdult
                  ? l10n.sensitiveContentBlurUnscannedDescriptionAdult
                  : l10n.sensitiveContentBlurUnscannedDescriptionMinor,
              value: !state.isAdult || state.effectiveBlurUnscannedMedia,
              enabled: state.isAdult,
              onChanged: (v) => vm.editBlurUnscannedMedia(value: v),
            ),
            if (state.isSensitiveContentDirty)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FluxerButton.secondary(
                        label: l10n.sensitiveContentResetButton,
                        onPressed: vm.resetSensitiveContent,
                      ),
                    ),
                  ),
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: FluxerButton.primary(
                        label: l10n.sensitiveContentSaveButton,
                        isLoading: state.isSavingSensitiveContent,
                        onPressedAsync: vm.saveSensitiveContent,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // Data Export section
  // ---------------------------------------------------------------------------

  Widget _buildDataExportSection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    return FluxerSettingsSection(
      title: 'Data Export',
      description:
          'Download a complete package of your account data, '
          'including all messages and attachment URLs',
      children: [
        FluxerSettingsSubsection(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                border: Border.all(color: colors.backgroundHeaderSecondary),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: EdgeInsets.all(layout.s3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You can choose to include:',
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: layout.s2),
                  _infoListItem(
                    colors,
                    'Account \u2013 profile, settings, relationships, '
                    'payments, and all account metadata',
                  ),
                  SizedBox(height: layout.s1),
                  _infoListItem(
                    colors,
                    "Messages \u2013 all messages you've sent, with "
                    'channel context and attachment URLs',
                  ),
                  SizedBox(height: layout.s1),
                  _infoListItem(
                    colors,
                    'Communities \u2013 basic metadata about '
                    "communities you're in",
                  ),
                  SizedBox(height: layout.s1),
                  _infoListItem(
                    colors,
                    'Analytics \u2013 all analytics events associated '
                    'with your activity',
                  ),
                ],
              ),
            ),
            Text(
              "You can request a data export once every 7 days. You'll "
              'receive an email with a download link valid for 7 days.',
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FluxerButton.primary(
                label: 'Request Data Export',
                onPressed: _showDataExportSheet,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDataExportSheet() {
    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        context,
        title: 'Request Data Export',
        useRootNavigator: true,
        builder: (sheetContext, scrollController, close) {
          return _DataExportSheetContent(
            scrollController: scrollController,
            initialSelected: const {'account', 'messages', 'communities'},
            onRequest: (categories) async {
              final vm = ref.read(privacyDashboardViewModelProvider.notifier);
              await vm.requestDataExport(categories);
              close();
            },
            onCancel: close,
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Data Deletion section
  // ---------------------------------------------------------------------------

  Widget _buildDataDeletionSection(
    PrivacyDashboardViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);
    final pendingDeletion = state.pendingDeletion;

    return FluxerSettingsSection(
      title: 'Data Deletion',
      description:
          'Permanently delete all messages you have sent '
          'across the platform',
      children: [
        FluxerSettingsSubsection(
          children: [
            if (pendingDeletion != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FluxerWarningAlert(
                    title: FluxerLocalizations.of(
                      context,
                    ).privacyPendingDeletionTitle,
                    message:
                        'Deletion will remove '
                        '${pendingDeletion.messageCount} messages from '
                        '${pendingDeletion.channelCount} channels. '
                        'Scheduled to run on '
                        '${_formatScheduledDate(pendingDeletion.scheduledAt)}.',
                  ),
                  SizedBox(height: layout.s3),
                  SizedBox(
                    width: double.infinity,
                    child: FluxerButton.secondary(
                      label: 'Cancel pending deletion',
                      onPressedAsync: vm.cancelBulkMessageDeletion,
                    ),
                  ),
                ],
              ),
            Text(
              'Once deleted, your messages cannot be recovered. The deletion '
              'process runs in the background and may take some time depending '
              'on how many messages you have sent.',
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            if (pendingDeletion == null)
              SizedBox(
                width: double.infinity,
                child: FluxerButton.dangerPrimary(
                  label: 'Delete all my messages',
                  onPressed: _showDeleteMessagesSheet,
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _showDeleteMessagesSheet() {
    final colors = context.colors;
    final layout = context.layout;

    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: 'Delete All Messages',
        useRootNavigator: true,
        builder: (sheetContext, close) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you sure you want to delete all your messages? '
                  'This action cannot be undone.',
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: layout.s4),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary,
                    border: Border.all(color: colors.backgroundHeaderSecondary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.all(layout.s3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What happens next:',
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: layout.s2),
                      _numberedStep(
                        colors,
                        1,
                        'Your deletion request will be queued and '
                        'processed in the background',
                      ),
                      SizedBox(height: layout.s1),
                      _numberedStep(
                        colors,
                        2,
                        'The job starts 24 hours after you confirm '
                        'and can be canceled or restarted anytime',
                      ),
                      SizedBox(height: layout.s1),
                      _numberedStep(
                        colors,
                        3,
                        'The time to complete depends on how many '
                        'messages you have sent',
                      ),
                      SizedBox(height: layout.s1),
                      _numberedStep(
                        colors,
                        4,
                        'Once deleted, your messages cannot be recovered',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: layout.s4),
                SizedBox(
                  width: double.infinity,
                  child: FluxerButton.dangerPrimary(
                    label: 'Delete All Messages',
                    onPressedAsync: () async {
                      final vm = ref.read(
                        privacyDashboardViewModelProvider.notifier,
                      );
                      await vm.requestBulkMessageDeletion();
                      close();
                    },
                  ),
                ),
                SizedBox(height: layout.s2),
                SizedBox(
                  width: double.infinity,
                  child: FluxerButton.secondary(
                    label: 'Cancel',
                    onPressed: close,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Widget _infoListItem(FluxerColorTheme colors, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\u2022 ',
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberedStep(FluxerColorTheme colors, int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatScheduledDate(String isoDate) {
    final dt = DateTime.parse(isoDate).toLocal();
    final year = dt.year.toString();
    final month = dt.month.toString().padLeft(2, '0');
    final day = dt.day.toString().padLeft(2, '0');
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute';
  }
}

// ---------------------------------------------------------------------------
// Data Export sheet content (extracted to manage local checkbox state)
// ---------------------------------------------------------------------------

class _DataExportSheetContent extends StatefulWidget {
  const _DataExportSheetContent({
    required this.scrollController,
    required this.initialSelected,
    required this.onRequest,
    required this.onCancel,
  });

  final ScrollController scrollController;
  final Set<String> initialSelected;
  final Future<void> Function(Set<String> categories) onRequest;
  final VoidCallback onCancel;

  @override
  State<_DataExportSheetContent> createState() =>
      _DataExportSheetContentState();
}

class _DataExportSheetContentState extends State<_DataExportSheetContent> {
  late final Set<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Set<String>.from(widget.initialSelected);
  }

  void _toggle(String category) {
    setState(() {
      if (_selected.contains(category)) {
        _selected.remove(category);
      } else {
        _selected.add(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return ListView(
      controller: widget.scrollController,
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      children: [
        Text(
          'Select which categories of data to include in your export.',
          style: context.textStyles.bodySmall.copyWith(
            color: colors.textPrimaryMuted,
          ),
        ),
        SizedBox(height: layout.s4),
        _checkboxWithDescription(
          colors,
          layout,
          value: _selected.contains('account'),
          onChanged: () => _toggle('account'),
          label: 'Account',
          description:
              'Profile, settings, relationships, payments, '
              'sessions, and all account metadata',
        ),
        SizedBox(height: layout.s3),
        _checkboxWithDescription(
          colors,
          layout,
          value: _selected.contains('messages'),
          onChanged: () => _toggle('messages'),
          label: 'Messages',
          description:
              "All messages you've sent, with channel context "
              'and attachment URLs',
        ),
        SizedBox(height: layout.s3),
        _checkboxWithDescription(
          colors,
          layout,
          value: _selected.contains('communities'),
          onChanged: () => _toggle('communities'),
          label: 'Communities',
          description:
              "Basic metadata about all communities you're "
              'currently in',
        ),
        SizedBox(height: layout.s3),
        _checkboxWithDescription(
          colors,
          layout,
          value: _selected.contains('analytics'),
          onChanged: () => _toggle('analytics'),
          label: 'Analytics',
          description:
              'All analytics events associated with your '
              'activity, exported as JSON-LD',
        ),
        SizedBox(height: layout.s4),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            border: Border.all(color: colors.backgroundHeaderSecondary),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(layout.s3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What happens next:',
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s2),
              _buildStep(colors, 1, 'Your export request will be processed'),
              SizedBox(height: layout.s1),
              _buildStep(
                colors,
                2,
                "You'll receive an email when your data "
                'package is ready',
              ),
              SizedBox(height: layout.s1),
              _buildStep(
                colors,
                3,
                'The download link will be valid for 7 days',
              ),
              SizedBox(height: layout.s1),
              _buildStep(
                colors,
                4,
                'You can request a new export once every 7 days',
              ),
            ],
          ),
        ),
        SizedBox(height: layout.s4),
        SizedBox(
          width: double.infinity,
          child: FluxerButton.primary(
            label: 'Request Export',
            onPressedAsync: _selected.isEmpty
                ? null
                : () => widget.onRequest(_selected),
          ),
        ),
        SizedBox(height: layout.s2),
        SizedBox(
          width: double.infinity,
          child: FluxerButton.secondary(
            label: 'Cancel',
            onPressed: widget.onCancel,
          ),
        ),
      ],
    );
  }

  Widget _checkboxWithDescription(
    FluxerColorTheme colors,
    FluxerLayoutTheme layout, {
    required bool value,
    required VoidCallback onChanged,
    required String label,
    required String description,
  }) {
    return FluxerCheckbox(
      value: value,
      onChanged: (_) => onChanged(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: layout.s1 / 2),
          Text(
            description,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimary.withValues(alpha: 0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(FluxerColorTheme colors, int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
