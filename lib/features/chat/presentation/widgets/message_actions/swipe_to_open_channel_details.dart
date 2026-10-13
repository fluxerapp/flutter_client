import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_drawer_drag_bridge.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';
import 'package:fluxer_app/shared/gestures/directional_horizontal_drag_recognizer.dart';
import 'package:fluxer_app/shared/gestures/nested_horizontal_scrollable.dart';

class SwipeToOpenChannelDetails extends ConsumerStatefulWidget {
  const SwipeToOpenChannelDetails({
    required this.child,
    required this.channel,
    required this.dm,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final Channel? channel;
  final DmConversation? dm;
  final bool enabled;

  @override
  ConsumerState<SwipeToOpenChannelDetails> createState() =>
      _SwipeToOpenChannelDetailsState();
}

class _SwipeToOpenChannelDetailsState
    extends ConsumerState<SwipeToOpenChannelDetails> {
  final GlobalKey _contentKey = GlobalKey();

  bool _shouldDeferToHorizontalScroll(PointerDownEvent event) {
    if (DeferHorizontalDragWhileCoasting.of(context)) {
      return true;
    }
    final BuildContext? searchRoot = _contentKey.currentContext;
    if (searchRoot == null) {
      return false;
    }
    return isPointerOverOverflowingHorizontalScrollable(
      searchRoot,
      event.position,
      viewId: event.viewId,
    );
  }

  void _handleDragStart(DragStartDetails details) {
    ref.read(channelDetailsDrawerDragBridgeProvider)
      ..bindInteractiveSession(channel: widget.channel, dm: widget.dm)
      ..onDragStart();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    ref
        .read(channelDetailsDrawerDragBridgeProvider)
        .onDragUpdate(details.delta.dx);
  }

  void _handleDragEnd(DragEndDetails details) {
    unawaited(
      ref.read(channelDetailsDrawerDragBridgeProvider).onDragEnd(details),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled || !ChatSwipeToReplyScope.enabledOf(context)) {
      return widget.child;
    }
    final double leadingReserve = leadingEdgeHorizontalSwipeReserveWidth(
      context,
    );

    return Stack(
      fit: StackFit.passthrough,
      children: [
        RepaintBoundary(key: _contentKey, child: widget.child),
        PositionedDirectional(
          start: leadingReserve,
          top: 0,
          end: 0,
          bottom: 0,
          child: RawGestureDetector(
            behavior: HitTestBehavior.translucent,
            gestures: <Type, GestureRecognizerFactory>{
              DirectionalHorizontalDragRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    DirectionalHorizontalDragRecognizer
                  >(
                    () => DirectionalHorizontalDragRecognizer(
                      directions: () => const <HorizontalClaimDirection>{
                        HorizontalClaimDirection.left,
                      },
                      shouldDefer: _shouldDeferToHorizontalScroll,
                    ),
                    (recognizer) {
                      recognizer
                        ..onStart = _handleDragStart
                        ..onUpdate = _handleDragUpdate
                        ..onEnd = _handleDragEnd
                        ..onCancel = () => _handleDragEnd(DragEndDetails());
                    },
                  ),
            },
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
