import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_markdown.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// A link preview card.
class EmbedLink extends StatelessWidget {
  final Embed embed;

  const EmbedLink({required this.embed, super.key});

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: const BoxConstraints(maxWidth: 440),
      decoration: BoxDecoration(
        color: context.colors.embedBackground,
        border: Border(left: BorderSide(color: sideColor, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (embed.providerName != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedInlineText(
                  text: embed.providerName!,
                  style: context.textStyles.embedFooter.copyWith(fontSize: 12),
                ),
              ),
            if (embed.author != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedAuthorRow(author: embed.author!),
              ),
            if (embed.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: EmbedTitle(title: embed.title!, url: embed.url),
              ),
            if (embed.description != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: MessageMarkdown(
                  data: embed.description!,
                  baseStyle: context.textStyles.embedDescription,
                  markdownContext:
                      FluxerMarkdownContext.restrictedEmbedDescription,
                ),
              ),
            if (embed.thumbnail != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: embed.thumbnail!.proxyUrl ?? embed.thumbnail!.url,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, e, s) => const SizedBox.shrink(),
                  ),
                ),
              ),
            if (embed.footer != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: EmbedFooterRow(
                  footer: embed.footer!,
                  timestamp: embed.timestamp,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
