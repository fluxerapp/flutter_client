import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/utils/search/channel_search_utils.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

String watchChannelSearchTokenValueLabel(
  WidgetRef ref,
  FluxerLocalizations l10n,
  ChannelSearchToken token, {
  required String? guildId,
}) {
  switch (token.kind) {
    case ChannelSearchTokenKind.from:
    case ChannelSearchTokenKind.mentions:
      final GuildUserDisplay? display = ref
          .watch(guildUserDisplayProvider((token.value, guildId)))
          .value;
      return display?.displayName ??
          token.label ??
          shortMentionWireIdFallback(token.value);
    case ChannelSearchTokenKind.channel:
      final String? name = ref
          .watch(channelByIdProvider(token.value))
          .value
          ?.name;
      return '#${name ?? token.label ?? shortMentionWireIdFallback(token.value)}';
    case ChannelSearchTokenKind.has:
      final MessageSearchContentFilter? filter =
          channelSearchContentFilterForValue(token.value);
      return filter == null
          ? token.value
          : channelSearchContentLabel(l10n, filter);
    case ChannelSearchTokenKind.pinned:
      return token.value == 'false'
          ? l10n.channelDetailsSearchPinnedFalse
          : l10n.channelDetailsSearchPinnedTrue;
    case ChannelSearchTokenKind.authorType:
      return channelSearchAuthorTypeLabel(l10n, token.value);
    case ChannelSearchTokenKind.before:
    case ChannelSearchTokenKind.during:
    case ChannelSearchTokenKind.after:
      return token.value;
  }
}

class ChannelSearchTokenChip extends ConsumerWidget {
  const ChannelSearchTokenChip({
    required this.token,
    required this.guildId,
    this.onRemove,
    super.key,
  });

  final ChannelSearchToken token;
  final String? guildId;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final String value = watchChannelSearchTokenValueLabel(
      ref,
      l10n,
      token,
      guildId: guildId,
    );
    final TextStyle base = context.textStyles.label;
    final Widget label = Text.rich(
      TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '${token.kind.key}: ',
            style: base.copyWith(color: colors.textSecondary),
          ),
          TextSpan(
            text: value,
            style: base.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    final VoidCallback? remove = onRemove;
    return Semantics(
      label: '${token.kind.key}: $value',
      child: Container(
        constraints: const BoxConstraints(maxWidth: 220, minHeight: 26),
        padding: EdgeInsetsDirectional.only(
          start: 8,
          end: remove == null ? 8 : 2,
        ),
        decoration: BoxDecoration(
          color: colors.brandPrimary.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: label),
            if (remove != null)
              FluxerGestureDetector(
                key: ValueKey<String>('search-token-remove-${token.signature}'),
                behavior: HitTestBehavior.opaque,
                onTap: remove,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  child: PhosphorIcon(
                    PhosphorIconsBold.x,
                    size: 12,
                    color: colors.textSecondary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
