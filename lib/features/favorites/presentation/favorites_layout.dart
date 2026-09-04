import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/channel_layout.dart';
import 'package:fluxer_app/features/dm/presentation/dm_layout.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_welcome.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class FavoritesLayout extends ConsumerWidget {
  const FavoritesLayout({this.channelId, this.messageId, super.key});

  final String? channelId;
  final String? messageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? channelId = this.channelId;
    if (channelId == null) {
      if (isMobileLayout(context)) {
        return const ColoredBox(
          color: Colors.transparent,
          child: SizedBox.shrink(),
        );
      }
      return const FavoritesWelcome();
    }

    final favoriteAsync = ref.watch(favoriteChannelProvider(channelId));
    return favoriteAsync.when(
      loading: () => ColoredBox(
        color: context.colors.chatBackground,
        child: const SizedBox.shrink(),
      ),
      error: (_, _) => ColoredBox(
        color: context.colors.chatBackground,
        child: const SizedBox.shrink(),
      ),
      data: (favorite) {
        if (favorite == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!context.mounted) {
              return;
            }
            context.go(RoutePaths.favoritesBase);
          });
          return ColoredBox(
            color: context.colors.chatBackground,
            child: const SizedBox.shrink(),
          );
        }

        final String? guildId = favorite.guildId;
        if (!isFavoriteDmGuildId(guildId) && guildId != null) {
          return _FavoritesGuildChannel(
            guildId: guildId,
            channelId: channelId,
            messageId: messageId,
          );
        }

        return DMLayout(channelId: channelId, targetMessageId: messageId);
      },
    );
  }
}

class _FavoritesGuildChannel extends ConsumerStatefulWidget {
  const _FavoritesGuildChannel({
    required this.guildId,
    required this.channelId,
    this.messageId,
  });

  final String guildId;
  final String channelId;
  final String? messageId;

  @override
  ConsumerState<_FavoritesGuildChannel> createState() =>
      _FavoritesGuildChannelState();
}

class _FavoritesGuildChannelState
    extends ConsumerState<_FavoritesGuildChannel> {
  ({String channelId, String guildId})? _syncedTarget;

  @override
  void initState() {
    super.initState();
    _scheduleGuildSyncIfNeeded();
  }

  @override
  void didUpdateWidget(covariant _FavoritesGuildChannel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.guildId != widget.guildId) {
      _scheduleGuildSyncIfNeeded();
    }
  }

  void _scheduleGuildSyncIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final ({String channelId, String guildId}) target = (
        channelId: widget.channelId,
        guildId: widget.guildId,
      );
      if (_syncedTarget == target) {
        return;
      }
      _syncedTarget = target;
      ref.read(guildSyncProvider.notifier).syncIfNeeded(widget.guildId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChannelLayout(
      guildId: widget.guildId,
      channelId: widget.channelId,
      messageId: widget.messageId,
    );
  }
}
