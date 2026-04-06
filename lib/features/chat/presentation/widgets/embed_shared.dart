import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class EmbedTitle extends StatelessWidget {
  final String title;
  final String? url;

  const EmbedTitle({required this.title, this.url, super.key});

  Future<void> _launch(BuildContext context) async {
    if (url == null) {
      return;
    }
    await handleExternalLinkTap(context, url!);
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.textStyles.embedTitle;

    if (url == null) {
      return Text(
        title,
        style: baseStyle.copyWith(color: context.colors.textPrimary),
      );
    }

    return GestureDetector(
      onTap: () => _launch(context),
      child: Text(title, style: baseStyle),
    );
  }
}

class EmbedAuthorRow extends StatelessWidget {
  final EmbedAuthor author;

  const EmbedAuthorRow({required this.author, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (author.iconUrl != null) ...[
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: CachedNetworkImage(
            imageUrl: author.proxyIconUrl ?? author.iconUrl!,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            errorBuilder: (_, e, s) => const SizedBox.shrink(),
          ),
        ),
        const SizedBox(width: 6),
      ],
      Flexible(
        child: Text(
          author.name,
          style: TextStyle(
            color: context.colors.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

class EmbedFooterRow extends StatelessWidget {
  final EmbedFooter footer;
  final String? timestamp;

  const EmbedFooterRow({required this.footer, this.timestamp, super.key});

  String? _formatTimestamp() {
    if (timestamp == null) {
      return null;
    }
    try {
      final dt = DateTime.parse(timestamp!).toLocal();
      return '${dt.day.toString().padLeft(2, '0')}.'
          '${dt.month.toString().padLeft(2, '0')}.'
          '${dt.year} '
          '${dt.hour.toString().padLeft(2, '0')}:'
          '${dt.minute.toString().padLeft(2, '0')}';
    } on FormatException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ts = _formatTimestamp();
    return Row(
      children: [
        if (footer.iconUrl != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: CachedNetworkImage(
              imageUrl: footer.proxyIconUrl ?? footer.iconUrl!,
              width: 16,
              height: 16,
              fit: BoxFit.cover,
              errorBuilder: (_, e, s) => const SizedBox.shrink(),
            ),
          ),
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text(
            ts != null ? '${footer.text} • $ts' : footer.text,
            style: context.textStyles.embedFooter,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
