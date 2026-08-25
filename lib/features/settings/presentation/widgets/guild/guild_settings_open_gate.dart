import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';
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
  bool _permissionsResolved = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolvePermissions());
  }

  Future<void> _resolvePermissions() async {
    await ref
        .read(guildPermissionsProvider.notifier)
        .refreshPermissions(widget.guildId);
    if (mounted) {
      setState(() => _permissionsResolved = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_permissionsResolved) {
      return Center(
        child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
      );
    }

    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = ref
        .watch(guildByIdProvider(widget.guildId))
        .asData
        ?.value;
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
