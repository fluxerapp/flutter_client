import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class ChannelSearchResultMessageCard extends StatefulWidget {
  const ChannelSearchResultMessageCard({
    required this.message,
    required this.guildId,
    required this.onJump,
    super.key,
  });

  final Message message;
  final String? guildId;
  final VoidCallback onJump;

  @override
  State<ChannelSearchResultMessageCard> createState() =>
      _ChannelSearchResultMessageCardState();
}

class _ChannelSearchResultMessageCardState
    extends State<ChannelSearchResultMessageCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Material(
          color: context.colors.backgroundSecondaryLighter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: context.colors.backgroundHeaderSecondary),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onJump,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: IgnorePointer(
                    child: MessageItem(
                      message: widget.message,
                      inboxPreviewMode: true,
                      hideMentionHighlight: true,
                      previewRoleGuildId: widget.guildId,
                    ),
                  ),
                ),
                if (_hovered)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Material(
                      color: context.colors.backgroundPrimary,
                      borderRadius: BorderRadius.circular(4),
                      child: InkWell(
                        onTap: widget.onJump,
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            l10n.notificationsJump,
                            style: context.textStyles.timestamp.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colors.textPrimaryMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
