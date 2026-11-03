import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

String watchAccountUserId(Object ref) {
  final String? userId = _readCurrentUserId(ref, watch: true);
  if (userId == null || userId.isEmpty) {
    throw StateError('No active account user id');
  }
  return userId;
}

String readAccountUserId(Object ref) {
  final String? userId = _readCurrentUserId(ref, watch: false);
  if (userId == null || userId.isEmpty) {
    throw StateError('No active account user id');
  }
  return userId;
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
