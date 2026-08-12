import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/utils/guild_settings_path.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/guild_settings_modal.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class NoRolesAvailableSheet {
  NoRolesAvailableSheet._();

  static Future<void> show(BuildContext context, {required String guildId}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String rolesSettingsPath = formatGuildSettingsRolesPath(l10n);

    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.memberRolesNoRolesAvailable,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        final colors = sheetContext.colors;
        final layout = sheetContext.layout;
        final String description = l10n.memberRolesNoRolesAvailableDescription(
          rolesSettingsPath,
        );
        final int pathIndex = description.indexOf(rolesSettingsPath);
        final String beforePath = pathIndex >= 0
            ? description.substring(0, pathIndex)
            : description;
        final String afterPath = pathIndex >= 0
            ? description.substring(pathIndex + rolesSettingsPath.length)
            : '';

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  style: sheetContext.textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                  ),
                  children: <InlineSpan>[
                    TextSpan(text: beforePath),
                    if (pathIndex >= 0)
                      TextSpan(
                        text: rolesSettingsPath,
                        style: sheetContext.textStyles.bodySmall.copyWith(
                          color: colors.brandPrimary,
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            close();
                            unawaited(
                              GuildSettingsModal.show(
                                sheetContext,
                                guildId: guildId,
                                initialTab: GuildSettingsTab.roles,
                              ),
                            );
                          },
                      ),
                    TextSpan(text: afterPath),
                  ],
                ),
              ),
              SizedBox(height: layout.s4),
              FluxerButton.primary(
                label: l10n.memberRolesConfirmOk,
                onPressed: close,
              ),
            ],
          ),
        );
      },
    );
  }
}
