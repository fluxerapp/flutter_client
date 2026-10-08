import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance_runtime_config_provider.g.dart';

@Riverpod(keepAlive: true)
InstanceRuntimeConfig instanceRuntimeConfig(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.maybeWhen(
    data: InstanceRuntimeConfig.fromWellKnown,
    orElse: () => InstanceRuntimeConfig.fromWellKnown(
      ref.watch(activeInstanceProvider).wellKnown,
    ),
  );
}

typedef AccountIdentityFlags = ({bool usernameSignIn, bool uniqueUsernames});

@Riverpod(keepAlive: true)
class AccountIdentity extends _$AccountIdentity {
  @override
  AccountIdentityFlags build() {
    return (usernameSignIn: false, uniqueUsernames: false);
  }

  void sync(InstanceRuntimeConfig config) {
    final AccountIdentityFlags next = (
      usernameSignIn: config.usernameSignIn,
      uniqueUsernames: config.uniqueUsernames,
    );
    if (next != state) {
      state = next;
    }
  }
}

@Riverpod(keepAlive: true)
bool uniqueUsernames(Ref ref) {
  return ref.watch(accountIdentityProvider).uniqueUsernames;
}
