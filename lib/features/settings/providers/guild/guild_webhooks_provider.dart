import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_webhook_updates.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_webhooks_provider.g.dart';

@riverpod
class GuildWebhooks extends _$GuildWebhooks {
  @override
  Future<List<WebhookResponse>> build(String guildId) {
    return _loadWebhooks();
  }

  Future<void> reload() async {
    state = const AsyncLoading<List<WebhookResponse>>();
    state = AsyncData<List<WebhookResponse>>(await _loadWebhooks());
  }

  Future<void> deleteWebhook(String webhookId) async {
    await ref
        .read(fluxerClientProvider)
        .webhooks
        .deleteWebhook(webhookId: webhookId);
    await reload();
  }

  Future<void> applyPendingUpdates({
    required List<WebhookResponse> originals,
    required GuildWebhookUpdates updates,
  }) async {
    for (final WebhookPendingUpdate move in updates.channelMoves(originals)) {
      await updateWebhook(webhookId: move.id, channelId: move.channelId);
    }
    for (final WebhookPendingUpdate update in updates.basicUpdates(originals)) {
      await updateWebhook(
        webhookId: update.id,
        name: update.name,
        avatar: update.clearAvatar ? '' : update.avatar,
      );
    }
    updates.reset();
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
        .listGuildWebhooks(guildId: guildId);
  }
}
