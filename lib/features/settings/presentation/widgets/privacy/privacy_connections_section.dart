import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/domain/privacy_permission.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/privacy_dm_confirmation_sheet.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PrivacyConnectionsSection extends ConsumerWidget {
  const PrivacyConnectionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);

    return FluxerSettingsSection(
      sectionId: 'connections',
      title: l10n.privacyDashboardFriendsAndDirectMessagesSection,
      children: [
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardFriendRequestsTitle,
          children: [
            FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardFriendRequestsEveryone,
                  value: state.everyoneCanFriendRequest,
                  onChanged: (value) => unawaited(
                    vm.updateFriendSourceFlag(
                      FriendSourceFlag.noRelation,
                      enabled: value,
                    ),
                  ),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardFriendRequestsFriendsOfFriends,
                  value:
                      state.everyoneCanFriendRequest ||
                      state.friendsOfFriendsCanFriend,
                  enabled: !state.everyoneCanFriendRequest,
                  onChanged: (value) => unawaited(
                    vm.updateFriendSourceFlag(
                      FriendSourceFlag.mutualFriends,
                      enabled: value,
                    ),
                  ),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardFriendRequestsCommunityMembers,
                  value:
                      state.everyoneCanFriendRequest ||
                      state.communityMembersCanFriend,
                  enabled: !state.everyoneCanFriendRequest,
                  onChanged: (value) => unawaited(
                    vm.updateFriendSourceFlag(
                      FriendSourceFlag.mutualGuilds,
                      enabled: value,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardDirectMessagesTitle,
          children: [
            FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardDirectMessagesMembers,
                  value: !state.defaultGuildsRestricted,
                  onChanged: (value) => unawaited(
                    _handleDmToggle(
                      context,
                      ref,
                      allowing: value,
                      isBots: false,
                    ),
                  ),
                ),
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardDirectMessagesBots,
                  value: !state.botDefaultGuildsRestricted,
                  onChanged: (value) => unawaited(
                    _handleDmToggle(
                      context,
                      ref,
                      allowing: value,
                      isBots: true,
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

  Future<void> _handleDmToggle(
    BuildContext context,
    WidgetRef ref, {
    required bool allowing,
    required bool isBots,
  }) async {
    final guildIds = ref
        .read(guildListViewModelProvider)
        .guilds
        .map((guild) => guild.id)
        .toList();
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);

    if (guildIds.isEmpty) {
      if (isBots) {
        await vm.updateBotDefaultGuildsRestricted(restricted: !allowing);
      } else {
        await vm.updateDefaultGuildsRestricted(restricted: !allowing);
      }
      return;
    }

    final bool? applyToAll = await PrivacyDmConfirmationSheet.show(
      context,
      allowing: allowing,
      isBots: isBots,
    );
    if (applyToAll == null) {
      return;
    }

    if (isBots) {
      await vm.updateBotDefaultGuildsRestricted(
        restricted: !allowing,
        applyToAll: applyToAll,
        guildIds: allowing ? const <String>[] : guildIds,
      );
    } else {
      await vm.updateDefaultGuildsRestricted(
        restricted: !allowing,
        applyToAll: applyToAll,
        guildIds: allowing ? const <String>[] : guildIds,
      );
    }
  }
}
