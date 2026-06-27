import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

class AccountDisableSheet extends ConsumerStatefulWidget {
  const AccountDisableSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).dangerZoneDisableTitle,
      useRootNavigator: true,
      builder: (_, _) => const AccountDisableSheet(),
    );
  }

  @override
  ConsumerState<AccountDisableSheet> createState() =>
      _AccountDisableSheetState();
}

class _AccountDisableSheetState extends ConsumerState<AccountDisableSheet> {
  bool _loading = false;
  String? _error;

  Future<void> _handleDisable() async {
    final l10n = FluxerLocalizations.of(context);

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.disableCurrentUserAccount(
        body: const SudoVerificationSchema(),
      );

      if (mounted) {
        // Pop all the way back — the gateway disconnect will redirect to login
        Navigator.of(context, rootNavigator: true).pop();
      }
    } on DioException catch (e) {
      if (!mounted) {
        return;
      }
      final data = e.response?.data;
      final message = data is Map<String, dynamic>
          ? (data['message'] as String?) ?? l10n.genericError
          : l10n.genericError;
      setState(() {
        _loading = false;
        _error = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.dangerZoneDisableConfirmDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          if (_error != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.statusDanger,
              ),
            ),
          ],
          SizedBox(height: layout.s4),
          Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: _loading
                      ? null
                      : () => Navigator.of(context).pop(),
                  label: l10n.cancel,
                  fitContent: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FluxerButton.dangerPrimary(
                  onPressed: _loading ? null : _handleDisable,
                  label: l10n.dangerZoneDisableTitle,
                  isLoading: _loading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
