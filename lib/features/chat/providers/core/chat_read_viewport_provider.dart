import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_read_viewport_provider.g.dart';

@immutable
class ChatReadViewportState {
  const ChatReadViewportState({
    this.channelId = '',
    this.viewportActive = false,
    this.nearLoadedTail = false,
    this.distanceFromBottom = 0,
    this.viewportHeight = 0,
    this.foreground = false,
  });

  final String channelId;
  final bool viewportActive;
  final bool nearLoadedTail;
  final double distanceFromBottom;
  final double viewportHeight;
  final bool foreground;

  bool get canAutoAck => viewportActive && foreground;

  @override
  bool operator ==(Object other) =>
      other is ChatReadViewportState &&
      other.channelId == channelId &&
      other.viewportActive == viewportActive &&
      other.nearLoadedTail == nearLoadedTail &&
      other.distanceFromBottom == distanceFromBottom &&
      other.viewportHeight == viewportHeight &&
      other.foreground == foreground;

  @override
  int get hashCode => Object.hash(
    channelId,
    viewportActive,
    nearLoadedTail,
    distanceFromBottom,
    viewportHeight,
    foreground,
  );
}

@Riverpod(keepAlive: true)
class ChatReadViewport extends _$ChatReadViewport {
  String _channelId = '';
  String? _visibleChannelId;
  bool _nearLoadedTail = false;
  double _distanceFromBottom = 0;
  double _viewportHeight = 0;

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
        _viewportHeight = 0;
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
          // Ignore teardown from a list that no longer owns the viewport.
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
    required double viewportHeight,
  }) {
    if (_channelId != channelId) {
      return;
    }
    if (_nearLoadedTail == nearLoadedTail &&
        _distanceFromBottom == distanceFromBottom &&
        _viewportHeight == viewportHeight) {
      return;
    }
    _nearLoadedTail = nearLoadedTail;
    _distanceFromBottom = distanceFromBottom;
    _viewportHeight = viewportHeight;
    _emit();
  }

  ChatReadViewportState _snapshot({required bool foreground}) =>
      ChatReadViewportState(
        channelId: _channelId,
        viewportActive:
            _channelId.isNotEmpty && _visibleChannelId == _channelId,
        nearLoadedTail: _nearLoadedTail,
        distanceFromBottom: _distanceFromBottom,
        viewportHeight: _viewportHeight,
        foreground: foreground,
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
}) =>
    channelId.isNotEmpty &&
    viewport.channelId == channelId &&
    viewport.nearLoadedTail &&
    !hasMoreNewerMessages &&
    viewport.canAutoAck;
