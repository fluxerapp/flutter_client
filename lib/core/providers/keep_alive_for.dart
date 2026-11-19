import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show KeepAliveLink;

KeepAliveLink keepAliveFor(Ref ref, Duration duration) {
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
  return link;
}
