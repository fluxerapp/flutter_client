import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/link_channel_navigator.dart';
import 'package:fluxer_app/material_ui.dart';

class LinkChannelRouteHandler extends ConsumerStatefulWidget {
  const LinkChannelRouteHandler({
    required this.guildId,
    required this.channel,
    required this.child,
    super.key,
  });

  final String guildId;
  final Channel channel;
  final Widget child;

  @override
  ConsumerState<LinkChannelRouteHandler> createState() =>
      _LinkChannelRouteHandlerState();
}

class _LinkChannelRouteHandlerState
    extends ConsumerState<LinkChannelRouteHandler> {
  bool _handled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_handleLinkChannelRoute());
    });
  }

  @override
  void didUpdateWidget(covariant LinkChannelRouteHandler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channel.id != widget.channel.id) {
      _handled = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_handleLinkChannelRoute());
      });
    }
  }

  Future<void> _handleLinkChannelRoute() async {
    if (_handled || widget.channel.type != ChannelType.guildLink) {
      return;
    }
    _handled = true;
    if (!mounted) {
      return;
    }
    final bool opened = await tryOpenLinkChannel(
      context: context,
      container: ProviderScope.containerOf(context),
      channel: widget.channel,
      skipGate: true,
    );
    if (!mounted || !opened) {
      return;
    }
    navigateToContent(context, RoutePaths.guild(widget.guildId));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
