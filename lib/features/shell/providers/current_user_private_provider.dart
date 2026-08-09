import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_private_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserPrivateRead extends _$CurrentUserPrivateRead {
  @override
  UserPrivateResponse? build() {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (next == null) {
        state = null;
        return;
      }
      if (previous != null && previous != next) {
        unawaited(refresh());
      }
    });
    return null;
  }

  void applyStartupUser(UserPrivateResponse user) {
    state = user;
  }

  Future<void> refresh() async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      state = null;
      return;
    }
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      state = await client.users.getCurrentUser();
    } on Object {
      // Keep the last known profile when refresh fails.
    }
  }
}
