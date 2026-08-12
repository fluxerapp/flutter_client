import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/privacy_permission.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PrivacyCommunicationSection extends ConsumerWidget {
  const PrivacyCommunicationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);

    return FluxerSettingsSection(
      sectionId: 'communication',
      title: l10n.privacyDashboardCommunicationSection,
      children: [
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardIncomingCallsTitle,
          children: [
            FluxerSelect<PermissionMode>(
              label: l10n.privacyDashboardAllowedCallers,
              value: state.incomingCallMode,
              enableSearch: false,
              items: [
                FluxerSelectItem(
                  value: PermissionMode.nobody,
                  label: l10n.privacyDashboardIncomingCallNobodyDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.friendsOnly,
                  label: l10n.privacyDashboardIncomingCallFriendsOnlyDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.custom,
                  label: l10n.privacyDashboardIncomingCallCustomDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.everyone,
                  label: l10n.privacyDashboardIncomingCallEveryoneDesc,
                ),
              ],
              onChanged: (mode) => unawaited(
                vm.updateIncomingCallFlags(
                  incomingCallFlagsForMode(mode, state.incomingCallFlags),
                ),
              ),
            ),
            if (state.incomingCallMode == PermissionMode.custom) ...[
              SizedBox(height: layout.s2),
              FluxerSubsectionLabel(l10n.privacyDashboardAdditionalGroups),
              SizedBox(height: layout.s2),
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.privacyDashboardFriendRequestsFriendsOfFriends,
                    value: state.callFriendsOfFriends,
                    onChanged: (value) => unawaited(
                      vm.updateIncomingCallFlags(
                        toggleIncomingCallFlag(
                          currentFlags: state.incomingCallFlags,
                          flag: IncomingCallFlag.friendsOfFriends,
                          enabled: value,
                        ),
                      ),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.privacyDashboardFriendRequestsCommunityMembers,
                    value: state.callGuildMembers,
                    onChanged: (value) => unawaited(
                      vm.updateIncomingCallFlags(
                        toggleIncomingCallFlag(
                          currentFlags: state.incomingCallFlags,
                          flag: IncomingCallFlag.guildMembers,
                          enabled: value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (state.incomingCallMode != PermissionMode.nobody) ...[
              SizedBox(height: layout.s2),
              FluxerSubsectionLabel(l10n.privacyDashboardRingBehavior),
              SizedBox(height: layout.s2),
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.privacyDashboardSilentCalls,
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
          ],
        ),
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardGroupDmTitle,
          children: [
            FluxerSelect<PermissionMode>(
              label: l10n.privacyDashboardAllowedInvites,
              value: state.groupDmAddMode,
              enableSearch: false,
              items: [
                FluxerSelectItem(
                  value: PermissionMode.nobody,
                  label: l10n.privacyDashboardGroupDmNobodyDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.friendsOnly,
                  label: l10n.privacyDashboardGroupDmFriendsOnlyDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.custom,
                  label: l10n.privacyDashboardGroupDmCustomDesc,
                ),
                FluxerSelectItem(
                  value: PermissionMode.everyone,
                  label: l10n.privacyDashboardGroupDmEveryoneDesc,
                ),
              ],
              onChanged: (mode) => unawaited(
                vm.updateGroupDmAddPermissionFlags(
                  groupDmAddFlagsForMode(mode, state.groupDmAddPermissionFlags),
                ),
              ),
            ),
            if (state.groupDmAddMode == PermissionMode.custom) ...[
              SizedBox(height: layout.s2),
              FluxerSubsectionLabel(l10n.privacyDashboardAdditionalGroups),
              SizedBox(height: layout.s2),
              FluxerSettingsSwitchGroup(
                children: [
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.privacyDashboardFriendRequestsFriendsOfFriends,
                    value: state.groupDmFriendsOfFriends,
                    onChanged: (value) => unawaited(
                      vm.updateGroupDmAddPermissionFlags(
                        toggleGroupDmAddFlag(
                          currentFlags: state.groupDmAddPermissionFlags,
                          flag: GroupDmAddPermissionFlag.friendsOfFriends,
                          enabled: value,
                        ),
                      ),
                    ),
                  ),
                  FluxerSettingsSwitchItem.grouped(
                    label: l10n.privacyDashboardFriendRequestsCommunityMembers,
                    value: state.groupDmGuildMembers,
                    onChanged: (value) => unawaited(
                      vm.updateGroupDmAddPermissionFlags(
                        toggleGroupDmAddFlag(
                          currentFlags: state.groupDmAddPermissionFlags,
                          flag: GroupDmAddPermissionFlag.guildMembers,
                          enabled: value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }
}
