import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_sheet.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/utils/incoming_voice_call_actions.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:material_ui/material_ui.dart';

/// Presents ringing calls in a Fluxer draggable bottom sheet like fluxer-web
/// IncomingCallUI on mobile.
class IncomingVoiceCallLayer extends ConsumerStatefulWidget {
  const IncomingVoiceCallLayer({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<IncomingVoiceCallLayer> createState() =>
      _IncomingVoiceCallLayerState();
}

class _IncomingVoiceCallLayerState
    extends ConsumerState<IncomingVoiceCallLayer> {
  bool _sheetOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _enqueuePresentSheet());
  }

  void _enqueuePresentSheet() {
    if (!mounted || _sheetOpen) {
      return;
    }
    if (!shouldPresentIncomingVoiceSheet(
      isNativeVoiceCallKitPlatform: isNativeVoiceCallKitPlatform,
      isRuntimeMobileFormFactor: isFluxerRuntimeMobileFormFactor,
      isForeground: ref.read(appUiForegroundProvider),
    )) {
      return;
    }
    final List<String> pending = ref.read(
      pendingIncomingVoiceChannelIdsProvider,
    );
    if (pending.isEmpty) {
      return;
    }
    final String channelId = pending.first;
    _sheetOpen = true;
    unawaited(_runSheetLifecycle(channelId));
  }

  Future<void> _runSheetLifecycle(String channelId) async {
    final BuildContext? sheetContext = rootNavigatorKey.currentContext;
    if (sheetContext == null || !sheetContext.mounted) {
      _sheetOpen = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _enqueuePresentSheet();
        }
      });
      return;
    }
    try {
      final String? result = await showIncomingVoiceCallSheet(
        sheetContext,
        ref: ref,
        channelId: channelId,
      );
      if (!mounted) {
        return;
      }
      final BuildContext actionContext =
          rootNavigatorKey.currentContext ?? context;
      if (!actionContext.mounted) {
        return;
      }
      if (result == kIncomingVoiceResultAccept) {
        await executeAcceptIncomingVoiceCall(ref, actionContext, channelId);
      } else if (result == kIncomingVoiceResultReject) {
        await executeDeclineIncomingVoiceCall(ref, actionContext, channelId);
      } else if (result == kIncomingVoiceResultIgnore) {
        await executeIgnoreIncomingVoiceCall(ref, actionContext, channelId);
      }
    } finally {
      _sheetOpen = false;
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _enqueuePresentSheet();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (_, _) {
      _enqueuePresentSheet();
    });
    return widget.child;
  }
}
