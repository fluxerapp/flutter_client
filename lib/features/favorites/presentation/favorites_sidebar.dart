import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_channel_list.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_header.dart';
import 'package:fluxer_app/features/favorites/utils/navigate_to_favorite_channel.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:material_ui/material_ui.dart';

class FavoritesSidebar extends ConsumerWidget {
  const FavoritesSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChannelId = ref.watch(activeChannelIdProvider);

    return Container(
      width: isMobileLayout(context) ? null : 240,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: isMobileLayout(context)
            ? null
            : Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        children: [
          const FavoritesHeader(),
          Expanded(
            child: FavoritesChannelList(
              selectedChannelId: selectedChannelId,
              onChannelSelected: (ResolvedFavoriteEntry entry) {
                unawaited(
                  navigateToFavoriteChannel(
                    context: context,
                    ref: ref,
                    channelId: entry.channelId,
                    guildId: entry.guildId,
                    channel: entry.channel,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
