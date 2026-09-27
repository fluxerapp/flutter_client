import 'package:flutter/foundation.dart';

bool get isAlternateAppIconSettingsAvailable {
  if (kIsWeb) {
    return false;
  }
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS => true,
    TargetPlatform.android => false,
    _ => false,
  };
}
