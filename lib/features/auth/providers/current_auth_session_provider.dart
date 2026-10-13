import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_auth_session_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentAuthSessionIdHash extends _$CurrentAuthSessionIdHash {
  @override
  String? build() {
    ref.listen(fluxerAuthTokenProvider, (previous, next) {
      if (previous != next) {
        state = null;
      }
    });
    return null;
  }

  void update(String? idHash) {
    if (state == idHash) {
      return;
    }
    state = idHash;
  }
}
