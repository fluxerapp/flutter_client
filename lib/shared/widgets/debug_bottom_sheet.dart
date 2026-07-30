import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Shows a bottom sheet with syntax-highlighted JSON data and a copy button.
///
/// Used by debug actions (Debug Community, Debug User, Debug Channel).
Future<void> showDebugBottomSheet(
  BuildContext context, {
  required String title,
  required Map<String, Object?> data,
  void Function(String message)? onCopied,
}) async {
  final json = const JsonEncoder.withIndent('  ').convert(data);
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final copied = ValueNotifier<bool>(false);

  await FluxerBottomSheet.showScrollable<void>(
    context,
    title: title,
    builder: (sheetContext, scrollController, close) {
      final layout = sheetContext.layout;
      final l10n = FluxerLocalizations.of(sheetContext);

      return SingleChildScrollView(
        controller: scrollController,
        padding: FluxerBottomSheet.scrollViewPadding(
          sheetContext,
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: HighlightView(
                  json,
                  language: 'json',
                  theme: isDark ? vs2015Theme : githubTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: ValueListenableBuilder<bool>(
                valueListenable: copied,
                builder: (_, isCopied, _) => IconButton(
                  icon: PhosphorIcon(
                    isCopied ? PhosphorIconsBold.check : PhosphorIconsBold.copy,
                    color: isCopied
                        ? Colors.green
                        : isDark
                        ? Colors.white70
                        : Colors.black54,
                    size: 18,
                  ),
                  onPressed: isCopied
                      ? null
                      : () {
                          unawaited(
                            copyToClipboard(context: sheetContext, value: json),
                          );
                          copied.value = true;
                          Future<void>.delayed(const Duration(seconds: 2), () {
                            copied.value = false;
                          });
                          onCopied?.call(l10n.copiedToClipboard);
                        },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
