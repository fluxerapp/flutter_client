import 'package:flutter/foundation.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/fluxer_render_error_placeholder.dart';

void configureFluxerErrorUi() {
  if (kDebugMode) {
    return;
  }
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const FluxerRenderErrorPlaceholder();
  };
}
