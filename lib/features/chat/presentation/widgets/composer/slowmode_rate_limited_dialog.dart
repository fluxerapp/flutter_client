import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_rate_limited_alert_provider.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_format.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

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
  return FluxerModal.show<void>(
    context,
    centered: true,
    title: l10n.slowmodeRateLimitedTitle,
    builder: (BuildContext context, VoidCallback close) {
      return Text(
        l10n.slowmodeRateLimitedMessage(formatSlowmodeCountdown(remaining)),
      );
    },
    actionsBuilder: (void Function([void]) pop) => <Widget>[
      FluxerButton.primary(onPressed: pop, label: l10n.uiConfirm),
    ],
  );
}
