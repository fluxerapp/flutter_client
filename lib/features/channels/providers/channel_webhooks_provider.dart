import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_webhooks_provider.g.dart';

@riverpod
class ChannelWebhooks extends _$ChannelWebhooks {
  @override
  Future<List<WebhookResponse>> build(String channelId) {
    return _loadWebhooks();
  }

  Future<void> reload() async {
    state = const AsyncLoading<List<WebhookResponse>>();
    state = AsyncData<List<WebhookResponse>>(await _loadWebhooks());
  }

  Future<WebhookResponse> createWebhook({required String name}) async {
    final WebhookResponse response = await ref
        .read(fluxerClientProvider)
        .webhooks
        .createWebhook(
          channelId: channelId,
          body: WebhookCreateRequest(name: name),
        );
    await reload();
    return response;
  }

  Future<void> deleteWebhook(String webhookId) async {
    await ref
        .read(fluxerClientProvider)
        .webhooks
        .deleteWebhook(webhookId: webhookId);
    await reload();
  }

  Future<WebhookResponse> updateWebhook({
    required String webhookId,
    String? name,
    String? avatar,
    String? channelId,
  }) async {
    final WebhookResponse response = await ref
        .read(fluxerClientProvider)
        .webhooks
        .updateWebhook(
          webhookId: webhookId,
          body: WebhookUpdateRequest(
            name: name,
            avatar: avatar,
            channelId: channelId,
          ),
        );
    final List<WebhookResponse>? current = state.value;
    if (current != null) {
      state = AsyncData<List<WebhookResponse>>(
        current
            .map(
              (WebhookResponse webhook) =>
                  webhook.id == webhookId ? response : webhook,
            )
            .toList(),
      );
    }
    return response;
  }

  Future<List<WebhookResponse>> _loadWebhooks() {
    return ref
        .read(fluxerClientProvider)
        .webhooks
        .listChannelWebhooks(channelId: channelId);
  }
}
