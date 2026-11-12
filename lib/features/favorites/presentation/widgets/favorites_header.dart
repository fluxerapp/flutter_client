import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/desktop_sidebar_header_surface.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_list_context_menu.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FavoritesHeader extends ConsumerWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final settings = ref.watch(favoriteSettingsProvider).value;
    final isMuted = settings?.muted ?? false;

    if (usesDesktopPointerUi(context)) {
      return const _DesktopFavoritesHeader();
    }

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

class _DesktopFavoritesHeader extends ConsumerStatefulWidget {
  const _DesktopFavoritesHeader();

  @override
  ConsumerState<_DesktopFavoritesHeader> createState() =>
      _DesktopFavoritesHeaderState();
}

class _DesktopFavoritesHeaderState
    extends ConsumerState<_DesktopFavoritesHeader> {
  bool _open = false;

  Future<void> _openMenu(Offset position) async {
    setState(() => _open = true);
    try {
      await showFavoritesListMenu(context, ref, position: position);
    } finally {
      if (mounted) {
        setState(() => _open = false);
      }
    }
  }

  Offset _belowHeader() {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) {
      return Offset.zero;
    }
    return box.localToGlobal(Offset(0, box.size.height));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget content = Row(
      children: <Widget>[
        PhosphorIcon(
          PhosphorIconsFill.star,
          size: 16,
          color: colors.textPrimary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            l10n.favoritesTitle,
            style: context.textStyles.channelName.copyWith(
              color: colors.textPrimary,
              height: 20 / 16,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        RotatedBox(
          quarterTurns: _open ? 2 : 0,
          child: PhosphorIcon(
            PhosphorIconsBold.caretDown,
            size: 16,
            color: colors.textPrimary,
          ),
        ),
      ],
    );
    return FluxerTappable(
      onTap: () => unawaited(_openMenu(_belowHeader())),
      onSecondaryTapUp: (TapUpDetails details) =>
          unawaited(_openMenu(details.globalPosition)),
      semanticLabel: l10n.favoritesHeaderMenu,
      builder: (BuildContext context, Set<WidgetState> states) =>
          DesktopSidebarHeaderSurface(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            active: _open || states.contains(WidgetState.hovered),
            child: content,
          ),
    );
  }
}
