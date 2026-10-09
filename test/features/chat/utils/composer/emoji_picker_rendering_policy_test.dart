import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/emoji_picker_rendering_policy.dart';

void main() {
  test('uses tight overscan to limit concurrent emoji decode pressure', () {
    expect(kEmojiPickerOverscanRows, 2);
    expect(emojiPickerCacheExtent(rowHeight: 48), 96);
    expect(kCustomEmojiPickerFetchSize, 48);
  });

  test(
    'animation budget covers every cell the viewport can show, fixes #704',
    () {
      expect(emojiPickerMaxAnimatedEmojis(columns: 8, viewportHeight: 480), 88);
      expect(emojiPickerMaxAnimatedEmojis(columns: 8, viewportHeight: 500), 96);
    },
  );

  test('does not track hover state on mobile', () {
    expect(emojiPickerUsesHoverTracking(isMobile: true), isFalse);
    expect(emojiPickerUsesHoverTracking(isMobile: false), isTrue);
  });

  test('prefetches animated emoji urls on mobile only', () {
    expect(emojiPickerPrefetchAnimatedUrls(isMobile: true), isTrue);
    expect(emojiPickerPrefetchAnimatedUrls(isMobile: false), isFalse);
  });

  test('defers premium upsell work until after the first frame', () {
    expect(
      emojiPickerShouldBuildUpsell(
        isPremium: false,
        hasSearchQuery: false,
        isFirstFrameSettled: false,
      ),
      isFalse,
    );
    expect(
      emojiPickerShouldBuildUpsell(
        isPremium: false,
        hasSearchQuery: false,
        isFirstFrameSettled: true,
      ),
      isTrue,
    );
    expect(
      emojiPickerShouldBuildUpsell(
        isPremium: true,
        hasSearchQuery: false,
        isFirstFrameSettled: true,
      ),
      isFalse,
    );
    expect(
      emojiPickerShouldBuildUpsell(
        isPremium: false,
        hasSearchQuery: true,
        isFirstFrameSettled: true,
      ),
      isFalse,
    );
  });
}
