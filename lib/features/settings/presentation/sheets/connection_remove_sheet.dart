import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

class ConnectionRemoveSheet {
  const ConnectionRemoveSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required ConnectionResponse connection,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.connectionRemoveTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) =>
          _ConnectionRemoveBody(connection: connection, close: close),
    );
  }
}

class _ConnectionRemoveBody extends ConsumerWidget {
  const _ConnectionRemoveBody({required this.connection, required this.close});

  final ConnectionResponse connection;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;

    return Padding(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.connectionRemoveDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerButton.dangerPrimary(
            label: l10n.connectionRemoveConfirm,
            onPressedAsync: () async {
              try {
                await ref
                    .read(connectionsViewModelProvider.notifier)
                    .deleteConnection(connection.type.toJson(), connection.id);
                if (context.mounted) {
                  close();
                }
              } on Object catch (_) {
                ref
                    .read(toastProvider.notifier)
                    .show(
                      FluxerToast(
                        message: l10n.connectionRemoveFailed,
                        variant: FluxerToastVariant.danger,
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
