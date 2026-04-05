import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_markdown.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

/// A rich embed card
class EmbedRich extends StatelessWidget {
  final Embed embed;

  const EmbedRich({required this.embed, super.key});

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    final hasThumbnail =
        embed.thumbnail != null &&
        embed.type != EmbedType.image &&
        embed.type != EmbedType.gifv;

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (embed.providerName != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        embed.providerName!,
                        style: context.textStyles.embedFooter.copyWith(
                          fontSize: 12,
                        ),
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
                      padding: const EdgeInsets.only(bottom: 6),
                      child: MessageMarkdown(
                        data: embed.description!,
                        baseStyle: context.textStyles.embedDescription,
                        markdownContext:
                            FluxerMarkdownContext.restrictedEmbedDescription,
                      ),
                    ),
                  if (embed.fields.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: _EmbedFields(fields: embed.fields),
                    ),
                  if (embed.image != null && !hasThumbnail)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: _EmbedMediaImage(media: embed.image!),
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
            if (hasThumbnail) ...[
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: embed.thumbnail!.proxyUrl ?? embed.thumbnail!.url,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  errorBuilder: (_, e, s) => const SizedBox.shrink(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmbedFields extends StatelessWidget {
  final List<EmbedField> fields;

  const _EmbedFields({required this.fields});

  @override
  Widget build(BuildContext context) {
    // inline fields: up to 3 per row; block fields always start a new row
    final rows = <List<EmbedField>>[];
    var current = <EmbedField>[];

    for (final f in fields) {
      if (!f.isInline) {
        if (current.isNotEmpty) {
          rows.add(current);
          current = [];
        }
        rows.add([f]);
      } else {
        current.add(f);
        if (current.length == 3) {
          rows.add(current);
          current = [];
        }
      }
    }
    if (current.isNotEmpty) {
      rows.add(current);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.map((row) {
        if (row.length == 1 && !row[0].isInline) {
          return _EmbedFieldTile(field: row[0]);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: row
              .map((f) => Expanded(child: _EmbedFieldTile(field: f)))
              .toList(),
        );
      }).toList(),
    );
  }
}

class _EmbedFieldTile extends StatelessWidget {
  final EmbedField field;

  const _EmbedFieldTile({required this.field});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 6, right: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.name,
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        MessageMarkdown(
          data: field.value,
          baseStyle: TextStyle(color: context.colors.textChat, fontSize: 13),
          markdownContext:
              FluxerMarkdownContext.restrictedEmbedDescription,
        ),
      ],
    ),
  );
}

class _EmbedMediaImage extends StatelessWidget {
  final EmbedMedia media;

  const _EmbedMediaImage({required this.media});

  @override
  Widget build(BuildContext context) {
    const maxW = 400.0;
    final w = media.width?.toDouble();
    final h = media.height?.toDouble();
    double? displayW;
    double? displayH;
    if (w != null && h != null && w > 0) {
      displayW = w.clamp(0, maxW);
      displayH = h * (displayW / w);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: media.proxyUrl ?? media.url,
        width: displayW,
        height: displayH,
        fit: BoxFit.cover,
        errorBuilder: (_, e, s) => const SizedBox.shrink(),
      ),
    );
  }
}
