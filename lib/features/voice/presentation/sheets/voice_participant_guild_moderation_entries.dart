import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/ban_member_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/timeout_member_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_actions_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_confirmation_sheet.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<VoiceParticipantMenuEntry> buildVoiceParticipantGuildModerationEntries({
  required BuildContext context,
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required String guildId,
  required String userId,
  required String username,
  required ProfileMenuCapabilities capabilities,
  required String? currentNick,
  required VoidCallback close,
}) {
  final List<VoiceParticipantMenuEntry> entries = <VoiceParticipantMenuEntry>[];

  if (capabilities.showTimeout) {
    entries.add(
      VoiceParticipantMenuActionEntry(
        label: l10n.userProfileTimeout,
        icon: PhosphorIconsFill.clock,
        isDanger: true,
        onPressed: () {
          close();
          unawaited(() async {
            final int? seconds = await TimeoutMemberSheet.show(
              context,
              username: username,
            );
            if (seconds == null) {
              return;
            }
            await UserProfileActionsSheet.runGuildModeration(
              ref,
              guildId: guildId,
              userId: userId,
              successMessage: l10n.userProfileTimeoutSuccess(username),
              failureMessage: l10n.userProfileActionFailed,
              action: () => ref
                  .read(fluxerClientProvider)
                  .guilds
                  .updateGuildMember(
                    guildId: guildId,
                    userId: userId,
                    body: GuildMemberUpdateRequest(
                      nick: currentNick,
                      communicationDisabledUntil: DateTime.now().toUtc().add(
                        Duration(seconds: seconds),
                      ),
                    ),
                  ),
            );
          }());
        },
      ),
    );
  }

  if (capabilities.showRemoveTimeout) {
    entries.add(
      VoiceParticipantMenuActionEntry(
        label: l10n.userProfileRemoveTimeout,
        icon: PhosphorIconsFill.clockClockwise,
        isDanger: true,
        onPressed: () {
          close();
          unawaited(() async {
            final bool ok = await UserProfileConfirmationSheet.show(
              context,
              title: l10n.userProfileRemoveTimeoutConfirmTitle,
              description: l10n.userProfileRemoveTimeoutConfirmDescription(
                username,
              ),
              primaryLabel: l10n.userProfileRemoveTimeout,
              primaryVariant: FluxerButtonVariant.dangerPrimary,
            );
            if (!ok) {
              return;
            }
            await UserProfileActionsSheet.runGuildModeration(
              ref,
              guildId: guildId,
              userId: userId,
              successMessage: l10n.userProfileRemoveTimeoutSuccess(username),
              failureMessage: l10n.userProfileActionFailed,
              action: () => ref
                  .read(fluxerClientProvider)
                  .guilds
                  .updateGuildMember(
                    guildId: guildId,
                    userId: userId,
                    body: GuildMemberUpdateRequest(nick: currentNick),
                  ),
            );
          }());
        },
      ),
    );
  }

  if (capabilities.canKick) {
    entries.add(
      VoiceParticipantMenuActionEntry(
        label: l10n.userProfileKick,
        icon: PhosphorIconsFill.signOut,
        isDanger: true,
        onPressed: () {
          close();
          unawaited(() async {
            final bool ok = await UserProfileConfirmationSheet.show(
              context,
              title: l10n.userProfileKickConfirmTitle(username),
              description: l10n.userProfileKickConfirmDescription(username),
              primaryLabel: l10n.userProfileKick,
              primaryVariant: FluxerButtonVariant.dangerPrimary,
            );
            if (!ok) {
              return;
            }
            await UserProfileActionsSheet.runGuildModeration(
              ref,
              guildId: guildId,
              userId: userId,
              successMessage: l10n.userProfileKickSuccess(username),
              failureMessage: l10n.userProfileActionFailed,
              action: () => ref
                  .read(fluxerClientProvider)
                  .guilds
                  .removeGuildMember(guildId: guildId, userId: userId),
            );
          }());
        },
      ),
    );
  }

  if (capabilities.canBan) {
    entries.add(
      VoiceParticipantMenuActionEntry(
        label: l10n.userProfileBan,
        icon: PhosphorIconsFill.gavel,
        isDanger: true,
        onPressed: () {
          close();
          unawaited(() async {
            final result = await BanMemberSheet.show(
              context,
              username: username,
            );
            if (result == null) {
              return;
            }
            await UserProfileActionsSheet.runGuildModeration(
              ref,
              guildId: guildId,
              userId: userId,
              successMessage: l10n.userProfileBanSuccess(username),
              failureMessage: l10n.userProfileActionFailed,
              action: () => ref
                  .read(fluxerClientProvider)
                  .guilds
                  .banGuildMember(
                    guildId: guildId,
                    userId: userId,
                    body: GuildBanCreateRequest(
                      deleteMessageDays: result.deleteMessageDays,
                      reason: result.reason,
                      banDurationSeconds: result.banDurationSeconds,
                    ),
                  ),
            );
          }());
        },
      ),
    );
  }

  return entries;
}
