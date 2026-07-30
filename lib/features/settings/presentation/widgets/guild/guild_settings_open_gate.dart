import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:go_router/go_router.dart';

class GuildSettingsOpenGate extends ConsumerStatefulWidget {
  const GuildSettingsOpenGate({
    required this.guildId,
    required this.builder,
    super.key,
  });

  final String guildId;
  final Widget Function(BuildContext context) builder;

  @override
  ConsumerState<GuildSettingsOpenGate> createState() =>
      _GuildSettingsOpenGateState();
}

class _GuildSettingsOpenGateState extends ConsumerState<GuildSettingsOpenGate> {
  bool _didPopForAccess = false;

  @override
  Widget build(BuildContext context) {
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(widget.guildId)).value;
    final bool canOpen = canOpenGuildSettingsForRef(
      ref: ref,
      permissions: permissions,
      guild: guild,
    );

    if (!canOpen && !_didPopForAccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _didPopForAccess) {
          return;
        }
        _didPopForAccess = true;
        context.pop();
      });
      return const SizedBox.shrink();
    }

    return widget.builder(context);
  }
}
