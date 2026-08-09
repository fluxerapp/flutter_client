import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kTextualPreviewLineHeight = 18;
const double kTextualPreviewMaxWidth = 400;
const EdgeInsets kTextualPreviewCodeInset = EdgeInsets.all(10);

class TextualAttachmentPreviewSurface extends StatelessWidget {
  const TextualAttachmentPreviewSurface({
    required this.status,
    required this.visibleLineCount,
    required this.child,
    this.previewError,
    this.copyTextContent,
    this.fillAvailableSpace = false,
    this.scrollController,
    this.contentPadding = EdgeInsets.zero,
    super.key,
  });

  final TextualAttachmentPreviewStatus status;
  final int visibleLineCount;
  final Widget child;
  final TextualAttachmentPreviewError? previewError;
  final String? copyTextContent;
  final bool fillAvailableSpace;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final EdgeInsets pad = contentPadding.resolve(Directionality.of(context));
    final bool showCopy =
        copyTextContent != null &&
        copyTextContent!.isNotEmpty &&
        status == TextualAttachmentPreviewStatus.loaded;
    final Widget scrollChild = status == TextualAttachmentPreviewStatus.loaded
        ? child
        : Padding(
            padding: pad == EdgeInsets.zero
                ? kTextualPreviewCodeInset
                : EdgeInsets.only(left: pad.left, right: pad.right),
            child: child,
          );

    final Color surfaceColor = colors.bgCodeBlock;

    final Widget stack = Stack(
      children: [
        Positioned.fill(
          child: SelectionArea(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.only(top: pad.top, bottom: pad.bottom),
              child: scrollChild,
            ),
          ),
        ),
        if (showCopy)
          Positioned(
            top: 4,
            right: 4,
            child: _TextualPreviewCopyButton(
              text: copyTextContent!,
              surfaceColor: surfaceColor,
            ),
          ),
      ],
    );

    if (fillAvailableSpace) {
      return ColoredBox(
        color: surfaceColor,
        child: SizedBox.expand(child: stack),
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: kTextualPreviewMaxWidth,
        maxHeight: visibleLineCount * kTextualPreviewLineHeight + 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      clipBehavior: Clip.antiAlias,
      child: stack,
    );
  }
}

class _TextualPreviewCopyButton extends StatefulWidget {
  const _TextualPreviewCopyButton({
    required this.text,
    required this.surfaceColor,
  });

  final String text;
  final Color surfaceColor;

  @override
  State<_TextualPreviewCopyButton> createState() =>
      _TextualPreviewCopyButtonState();
}

class _TextualPreviewCopyButtonState extends State<_TextualPreviewCopyButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool alwaysVisible = isMobileLayout(context);
    final double opacity = alwaysVisible || _hovered ? 1 : 0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: SizedBox(
        width: 28,
        height: 28,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const ColoredBox(color: Colors.transparent),
            IgnorePointer(
              ignoring: opacity == 0,
              child: Opacity(
                opacity: opacity,
                child: Material(
                  color: widget.surfaceColor.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(6),
                  child: IconButton(
                    tooltip: l10n.chatTextualPreviewCopy,
                    visualDensity: VisualDensity.compact,
                    iconSize: 16,
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(6),
                      minimumSize: const Size(28, 28),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      unawaited(
                        Clipboard.setData(ClipboardData(text: widget.text)),
                      );
                    },
                    icon: PhosphorIcon(
                      PhosphorIconsBold.copy,
                      size: 16,
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextualAttachmentPreviewErrorRow extends StatelessWidget {
  const TextualAttachmentPreviewErrorRow({this.previewError, super.key});

  final TextualAttachmentPreviewError? previewError;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String message =
        previewError?.type == TextualAttachmentPreviewErrorType.size
        ? l10n.chatTextualPreviewSizeError(kTextPreviewMaxBytes ~/ 1024)
        : l10n.chatTextualPreviewLoadError;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhosphorIcon(
          PhosphorIconsBold.warningCircle,
          size: 16,
          color: colors.statusDanger,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: context.textStyles.smallText.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class TextualAttachmentPreviewLoading extends StatelessWidget {
  const TextualAttachmentPreviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: FluxerLoadingSpinner(),
      ),
    );
  }
}
