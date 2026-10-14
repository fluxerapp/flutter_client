import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showDebugBottomSheet(
  BuildContext context, {
  required String title,
  required Map<String, Object?> data,
  String? copiedMessage,
}) {
  final String json = const JsonEncoder.withIndent('  ').convert(data);
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: title,
    minChildSize: 0.5,
    builder: (sheetContext, scrollController, close) => _DebugSheetBody(
      json: json,
      copiedMessage: copiedMessage,
      scrollController: scrollController,
    ),
  );
}

class _DebugSheetBody extends StatelessWidget {
  const _DebugSheetBody({
    required this.json,
    required this.copiedMessage,
    required this.scrollController,
  });

  final String json;
  final String? copiedMessage;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

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
                      value: json,
                      message: copiedMessage,
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
              color: FluxerBottomSheet.cardColorOf(context),
              borderRadius: layout.radiusLg,
            ),
            child: SelectableText(
              json,
              style: context.textStyles.codeText.copyWith(
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
