import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_auth_session_provider.g.dart';

/// Holds the id hash of the session currently making requests on this
/// client. Populated from the gateway `READY` event
/// (`auth_session_id_hash`) and updated by `AUTH_SESSION_CHANGE` when the
/// token rotates. Null until the first READY is received.
///
/// This is the single source of truth for identifying the current session —
/// the REST `AuthSessionResponse.current` flag is unreliable and is not
/// used as a fallback. If READY fails to deliver the hash, that is a
/// server-side bug and should be fixed there, not papered over in the UI.
///
/// Resets to null whenever the auth token changes so a stale hash from the
/// previous account cannot be matched against the new account's sessions
/// during the window between token swap and the next gateway `READY`.
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

  // ignore: use_setters_to_change_properties -- notifier method convention
  void update(String? idHash) => state = idHash;
}
