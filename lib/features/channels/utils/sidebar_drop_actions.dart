import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/domain/voice_participant_drag_item.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/utils/navigation/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/voice/utils/participant/participant_moderation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

Future<void> moveChannelFromSidebarDrop(
  WidgetRef ref, {
  required String guildId,
  required ChannelReorderDragItem item,
  required ChannelReorderDropResult result,
}) async {
  final ChannelRepository repository = ref.read(channelRepositoryProvider);
  final int maxChannelsPerCategory = ref.read(
    instanceLimitProvider(LimitKeys.maxChannelsPerCategory),
  );
  final List<Channel> channels =
      (await ref.read(fluxerDatabaseProvider).channelDao.getChannels(guildId))
          .map(Channel.fromRow)
          .toList();
  final ChannelMoveComputation? computation = computeChannelMove(
    channels: channels,
    dragItem: item,
    dropResult: result,
  );
  if (computation == null) {
    return;
  }
  try {
    await repository.applyLocalChannels(guildId, computation.updatedChannels);
    await repository.moveChannel(
      guildId: guildId,
      operation: computation.operation,
      rollbackChannels: channels,
    );
  } on Object catch (error) {
    await showApiErrorFromRoot(
      ApiErrorAction.moveChannel,
      error,
      details: ApiErrorDetails(count: maxChannelsPerCategory),
    );
  }
}

Future<void> moveVoiceParticipantFromSidebarDrop(
  BuildContext context,
  WidgetRef ref, {
  required VoiceParticipantDragItem item,
  required Channel channel,
}) async {
  if (item.channelId == channel.id) {
    return;
  }
  if (item.userId == readAccountUserId(ref)) {
    await joinGuildVoiceChannelFromList(
      context: context,
      ref: ref,
      guildId: item.guildId,
      channel: channel,
    );
    return;
  }
  final String actionLabel = FluxerLocalizations.of(
    context,
  ).permissionMoveMembers;
  final FluxerClient client = ref.read(fluxerClientProvider);
  await runVoiceParticipantModeration(
    ref,
    actionLabel: actionLabel,
    action: () => client.guilds.updateGuildMember(
      guildId: item.guildId,
      userId: item.userId,
      body: GuildMemberUpdateRequest(
        channelId: JsonNullable<SnowflakeType>.of(channel.id),
      ),
    ),
  );
}
