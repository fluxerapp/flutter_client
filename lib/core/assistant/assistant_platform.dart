import 'package:flutter/foundation.dart';

bool isAssistantChannelSupported() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}
