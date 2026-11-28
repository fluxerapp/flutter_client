import 'dart:async';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gif_import_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const String _kExportFileName = 'fluxer-favorite-gifs.txt';
const String _kExampleUrls =
    'https://example.com/gif1.gif\nhttps://example.com/gif2.gif';

Future<void> showImportFavoriteGifsModal(BuildContext context) {
  return FluxerModal.show<void>(
    context,
    title: FluxerLocalizations.of(context).gifImportTitle,
    useRootNavigator: true,
    builder: (BuildContext dialogContext, VoidCallback close) =>
        _ImportFavoriteGifsBody(close: close),
  );
}

Future<void> exportFavoriteGifUrls(
  BuildContext context,
  List<FavoriteGifEntry> entries,
) async {
  final List<String> urls = <String>[
    for (final FavoriteGifEntry entry in entries)
      if (entry.url.trim().isNotEmpty) entry.url.trim(),
  ];
  if (urls.isEmpty) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  try {
    await FilePicker.saveFile(
      dialogTitle: l10n.gifPickerExportFavorites,
      fileName: _kExportFileName,
      bytes: utf8.encode('${urls.join('\n')}\n'),
    );
  } on Object {
    if (context.mounted) {
      ProviderScope.containerOf(context, listen: false)
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.gifExportFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }
}

class _ImportFavoriteGifsBody extends ConsumerStatefulWidget {
  const _ImportFavoriteGifsBody({required this.close});

  final VoidCallback close;

  @override
  ConsumerState<_ImportFavoriteGifsBody> createState() =>
      _ImportFavoriteGifsBodyState();
}

class _ImportFavoriteGifsBodyState
    extends ConsumerState<_ImportFavoriteGifsBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FavoriteGifImportState state = ref.watch(favoriteGifImportProvider);
    final FavoriteGifImportNotifier notifier = ref.read(
      favoriteGifImportProvider.notifier,
    );
    final bool atLimit =
        ref.watch(favoriteGifsProvider).entries.length >= kMaxFavoriteGifs;
    final TextStyle body = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
      height: 1.4,
    );
    final List<Widget> children;
    final List<Widget> actions;
    if (state.isDone) {
      children = <Widget>[
        Text(
          state.skippedCount > 0
              ? l10n.gifImportCompleteWithSkipped(
                  state.importedCount,
                  state.skippedCount,
                )
              : l10n.gifImportComplete(state.importedCount),
          style: body,
        ),
      ];
      actions = <Widget>[
        FluxerButton.secondary(
          label: l10n.gifImportMore,
          onPressed: () {
            notifier.reset();
            _controller.clear();
          },
        ),
        FluxerButton.primary(
          label: l10n.gifImportDone,
          onPressed: widget.close,
        ),
      ];
    } else if (state.isRunning) {
      children = <Widget>[
        Text(
          l10n.gifImportProgress(
            state.processedCount,
            state.totalToImport,
            state.importedCount,
          ),
          style: body,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: state.progress,
            minHeight: 8,
            color: context.colors.brandPrimary,
            backgroundColor: context.colors.backgroundModifierAccent,
          ),
        ),
        Text(
          l10n.gifImportBackground,
          style: body.copyWith(color: context.colors.textTertiary),
        ),
      ];
      actions = <Widget>[
        FluxerButton.secondary(
          label: l10n.gifImportClose,
          onPressed: widget.close,
        ),
        FluxerButton.dangerPrimary(
          label: l10n.gifImportCancel,
          onPressed: notifier.cancel,
        ),
      ];
    } else {
      children = <Widget>[
        Text(l10n.gifImportInstructions, style: body),
        if (atLimit)
          Text(
            l10n.gifImportLimitReached,
            style: body.copyWith(color: context.colors.statusDanger),
          )
        else
          FluxerInput.multiline(
            controller: _controller,
            label: l10n.gifImportUrlsLabel,
            hint: _kExampleUrls,
            minLines: 8,
            maxLines: 14,
            autocorrect: false,
            enableSuggestions: false,
            autofocus: true,
          ),
      ];
      actions = <Widget>[
        FluxerButton.secondary(label: l10n.cancel, onPressed: widget.close),
        FluxerButton.primary(
          label: l10n.gifImportStart,
          onPressed: _controller.text.trim().isEmpty || atLimit
              ? null
              : () => unawaited(notifier.start(_controller.text)),
        ),
      ];
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: <Widget>[
        ...children,
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 8,
          children: actions,
        ),
      ],
    );
  }
}
