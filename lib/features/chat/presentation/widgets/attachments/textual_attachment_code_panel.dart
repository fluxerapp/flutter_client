import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

String? resolveHighlightLanguage(String languageCode) {
  ensureFluxerMarkdownLanguagesRegistered();
  final String normalized = languageCode.trim().toLowerCase();
  if (normalized.isEmpty ||
      normalized == 'plaintext' ||
      normalized == 'auto' ||
      normalized == 'ini') {
    return null;
  }
  if (kFluxerMarkdownLanguages.containsKey(normalized)) {
    return normalized;
  }
  return null;
}

class TextualAttachmentCodePanel extends StatelessWidget {
  const TextualAttachmentCodePanel({
    required this.status,
    required this.visibleLineCount,
    required this.wrapText,
    this.textContent,
    this.languageCode = 'plaintext',
    this.previewError,
    this.copyTextContent,
    this.fillAvailableSpace = false,
    this.scrollController,
    this.remainingSuffix,
    super.key,
  });

  final TextualAttachmentPreviewStatus status;
  final int visibleLineCount;
  final bool wrapText;
  final String? textContent;
  final String languageCode;
  final TextualAttachmentPreviewError? previewError;
  final String? copyTextContent;
  final bool fillAvailableSpace;
  final ScrollController? scrollController;
  final String? remainingSuffix;

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (status == TextualAttachmentPreviewStatus.error) {
      body = TextualAttachmentPreviewErrorRow(previewError: previewError);
    } else if (textContent == null ||
        status == TextualAttachmentPreviewStatus.loading ||
        status == TextualAttachmentPreviewStatus.idle) {
      body = const TextualAttachmentPreviewLoading();
    } else {
      body = _CodeBody(
        content: textContent!,
        languageCode: languageCode,
        wrapText: wrapText,
        remainingSuffix: remainingSuffix,
      );
    }

    return RepaintBoundary(
      child: TextualAttachmentPreviewSurface(
        status: status,
        visibleLineCount: visibleLineCount,
        previewError: previewError,
        copyTextContent: copyTextContent,
        fillAvailableSpace: fillAvailableSpace,
        scrollController: scrollController,
        child: body,
      ),
    );
  }
}

class _CodeBody extends StatelessWidget {
  const _CodeBody({
    required this.content,
    required this.languageCode,
    required this.wrapText,
    this.remainingSuffix,
  });

  final String content;
  final String languageCode;
  final bool wrapText;
  final String? remainingSuffix;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final TextStyle monoStyle = codeTextStyleFrom(
      context.textStyles.smallText.copyWith(
        color: context.colors.textPrimary,
        height: kTextualPreviewLineHeight / 13,
      ),
    );
    final String display = remainingSuffix == null
        ? content
        : '$content\n$remainingSuffix';
    final String? highlightLang = display.length > kMaxCodeHighlightSourceLength
        ? null
        : resolveHighlightLanguage(languageCode);

    if (highlightLang != null) {
      final Widget highlighted = HighlightView(
        display,
        language: highlightLang,
        theme: isDark
            ? kVs2015CodeBlockHighlightTheme
            : kGithubCodeBlockHighlightTheme,
        textStyle: monoStyle,
        padding: wrapText ? kTextualPreviewCodeInset : EdgeInsets.zero,
      );
      if (wrapText) {
        return highlighted;
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: kTextualPreviewCodeInset,
        child: highlighted,
      );
    }

    final Widget plain = Text(display, softWrap: wrapText, style: monoStyle);
    if (wrapText) {
      return Padding(padding: kTextualPreviewCodeInset, child: plain);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: kTextualPreviewCodeInset,
      child: plain,
    );
  }
}
