import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/emoji/providers/emoji_info_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

Future<void> showReactionEmojiContextMenu(
  BuildContext context, {
  required Offset position,
  required Reaction reaction,
}) {
  final String? emojiId = reaction.emojiId;
  if (!reaction.isCustom || emojiId == null) {
    return Future<void>.value();
  }
  final String url = FluxerMediaUrl.customEmoji(
    id: emojiId,
    animated: reaction.animated,
  );
  final EmojiInfoData data = EmojiInfoData.fromMarkdownLongPress(
    emojiId: emojiId,
    name: reaction.emoji,
    animated: reaction.animated,
  );
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
      _FavoriteEmojiItem(data: data, close: close),
      FluxerMenuItem(
        label: FluxerLocalizations.of(menuContext).emojiMenuCopyUrl,
        icon: PhosphorIconsBold.link,
        onPressed: () {
          close();
          unawaited(copyToClipboard(context: menuContext, value: url));
        },
      ),
      FluxerMenuItem(
        label: FluxerLocalizations.of(menuContext).emojiMenuOpenInBrowser,
        icon: PhosphorIconsBold.arrowSquareOut,
        onPressed: () {
          close();
          unawaited(openInBrowserOnly(Uri.parse(url)));
        },
      ),
      _CopyEmojiIdItem(emojiId: emojiId, close: close),
    ],
  );
}

class _FavoriteEmojiItem extends ConsumerWidget {
  const _FavoriteEmojiItem({required this.data, required this.close});

  final EmojiInfoData data;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? favoriteKey = ref
        .watch(emojiInfoResolvedProvider(data))
        .value
        ?.favoriteKey;
    if (favoriteKey == null) {
      return const SizedBox.shrink();
    }
    final List<String> favorites =
        ref.watch(favoriteEmojiKeysProvider).value ?? const <String>[];
    final bool isFavorite = favorites.contains(favoriteKey);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerMenuItem(
      label: isFavorite ? l10n.emojiMenuUnfavorite : l10n.emojiMenuFavorite,
      icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsRegular.star,
      onPressed: () {
        close();
        unawaited(
          ref.read(favoriteEmojiKeysProvider.notifier).toggle(favoriteKey),
        );
      },
    );
  }
}

class _CopyEmojiIdItem extends ConsumerWidget {
  const _CopyEmojiIdItem({required this.emojiId, required this.close});

  final String emojiId;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool developerMode = ref.watch(
      userSettingsViewModelProvider.select((s) => s.developerMode),
    );
    if (!developerMode) {
      return const SizedBox.shrink();
    }
    return FluxerMenuItem(
      label: FluxerLocalizations.of(context).emojiMenuCopyId,
      icon: PhosphorIconsRegular.snowflake,
      onPressed: () {
        close();
        unawaited(copyToClipboard(context: context, value: emojiId));
      },
    );
  }
}
