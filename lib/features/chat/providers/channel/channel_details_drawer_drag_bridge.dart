import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/material_ui.dart';

abstract class ChannelDetailsDrawerPhysicsHost {
  void bindInteractiveSession({
    required Channel? channel,
    required DmConversation? dm,
  });

  void onDragStart();

  void onDragUpdate(double delta);

  Future<void> onDragEnd(DragEndDetails details);
}

class ChannelDetailsDrawerDragBridge {
  ChannelDetailsDrawerPhysicsHost? _host;

  // attach keeps a symmetric API with detach
  // ignore: use_setters_to_change_properties
  void attach(ChannelDetailsDrawerPhysicsHost host) {
    _host = host;
  }

  void detach(ChannelDetailsDrawerPhysicsHost host) {
    if (_host == host) {
      _host = null;
    }
  }

  void bindInteractiveSession({
    required Channel? channel,
    required DmConversation? dm,
  }) {
    _host?.bindInteractiveSession(channel: channel, dm: dm);
  }

  void onDragStart() {
    _host?.onDragStart();
  }

  void onDragUpdate(double delta) {
    _host?.onDragUpdate(delta);
  }

  Future<void> onDragEnd(DragEndDetails details) async {
    await _host?.onDragEnd(details);
  }
}

final channelDetailsDrawerDragBridgeProvider =
    Provider<ChannelDetailsDrawerDragBridge>(
      (Ref ref) => ChannelDetailsDrawerDragBridge(),
    );
