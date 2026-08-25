import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_sticker_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_sticker_settings_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsStickersPage extends ConsumerWidget {
  const SettingsStickersPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildStickerSettingsState> stickersAsync = ref.watch(
      guildStickerSettingsProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.stickers,
      body: GuildSettingsAsyncBody<GuildStickerSettingsState>(
        value: stickersAsync,
        usesSettingsSheet: true,
        data: (GuildStickerSettingsState state) =>
            GuildStickerSettingsWidget(guildId: guildId, state: state),
      ),
    );
  }
}
