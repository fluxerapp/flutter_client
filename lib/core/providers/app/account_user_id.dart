import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

String? accountUserIdTestFallback;

String watchAccountUserId(Object ref) {
  final String? userId = accountUserIdOrNull(ref, watch: true);
  if (userId == null) {
    throw StateError('No active account user id');
  }
  return userId;
}

String readAccountUserId(Object ref) {
  final String? userId = accountUserIdOrNull(ref);
  if (userId == null) {
    throw StateError('No active account user id');
  }
  return userId;
}

String? accountUserIdOrNull(Object ref, {bool watch = false}) {
  final String? userId = _readCurrentUserId(ref, watch: watch);
  if (userId != null && userId.isNotEmpty) {
    return userId;
  }
  if (kReleaseMode) {
    return null;
  }
  return accountUserIdTestFallback;
}

String? _readCurrentUserId(Object ref, {required bool watch}) {
  if (ref is ProviderContainer) {
    return ref.read(currentUserIdProvider);
  }
  if (ref is WidgetRef) {
    return watch
        ? ref.watch(currentUserIdProvider)
        : ref.read(currentUserIdProvider);
  }
  if (ref is Ref) {
    return watch
        ? ref.watch(currentUserIdProvider)
        : ref.read(currentUserIdProvider);
  }
  throw ArgumentError('Unsupported ref type: ${ref.runtimeType}');
}
