const int kEmojiPickerOverscanRows = 2;

const int kEmojiPickerPrecacheLimit = 64;
const int kEmojiPickerPrecacheConcurrency = 4;
const int kEmojiPickerScrollAheadCount = 24;
const int kEmojiPickerMaxAnimatedEmojis = 6;

const int kCustomEmojiPickerFetchSize = 48;

const double kEmojiPickerCellSize = 48;
const double kEmojiPickerSectionGap = 12;
const double kEmojiPickerTopPadding = 4;
const double kEmojiPickerHeaderHeight = 26;
const double kEmojiPickerUpsellEstimatedHeight = 72;

const Duration kEmojiPickerScrollSettleDelay = Duration(milliseconds: 120);

double emojiPickerCacheExtent({
  required double rowHeight,
  int overscanRows = kEmojiPickerOverscanRows,
}) => rowHeight * overscanRows;

bool emojiPickerUsesHoverTracking({required bool isMobile}) => !isMobile;

bool emojiPickerShouldBuildUpsell({
  required bool isPremium,
  required bool hasSearchQuery,
  required bool isFirstFrameSettled,
}) => !isPremium && !hasSearchQuery && isFirstFrameSettled;

bool emojiPickerAnimateCustomEmojiInGrid({
  required bool isMobile,
  required bool emojiAnimated,
  required bool isInView,
  required bool scrollSettled,
}) => isMobile && emojiAnimated && isInView && scrollSettled;

bool emojiPickerPrefetchAnimatedUrls({required bool isMobile}) => isMobile;
