import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';

class CategoryChannelRouteHandler extends ConsumerStatefulWidget {
  const CategoryChannelRouteHandler({
    required this.guildId,
    required this.channel,
    required this.child,
    super.key,
  });

  final String guildId;
  final Channel channel;
  final Widget child;

  @override
  ConsumerState<CategoryChannelRouteHandler> createState() =>
      _CategoryChannelRouteHandlerState();
}

class _CategoryChannelRouteHandlerState
    extends ConsumerState<CategoryChannelRouteHandler> {
  bool _handled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_handleCategoryChannelRoute());
    });
  }

  @override
  void didUpdateWidget(covariant CategoryChannelRouteHandler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channel.id != widget.channel.id) {
      _handled = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_handleCategoryChannelRoute());
      });
    }
  }

  Future<void> _handleCategoryChannelRoute() async {
    if (_handled || widget.channel.type != ChannelType.guildCategory) {
      return;
    }
    _handled = true;
    if (!mounted) {
      return;
    }
    navigateToContent(context, RoutePaths.guild(widget.guildId));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
