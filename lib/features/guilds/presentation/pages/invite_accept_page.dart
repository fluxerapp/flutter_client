import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/invite_accept_modal.dart';
import 'package:go_router/go_router.dart';

class InviteAcceptPage extends StatefulWidget {
  const InviteAcceptPage({required this.code, super.key});

  final String code;

  @override
  State<InviteAcceptPage> createState() => _InviteAcceptPageState();
}

class _InviteAcceptPageState extends State<InviteAcceptPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_showModal());
    });
  }

  Future<void> _showModal() async {
    if (!mounted) {
      return;
    }
    await showInviteAcceptModal(context, code: widget.code);
    if (!mounted) {
      return;
    }
    context.go(RoutePaths.me);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
