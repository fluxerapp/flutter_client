import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resend_verification_email.g.dart';

@Riverpod(keepAlive: true)
class ResendVerificationEmailInFlight
    extends _$ResendVerificationEmailInFlight {
  @override
  bool build() => false;

  void setInFlight({required bool value}) {
    if (state == value) {
      return;
    }
    state = value;
  }
}

Future<void> resendVerificationEmail(
  WidgetRef ref,
  BuildContext context,
) async {
  if (ref.read(resendVerificationEmailInFlightProvider)) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final ResendVerificationEmailInFlight inFlight = ref.read(
    resendVerificationEmailInFlightProvider.notifier,
  )..setInFlight(value: true);
  final Toast toasts = ref.read(toastProvider.notifier);
  try {
    await ref.read(fluxerClientProvider).auth.resendVerificationEmail();
    toasts.show(
      FluxerToast(
        message: l10n.verificationEmailSent,
        variant: FluxerToastVariant.success,
      ),
    );
  } on DioException catch (error) {
    if (error.response?.statusCode == 429) {
      toasts.show(
        FluxerToast(
          message: l10n.verificationEmailRateLimited,
          variant: FluxerToastVariant.danger,
        ),
      );
      return;
    }
    if (context.mounted) {
      await showApiError(context, ApiErrorAction.generic, error);
    }
  } finally {
    inFlight.setInFlight(value: false);
  }
}
