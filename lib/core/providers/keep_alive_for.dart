import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void keepAliveFor(Ref ref, Duration duration) {
  final link = ref.keepAlive();
  Timer? timer;
  ref
    ..onCancel(() {
      timer?.cancel();
      timer = Timer(duration, link.close);
    })
    ..onResume(() {
      timer?.cancel();
      timer = null;
    })
    ..onDispose(() => timer?.cancel());
}
