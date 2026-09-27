import 'package:dynamic_app_icon_flutter_plus/dynamic_app_icon_flutter_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/platform/alternate_app_icon_settings.dart';
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
    final String? current =
        await DynamicAppIconFlutterPlus.getAlternateIconName();
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
}
