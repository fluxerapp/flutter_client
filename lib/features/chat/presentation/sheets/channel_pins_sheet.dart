import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

Future<void> showChannelPinsSheet(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
}) {
  final bool isDmChannel =
      findDmById(ref.read(dmViewModelProvider).conversations, channelId) !=
      null;
  final Channel? channel = isDmChannel
      ? null
      : findChannelById(ref.read(channelListViewModelProvider), channelId);
  final DmConversation? dm = isDmChannel
      ? findDmById(ref.read(dmViewModelProvider).conversations, channelId)
      : null;
  return showChannelDetailsSheet(
    context,
    channel: channel,
    dm: dm,
    initialTab: ChannelDetailsInitialTab.pins,
  );
}
