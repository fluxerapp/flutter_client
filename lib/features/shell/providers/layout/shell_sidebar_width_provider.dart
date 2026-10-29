import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shell_sidebar_width_provider.g.dart';

@Riverpod(keepAlive: true)
class ShellSidebarWidth extends _$ShellSidebarWidth {
  @override
  double? build() {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (next != previous) {
        unawaited(_loadForUser(next));
      }
    }, fireImmediately: true);
    return null;
  }

  Future<void> _loadForUser(String? userId) async {
    if (userId == null) {
      if (!ref.mounted) {
        return;
      }
      state = null;
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? raw = preferences.getString(
      shellSidebarWidthStorageKey(userId),
    );
    final double? parsed = parseStoredShellSidebarWidth(raw);
    if (raw != null && parsed == null) {
      await preferences.remove(shellSidebarWidthStorageKey(userId));
    }
    if (!ref.mounted || ref.read(currentUserIdProvider) != userId) {
      return;
    }
    state = parsed;
  }

  void setWidth(double width, {required bool persist}) {
    if (!ref.mounted) {
      return;
    }
    final double clamped = clampShellSidebarWidth(width);
    state = clamped;
    if (!persist) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    unawaited(_persist(userId, clamped));
  }

  Future<void> reset() async {
    if (!ref.mounted) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    state = null;
    if (userId == null) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(shellSidebarWidthStorageKey(userId));
  }

  Future<void> _persist(String userId, double width) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
      shellSidebarWidthStorageKey(userId),
      width.round().toString(),
    );
  }
}

double watchResolvedShellChannelSidebarWidth(
  WidgetRef ref,
  BuildContext context,
) {
  final FluxerLayoutTheme layout = context.layout;
  final Size windowSize = MediaQuery.sizeOf(context);
  final double? userPreference = ref.watch(shellSidebarWidthProvider);
  return resolveShellSidebarWidth(
    context: context,
    windowSize: windowSize,
    layout: layout,
    userPreference: userPreference,
  );
}
