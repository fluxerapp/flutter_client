import 'package:dynamic_app_icon_flutter_plus/dynamic_app_icon_flutter_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/platform/alternate_app_icon_settings.dart';
import 'package:fluxer_app/core/platform/android_alternate_app_icon_preference.dart';
import 'package:fluxer_app/core/platform/android_app_restart.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_catalog.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_icon_settings_provider.g.dart';

class AppIconSettingsState {
  const AppIconSettingsState({
    required this.supported,
    required this.choices,
    required this.selectedAlternateName,
  });

  const AppIconSettingsState.unsupported()
    : supported = false,
      choices = const <AppIconChoice>[],
      selectedAlternateName = null;

  final bool supported;
  final List<AppIconChoice> choices;
  final String? selectedAlternateName;

  bool isSelected(AppIconChoice choice) {
    return selectedAlternateName == choice.alternateIconName;
  }

  AppIconChoice? selectedChoice() {
    for (final AppIconChoice choice in choices) {
      if (isSelected(choice)) {
        return choice;
      }
    }
    for (final AppIconChoice choice in choices) {
      if (choice.alternateIconName == null) {
        return choice;
      }
    }
    return choices.isEmpty ? null : choices.first;
  }
}

@riverpod
class AppIconSettings extends _$AppIconSettings {
  @override
  Future<AppIconSettingsState> build() async {
    if (!isAlternateAppIconSettingsAvailable) {
      return const AppIconSettingsState.unsupported();
    }
    final bool platformSupported =
        await DynamicAppIconFlutterPlus.supportsAlternateIcons;
    if (!platformSupported) {
      return const AppIconSettingsState.unsupported();
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      await _reconcileAndroidAlternateAppIcon();
    }
    final String? current =
        await DynamicAppIconFlutterPlus.getAlternateIconName();
    if (defaultTargetPlatform == TargetPlatform.android) {
      await writeAndroidAlternateAppIconPreference(current);
    }
    final List<String> nativeAlternates =
        await DynamicAppIconFlutterPlus.getAvailableIcons();
    final List<AppIconChoice> choices = resolveAppIconChoices(
      nativeAlternates.toSet(),
    );
    return AppIconSettingsState(
      supported: choices.isNotEmpty,
      choices: choices,
      selectedAlternateName: current,
    );
  }

  Future<void> setChoice(AppIconChoice choice) async {
    if (!isAlternateAppIconSettingsAvailable) {
      return;
    }
    final AppIconSettingsState current = await future;
    if (choice.alternateIconName == current.selectedAlternateName) {
      return;
    }
    try {
      await DynamicAppIconFlutterPlus.setAlternateIconName(
        choice.alternateIconName,
      );
    } on PlatformException {
      return;
    }
    ref.invalidateSelf();
    await future;
  }

  Future<void> setChoiceWithRestart(AppIconChoice choice) async {
    if (!isAlternateAppIconSettingsAvailable) {
      return;
    }
    final AppIconSettingsState current = await future;
    if (choice.alternateIconName == current.selectedAlternateName) {
      return;
    }
    await writeAndroidAlternateAppIconPreference(choice.alternateIconName);
    state = AsyncValue.data(
      AppIconSettingsState(
        supported: current.supported,
        choices: current.choices,
        selectedAlternateName: choice.alternateIconName,
      ),
    );
    try {
      await DynamicAppIconFlutterPlus.setAlternateIconName(
        choice.alternateIconName,
      );
      await DynamicAppIconFlutterPlus.applyPendingIcon();
    } on PlatformException {
      await writeAndroidAlternateAppIconPreference(
        current.selectedAlternateName,
      );
      state = AsyncValue.data(current);
      return;
    }
    await restartAndroidApp();
  }

  Future<void> _reconcileAndroidAlternateAppIcon() async {
    final String? saved = await readAndroidAlternateAppIconPreference();
    final String? native =
        await DynamicAppIconFlutterPlus.getAlternateIconName();
    if (saved == native) {
      return;
    }
    try {
      await DynamicAppIconFlutterPlus.setAlternateIconName(saved);
      await DynamicAppIconFlutterPlus.applyPendingIcon();
    } on PlatformException {
      await writeAndroidAlternateAppIconPreference(native);
    }
  }
}
