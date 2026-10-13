import 'dart:async';

import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_details_drawer_provider.g.dart';

class ChannelDetailsDrawerState {
  const ChannelDetailsDrawerState({
    required this.channel,
    required this.dm,
    required this.initialTab,
    required this.openSearchImmediately,
    required this.resultCompleter,
  });

  final Channel? channel;
  final DmConversation? dm;
  final ChannelDetailsInitialTab initialTab;
  final bool openSearchImmediately;
  final Completer<ChannelDetailsJumpRequest?> resultCompleter;
}

@Riverpod(keepAlive: true)
class ChannelDetailsDrawer extends _$ChannelDetailsDrawer {
  @override
  ChannelDetailsDrawerState? build() => null;

  Future<ChannelDetailsJumpRequest?> open({
    required Channel? channel,
    required DmConversation? dm,
    ChannelDetailsInitialTab initialTab = ChannelDetailsInitialTab.members,
    bool openSearchImmediately = false,
  }) {
    final Completer<ChannelDetailsJumpRequest?> completer =
        Completer<ChannelDetailsJumpRequest?>();
    state = ChannelDetailsDrawerState(
      channel: channel,
      dm: dm,
      initialTab: initialTab,
      openSearchImmediately: openSearchImmediately,
      resultCompleter: completer,
    );
    return completer.future;
  }

  void close([ChannelDetailsJumpRequest? result]) {
    final ChannelDetailsDrawerState? current = state;
    if (current == null) {
      return;
    }
    state = null;
    if (!current.resultCompleter.isCompleted) {
      current.resultCompleter.complete(result);
    }
  }
}

@Riverpod(keepAlive: true)
class ChannelDetailsDrawerReveal extends _$ChannelDetailsDrawerReveal {
  @override
  double build() => 0;

  void setPixels(double pixels) {
    if (state == pixels) {
      return;
    }
    state = pixels;
  }
}

@Riverpod(keepAlive: true)
bool channelDetailsDrawerIsOpen(Ref ref) {
  return ref.watch(channelDetailsDrawerProvider) != null ||
      ref.watch(channelDetailsDrawerRevealProvider) > 0;
}

bool channelDetailsDrawerBlocksMessageSwipe({
  required bool hasDrawerSession,
  required double revealPixels,
  required double screenWidth,
}) {
  if (!hasDrawerSession || screenWidth <= 0) {
    return false;
  }
  return revealPixels >= screenWidth - 1;
}
