import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/utils/guild_bans_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildBanActionsSheet {
  GuildBanActionsSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required GuildBanEntry entry,
    required VoidCallback onViewDetails,
    required VoidCallback onRevokeBan,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        final layout = sheetContext.layout;
        return FluxerBottomSheetContent(
          scrollable: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _GuildBanActionsHeader(entry: entry),
              SizedBox(height: layout.s3),
              FluxerBottomSheetGroupColumn(
                children: <Widget>[
                  FluxerMenuGroup(
                    children: <Widget>[
                      FluxerBottomSheetMenuItem(
                        label: l10n.guildSettingsBanViewDetails,
                        icon: PhosphorIconsBold.eye,
                        onTap: () {
                          close();
                          onViewDetails();
                        },
                      ),
                    ],
                  ),
                  FluxerMenuGroup(
                    children: <Widget>[
                      FluxerBottomSheetMenuItem(
                        label: l10n.userProfileCopyUserId,
                        icon: PhosphorIconsBold.identificationCard,
                        onTap: () async {
                          await copyToClipboard(
                            context: sheetContext,
                            value: entry.userId,
                            message: l10n.dmUserIdCopied,
                          );
                          close();
                        },
                      ),
                    ],
                  ),
                  FluxerMenuGroup(
                    children: <Widget>[
                      FluxerBottomSheetMenuItem(
                        label: l10n.guildSettingsRevokeBanTitle,
                        icon: PhosphorIconsBold.prohibit,
                        isDanger: true,
                        onTap: () {
                          close();
                          onRevokeBan();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GuildBanActionsHeader extends StatelessWidget {
  const _GuildBanActionsHeader({required this.entry});

  final GuildBanEntry entry;

  @override
  Widget build(BuildContext context) {
    final user = entry.ban.user;
    final String displayName = resolveDisplayName(
      username: user.username,
      globalName: user.globalName,
    );
    final String tag = GuildBansUtils.buildUserTag(user);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Padding(
      padding: settingsSheetScrollPadding(context),
      child: Row(
        children: <Widget>[
          FluxerAvatar.user(
            fallbackText: displayName,
            userId: user.id,
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: user.id,
              hash: user.avatar,
            ),
            avatarColor: user.avatarColor,
            showStatus: false,
            size: 48,
          ),
          SizedBox(width: layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  displayName,
                  style: textStyles.heading.copyWith(
                    fontSize: 16,
                    color: colors.textChat,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tag,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimaryMuted,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
