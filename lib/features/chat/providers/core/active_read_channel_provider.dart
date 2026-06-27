import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_read_channel_provider.g.dart';

/// Snapshot of the channel the user is actively reading.
///
/// `canAutoAck` folds together window focus / app foreground and viewport
/// activity; `isAtBottom` mirrors the message list being scrolled to the
/// newest message. The gateway reducer reads [ActiveReadChannel.isAutoAckActive]
/// to suppress unread/mention recording for messages that arrive while the user
/// is looking at the channel — the Flutter equivalent of the web's
/// `NotificationAutoAck` + `ReadStateIncomingMessageMachine` auto-ack path.
@immutable
class ActiveReadChannelState {
  const ActiveReadChannelState({
    this.channelId = '',
    this.isAtBottom = false,
    this.canAutoAck = false,
    this.distanceFromBottom = 0,
    this.viewportHeight = 0,
  });

  final String channelId;
  final bool isAtBottom;
  final bool canAutoAck;
  final double distanceFromBottom;
  final double viewportHeight;

  @override
  bool operator ==(Object other) =>
      other is ActiveReadChannelState &&
      other.channelId == channelId &&
      other.isAtBottom == isAtBottom &&
      other.canAutoAck == canAutoAck &&
      other.distanceFromBottom == distanceFromBottom &&
      other.viewportHeight == viewportHeight;

  @override
  int get hashCode => Object.hash(
    channelId,
    isAtBottom,
    canAutoAck,
    distanceFromBottom,
    viewportHeight,
  );
}

@Riverpod(keepAlive: true)
class ActiveReadChannel extends _$ActiveReadChannel {
  @override
  ActiveReadChannelState build() => const ActiveReadChannelState();

  void update({
    required String channelId,
    required bool isAtBottom,
    required bool canAutoAck,
    required double distanceFromBottom,
    required double viewportHeight,
  }) {
    final next = ActiveReadChannelState(
      channelId: channelId,
      isAtBottom: isAtBottom,
      canAutoAck: canAutoAck,
      distanceFromBottom: distanceFromBottom,
      viewportHeight: viewportHeight,
    );
    if (next != state) {
      state = next;
    }
  }

  void clearChannel(String channelId) {
    if (channelId.isEmpty || state.channelId == channelId) {
      if (state != const ActiveReadChannelState()) {
        state = const ActiveReadChannelState();
      }
    }
  }

  /// True when [channelId] is the actively-read channel, scrolled to the bottom,
  /// with auto-ack eligible (focused/foregrounded). Messages arriving in such a
  /// channel are acked at the source instead of bumping the unread badge.
  bool isAutoAckActive(String channelId) =>
      channelId.isNotEmpty &&
      state.channelId == channelId &&
      state.isAtBottom &&
      state.canAutoAck;
}
