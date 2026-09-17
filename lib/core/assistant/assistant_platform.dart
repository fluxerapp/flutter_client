import 'package:flutter/foundation.dart';

bool isAssistantChannelSupported() {
  if (kIsWeb) {
    return false;
  }
  return defaultTargetPlatform == TargetPlatform.iOS;
}
