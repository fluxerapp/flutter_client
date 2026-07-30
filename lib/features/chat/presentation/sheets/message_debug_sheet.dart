import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Developer-mode message JSON inspector.
///
/// Counterpart of the web app's `MessageDebugModal`; renders a single
/// pretty-printed JSON dump of [Message.toJson] with a copy-to-clipboard
/// action. Use only behind a developer-mode gate.
Future<void> showMessageDebugSheet(
  BuildContext context, {
  required Message message,
}) {
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: FluxerLocalizations.of(context).chatMessageDebugSheetTitle,
    initialChildSize: 0.85,
    minChildSize: 0.5,
    builder: (sheetContext, scrollController, close) => _MessageDebugSheetBody(
      message: message,
      scrollController: scrollController,
    ),
  );
}

class _MessageDebugSheetBody extends ConsumerWidget {
  const _MessageDebugSheetBody({
    required this.message,
    required this.scrollController,
  });

  final Message message;
  final ScrollController scrollController;

  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final encoded = _encoder.convert(message.toJson());

    return SingleChildScrollView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                icon: PhosphorIconsFill.copy,
                label: l10n.chatMessageDebugCopyJson,
                onTap: () {
                  unawaited(
                    copyToClipboard(
                      context: context,
                      value: encoded,
                      message: l10n.chatMessageDebugJsonCopiedToast,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: layout.s3),
          Container(
            padding: EdgeInsets.all(layout.s3),
            decoration: BoxDecoration(
              color: colors.backgroundSecondaryAlt,
              borderRadius: layout.radiusLg,
            ),
            child: SelectableText(
              encoded,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                height: 1.4,
                color: colors.textPrimary,
              ),
            ),
          ),
          SizedBox(height: layout.s4),
        ],
      ),
    );
  }
}
