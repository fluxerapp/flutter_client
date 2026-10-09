import 'package:flutter/foundation.dart';

bool get isAlternateAppIconSettingsAvailable {
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS => true,
    TargetPlatform.android => false,
    _ => false,
  };
}
