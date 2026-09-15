import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/android_animator_duration_scale.dart';
import 'package:fluxer_app/features/accessibility/domain/motion_preferences.dart';
import 'package:fluxer_app/features/accessibility/domain/resolve_reduced_motion.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;

final androidAnimatorDurationDisabledProvider = StreamProvider<bool>((ref) {
  return watchAndroidAnimatorDurationDisabled();
});

bool platformReducedMotionOf(WidgetRef ref, BuildContext context) {
  return resolvePlatformReducedMotion(
    disableAnimations: MediaQuery.disableAnimationsOf(context),
    androidAnimatorDurationDisabled:
        ref.watch(androidAnimatorDurationDisabledProvider).value ?? false,
    useAndroidAnimatorDuration: androidAnimatorDurationScaleSupported,
  );
}

typedef MotionAppearanceSlice = ({
  bool syncWithSystem,
  bool manualReducedMotion,
  bool mobileAnimateEmojiOverridden,
  bool mobileAnimateEmojiValue,
  bool mobileGifAutoPlayOverridden,
  bool mobileGifAutoPlayValue,
  bool mobileStickerAnimationOverridden,
  StickerAnimationOptions mobileStickerAnimationValue,
  bool keepAnimatedEmojiUnderReducedMotion,
  bool keepGifAutoPlayUnderReducedMotion,
  bool keepStickerAnimationUnderReducedMotion,
});

typedef MotionUserSettingsSlice = ({
  bool animateEmoji,
  bool gifAutoPlay,
  StickerAnimationOptions animateStickers,
});

MotionAppearanceSlice motionAppearanceSlice(AppearancePreferencesState state) {
  return (
    syncWithSystem: state.syncReducedMotionWithSystem,
    manualReducedMotion: state.reducedMotionOverride,
    mobileAnimateEmojiOverridden: state.mobileAnimateEmojiOverridden,
    mobileAnimateEmojiValue: state.mobileAnimateEmojiValue,
    mobileGifAutoPlayOverridden: state.mobileGifAutoplayOverridden,
    mobileGifAutoPlayValue: state.mobileGifAutoplayValue,
    mobileStickerAnimationOverridden: state.mobileStickerAnimationOverridden,
    mobileStickerAnimationValue: state.mobileStickerAnimationValue,
    keepAnimatedEmojiUnderReducedMotion:
        state.keepAnimatedEmojiUnderReducedMotion,
    keepGifAutoPlayUnderReducedMotion: state.keepGifAutoPlayUnderReducedMotion,
    keepStickerAnimationUnderReducedMotion:
        state.keepStickerAnimationUnderReducedMotion,
  );
}

MotionUserSettingsSlice motionUserSettingsSlice(UserSettingsViewState state) {
  return (
    animateEmoji: state.animateEmoji,
    gifAutoPlay: state.gifAutoPlay,
    animateStickers: state.animateStickers,
  );
}

MotionPreferencesInput motionPreferencesInputFromSlices({
  required MotionAppearanceSlice appearance,
  required MotionUserSettingsSlice userSettings,
  required bool systemReducedMotion,
  required bool isMobile,
}) {
  return MotionPreferencesInput(
    syncWithSystem: appearance.syncWithSystem,
    manualReducedMotion: appearance.manualReducedMotion,
    systemReducedMotion: systemReducedMotion,
    isMobile: isMobile,
    animateEmoji: userSettings.animateEmoji,
    gifAutoPlay: userSettings.gifAutoPlay,
    animateStickers: userSettings.animateStickers,
    mobileAnimateEmojiOverridden: appearance.mobileAnimateEmojiOverridden,
    mobileAnimateEmojiValue: appearance.mobileAnimateEmojiValue,
    mobileGifAutoPlayOverridden: appearance.mobileGifAutoPlayOverridden,
    mobileGifAutoPlayValue: appearance.mobileGifAutoPlayValue,
    mobileStickerAnimationOverridden:
        appearance.mobileStickerAnimationOverridden,
    mobileStickerAnimationValue: appearance.mobileStickerAnimationValue,
    keepAnimatedEmojiUnderReducedMotion:
        appearance.keepAnimatedEmojiUnderReducedMotion,
    keepGifAutoPlayUnderReducedMotion:
        appearance.keepGifAutoPlayUnderReducedMotion,
    keepStickerAnimationUnderReducedMotion:
        appearance.keepStickerAnimationUnderReducedMotion,
  );
}

MotionPreferencesModel effectiveMotionOf(WidgetRef ref, BuildContext context) {
  final MotionAppearanceSlice appearance = ref.watch(
    appearancePreferencesProvider.select(motionAppearanceSlice),
  );
  final MotionUserSettingsSlice userSettings = ref.watch(
    userSettingsViewModelProvider.select(motionUserSettingsSlice),
  );
  return resolveMotionPreferencesModel(
    motionPreferencesInputFromSlices(
      appearance: appearance,
      userSettings: userSettings,
      systemReducedMotion: platformReducedMotionOf(ref, context),
      isMobile: isMobileLayout(context),
    ),
  );
}
