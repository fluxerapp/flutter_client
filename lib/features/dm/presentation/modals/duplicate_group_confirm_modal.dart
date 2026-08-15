import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showDuplicateGroupConfirmModal(
  BuildContext context,
  WidgetRef ref, {
  required List<DmConversation> channels,
  required Future<void> Function() onConfirm,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerModal.show<void>(
    context,
    title: l10n.createDmConfirmNewGroup,
    centered: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.createDmDuplicateGroupDescription,
            style: dialogContext.textStyles.bodySmall.copyWith(
              color: dialogContext.colors.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: dialogContext.layout.s4),
          ...channels.map((DmConversation channel) {
            final String activityLabel = _activityLabel(channel, l10n);
            return Padding(
              padding: EdgeInsets.only(bottom: dialogContext.layout.s2),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    close();
                    unawaited(
                      navigateToDmChannelContent(
                        context: context,
                        ref: ref,
                        channelId: channel.id,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        groupDmAvatarCluster(
                          dm: channel,
                          size: 40,
                          status: channel.groupStatus,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                channel.displayName,
                                style: dialogContext.textStyles.username
                                    .copyWith(
                                      color: dialogContext.colors.textPrimary,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                activityLabel,
                                style: dialogContext.textStyles.bodySmall
                                    .copyWith(
                                      color: dialogContext.colors.textTertiary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      );
    },
    actionsBuilder: (void Function([void]) pop) {
      return <Widget>[
        FluxerButton.primary(
          label: l10n.createDmCreateNewGroup,
          onPressed: () async {
            await onConfirm();
            pop();
          },
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(label: l10n.cancel, onPressed: () => pop()),
      ];
    },
  );
}

String _activityLabel(DmConversation channel, FluxerLocalizations l10n) {
  final String? lastMessageId = channel.lastMessageId;
  if (lastMessageId == null || lastMessageId.isEmpty) {
    return l10n.createDmNoActivityYet;
  }
  final DateTime time = dateTimeFromSnowflakeAsLocalOrNow(lastMessageId);
  return DateFormat.yMMMd(l10n.localeName).add_jm().format(time);
}
