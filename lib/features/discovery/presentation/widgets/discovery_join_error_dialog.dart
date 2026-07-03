import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_join_error.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class DiscoveryJoinErrorDialog {
  DiscoveryJoinErrorDialog._();

  static Future<void> show(
    BuildContext context, {
    required DioException error,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DiscoveryJoinError joinError = discoveryJoinErrorFromApiCode(
      apiErrorCodeFromDioException(error),
    );
    return FluxerModal.show<void>(
      context,
      title: joinError.title(l10n),
      description: joinError.message(l10n),
      centered: true,
      builder: (BuildContext context, VoidCallback close) {
        return const SizedBox.shrink();
      },
    );
  }
}
