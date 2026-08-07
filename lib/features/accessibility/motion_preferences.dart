import 'package:fluxer_app/features/accessibility/resolve_reduced_motion.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;

const bool kDefaultMobileGifAutoPlay = true;
const StickerAnimationOptions kDefaultMobileStickerAnimation =
    StickerAnimationOptions.animateOnInteraction;

class MotionPreferencesInput {
  const MotionPreferencesInput({
    this.syncWithSystem = true,
    this.manualReducedMotion = false,
    this.systemReducedMotion = false,
    this.isMobile = false,
    this.animateEmoji = true,
    this.gifAutoPlay = true,
    this.animateStickers = StickerAnimationOptions.alwaysAnimate,
    this.mobileAnimateEmojiOverridden = false,
    this.mobileAnimateEmojiValue = true,
    this.mobileGifAutoPlayOverridden = false,
    this.mobileGifAutoPlayValue = kDefaultMobileGifAutoPlay,
    this.mobileStickerAnimationOverridden = false,
    this.mobileStickerAnimationValue = kDefaultMobileStickerAnimation,
    this.keepAnimatedEmojiUnderReducedMotion = false,
    this.keepGifAutoPlayUnderReducedMotion = false,
    this.keepStickerAnimationUnderReducedMotion = false,
  });

  final bool syncWithSystem;
  final bool manualReducedMotion;
  final bool systemReducedMotion;
  final bool isMobile;
  final bool animateEmoji;
  final bool gifAutoPlay;
  final StickerAnimationOptions animateStickers;
  final bool mobileAnimateEmojiOverridden;
  final bool mobileAnimateEmojiValue;
  final bool mobileGifAutoPlayOverridden;
  final bool mobileGifAutoPlayValue;
  final bool mobileStickerAnimationOverridden;
  final StickerAnimationOptions mobileStickerAnimationValue;
  final bool keepAnimatedEmojiUnderReducedMotion;
  final bool keepGifAutoPlayUnderReducedMotion;
  final bool keepStickerAnimationUnderReducedMotion;
}

class MotionPreferencesModel {
  const MotionPreferencesModel({
    required this.reducedMotion,
    required this.effectiveAnimateEmoji,
    required this.effectiveGifAutoPlay,
    required this.effectiveAnimateStickers,
    required this.emojiOverridesReducedMotion,
    required this.gifOverridesReducedMotion,
    required this.stickerOverridesReducedMotion,
  });

  final bool reducedMotion;
  final bool effectiveAnimateEmoji;
  final bool effectiveGifAutoPlay;
  final StickerAnimationOptions effectiveAnimateStickers;
  final bool emojiOverridesReducedMotion;
  final bool gifOverridesReducedMotion;
  final bool stickerOverridesReducedMotion;
}

class MotionPreferencesWrite {
  const MotionPreferencesWrite({
    this.animateEmoji,
    this.gifAutoPlay,
    this.animateStickers,
    this.mobileAnimateEmojiOverridden,
    this.mobileAnimateEmojiValue,
    this.mobileGifAutoPlayOverridden,
    this.mobileGifAutoPlayValue,
    this.mobileStickerAnimationOverridden,
    this.mobileStickerAnimationValue,
    this.keepAnimatedEmojiUnderReducedMotion,
    this.keepGifAutoPlayUnderReducedMotion,
    this.keepStickerAnimationUnderReducedMotion,
  });

  final bool? animateEmoji;
  final bool? gifAutoPlay;
  final StickerAnimationOptions? animateStickers;
  final bool? mobileAnimateEmojiOverridden;
  final bool? mobileAnimateEmojiValue;
  final bool? mobileGifAutoPlayOverridden;
  final bool? mobileGifAutoPlayValue;
  final bool? mobileStickerAnimationOverridden;
  final StickerAnimationOptions? mobileStickerAnimationValue;
  final bool? keepAnimatedEmojiUnderReducedMotion;
  final bool? keepGifAutoPlayUnderReducedMotion;
  final bool? keepStickerAnimationUnderReducedMotion;
}

bool selectReducedMotionActive(MotionPreferencesInput input) {
  return resolveReducedMotion(
    syncReducedMotionWithSystem: input.syncWithSystem,
    reducedMotionOverride: input.manualReducedMotion,
    platformReducedMotion: input.systemReducedMotion,
  );
}

bool selectBaseAnimateEmoji(MotionPreferencesInput input) {
  if (input.isMobile && input.mobileAnimateEmojiOverridden) {
    return input.mobileAnimateEmojiValue;
  }
  return input.animateEmoji;
}

bool selectBaseGifAutoPlay(MotionPreferencesInput input) {
  if (input.isMobile) {
    return input.mobileGifAutoPlayOverridden
        ? input.mobileGifAutoPlayValue
        : kDefaultMobileGifAutoPlay;
  }
  return input.gifAutoPlay;
}

StickerAnimationOptions selectBaseAnimateStickers(
  MotionPreferencesInput input,
) {
  if (input.isMobile) {
    return input.mobileStickerAnimationOverridden
        ? input.mobileStickerAnimationValue
        : kDefaultMobileStickerAnimation;
  }
  return input.animateStickers;
}

StickerAnimationOptions _downgradeStickerForReducedMotion(
  StickerAnimationOptions value,
) {
  return value == StickerAnimationOptions.alwaysAnimate
      ? StickerAnimationOptions.animateOnInteraction
      : value;
}

MotionPreferencesModel resolveMotionPreferencesModel(
  MotionPreferencesInput input,
) {
  final bool reducedMotion = selectReducedMotionActive(input);
  final bool baseEmoji = selectBaseAnimateEmoji(input);
  final bool baseGif = selectBaseGifAutoPlay(input);
  final StickerAnimationOptions baseStickers = selectBaseAnimateStickers(input);

  final bool effectiveEmoji = !reducedMotion
      ? baseEmoji
      : input.keepAnimatedEmojiUnderReducedMotion && baseEmoji;
  final bool effectiveGif = !reducedMotion
      ? baseGif
      : input.keepGifAutoPlayUnderReducedMotion && baseGif;
  final StickerAnimationOptions effectiveStickers = !reducedMotion
      ? baseStickers
      : (input.keepStickerAnimationUnderReducedMotion
            ? baseStickers
            : _downgradeStickerForReducedMotion(baseStickers));

  return MotionPreferencesModel(
    reducedMotion: reducedMotion,
    effectiveAnimateEmoji: effectiveEmoji,
    effectiveGifAutoPlay: effectiveGif,
    effectiveAnimateStickers: effectiveStickers,
    emojiOverridesReducedMotion:
        reducedMotion && input.keepAnimatedEmojiUnderReducedMotion && baseEmoji,
    gifOverridesReducedMotion:
        reducedMotion && input.keepGifAutoPlayUnderReducedMotion && baseGif,
    stickerOverridesReducedMotion:
        reducedMotion &&
        input.keepStickerAnimationUnderReducedMotion &&
        baseStickers == StickerAnimationOptions.alwaysAnimate,
  );
}

MotionPreferencesWrite resolveAnimateEmojiRequest({
  required MotionPreferencesInput input,
  required bool value,
}) {
  if (!selectReducedMotionActive(input)) {
    return input.isMobile
        ? MotionPreferencesWrite(
            mobileAnimateEmojiOverridden: true,
            mobileAnimateEmojiValue: value,
          )
        : MotionPreferencesWrite(animateEmoji: value);
  }
  if (value) {
    return input.isMobile
        ? const MotionPreferencesWrite(
            mobileAnimateEmojiOverridden: true,
            mobileAnimateEmojiValue: true,
            keepAnimatedEmojiUnderReducedMotion: true,
          )
        : const MotionPreferencesWrite(
            animateEmoji: true,
            keepAnimatedEmojiUnderReducedMotion: true,
          );
  }
  return const MotionPreferencesWrite(
    keepAnimatedEmojiUnderReducedMotion: false,
  );
}

MotionPreferencesWrite resolveGifAutoPlayRequest({
  required MotionPreferencesInput input,
  required bool value,
}) {
  if (!selectReducedMotionActive(input)) {
    return input.isMobile
        ? MotionPreferencesWrite(
            mobileGifAutoPlayOverridden: true,
            mobileGifAutoPlayValue: value,
          )
        : MotionPreferencesWrite(gifAutoPlay: value);
  }
  if (value) {
    return input.isMobile
        ? const MotionPreferencesWrite(
            mobileGifAutoPlayOverridden: true,
            mobileGifAutoPlayValue: true,
            keepGifAutoPlayUnderReducedMotion: true,
          )
        : const MotionPreferencesWrite(
            gifAutoPlay: true,
            keepGifAutoPlayUnderReducedMotion: true,
          );
  }
  return const MotionPreferencesWrite(keepGifAutoPlayUnderReducedMotion: false);
}

MotionPreferencesWrite resolveAnimateStickersRequest({
  required MotionPreferencesInput input,
  required StickerAnimationOptions value,
}) {
  if (!selectReducedMotionActive(input)) {
    return input.isMobile
        ? MotionPreferencesWrite(
            mobileStickerAnimationOverridden: true,
            mobileStickerAnimationValue: value,
          )
        : MotionPreferencesWrite(animateStickers: value);
  }
  if (value == StickerAnimationOptions.alwaysAnimate) {
    return input.isMobile
        ? MotionPreferencesWrite(
            mobileStickerAnimationOverridden: true,
            mobileStickerAnimationValue: value,
            keepStickerAnimationUnderReducedMotion: true,
          )
        : MotionPreferencesWrite(
            animateStickers: value,
            keepStickerAnimationUnderReducedMotion: true,
          );
  }
  return input.isMobile
      ? MotionPreferencesWrite(
          mobileStickerAnimationOverridden: true,
          mobileStickerAnimationValue: value,
          keepStickerAnimationUnderReducedMotion: false,
        )
      : MotionPreferencesWrite(
          animateStickers: value,
          keepStickerAnimationUnderReducedMotion: false,
        );
}
