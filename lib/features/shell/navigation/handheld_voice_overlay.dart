import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

bool isHandheldVoiceOverlayForContainer(ProviderContainer container) {
  final BuildContext? context = container
      .read(fluxerRouterProvider)
      .routerDelegate
      .navigatorKey
      .currentContext;
  if (context == null) {
    return false;
  }
  return isHandheldVoiceOverlay(context);
}
