import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_list_context_menu.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavoritesHeader extends ConsumerWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final settings = ref.watch(favoriteSettingsProvider).value;
    final isMuted = settings?.muted ?? false;

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.userAreaDividerColor),
        ),
      ),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsFill.star,
            size: 20,
            color: context.colors.interactiveNormal,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              l10n.favoritesTitle,
              style: context.textStyles.channelName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            tooltip: isMuted ? l10n.favoritesUnmute : l10n.favoritesMute,
            icon: PhosphorIcon(
              isMuted ? PhosphorIconsFill.bellSlash : PhosphorIconsFill.bell,
              size: 20,
              color: context.colors.textPrimaryMuted,
            ),
            onPressed: () async {
              await ref
                  .read(favoriteChannelsRepositoryProvider)
                  .setMuted(value: !isMuted);
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
          IconButton(
            tooltip: l10n.favoritesHeaderMenu,
            icon: PhosphorIcon(
              PhosphorIconsBold.dotsThree,
              size: 20,
              color: context.colors.textPrimaryMuted,
            ),
            onPressed: () {
              final RenderBox? box = context.findRenderObject() as RenderBox?;
              if (box == null) {
                return;
              }
              final Offset position = box.localToGlobal(
                Offset(0, box.size.height),
              );
              unawaited(
                showFavoritesListMenu(context, ref, position: position),
              );
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }
}
