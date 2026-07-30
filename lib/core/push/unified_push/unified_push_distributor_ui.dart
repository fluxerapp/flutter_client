import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_functions.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_storage.dart';
import 'package:unifiedpush_ui/unifiedpush_ui.dart';

/// Shows the official UnifiedPush distributor picker or install guidance.
Future<void> showUnifiedPushDistributorSetup(
  BuildContext context, {
  required UnifiedPushNoDistributorDismissalStorage dismissalStorage,
}) async {
  if (!context.mounted) {
    return;
  }
  final bool dismissed = await dismissalStorage.isDismissed();
  if (!context.mounted) {
    return;
  }
  await UnifiedPushUi(
    context: context,
    instances: const <String>[kFluxerUnifiedPushInstance],
    unifiedPushFunctions: FluxerUnifiedPushFunctions(),
    showNoDistribDialog: !dismissed,
    onNoDistribDialogDismissed: () {
      unawaited(dismissalStorage.dismiss());
    },
  ).registerAppWithDialog();
  await UnifiedPushService.instance.syncRegistration(force: true);
}
