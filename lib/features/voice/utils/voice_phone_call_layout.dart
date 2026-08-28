import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_visibility.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kVoiceCallPhoneTransitionDuration = Duration(milliseconds: 420);
const Curve kVoiceCallPhoneTransitionCurve = Curves.easeOutCubic;
const Offset kVoiceCallPhoneSlideBegin = Offset(0, 0.12);

bool shouldMinimizePhoneVoiceCall(BuildContext context, WidgetRef ref) {
  if (!isPhoneVoiceOverlay(context)) {
    return false;
  }
  final String location = ref.read(shellLocationProvider);
  return voicePipIsOnSessionCallRoute(
    voice: ref.read(voiceSessionProvider),
    location: location,
    routeGuildId: extractGuildId(location),
    routeChannelId: extractChannelId(location),
  );
}
