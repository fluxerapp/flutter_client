import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_spoiler_sync_provider.g.dart';

@riverpod
class ChannelSpoilerSync extends _$ChannelSpoilerSync {
  late final FluxerSpoilerSyncController _controller;

  @override
  int build(String channelId) {
    _controller = FluxerSpoilerSyncController();
    ref.onDispose(_controller.dispose);
    return 0;
  }

  FluxerSpoilerSyncController get controller => _controller;
}
