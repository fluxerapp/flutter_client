import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class AccountIdentitySync extends ConsumerStatefulWidget {
  const AccountIdentitySync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AccountIdentitySync> createState() =>
      _AccountIdentitySyncState();
}

class _AccountIdentitySyncState extends ConsumerState<AccountIdentitySync> {
  @override
  void initState() {
    super.initState();
    ref.listenManual<InstanceRuntimeConfig>(
      instanceRuntimeConfigProvider,
      (_, InstanceRuntimeConfig next) => scheduleMicrotask(() {
        if (mounted) {
          ref.read(accountIdentityProvider.notifier).sync(next);
        }
      }),
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
