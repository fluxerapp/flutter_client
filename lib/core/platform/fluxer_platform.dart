import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:cupertino_ui/cupertino_ui.dart' show WidgetsFlutterBinding;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:fluxer_app/material_ui.dart' show WidgetsFlutterBinding;

const double kFluxerMobileFormFactorMaxShortestSide = 600;

const bool kFluxerMobileFormFactorBuild =
    // Compile-time flag for Linux mobile form factor testing.
    // ignore: do_not_use_environment
    bool.fromEnvironment('LINUX_MOBILE');

bool? _isRuntimeMobileFormFactor;

bool get isFluxerNativeMobileOs =>
    !kIsWeb && (Platform.isAndroid || Platform.isIOS);

/// Android and iOS use the system CallKit / connection service incoming UI
bool get isNativeVoiceCallKitPlatform => isFluxerNativeMobileOs;

bool _isFluxerDesktopClassOs() {
  return !kIsWeb &&
      (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
}

/// Call after [WidgetsFlutterBinding.ensureInitialized].
void configureFluxerMobileDetection() {
  if (kIsWeb || isFluxerNativeMobileOs || !_isFluxerDesktopClassOs()) {
    _isRuntimeMobileFormFactor = false;
    return;
  }
  if (kFluxerMobileFormFactorBuild) {
    _isRuntimeMobileFormFactor = true;
    return;
  }
  final FlutterView? view =
      PlatformDispatcher.instance.implicitView ??
      (PlatformDispatcher.instance.views.isNotEmpty
          ? PlatformDispatcher.instance.views.first
          : null);
  if (view == null) {
    _isRuntimeMobileFormFactor = false;
    return;
  }
  final double devicePixelRatio = view.devicePixelRatio;
  final Size logicalSize = view.physicalSize / devicePixelRatio;
  _isRuntimeMobileFormFactor = isFluxerMobileFormFactorShortestSide(
    math.min(logicalSize.width, logicalSize.height),
  );
}

@visibleForTesting
bool isFluxerMobileFormFactorShortestSide(double shortestLogicalSide) {
  return shortestLogicalSide < kFluxerMobileFormFactorMaxShortestSide;
}

@visibleForTesting
void resetFluxerMobileDetectionForTesting() {
  _isRuntimeMobileFormFactor = null;
}

@visibleForTesting
void setFluxerRuntimeMobileFormFactorForTesting({required bool? value}) {
  _isRuntimeMobileFormFactor = value;
}

bool get isFluxerRuntimeMobileFormFactor {
  if (kIsWeb || isFluxerNativeMobileOs || !_isFluxerDesktopClassOs()) {
    return false;
  }
  if (kFluxerMobileFormFactorBuild) {
    return true;
  }
  return _isRuntimeMobileFormFactor ?? false;
}

bool get isFluxerDesktopOs =>
    _isFluxerDesktopClassOs() && !isFluxerRuntimeMobileFormFactor;

bool get isFluxerMobileOs =>
    isFluxerNativeMobileOs || isFluxerRuntimeMobileFormFactor;

bool get isFluxerLinuxMobileVoiceTarget =>
    !kIsWeb && Platform.isLinux && isFluxerRuntimeMobileFormFactor;
