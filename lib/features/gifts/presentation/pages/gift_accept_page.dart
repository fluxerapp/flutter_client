import 'dart:async';

import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/gifts/presentation/modals/gift_accept_modal.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class GiftAcceptPage extends StatefulWidget {
  const GiftAcceptPage({required this.code, super.key});

  final String code;

  @override
  State<GiftAcceptPage> createState() => _GiftAcceptPageState();
}

class _GiftAcceptPageState extends State<GiftAcceptPage> {
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
    await showGiftAcceptModal(context, code: extractGiftCode(widget.code));
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
