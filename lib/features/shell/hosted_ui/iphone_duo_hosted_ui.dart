import 'dart:io';
import 'dart:math' as math;

import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/material_ui.dart';

bool usesIphoneDuoHostedUi(BuildContext context) {
  if (kIsWeb || !Platform.isIOS || !PlatformInfo.isIOS26OrHigher()) {
    return false;
  }
  final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
  if (viewPadding.top != 0) {
    return false;
  }
  if (viewPadding.right > 0 && viewPadding.left == 0) {
    return true;
  }
  if (viewPadding.left > 0 && viewPadding.right == 0) {
    return true;
  }
  return false;
}

bool showsInAppShellBackButton(BuildContext context) =>
    !usesIphoneDuoHostedUi(context);

bool isPreShellRoute(String location) {
  return location == '/login' ||
      location == '/loading' ||
      location == '/reconnecting';
}

bool showsIphoneDuoWindowBackground({
  required bool isAuthenticated,
  required String location,
  required bool splashExitAllowed,
}) {
  if (!isAuthenticated || !splashExitAllowed) {
    return false;
  }
  return !isPreShellRoute(location);
}

EdgeInsets hostedUiSystemInsets(BuildContext context) {
  final EdgeInsets padding = MediaQuery.paddingOf(context);
  final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
  return EdgeInsets.fromLTRB(
    math.max(padding.left, viewPadding.left),
    math.max(padding.top, viewPadding.top),
    math.max(padding.right, viewPadding.right),
    math.max(padding.bottom, viewPadding.bottom),
  );
}
