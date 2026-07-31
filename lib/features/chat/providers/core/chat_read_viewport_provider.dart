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
    this.viewportHeight = 0,
    this.foreground = false,
    this.sampledTailId,
  });

  final String channelId;
  final bool viewportActive;
  final bool nearLoadedTail;
  final double distanceFromBottom;
  final double viewportHeight;
  final bool foreground;

  /// The newest server-backed message id the published geometry was measured
  /// against. When the tail advances before the next publication, this token
  /// mismatches and auto-ack eligibility drops until post-layout geometry
  /// republishes. Exact equality; null matches only an empty live window.
  final String? sampledTailId;

  bool get canAutoAck => viewportActive && foreground;

  @override
  bool operator ==(Object other) =>
      other is ChatReadViewportState &&
      other.channelId == channelId &&
      other.viewportActive == viewportActive &&
      other.nearLoadedTail == nearLoadedTail &&
      other.distanceFromBottom == distanceFromBottom &&
      other.viewportHeight == viewportHeight &&
      other.foreground == foreground &&
      other.sampledTailId == sampledTailId;

  @override
  int get hashCode => Object.hash(
    channelId,
    viewportActive,
    nearLoadedTail,
    distanceFromBottom,
    viewportHeight,
    foreground,
    sampledTailId,
  );
}

@Riverpod(keepAlive: true)
class ChatReadViewport extends _$ChatReadViewport {
  String _channelId = '';
  String? _visibleChannelId;
  bool _nearLoadedTail = false;
  double _distanceFromBottom = 0;
  double _viewportHeight = 0;
  String? _sampledTailId;

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
        _sampledTailId = null;
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
    required String? sampledTailId,
  }) {
    // Deferred like the mutators above: the widget publishes from
    // ScrollMetricsNotification handlers that run during layout, and the
    // state write in _emit must never land mid-build.
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
            _viewportHeight == viewportHeight &&
            _sampledTailId == sampledTailId) {
          return;
        }
        _nearLoadedTail = nearLoadedTail;
        _distanceFromBottom = quantizedDistance;
        _viewportHeight = viewportHeight;
        _sampledTailId = sampledTailId;
        _emit();
      }),
    );
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
        sampledTailId: _sampledTailId,
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

/// [currentTailId] is the live window's newest server-backed id. A near-tail
/// claim authorizes an ack only for the tail it was measured against
/// ([ChatReadViewportState.sampledTailId], exact equality; null matches only
/// an empty window) - a stale claim must not ack rows the user never saw.
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
