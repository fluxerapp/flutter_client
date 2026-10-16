import 'dart:async';

import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';

class GatedRebuildPermissionCache extends ChannelPermissionCache {
  GatedRebuildPermissionCache(this.gate);

  final Completer<void> gate;

  @override
  Future<void> rebuildChannel(String channelId, {bool localOnly = false}) {
    return gate.future;
  }
}
