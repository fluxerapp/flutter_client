import 'package:flutter/foundation.dart';
import 'package:refresh_rate/refresh_rate.dart';

void configureFluxerDisplayRefreshRate() {
  if (kIsWeb) {
    return;
  }
  try {
    RefreshRate.enable();
  } on Object {
    // display refresh should never block startup
  }
}
