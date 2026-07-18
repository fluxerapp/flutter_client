import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;

bool get isDesktopOs =>
    !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);

bool get isMobileNative => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
