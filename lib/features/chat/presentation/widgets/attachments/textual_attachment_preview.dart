import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/modals/textual_attachment_preview_modal.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/textual_attachment_language_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/textual_attachment_preview_options_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/textual_attachment_preview_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/csv_attachment_table_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_footer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/csv_attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_fullscreen.dart';
import 'package:fluxer_app/features/settings/providers/textual_preview_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

typedef TextualAttachmentContentLoader =
    Future<TextualAttachmentContentResult> Function({
      required Attachment attachment,
      CancelToken? cancelToken,
    });

class TextualAttachmentPreview extends ConsumerStatefulWidget {
  const TextualAttachmentPreview({
    required this.attachment,
    this.dio,
    this.contentLoader,
    super.key,
  });

  final Attachment attachment;
  final Dio? dio;
  final TextualAttachmentContentLoader? contentLoader;

  @override
  ConsumerState<TextualAttachmentPreview> createState() =>
      _TextualAttachmentPreviewState();
}

class _TextualAttachmentPreviewState
    extends ConsumerState<TextualAttachmentPreview> {
  late bool _isCsvPreview;
  late String _inferredLanguageCode;
  late String _selectedLanguage;
  late bool _isExpanded;
  TextualAttachmentPreviewStatus _status = TextualAttachmentPreviewStatus.idle;
  TextualAttachmentPreviewError? _previewError;
  String? _textContent;
  List<String> _lines = const <String>[];
  CsvRows? _csvRows;
  CancelToken? _cancelToken;
  ValueNotifier<TextualAttachmentFullscreenSnapshot>? _fullscreenSnapshot;
  ProviderSubscription<bool>? _wrapTextSubscription;

  Attachment get _attachment => widget.attachment;

  @override
  void initState() {
    super.initState();
    _configureForAttachment();
    _wrapTextSubscription = ref.listenManual<bool>(
      textualPreviewPreferencesProvider.select((state) => state.wrapText),
      (bool? previous, bool next) {
        _publishFullscreenSnapshot();
      },
    );
    unawaited(_loadContent());
  }

  @override
  void didUpdateWidget(covariant TextualAttachmentPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.attachment.id == widget.attachment.id) {
      return;
    }
    _configureForAttachment();
    _resetContentState();
    unawaited(_loadContent());
  }

  void _configureForAttachment() {
    _isCsvPreview = isCsvAttachment(_attachment);
    _inferredLanguageCode = inferLanguageCodeFromAttachment(_attachment);
    _selectedLanguage = getInitialSelectedLanguage(
      _attachment,
      _inferredLanguageCode,
    );
    _isExpanded = previewExpansionState[_attachment.id] ?? false;
  }

  @override
  void dispose() {
    _wrapTextSubscription?.close();
    _fullscreenSnapshot?.dispose();
    _fullscreenSnapshot = null;
    _cancelToken?.cancel();
    super.dispose();
  }

  TextualAttachmentFullscreenSnapshot _buildFullscreenSnapshot() {
    return TextualAttachmentFullscreenSnapshot(
      status: _status,
      selectedLanguage: _selectedLanguage,
      wrapText: ref.read(textualPreviewPreferencesProvider).wrapText,
      isCsvPreview: _isCsvPreview,
      lineCount: _lines.length,
      textContent: _textContent,
      csvRows: _csvRows,
      previewError: _previewError,
    );
  }

  void _publishFullscreenSnapshot() {
    final ValueNotifier<TextualAttachmentFullscreenSnapshot>? notifier =
        _fullscreenSnapshot;
    if (notifier == null) {
      return;
    }
    notifier.value = _buildFullscreenSnapshot();
  }

  void _resetContentState() {
    _textContent = null;
    _lines = const <String>[];
    _csvRows = null;
    _previewError = null;
    _status = TextualAttachmentPreviewStatus.idle;
  }

  void _applyLoadedContent(String content) {
    _textContent = content;
    if (_isCsvPreview) {
      _csvRows = parseCsvRows(content);
      _lines = const <String>[];
    } else {
      _lines = splitPreviewLines(content);
      _csvRows = null;
    }
    _status = TextualAttachmentPreviewStatus.loaded;
    _previewError = null;
  }

  Future<void> _loadContent() async {
    _cancelToken?.cancel();
    final CancelToken token = CancelToken();
    _cancelToken = token;
    if (!mounted) {
      return;
    }
    setState(() {
      _status = TextualAttachmentPreviewStatus.loading;
      _previewError = null;
    });
    _publishFullscreenSnapshot();
    try {
      final TextualAttachmentContentLoader loader =
          widget.contentLoader ??
          ({required Attachment attachment, CancelToken? cancelToken}) {
            return fetchTextualAttachmentContent(
              attachment: attachment,
              cancelToken: cancelToken,
              dio: widget.dio,
            );
          };
      final TextualAttachmentContentResult result = await loader(
        attachment: _attachment,
        cancelToken: token,
      );
      if (!mounted || token.isCancelled) {
        return;
      }
      setState(() {
        if (result.isLoaded) {
          _applyLoadedContent(result.content!);
        } else {
          _textContent = null;
          _lines = const <String>[];
          _csvRows = null;
          _status = TextualAttachmentPreviewStatus.error;
          _previewError = result.error;
        }
      });
      _publishFullscreenSnapshot();
    } on DioException catch (error) {
      if (CancelToken.isCancel(error) || !mounted) {
        return;
      }
      setState(() {
        _status = TextualAttachmentPreviewStatus.error;
        _previewError = TextualAttachmentPreviewError(
          type: TextualAttachmentPreviewErrorType.network,
          message: error.message,
        );
      });
      _publishFullscreenSnapshot();
    }
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      previewExpansionState[_attachment.id] = _isExpanded;
    });
  }

  Future<void> _openLanguagePicker() async {
    final String? selected = await showTextualAttachmentLanguageSheet(
      context: context,
      selectedLanguage: _selectedLanguage,
      inferredLanguageCode: _inferredLanguageCode,
    );
    if (selected == null || !mounted || selected == _selectedLanguage) {
      return;
    }
    setState(() => _selectedLanguage = selected);
    _publishFullscreenSnapshot();
  }

  Future<void> _download() async {
    final String? downloadUrl = attachmentEffectiveDownloadUrl(
      url: _attachment.url,
      isExpired: _attachment.expired ?? false,
      proxyUrl: _attachment.proxyUrl,
    );
    if (downloadUrl == null || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, downloadUrl);
  }

  Future<void> _showMoreOptions() async {
    final bool wrapText = ref.read(textualPreviewPreferencesProvider).wrapText;
    final TextualAttachmentPreviewOption? action =
        await showTextualAttachmentPreviewOptionsSheet(
          context: context,
          wrapText: wrapText,
          showWrapText: !_isCsvPreview,
        );
    if (!mounted || action == null) {
      return;
    }
    switch (action) {
      case TextualAttachmentPreviewOption.download:
        await _download();
      case TextualAttachmentPreviewOption.wrapText:
        await ref
            .read(textualPreviewPreferencesProvider.notifier)
            .toggleWrapText();
    }
  }

  Future<void> _openFullscreen() async {
    final ValueNotifier<TextualAttachmentFullscreenSnapshot> notifier =
        ValueNotifier<TextualAttachmentFullscreenSnapshot>(
          _buildFullscreenSnapshot(),
        );
    _fullscreenSnapshot = notifier;
    try {
      if (isFluxerMobileOs) {
        await showTextualAttachmentPreviewSheet(
          context: context,
          attachment: _attachment,
          snapshot: notifier,
          onSelectLanguage: () {
            unawaited(_openLanguagePicker());
          },
          onMoreOptions: () {
            unawaited(_showMoreOptions());
          },
        );
      } else {
        await showTextualAttachmentPreviewModal(
          context: context,
          attachment: _attachment,
          snapshot: notifier,
          onSelectLanguage: () {
            unawaited(_openLanguagePicker());
          },
          onMoreOptions: () {
            unawaited(_showMoreOptions());
          },
        );
      }
    } finally {
      if (identical(_fullscreenSnapshot, notifier)) {
        _fullscreenSnapshot = null;
      }
      notifier.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool wrapText = ref.watch(
      textualPreviewPreferencesProvider.select((state) => state.wrapText),
    );
    final int itemCount = _isCsvPreview
        ? (_csvRows?.length ?? 0)
        : _lines.length;
    final bool canExpand = itemCount > kDefaultPreviewLines;
    final bool loaded = _status == TextualAttachmentPreviewStatus.loaded;

    String? remainingSuffix;
    String? inlineText;
    CsvRows? inlineCsvRows = _csvRows;

    if (loaded && _isCsvPreview && _csvRows != null) {
      inlineCsvRows = _visibleCsvRows(_csvRows!);
      if (_isExpanded) {
        final int remaining = remainingCsvRows(_csvRows!);
        if (remaining > 0) {
          remainingSuffix = l10n.chatTextualPreviewRemainingRows(remaining);
        }
      }
    } else if (loaded && !_isCsvPreview) {
      inlineText = _visibleCodeText();
      if (_isExpanded) {
        final int remaining = remainingPreviewLinesFromCount(_lines.length);
        if (remaining > 0) {
          remainingSuffix = l10n.chatTextualPreviewRemainingLines(remaining);
        }
      }
    }

    final int visibleLineCount;
    if (!loaded || !_isExpanded) {
      visibleLineCount = getVisibleLineCount(itemCount, isExpanded: false);
    } else if (_isCsvPreview) {
      visibleLineCount = (inlineCsvRows?.length ?? 1).clamp(1, 1000);
    } else {
      visibleLineCount = getVisibleLineCount(itemCount, isExpanded: true);
    }

    return Container(
      constraints: const BoxConstraints(maxWidth: kTextualPreviewMaxWidth),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        border: Border.all(color: context.colors.backgroundModifierAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isCsvPreview)
            CsvAttachmentTablePanel(
              status: _status,
              visibleLineCount: visibleLineCount,
              rows: inlineCsvRows,
              previewError: _previewError,
              copyTextContent: _textContent,
              remainingSuffix: remainingSuffix,
            )
          else
            TextualAttachmentCodePanel(
              status: _status,
              visibleLineCount: visibleLineCount,
              wrapText: wrapText,
              textContent: inlineText,
              languageCode: _selectedLanguage,
              previewError: _previewError,
              copyTextContent: _textContent,
              remainingSuffix: remainingSuffix,
            ),
          TextualAttachmentPreviewFooter(
            attachment: _attachment,
            canExpand: canExpand,
            isExpanded: _isExpanded,
            itemCount: itemCount,
            onToggleExpanded: _toggleExpanded,
            onOpenFullscreen: () {
              unawaited(_openFullscreen());
            },
            onSelectLanguage: () {
              unawaited(_openLanguagePicker());
            },
            onMoreOptions: () {
              unawaited(_showMoreOptions());
            },
            countKind: _isCsvPreview
                ? TextualPreviewCountKind.row
                : TextualPreviewCountKind.line,
            showLanguageButton: !_isCsvPreview,
          ),
        ],
      ),
    );
  }

  String _visibleCodeText() {
    if (_lines.isEmpty) {
      return _textContent ?? '';
    }
    final int maxLines = _isExpanded
        ? kMaxExpandedPreviewLines
        : kDefaultPreviewLines;
    return joinPreviewLines(_lines, maxLines: maxLines);
  }

  CsvRows _visibleCsvRows(CsvRows rows) {
    if (_isExpanded) {
      return truncateCsvRowsForInlineExpand(rows);
    }
    if (rows.length <= kDefaultPreviewLines) {
      return rows;
    }
    return rows.take(kDefaultPreviewLines).toList(growable: false);
  }
}
