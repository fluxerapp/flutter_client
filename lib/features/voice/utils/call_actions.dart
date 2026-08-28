import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_confirm_sheet.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:go_router/go_router.dart';

typedef StartDirectVoiceCallResult = ({
  bool ok,
  bool microphoneDenied,
  bool cameraDenied,
  bool notEligible,
  bool joinAttemptFailed,
});

/// When `microphoneDenied` or `cameraDenied` is true, the voice session
/// notifier already surfaced permission UI; avoid redundant snack bars.
/// When neither flag is true: `notEligible` is server ringability failure;
/// `joinAttemptFailed` is an unexpected exception from join; otherwise
/// the user likely navigated away (no snack — `ok` stays false silently).
Future<StartDirectVoiceCallResult> startDirectVoiceCall(
  WidgetRef ref,
  BuildContext context,
  String channelId, {
  List<String>? outboundRingRecipients,
  bool startWithVideo = false,
}) async {
  final dm = findDmById(ref.read(dmViewModelProvider).conversations, channelId);
  if (dm != null && !canStartDmCall(dm)) {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: true,
      joinAttemptFailed: false,
    );
  }
  final bool confirmBeforeStartingCalls = ref
      .read(appearancePreferencesProvider)
      .confirmBeforeStartingCalls;
  if (confirmBeforeStartingCalls) {
    final l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await showFluxerSettingsConfirmSheet(
      context,
      title: l10n.accessibilityConfirmStartCallTitle,
      description: l10n.accessibilityConfirmStartCallDescription,
      confirmLabel: l10n.accessibilityConfirmStartCallConfirmLabel,
    );
    if (confirmed != true) {
      return (
        ok: false,
        microphoneDenied: false,
        cameraDenied: false,
        notEligible: false,
        joinAttemptFailed: false,
      );
    }
    if (!context.mounted) {
      return (
        ok: false,
        microphoneDenied: false,
        cameraDenied: false,
        notEligible: false,
        joinAttemptFailed: false,
      );
    }
  }
  if (!context.mounted) {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: false,
      joinAttemptFailed: false,
    );
  }
  try {
    await joinVoiceChannelWithConfirmation(
      ref: ref,
      context: context,
      guildId: null,
      channelId: channelId,
      startOutgoingCall: true,
      outboundRingRecipients: outboundRingRecipients,
      initialSelfVideo: startWithVideo,
    );
  } on Object {
    return (
      ok: false,
      microphoneDenied: false,
      cameraDenied: false,
      notEligible: false,
      joinAttemptFailed: true,
    );
  }
  if (context.mounted) {
    unawaited(context.push(RoutePaths.dmChannelCall(channelId)));
  }
  return (
    ok: true,
    microphoneDenied: false,
    cameraDenied: false,
    notEligible: false,
    joinAttemptFailed: false,
  );
}
