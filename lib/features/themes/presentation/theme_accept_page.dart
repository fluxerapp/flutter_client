import 'dart:async';

import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/themes/presentation/theme_accept_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class ThemeAcceptPage extends StatefulWidget {
  const ThemeAcceptPage({required this.themeId, super.key});

  final String themeId;

  @override
  State<ThemeAcceptPage> createState() => _ThemeAcceptPageState();
}

class _ThemeAcceptPageState extends State<ThemeAcceptPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_showSheet());
    });
  }

  Future<void> _showSheet() async {
    if (!mounted) {
      return;
    }
    await ThemeAcceptSheet.show(context, themeId: widget.themeId);
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
