import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/emoji/domain/expression_kind.dart';
import 'package:fluxer_app/features/emoji/providers/emoji_info_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expression_limits_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_expression_limits.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_expression_permissions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart' as sdk;

final Set<String> _cloneInFlight = <String>{};

Future<void> showEmojiContextMenu(
  BuildContext context, {
  required Offset position,
  required EmojiInfoData emoji,
}) {
  final String? id = emoji.isCustom ? emoji.id : null;
  return _showExpressionContextMenu(
    context,
    position: position,
    target: _ExpressionMenuTarget(
      kind: ExpressionKind.emoji,
      name: emoji.name,
      id: id,
      guildId: emoji.guildId,
      favoriteKey: emoji.favoriteKeyForGuild(emoji.guildId),
      url: id == null
          ? null
          : FluxerMediaUrl.customEmoji(id: id, animated: emoji.animated),
      emojiInfo: id != null && emoji.guildId == null ? emoji : null,
    ),
  );
}

Future<void> showStickerContextMenu(
  BuildContext context, {
  required Offset position,
  required StickerEntry sticker,
}) {
  return _showExpressionContextMenu(
    context,
    position: position,
    target: _ExpressionMenuTarget(
      kind: ExpressionKind.sticker,
      name: sticker.name,
      id: sticker.id,
      guildId: sticker.guildId,
      favoriteKey: sticker.favoriteKey,
      url: sticker.urlForSize(320),
    ),
  );
}

Future<void> _showExpressionContextMenu(
  BuildContext context, {
  required Offset position,
  required _ExpressionMenuTarget target,
}) {
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) {
      final _ExpressionMenuStrings strings = _ExpressionMenuStrings.of(
        FluxerLocalizations.of(menuContext),
        target.kind,
      );
      void run(Future<void> Function() action) {
        close();
        unawaited(action());
      }

      final String? id = target.id;
      final String? url = target.url;
      return <Widget>[
        _FavoriteToggleItem(target: target, strings: strings, close: close),
        if (id != null)
          FluxerMenuItem(
            label: strings.copyId,
            icon: PhosphorIconsRegular.clipboard,
            onPressed: () =>
                run(() => copyToClipboard(context: menuContext, value: id)),
          ),
        if (id != null)
          _CloneSubmenuItem(target: target, strings: strings, close: close),
        if (url != null) ...<Widget>[
          const FluxerMenuDivider(),
          FluxerMenuItem(
            label: strings.copyUrl,
            icon: PhosphorIconsBold.link,
            onPressed: () =>
                run(() => copyToClipboard(context: menuContext, value: url)),
          ),
          FluxerMenuItem(
            label: strings.openInBrowser,
            icon: PhosphorIconsBold.arrowSquareOut,
            onPressed: () => run(() => openInBrowserOnly(Uri.parse(url))),
          ),
        ],
      ];
    },
  );
}

class _ExpressionMenuTarget {
  const _ExpressionMenuTarget({
    required this.kind,
    required this.name,
    this.id,
    this.guildId,
    this.favoriteKey,
    this.url,
    this.emojiInfo,
  });

  final ExpressionKind kind;
  final String name;
  final String? id;
  final String? guildId;
  final String? favoriteKey;
  final String? url;
  final EmojiInfoData? emojiInfo;

  ({String? favoriteKey, String? guildId}) watchResolved(WidgetRef ref) {
    final EmojiInfoData? info = emojiInfo;
    if (info == null) {
      return (favoriteKey: favoriteKey, guildId: guildId);
    }
    final EmojiInfoResolved? resolved = ref
        .watch(emojiInfoResolvedProvider(info))
        .value;
    return (
      favoriteKey: resolved?.favoriteKey,
      guildId: resolved?.attribution.guild?.id,
    );
  }
}

class _ExpressionMenuStrings {
  const _ExpressionMenuStrings({
    required this.favorite,
    required this.unfavorite,
    required this.copyId,
    required this.copyUrl,
    required this.openInBrowser,
    required this.cloneTo,
    required this.slotsFull,
    required this.cloned,
  });

  factory _ExpressionMenuStrings.of(
    FluxerLocalizations l10n,
    ExpressionKind kind,
  ) => switch (kind) {
    ExpressionKind.emoji => _ExpressionMenuStrings(
      favorite: l10n.emojiMenuFavorite,
      unfavorite: l10n.emojiMenuUnfavorite,
      copyId: l10n.emojiMenuCopyId,
      copyUrl: l10n.emojiMenuCopyUrl,
      openInBrowser: l10n.emojiMenuOpenInBrowser,
      cloneTo: l10n.emojiMenuCloneTo,
      slotsFull: l10n.expressionMenuEmojiSlotsFull,
      cloned: l10n.emojiClonedToast,
    ),
    ExpressionKind.sticker => _ExpressionMenuStrings(
      favorite: l10n.stickerMenuFavorite,
      unfavorite: l10n.stickerMenuUnfavorite,
      copyId: l10n.stickerMenuCopyId,
      copyUrl: l10n.stickerMenuCopyUrl,
      openInBrowser: l10n.stickerMenuOpenInBrowser,
      cloneTo: l10n.stickerMenuCloneTo,
      slotsFull: l10n.expressionMenuStickerSlotsFull,
      cloned: l10n.stickerClonedToast,
    ),
  };

  final String favorite;
  final String unfavorite;
  final String copyId;
  final String copyUrl;
  final String openInBrowser;
  final String cloneTo;
  final String slotsFull;
  final String Function(String name, String targetName) cloned;
}

class _FavoriteToggleItem extends ConsumerWidget {
  const _FavoriteToggleItem({
    required this.target,
    required this.strings,
    required this.close,
  });

  final _ExpressionMenuTarget target;
  final _ExpressionMenuStrings strings;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? key = target.watchResolved(ref).favoriteKey;
    if (key == null) {
      return const SizedBox.shrink();
    }
    final bool sticker = target.kind == ExpressionKind.sticker;
    final List<String> favorites =
        ref
            .watch(
              sticker ? favoriteStickerKeysProvider : favoriteEmojiKeysProvider,
            )
            .value ??
        const <String>[];
    final bool isFavorite = favorites.contains(key);
    return FluxerMenuItem(
      label: isFavorite ? strings.unfavorite : strings.favorite,
      icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
      onPressed: () {
        close();
        unawaited(
          sticker
              ? ref.read(favoriteStickerKeysProvider.notifier).toggle(key)
              : ref.read(favoriteEmojiKeysProvider.notifier).toggle(key),
        );
      },
    );
  }
}

class _CloneSubmenuItem extends ConsumerWidget {
  const _CloneSubmenuItem({
    required this.target,
    required this.strings,
    required this.close,
  });

  final _ExpressionMenuTarget target;
  final _ExpressionMenuStrings strings;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? sourceGuildId = target.watchResolved(ref).guildId;
    final List<Guild> guilds = ref.watch(guildListViewModelProvider).guilds;
    final Guild? source = guilds
        .where((Guild guild) => guild.id == sourceGuildId)
        .firstOrNull;
    final bool allowed =
        source != null &&
        switch (target.kind) {
          ExpressionKind.emoji => isCloneEmojiAllowed(source.features),
          ExpressionKind.sticker => isCloneStickerAllowed(source.features),
        };
    if (!allowed) {
      return const SizedBox.shrink();
    }
    final List<Guild> eligible =
        guilds
            .where(
              (Guild guild) =>
                  guild.id != sourceGuildId &&
                  canManageGuildExpressions(
                    ref.watch(guildSettingsPermissionsProvider(guild.id)),
                  ),
            )
            .toList()
          ..sort(
            (Guild a, Guild b) =>
                a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
    if (eligible.isEmpty) {
      return const SizedBox.shrink();
    }
    return FluxerMenuSubmenuItem(
      label: strings.cloneTo,
      submenuBuilder: (BuildContext submenuContext) => <Widget>[
        for (final Guild guild in eligible)
          _CloneTargetItem(
            target: target,
            strings: strings,
            guild: guild,
            close: close,
          ),
      ],
    );
  }
}

class _CloneTargetItem extends ConsumerWidget {
  const _CloneTargetItem({
    required this.target,
    required this.strings,
    required this.guild,
    required this.close,
  });

  final _ExpressionMenuTarget target;
  final _ExpressionMenuStrings strings;
  final Guild guild;
  final VoidCallback close;

  bool _slotsFull(WidgetRef ref) {
    final GuildExpressionLimits? limits = ref
        .watch(guildExpressionLimitsProvider(guild.id))
        .value;
    if (limits == null) {
      return false;
    }
    final (bool unlimited, int max, int count) = switch (target.kind) {
      ExpressionKind.emoji => (
        limits.hasUnlimitedEmojis,
        limits.maxEmojis,
        (ref.watch(allGuildEmojisForPickerProvider).value ??
                const <GuildEmojiEntry>[])
            .where((GuildEmojiEntry e) => e.guildId == guild.id)
            .length,
      ),
      ExpressionKind.sticker => (
        limits.hasUnlimitedStickers,
        limits.maxStickers,
        (ref.watch(allGuildStickersForPickerProvider).value ??
                const <StickerEntry>[])
            .where((StickerEntry s) => s.guildId == guild.id)
            .length,
      ),
    };
    return !unlimited && count >= max;
  }

  Future<void> _clone(sdk.FluxerClient client, Toast toasts) async {
    final String? sourceId = target.id;
    final String key = '${target.kind.name}:$sourceId:${guild.id}';
    if (sourceId == null || !_cloneInFlight.add(key)) {
      return;
    }
    try {
      await switch (target.kind) {
        ExpressionKind.emoji => client.guilds.cloneGuildEmoji(
          guildId: guild.id,
          body: sdk.GuildEmojiCloneRequest(sourceEmojiId: sourceId),
        ),
        ExpressionKind.sticker => client.guilds.cloneGuildSticker(
          guildId: guild.id,
          body: sdk.GuildStickerCloneRequest(sourceStickerId: sourceId),
        ),
      };
      toasts.show(
        FluxerToast(
          message: strings.cloned(target.name, guild.name),
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object catch (error) {
      await showApiErrorFromRoot(ApiErrorAction.generic, error);
    } finally {
      _cloneInFlight.remove(key);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool full = _slotsFull(ref);
    return FluxerMenuItem(
      label: guild.name,
      enabled: !full,
      hint: full ? strings.slotsFull : null,
      onPressed: () {
        final sdk.FluxerClient client = ref.read(fluxerClientProvider);
        final Toast toasts = ref.read(toastProvider.notifier);
        close();
        unawaited(_clone(client, toasts));
      },
    );
  }
}
