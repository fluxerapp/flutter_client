import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_error_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_status_body.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_widget.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_webhooks_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class SettingsWebhooksPage extends ConsumerWidget {
  const SettingsWebhooksPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<WebhookResponse>> webhooksAsync = ref.watch(
      guildWebhooksProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.webhooks,
      body: webhooksAsync.when(
        loading: () => const GuildWebhooksLoadingBody(),
        error: (Object error, StackTrace stackTrace) => GuildWebhooksStatusBody(
          child: GuildWebhooksErrorState(
            onRetry: () => unawaited(
              ref.read(guildWebhooksProvider(guildId).notifier).reload(),
            ),
          ),
        ),
        data: (List<WebhookResponse> webhooks) =>
            GuildWebhooksWidget(guildId: guildId, webhooks: webhooks),
      ),
    );
  }
}
