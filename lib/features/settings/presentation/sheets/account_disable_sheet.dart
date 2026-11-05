import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/account_closure_notice_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/utils/sign_out_current_account.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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

    final ProviderContainer container = ProviderScope.containerOf(
      context,
      listen: false,
    );
    final NavigatorState rootNavigator = Navigator.of(
      context,
      rootNavigator: true,
    );

    setState(() {
      _loading = true;
      _error = null;
    });

    container
        .read(accountClosureInFlightProvider.notifier)
        .setInFlight(value: true);
    try {
      await container
          .read(fluxerClientProvider)
          .users
          .disableCurrentUserAccount(body: const SudoVerificationSchema());
    } on DioException catch (e) {
      container
          .read(accountClosureInFlightProvider.notifier)
          .setInFlight(value: false);
      if (!mounted) {
        return;
      }
      setState(() {
        _loading = false;
        _error = isSudoCancellation(e)
            ? null
            : userFacingErrorMessage(e, l10n.genericError);
      });
      return;
    }

    container
        .read(pendingAccountClosureNoticeProvider.notifier)
        .show(const AccountClosureNotice(kind: AccountClosureKind.disabled));
    rootNavigator.popUntil((Route<dynamic> route) => route.isFirst);
    await signOutCurrentAccount(container, keepInstance: true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
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
