import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_unread_review.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_read_viewport_provider.g.dart';

@immutable
class ChatReadViewportState {
  const ChatReadViewportState({
    this.channelId = '',
    this.viewportActive = false,
    this.nearLoadedTail = false,
    this.distanceFromBottom = 0,
    this.foreground = false,
    this.sampledTailId,
    this.followsLiveTail = false,
  });

  final String channelId;
  final bool viewportActive;
  final bool nearLoadedTail;
  final double distanceFromBottom;
  final bool foreground;

  final String? sampledTailId;
  final bool followsLiveTail;

  bool get canAutoAck => viewportActive && foreground;

  @override
  bool operator ==(Object other) =>
      other is ChatReadViewportState &&
      other.channelId == channelId &&
      other.viewportActive == viewportActive &&
      other.nearLoadedTail == nearLoadedTail &&
      other.distanceFromBottom == distanceFromBottom &&
      other.foreground == foreground &&
      other.sampledTailId == sampledTailId &&
      other.followsLiveTail == followsLiveTail;

  @override
  int get hashCode => Object.hash(
    channelId,
    viewportActive,
    nearLoadedTail,
    distanceFromBottom,
    foreground,
    sampledTailId,
    followsLiveTail,
  );
}

@Riverpod(keepAlive: true)
class ChatReadViewport extends _$ChatReadViewport {
  String _channelId = '';
  String? _visibleChannelId;
  bool _nearLoadedTail = false;
  double _distanceFromBottom = 0;
  String? _sampledTailId;
  bool _followsLiveTail = false;

  @override
  ChatReadViewportState build() =>
      _snapshot(foreground: ref.watch(appUiForegroundProvider));

  void setActiveChannel(String channelId) {
    unawaited(
      Future<void>.microtask(() {
        if (_channelId == channelId) {
          return;
        }
        _channelId = channelId;
        _nearLoadedTail = false;
        _distanceFromBottom = 0;
        _sampledTailId = null;
        _followsLiveTail = false;
        _emit();
      }),
    );
  }

  void setViewportActive({required String channelId, required bool isActive}) {
    unawaited(
      Future<void>.microtask(() {
        if (isActive) {
          if (_visibleChannelId == channelId) {
            return;
          }
          _visibleChannelId = channelId;
        } else {
          if (_visibleChannelId != channelId) {
            return;
          }
          _visibleChannelId = null;
        }
        _emit();
      }),
    );
  }

  void updateViewport({
    required String channelId,
    required bool nearLoadedTail,
    required double distanceFromBottom,
    required String? sampledTailId,
    bool followsLiveTail = false,
  }) {
    unawaited(
      Future<void>.microtask(() {
        if (_channelId != channelId) {
          return;
        }
        final double quantizedDistance = quantizeReadViewportDistance(
          distanceFromBottom,
        );
        if (_nearLoadedTail == nearLoadedTail &&
            _distanceFromBottom == quantizedDistance &&
            _sampledTailId == sampledTailId &&
            _followsLiveTail == followsLiveTail) {
          return;
        }
        _nearLoadedTail = nearLoadedTail;
        _distanceFromBottom = quantizedDistance;
        _sampledTailId = sampledTailId;
        _followsLiveTail = followsLiveTail;
        _emit();
      }),
    );
  }

  void followLiveTail({
    required String channelId,
    required String? previousTailId,
    required String nextTailId,
  }) {
    if (_channelId != channelId ||
        !_nearLoadedTail ||
        !_followsLiveTail ||
        _sampledTailId != previousTailId) {
      return;
    }
    _sampledTailId = nextTailId;
    _emit();
  }

  ChatReadViewportState _snapshot({required bool foreground}) =>
      ChatReadViewportState(
        channelId: _channelId,
        viewportActive:
            _channelId.isNotEmpty && _visibleChannelId == _channelId,
        nearLoadedTail: _nearLoadedTail,
        distanceFromBottom: _distanceFromBottom,
        foreground: foreground,
        sampledTailId: _sampledTailId,
        followsLiveTail: _followsLiveTail,
      );

  void _emit() {
    if (!ref.mounted) {
      return;
    }
    final next = _snapshot(foreground: ref.read(appUiForegroundProvider));
    if (next != state) {
      state = next;
    }
  }
}

bool isAutoAckEligible({
  required ChatReadViewportState viewport,
  required String channelId,
  required bool hasMoreNewerMessages,
  required String? currentTailId,
}) =>
    channelId.isNotEmpty &&
    viewport.channelId == channelId &&
    viewport.nearLoadedTail &&
    viewport.sampledTailId == currentTailId &&
    !hasMoreNewerMessages &&
    viewport.canAutoAck;
