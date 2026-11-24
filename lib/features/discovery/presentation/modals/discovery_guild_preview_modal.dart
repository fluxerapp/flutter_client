import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/invite_accept_modal.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

const String _discoverableFeature = 'DISCOVERABLE';

Future<void> showDiscoveryGuildPreviewModal(
  BuildContext context, {
  required DiscoveryGuildListResponseGuilds guild,
}) {
  return showInviteStyleModal<void>(
    context,
    child: DiscoveryGuildPreviewModalBody(guild: guild),
  );
}

class DiscoveryGuildPreviewModalBody extends ConsumerWidget {
  const DiscoveryGuildPreviewModalBody({required this.guild, super.key});

  final DiscoveryGuildListResponseGuilds guild;

  String? get _iconUrl {
    final String? icon = guild.icon;
    if (icon == null || icon.isEmpty) {
      return null;
    }
    return FluxerMediaUrl.guildIcon(
      guildId: guild.id,
      hash: icon,
      animated: isAnimatedMediaHash(icon),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isAlreadyMember = ref.watch(
      guildListViewModelProvider.select(
        (state) => state.guilds.any((Guild g) => g.id == guild.id),
      ),
    );
    final bool isJoining = ref.watch(
      discoveryControllerProvider.select(
        (DiscoveryState s) => s.joiningGuildIds.contains(guild.id),
      ),
    );
    final bool canJoin = !ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.singleCommunity),
    );
    final String onlineCount = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    ).format(guild.onlineCount);
    final String description = guild.description?.trim() ?? '';
    return InviteAcceptBackground(
      splashUrl: null,
      child: InviteAcceptCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InviteGuildHeader(
              iconUrl: _iconUrl,
              guildName: guild.name,
              features: guild.features
                  .where((String f) => f != _discoverableFeature)
                  .toList(),
              badgeIds: guild.badgeIds,
              subtitle: l10n.discoveryPublicCommunity,
              onlineLabel: l10n.discoveryOnlineCount(onlineCount),
              membersLabel: l10n.discoveryMemberCount(guild.memberCount),
            ),
            const SizedBox(height: 12),
            Text(
              description.isEmpty ? l10n.discoveryNoDescription : description,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 1.5,
                color: colors.textTertiary,
              ),
            ),
            if (isAlreadyMember || canJoin) ...<Widget>[
              const SizedBox(height: 16),
              FluxerButton.primary(
                label: isAlreadyMember
                    ? l10n.discoveryOpenCommunity
                    : l10n.discoveryJoinCommunity,
                isLoading: isJoining && !isAlreadyMember,
                onPressed: isJoining
                    ? null
                    : () => unawaited(
                        _handlePrimary(
                          context,
                          ref,
                          isAlreadyMember: isAlreadyMember,
                        ),
                      ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _handlePrimary(
    BuildContext context,
    WidgetRef ref, {
    required bool isAlreadyMember,
  }) async {
    final GoRouter router = GoRouter.of(context);
    if (isAlreadyMember) {
      Navigator.of(context).pop();
      router.go(RoutePaths.guild(guild.id));
      return;
    }
    try {
      await ref.read(discoveryControllerProvider.notifier).joinGuild(guild.id);
    } on Object catch (error) {
      if (!context.mounted) {
        return;
      }
      await showApiError(context, ApiErrorAction.joinDiscoveryCommunity, error);
      return;
    }
    if (context.mounted) {
      Navigator.of(context).pop();
    }
    router.go(RoutePaths.guild(guild.id));
  }
}
