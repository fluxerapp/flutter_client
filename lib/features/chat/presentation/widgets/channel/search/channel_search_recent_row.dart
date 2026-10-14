import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_token_chip.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSearchRecentRow extends StatelessWidget {
  const ChannelSearchRecentRow({
    required this.entry,
    required this.guildId,
    required this.onTap,
    required this.onRemove,
    super.key,
  });

  final ChannelSearchHistoryEntry entry;
  final String? guildId;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ({String text, List<ChannelSearchToken> tokens}) query = entry.query;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Row(
            children: <Widget>[
              PhosphorIcon(
                PhosphorIconsBold.clockCounterClockwise,
                size: 18,
                color: colors.textTertiary,
              ),
              SizedBox(width: layout.s3),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: layout.s2),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      for (final ChannelSearchToken token in query.tokens)
                        ChannelSearchTokenChip(token: token, guildId: guildId),
                      if (query.text.isNotEmpty)
                        Text(
                          query.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodyMedium.copyWith(
                            color: colors.textPrimary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              FluxerGestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onRemove,
                child: Semantics(
                  button: true,
                  label: l10n.channelSearchRemoveRecent,
                  child: Padding(
                    padding: EdgeInsets.all(layout.s3),
                    child: PhosphorIcon(
                      PhosphorIconsBold.x,
                      size: 14,
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
