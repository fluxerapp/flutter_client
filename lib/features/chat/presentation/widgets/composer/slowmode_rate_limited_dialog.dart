import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/publish_message_sheets.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/slowmode_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

void listenSlowmodeRateLimitedAlerts(WidgetRef ref, BuildContext context) {
  ref.listen<Duration?>(slowmodeRateLimitedAlertProvider, (
    Duration? previous,
    Duration? next,
  ) {
    if (next == null || next == previous) {
      return;
    }
    unawaited(
      showSlowmodeRateLimitedDialog(context, remaining: next).whenComplete(() {
        ref.read(slowmodeRateLimitedAlertProvider.notifier).clear();
      }),
    );
  });
}

Future<void> showSlowmodeRateLimitedDialog(
  BuildContext context, {
  required Duration remaining,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return showErrorDialog(
    context,
    title: l10n.slowmodeRateLimitedTitle,
    body: l10n.slowmodeRateLimitedMessage(
      formatRetryWait(l10n, remaining.inMilliseconds) ??
          formatSlowmodeCountdown(remaining),
    ),
  );
}
