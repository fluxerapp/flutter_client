import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';

Future<void> showChannelInviteModal(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required String channelName,
  required String guildId,
  required bool useVanityUrl,
  String? vanityUrlCode,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
  late final String inviteUrl;
  if (useVanityUrl && vanityUrlCode != null && vanityUrlCode.isNotEmpty) {
    inviteUrl = '$inviteBase/$vanityUrlCode';
  } else {
    final FluxerClient client = ref.read(fluxerClientProvider);
    final invite = await client.invites.createChannelInvite(
      channelId: channelId,
      body: const ChannelInviteCreateRequest(
        maxAge: 604800,
        maxUses: 0,
        temporary: false,
      ),
    );
    final String code = invite.toGuildInviteMetadataResponse().code;
    inviteUrl = '$inviteBase/$code';
  }
  if (!context.mounted) {
    return;
  }
  final ValueNotifier<bool> copied = ValueNotifier<bool>(false);
  await FluxerModal.show<void>(
    context,
    title: l10n.channelDetailsInvitePeople,
    builder: (BuildContext dialogContext, VoidCallback close) {
      final colors = dialogContext.colors;
      final textStyles = dialogContext.textStyles;
      final layout = dialogContext.layout;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.guildNavbarInviteRecipientsChannel(channelName),
            style: textStyles.timestamp.copyWith(
              color: colors.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.guildNavbarInviteLinkPrompt,
            style: textStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w500,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: layout.s2),
          TextFormField(
            initialValue: inviteUrl,
            readOnly: true,
            style: textStyles.bodySmall.copyWith(color: colors.textPrimary),
            decoration: InputDecoration(hintText: l10n.guildNavbarInviteLink),
          ),
        ],
      );
    },
    actions: <Widget>[
      Builder(
        builder: (BuildContext actionContext) {
          return ValueListenableBuilder<bool>(
            valueListenable: copied,
            builder: (BuildContext context, bool isCopied, Widget? child) {
              return FluxerButton.primary(
                onPressed: () async {
                  await copyToClipboard(
                    context: actionContext,
                    value: inviteUrl,
                    message: FluxerLocalizations.of(
                      actionContext,
                    ).guildSettingsCopiedUrl,
                  );
                  copied.value = true;
                  unawaited(
                    Future<void>.delayed(const Duration(seconds: 3), () {
                      if (copied.value) {
                        copied.value = false;
                      }
                    }),
                  );
                },
                child: Text(
                  isCopied
                      ? l10n.guildNavbarCopied
                      : l10n.channelDetailsCopyLink,
                ),
              );
            },
          );
        },
      ),
    ],
  );
}
