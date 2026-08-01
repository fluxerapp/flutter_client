import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/members/utils/guild_members_page_permissions.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildMembersAccessGate extends ConsumerStatefulWidget {
  const GuildMembersAccessGate({
    required this.guildId,
    required this.child,
    super.key,
  });

  final String guildId;
  final Widget child;

  @override
  ConsumerState<GuildMembersAccessGate> createState() =>
      _GuildMembersAccessGateState();
}

class _GuildMembersAccessGateState
    extends ConsumerState<GuildMembersAccessGate> {
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

    final int permissions =
        ref.watch(guildPermissionsProvider)[widget.guildId] ?? 0;
    if (!hasMembersPagePermission(permissions)) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(context.layout.s4),
          child: Text(
            FluxerLocalizations.of(context).guildSettingsNoPermission,
            style: TextStyle(color: context.colors.textPrimaryMuted),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return widget.child;
  }
}
