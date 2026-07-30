import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/constants/user_flags.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/presentation/change_friend_nickname.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_simple_report_sheet.dart';
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/ban_member_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/change_nickname_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/timeout_member_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_confirmation_sheet.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileActionsSheet {
  UserProfileActionsSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required Friend? relationship,
    required UserProfileFullResponseUser user,
    required bool isCurrentUser,
    required Offset position,
    required String displayName,
    bool hasGuildProfile = false,
    bool isShowingGlobalProfile = false,
    VoidCallback? onShowGlobalProfile,
    VoidCallback? onShowCommunityProfile,
    String? guildId,
    Message? message,
    String? avatarUrl,
    int? avatarColor,
    ProfileMenuCapabilities capabilities = ProfileMenuCapabilities.none,
    String? currentNick,
    DateTime? currentTimeoutUntil,
  }) {
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) {
        final l10n = FluxerLocalizations.of(menuContext);
        final tag = '${user.username}#${user.discriminator}';
        final status = relationship?.friendStatus;
        final bool isSystem = user.system ?? false;

        // Each entry is a divider-separated group, mirroring the web
        // `UserProfileActionsSheet` menu grouping.
        final groups = <List<Widget>>[];

        if (hasGuildProfile) {
          groups.add(<Widget>[
            FluxerMenuItem(
              label: isShowingGlobalProfile
                  ? l10n.userProfileViewCommunityProfile
                  : l10n.userProfileViewMainProfile,
              icon: PhosphorIconsFill.userCircle,
              onPressed: () {
                close();
                if (isShowingGlobalProfile) {
                  onShowCommunityProfile?.call();
                  return;
                }
                onShowGlobalProfile?.call();
              },
            ),
          ]);
        }

        groups.add(<Widget>[
          FluxerMenuItem(
            label: l10n.userProfileCopyUsername,
            icon: PhosphorIconsFill.copy,
            onPressed: () async {
              close();
              await copyToClipboard(context: menuContext, value: tag);
            },
          ),
          FluxerMenuItem(
            label: l10n.userProfileCopyUserId,
            icon: PhosphorIconsFill.identificationCard,
            onPressed: () async {
              close();
              await copyToClipboard(context: menuContext, value: user.id);
            },
          ),
        ]);

        if (guildId != null) {
          if (capabilities.canChangeNickname) {
            groups.add(<Widget>[
              FluxerMenuItem(
                label: l10n.userProfileChangeNickname,
                icon: PhosphorIconsFill.pencilSimple,
                onPressed: () async {
                  close();
                  final result = await ChangeNicknameSheet.show(
                    context,
                    username: user.username,
                    currentNick: currentNick,
                  );
                  if (result == null) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileNicknameSuccess,
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => _updateGuildMemberNickname(
                      ref: ref,
                      guildId: guildId,
                      userId: user.id,
                      nick: result.nick,
                      isCurrentUser: isCurrentUser,
                    ),
                  );
                },
              ),
            ]);
          }

          if (capabilities.canTransfer) {
            groups.add(<Widget>[
              FluxerMenuItem(
                label: l10n.userProfileTransferOwnership,
                icon: PhosphorIconsFill.crown,
                isDanger: true,
                onPressed: () async {
                  close();
                  final ok = await UserProfileConfirmationSheet.show(
                    context,
                    title: l10n.userProfileTransferConfirmTitle,
                    description: l10n.userProfileTransferConfirmDescription(
                      user.username,
                    ),
                    primaryLabel: l10n.userProfileTransferOwnership,
                    primaryVariant: FluxerButtonVariant.dangerPrimary,
                  );
                  if (!ok) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileTransferSuccess,
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => ref
                        .read(fluxerClientProvider)
                        .guilds
                        .transferGuildOwnership(
                          guildId: guildId,
                          body: GuildTransferOwnershipRequest(
                            newOwnerId: user.id,
                          ),
                        ),
                  );
                },
              ),
            ]);
          }

          final moderationItems = <Widget>[];
          if (capabilities.showTimeout) {
            moderationItems.add(
              FluxerMenuItem(
                label: l10n.userProfileTimeout,
                icon: PhosphorIconsFill.clock,
                isDanger: true,
                onPressed: () async {
                  close();
                  final seconds = await TimeoutMemberSheet.show(
                    context,
                    username: user.username,
                  );
                  if (seconds == null) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileTimeoutSuccess(
                      user.username,
                    ),
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => ref
                        .read(fluxerClientProvider)
                        .guilds
                        .updateGuildMember(
                          guildId: guildId,
                          userId: user.id,
                          body: GuildMemberUpdateRequest(
                            nick: currentNick,
                            communicationDisabledUntil: DateTime.now()
                                .toUtc()
                                .add(Duration(seconds: seconds)),
                          ),
                        ),
                  );
                },
              ),
            );
          }
          if (capabilities.showRemoveTimeout) {
            moderationItems.add(
              FluxerMenuItem(
                label: l10n.userProfileRemoveTimeout,
                icon: PhosphorIconsFill.clockClockwise,
                isDanger: true,
                onPressed: () async {
                  close();
                  final ok = await UserProfileConfirmationSheet.show(
                    context,
                    title: l10n.userProfileRemoveTimeoutConfirmTitle,
                    description: l10n
                        .userProfileRemoveTimeoutConfirmDescription(
                          user.username,
                        ),
                    primaryLabel: l10n.userProfileRemoveTimeout,
                    primaryVariant: FluxerButtonVariant.dangerPrimary,
                  );
                  if (!ok) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileRemoveTimeoutSuccess(
                      user.username,
                    ),
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => ref
                        .read(fluxerClientProvider)
                        .guilds
                        .updateGuildMember(
                          guildId: guildId,
                          userId: user.id,
                          body: GuildMemberUpdateRequest(
                            nick: currentNick,
                            communicationDisabledUntil: null,
                          ),
                        ),
                  );
                },
              ),
            );
          }
          if (capabilities.canKick) {
            moderationItems.add(
              FluxerMenuItem(
                label: l10n.userProfileKick,
                icon: PhosphorIconsFill.signOut,
                isDanger: true,
                onPressed: () async {
                  close();
                  final ok = await UserProfileConfirmationSheet.show(
                    context,
                    title: l10n.userProfileKickConfirmTitle(user.username),
                    description: l10n.userProfileKickConfirmDescription(
                      user.username,
                    ),
                    primaryLabel: l10n.userProfileKick,
                    primaryVariant: FluxerButtonVariant.dangerPrimary,
                  );
                  if (!ok) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileKickSuccess(user.username),
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => ref
                        .read(fluxerClientProvider)
                        .guilds
                        .removeGuildMember(guildId: guildId, userId: user.id),
                  );
                },
              ),
            );
          }
          if (capabilities.canBan) {
            moderationItems.add(
              FluxerMenuItem(
                label: l10n.userProfileBan,
                icon: PhosphorIconsFill.gavel,
                isDanger: true,
                onPressed: () async {
                  close();
                  final result = await BanMemberSheet.show(
                    context,
                    username: user.username,
                  );
                  if (result == null) {
                    return;
                  }
                  await _runGuildModeration(
                    ref,
                    guildId: guildId,
                    userId: user.id,
                    successMessage: l10n.userProfileBanSuccess(user.username),
                    failureMessage: l10n.userProfileActionFailed,
                    action: () => ref
                        .read(fluxerClientProvider)
                        .guilds
                        .banGuildMember(
                          guildId: guildId,
                          userId: user.id,
                          body: GuildBanCreateRequest(
                            deleteMessageDays: result.deleteMessageDays,
                            reason: result.reason,
                            banDurationSeconds: result.banDurationSeconds,
                          ),
                        ),
                  );
                },
              ),
            );
          }
          if (moderationItems.isNotEmpty) {
            groups.add(moderationItems);
          }
        }

        if (!isCurrentUser) {
          if (status == FriendStatus.accepted) {
            groups.add(<Widget>[
              FluxerMenuItem(
                label: l10n.dmChangeFriendNickname,
                icon: PhosphorIconsFill.pencilSimple,
                onPressed: () async {
                  close();
                  await showChangeFriendNicknameSheet(
                    context,
                    ref,
                    userId: user.id,
                    username: user.username,
                    currentNick: relationship?.nickname,
                  );
                },
              ),
              FluxerMenuItem(
                label: l10n.userProfileRemoveFriend,
                icon: PhosphorIconsFill.userMinus,
                isDanger: true,
                onPressed: () async {
                  close();
                  final ok = await UserProfileConfirmationSheet.show(
                    context,
                    title: l10n.userProfileRemoveFriendConfirmTitle,
                    description: l10n.userProfileRemoveFriendConfirmDescription(
                      user.username,
                    ),
                    primaryLabel: l10n.userProfileRemoveFriend,
                    primaryVariant: FluxerButtonVariant.dangerPrimary,
                  );
                  if (ok) {
                    await _runRepoAction(
                      ref,
                      l10n.userProfileActionFailed,
                      () => ref
                          .read(friendRepositoryProvider)
                          .removeRelationship(user.id),
                    );
                  }
                },
              ),
            ]);
          }

          final reportBlockItems = <Widget>[];
          final reportableMessage = message;
          if (reportableMessage != null &&
              !reportableMessage.hasFailed &&
              (reportableMessage.type == messageTypeDefault ||
                  reportableMessage.type == messageTypeReply)) {
            reportBlockItems.add(
              FluxerMenuItem(
                label: l10n.userProfileReportMessage,
                icon: PhosphorIconsFill.flag,
                isDanger: true,
                onPressed: () async {
                  close();
                  await showSimpleIarReportSheet(
                    context,
                    iarContext: IarMessageContext(
                      message: reportableMessage,
                      guildId: guildId,
                    ),
                  );
                },
              ),
            );
          }
          reportBlockItems.add(
            FluxerMenuItem(
              label: l10n.userProfileReportUser,
              icon: PhosphorIconsFill.flag,
              isDanger: true,
              onPressed: () async {
                close();
                await showSimpleIarReportSheet(
                  context,
                  iarContext: IarUserContext(
                    userId: user.id,
                    username: user.username,
                    displayName: displayName,
                    avatarUrl: avatarUrl,
                    avatarColor: avatarColor,
                    guildId: guildId,
                  ),
                );
              },
            ),
          );
          if (!isSystem) {
            if (status == FriendStatus.blocked) {
              reportBlockItems.add(
                FluxerMenuItem(
                  label: l10n.userProfileUnblockUser,
                  icon: PhosphorIconsFill.prohibit,
                  onPressed: () async {
                    close();
                    final ok = await UserProfileConfirmationSheet.show(
                      context,
                      title: l10n.userProfileUnblockConfirmTitle,
                      description: l10n.userProfileUnblockConfirmDescription(
                        user.username,
                      ),
                      primaryLabel: l10n.userProfileUnblockUser,
                      primaryVariant: FluxerButtonVariant.primary,
                    );
                    if (ok) {
                      await _runRepoAction(
                        ref,
                        l10n.userProfileActionFailed,
                        () => ref
                            .read(friendRepositoryProvider)
                            .removeRelationship(user.id),
                      );
                    }
                  },
                ),
              );
            } else {
              reportBlockItems.add(
                FluxerMenuItem(
                  label: l10n.userProfileBlockUser,
                  icon: PhosphorIconsFill.prohibit,
                  isDanger: true,
                  onPressed: () async {
                    close();
                    final ok = await UserProfileConfirmationSheet.show(
                      context,
                      title: l10n.userProfileBlockConfirmTitle,
                      description: l10n.userProfileBlockConfirmDescription(
                        user.username,
                      ),
                      primaryLabel: l10n.userProfileBlockUser,
                      primaryVariant: FluxerButtonVariant.dangerPrimary,
                    );
                    if (ok) {
                      await _runRepoAction(
                        ref,
                        l10n.userProfileActionFailed,
                        () => ref
                            .read(friendRepositoryProvider)
                            .blockUser(user.id),
                      );
                    }
                  },
                ),
              );
            }
          }
          groups.add(reportBlockItems);
        }

        final bool developerMode = ref.read(
          userSettingsViewModelProvider.select((s) => s.developerMode),
        );
        if (developerMode && !isCurrentUser) {
          final LocalUserSpamOverrideState spamOverride = ref.read(
            localUserSpamOverrideProvider,
          );
          final LocalUserSpamOverride spamNotifier = ref.read(
            localUserSpamOverrideProvider.notifier,
          );
          final bool isLocalSpammer = spamOverride.spammerUserIds.contains(
            user.id,
          );
          final bool isLocalNotSpammer = spamOverride.notSpammerUserIds
              .contains(user.id);
          final bool isServerSpammerUser = isServerSpammer(user.flags);
          final List<Widget> spamOverrideItems = <Widget>[
            FluxerMenuItem(
              label: l10n.devMarkAsSpamLocally,
              icon: isLocalSpammer
                  ? PhosphorIconsFill.check
                  : PhosphorIconsFill.bug,
              onPressed: () {
                close();
                unawaited(
                  isLocalSpammer
                      ? spamNotifier.clearOverride(user.id)
                      : spamNotifier.markAsSpammer(user.id),
                );
              },
            ),
          ];
          if (isServerSpammerUser) {
            spamOverrideItems.add(
              FluxerMenuItem(
                label: l10n.devIgnoreSpamFlag,
                icon: isLocalNotSpammer
                    ? PhosphorIconsFill.check
                    : PhosphorIconsFill.bug,
                onPressed: () {
                  close();
                  unawaited(
                    isLocalNotSpammer
                        ? spamNotifier.clearOverride(user.id)
                        : spamNotifier.markAsNotSpammer(user.id),
                  );
                },
              ),
            );
          }
          groups.add(spamOverrideItems);
        }

        final widgets = <Widget>[];
        for (final group in groups) {
          if (group.isEmpty) {
            continue;
          }
          if (widgets.isNotEmpty) {
            widgets.add(const FluxerMenuDivider());
          }
          widgets.addAll(group);
        }
        return widgets;
      },
    );
  }

  static Future<void> _updateGuildMemberNickname({
    required WidgetRef ref,
    required String guildId,
    required String userId,
    required String? nick,
    required bool isCurrentUser,
  }) async {
    if (isCurrentUser) {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .updateCurrentGuildMember(
            guildId: guildId,
            body: MyGuildMemberUpdateRequest(nick: nick),
          );
      return;
    }
    // Can't use updateGuildMember
    // communication_disabled_until are treated as required in the OpenAPI spec but
    // should not be included in patch for other users. The OpenAPI spec should be fixed at some point.
    await ref
        .read(fluxerDioProvider)
        .patch<void>(
          '/guilds/$guildId/members/$userId',
          data: <String, dynamic>{'nick': nick},
        );
  }

  static Future<void> _runGuildModeration(
    WidgetRef ref, {
    required String guildId,
    required String userId,
    required String successMessage,
    required String failureMessage,
    required Future<void> Function() action,
  }) async {
    try {
      await action();
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: successMessage,
              variant: FluxerToastVariant.success,
            ),
          );
      ref.invalidate(userProfileProvider(userId: userId, guildId: guildId));
    } on Object catch (e, st) {
      talker.error('[UserProfileActionsSheet] moderation failed: $e', e, st);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: failureMessage,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  static Future<void> _runRepoAction(
    WidgetRef ref,
    String errorMessage,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } on Object catch (e, st) {
      talker.error('[UserProfileActionsSheet] action failed: $e', e, st);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: errorMessage,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }
}
