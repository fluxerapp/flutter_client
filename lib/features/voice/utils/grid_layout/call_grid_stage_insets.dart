import 'dart:math' as math;

import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/material_ui.dart';

double voiceCallHandheldControlBottomReserve(BuildContext context) {
  return voiceChannelControlMorphingHeaderHeight() +
      kVoiceControlBarVerticalPadding * 2 +
      MediaQuery.viewPaddingOf(context).bottom;
}

bool voiceCallReserveHandheldControls(
  BuildContext context, {
  required bool showsOverlay,
  required bool screenShareExpanded,
}) {
  return showsOverlay &&
      !screenShareExpanded &&
      isHandheldVoiceOverlay(context);
}

EdgeInsets voiceCallGridStageInsets(
  BuildContext context, {
  required bool screenShareExpanded,
  required bool reserveHandheldControls,
}) {
  if (screenShareExpanded) {
    return EdgeInsets.zero;
  }
  final EdgeInsets systemInsets = voiceStageSystemInsets(context);
  if (!isHandheldVoiceOverlay(context)) {
    return systemInsets;
  }
  final double bottom = reserveHandheldControls
      ? math.max(
          systemInsets.bottom,
          voiceCallHandheldControlBottomReserve(context),
        )
      : systemInsets.bottom;
  return systemInsets.copyWith(bottom: bottom);
}

EdgeInsets voiceStageSystemInsets(BuildContext context) {
  return resolveVoiceStageSystemInsets(
    padding: MediaQuery.paddingOf(context),
    viewPadding: MediaQuery.viewPaddingOf(context),
    iphoneDuoHostedUi: usesIphoneDuoHostedUi(context),
  );
}

EdgeInsets resolveVoiceStageSystemInsets({
  required EdgeInsets padding,
  required EdgeInsets viewPadding,
  required bool iphoneDuoHostedUi,
}) {
  if (iphoneDuoHostedUi) {
    return EdgeInsets.fromLTRB(
      padding.left,
      math.max(padding.top, viewPadding.top),
      padding.right,
      math.max(padding.bottom, viewPadding.bottom),
    );
  }
  return EdgeInsets.fromLTRB(
    math.max(padding.left, viewPadding.left),
    math.max(padding.top, viewPadding.top),
    math.max(padding.right, viewPadding.right),
    math.max(padding.bottom, viewPadding.bottom),
  );
}
