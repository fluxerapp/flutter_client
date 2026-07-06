import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

bool isMobileVoiceCameraPlatform() {
  return !kIsWeb && (Platform.isIOS || Platform.isAndroid);
}
