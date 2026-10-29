import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_private_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserPrivateRead extends _$CurrentUserPrivateRead {
  int _epoch = 0;

  @override
  UserPrivateResponse? build() {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (next == null) {
        _epoch++;
        state = null;
        return;
      }
      if (previous != null && previous != next) {
        unawaited(refresh());
      }
    });
    return null;
  }

  void apply(UserPrivateResponse user) {
    _epoch++;
    state = user;
  }

  Future<void> refresh() async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      _epoch++;
      state = null;
      return;
    }
    final int epoch = ++_epoch;
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      final UserPrivateResponse user = await client.users.getCurrentUser();
      if (!ref.mounted || epoch != _epoch) {
        return;
      }
      state = user;
    } on Object {
      // Keep the last known profile when refresh fails.
    }
  }
}
