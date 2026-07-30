import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_emoji_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_emoji_settings_provider.dart';

class SettingsEmojiPage extends ConsumerWidget {
  const SettingsEmojiPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildEmojiSettingsState> emojiAsync = ref.watch(
      guildEmojiSettingsProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.emoji,
      body: GuildSettingsAsyncBody<GuildEmojiSettingsState>(
        value: emojiAsync,
        usesSettingsSheet: true,
        data: (GuildEmojiSettingsState state) =>
            GuildEmojiSettingsWidget(guildId: guildId, state: state),
      ),
    );
  }
}
