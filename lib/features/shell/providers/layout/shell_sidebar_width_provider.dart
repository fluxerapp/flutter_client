import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_sidebar_width_provider.g.dart';

@Riverpod(keepAlive: true)
class ShellSidebarWidth extends _$ShellSidebarWidth {
  @override
  double? build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return null;
    }
    final double? stored = store.readAccount(
      LocalSettingKeys.shellSidebarWidth,
      userId: userId,
    );
    return stored == null ? null : clampShellSidebarWidth(stored);
  }

  void setWidth(double width, {required bool persist}) {
    if (!ref.mounted) {
      return;
    }
    final double clamped = clampShellSidebarWidth(width);
    state = clamped;
    final String? userId = ref.read(currentUserIdProvider);
    if (!persist || userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .writeAccount(
          LocalSettingKeys.shellSidebarWidth,
          clamped.roundToDouble(),
          userId: userId,
        );
  }

  Future<void> reset() async {
    if (!ref.mounted) {
      return;
    }
    state = null;
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .removeAccount(LocalSettingKeys.shellSidebarWidth, userId: userId);
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
    desktop: usesDesktopPointerUi(context),
  );
}
