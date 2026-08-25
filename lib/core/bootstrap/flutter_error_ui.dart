import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/widgets/fluxer_render_error_placeholder.dart';
import 'package:fluxer_app/material_ui.dart';

void configureFluxerErrorUi() {
  if (kDebugMode) {
    return;
  }
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const FluxerRenderErrorPlaceholder();
  };
}
