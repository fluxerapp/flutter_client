import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webhook_live_refresh_provider.g.dart';

class WebhookLiveRefreshTick {
  const WebhookLiveRefreshTick({
    required this.generation,
    this.guildId,
    this.channelId,
  });

  final int generation;
  final String? guildId;
  final String? channelId;
}

@Riverpod(keepAlive: true)
class WebhookLiveRefresh extends _$WebhookLiveRefresh {
  @override
  WebhookLiveRefreshTick build() => const WebhookLiveRefreshTick(generation: 0);

  void markUpdated({required String guildId, required String channelId}) {
    state = WebhookLiveRefreshTick(
      generation: state.generation + 1,
      guildId: guildId,
      channelId: channelId,
    );
  }
}
