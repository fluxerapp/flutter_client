import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/channel_layout.dart';
import 'package:fluxer_app/features/dm/presentation/dm_layout.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_welcome.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
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

        final guildId = favorite.guildId;
        if (guildId != null && guildId.isNotEmpty) {
          return ChannelLayout(
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
