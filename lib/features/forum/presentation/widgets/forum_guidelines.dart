import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumGuidelines extends StatefulWidget {
  const ForumGuidelines({required this.forum, super.key});

  final Channel forum;

  @override
  State<ForumGuidelines> createState() => _ForumGuidelinesState();
}

class _ForumGuidelinesState extends State<ForumGuidelines> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final String topic = widget.forum.topic?.trim() ?? '';
    if (topic.isEmpty) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.layout.s3,
                  vertical: context.layout.s2 + 2,
                ),
                child: Row(
                  children: <Widget>[
                    PhosphorIcon(
                      PhosphorIconsBold.info,
                      size: 18,
                      color: colors.textSecondary,
                    ),
                    SizedBox(width: context.layout.s2),
                    Expanded(
                      child: Text(
                        l10n.forumPostGuidelines,
                        style: context.textStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    PhosphorIcon(
                      _expanded
                          ? PhosphorIconsBold.caretUp
                          : PhosphorIconsBold.caretDown,
                      size: 16,
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.layout.s3,
                0,
                context.layout.s3,
                context.layout.s3,
              ),
              child: MessageMarkdown(
                data: topic,
                channelId: widget.forum.id,
                markdownContext: FluxerMarkdownContext.restrictedChannelTopic,
                baseStyle: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
