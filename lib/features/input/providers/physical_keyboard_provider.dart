import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/platform/physical_keyboard.dart';

final physicalKeyboardConnectedProvider = StreamProvider<bool>((ref) {
  return watchPhysicalKeyboardConnected(supported: isFluxerNativeMobileOs);
});
