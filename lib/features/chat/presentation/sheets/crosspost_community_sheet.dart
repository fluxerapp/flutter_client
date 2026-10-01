import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class CrosspostCommunitySheet {
  CrosspostCommunitySheet._();

  static Future<void> show(
    BuildContext context, {
    required String channelId,
    required String messageId,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.crosspostCommunityTitle,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return _CrosspostCommunityBody(
          channelId: channelId,
          messageId: messageId,
          onClose: close,
        );
      },
    );
  }
}

class _CrosspostCommunityBody extends ConsumerStatefulWidget {
  const _CrosspostCommunityBody({
    required this.channelId,
    required this.messageId,
    required this.onClose,
  });

  final String channelId;
  final String messageId;
  final VoidCallback onClose;

  @override
  ConsumerState<_CrosspostCommunityBody> createState() =>
      _CrosspostCommunityBodyState();
}

class _CrosspostCommunityBodyState
    extends ConsumerState<_CrosspostCommunityBody> {
  CrosspostSourceGuildResponse? _guild;
  bool _failed = false;
  bool _joining = false;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    try {
      final CrosspostSourceResponse response = await ref
          .read(messageRepositoryProvider)
          .getCrosspostSource(
            channelId: widget.channelId,
            messageId: widget.messageId,
          );
      if (!mounted) {
        return;
      }
      setState(() => _guild = response.guild);
    } on Object {
      if (mounted) {
        setState(() => _failed = true);
      }
    }
  }

  Future<void> _openGuild(CrosspostSourceGuildResponse guild) async {
    final bool member = ref
        .read(guildListViewModelProvider)
        .guilds
        .any((item) => item.id == guild.id);
    if (!member && guild.discoverable) {
      setState(() => _joining = true);
      try {
        await ref
            .read(discoveryControllerProvider.notifier)
            .joinGuild(guild.id);
      } on Object {
        if (mounted) {
          setState(() => _joining = false);
        }
        return;
      }
    }
    if (!mounted) {
      return;
    }
    widget.onClose();
    ref.read(fluxerRouterProvider).go(RoutePaths.guild(guild.id));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final CrosspostSourceGuildResponse? guild = _guild;
    if (_failed) {
      return Text(
        l10n.crosspostSourceFailed,
        style: context.textStyles.bodySmall.copyWith(height: 1.4),
      );
    }
    if (guild == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: FluxerLoadingSpinner()),
      );
    }
    final bool member = ref
        .watch(guildListViewModelProvider)
        .guilds
        .any((item) => item.id == guild.id);
    final bool singleCommunity = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => config.singleCommunity,
      ),
    );
    final String? iconUrl = FluxerMediaUrl.guildIcon(
      guildId: guild.id,
      hash: guild.icon,
      animated: true,
    );
    final String? bannerUrl = FluxerMediaUrl.guildBanner(
      guildId: guild.id,
      hash: guild.banner,
    );
    final bool canJoin = guild.discoverable && !singleCommunity && !member;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (bannerUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 72,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: bannerUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          ),
        if (bannerUrl != null) SizedBox(height: context.layout.s3),
        Row(
          children: <Widget>[
            FluxerAvatar(fallbackText: guild.name, imageUrl: iconUrl, size: 48),
            SizedBox(width: context.layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    guild.name,
                    style: context.textStyles.heading.copyWith(fontSize: 18),
                  ),
                  if (guild.approximateMemberCount != null)
                    Text(
                      l10n.crosspostMembers(guild.approximateMemberCount!),
                      style: context.textStyles.smallText.copyWith(
                        color: context.colors.textTertiary,
                      ),
                    ),
                  if (guild.approximatePresenceCount != null)
                    Text(
                      l10n.crosspostOnline(guild.approximatePresenceCount!),
                      style: context.textStyles.smallText.copyWith(
                        color: context.colors.statusOnline,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        if (guild.description != null && guild.description!.trim().isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: context.layout.s3),
            child: Text(
              guild.description!,
              style: context.textStyles.bodySmall.copyWith(height: 1.4),
            ),
          ),
        SizedBox(height: context.layout.s4),
        if (member || canJoin)
          FluxerButton.primary(
            onPressed: _joining ? null : () => unawaited(_openGuild(guild)),
            label: member
                ? l10n.crosspostGoToCommunity
                : l10n.crosspostJoinCommunity,
            isLoading: _joining,
          ),
      ],
    );
  }
}
