import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/expression_picker_geometry.dart';
import 'package:fluxer_app/material_ui.dart';

final NotifierProvider<ExpressionPickerSizeNotifier, Size>
expressionPickerSizeProvider =
    NotifierProvider<ExpressionPickerSizeNotifier, Size>(
      ExpressionPickerSizeNotifier.new,
    );

class ExpressionPickerSizeNotifier extends Notifier<Size> {
  @override
  Size build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final double? width = store.read(LocalSettingKeys.expressionPickerWidth);
    final double? height = store.read(LocalSettingKeys.expressionPickerHeight);
    if (width == null || height == null || width <= 0 || height <= 0) {
      return kExpressionPickerDefaultSize;
    }
    return Size(width, height);
  }

  void setSize(Size size, {required bool persist}) {
    if (!ref.mounted) {
      return;
    }
    state = size;
    if (!persist) {
      return;
    }
    ref.read(localSettingsStoreProvider)
      ..write(
        LocalSettingKeys.expressionPickerWidth,
        size.width.roundToDouble(),
      )
      ..write(
        LocalSettingKeys.expressionPickerHeight,
        size.height.roundToDouble(),
      );
  }

  void reset() {
    if (!ref.mounted) {
      return;
    }
    state = kExpressionPickerDefaultSize;
    ref.read(localSettingsStoreProvider)
      ..write(LocalSettingKeys.expressionPickerWidth, null)
      ..write(LocalSettingKeys.expressionPickerHeight, null);
  }
}
