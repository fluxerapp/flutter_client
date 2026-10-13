const int kEmojiPickerOverscanRows = 2;

const int kEmojiPickerPrecacheLimit = 64;
const int kEmojiPickerPrecacheConcurrency = 4;
const int kEmojiPickerScrollAheadCount = 24;

const int kCustomEmojiPickerFetchSize = 48;

const double kEmojiPickerCellSize = 48;
const double kEmojiPickerSectionGap = 12;
const double kEmojiPickerTopPadding = 4;
const double kEmojiPickerHeaderHeight = 26;
const double kEmojiPickerUpsellEstimatedHeight = 72;

const double kEmojiPickerMobileRowHeight = 41;
const double kEmojiPickerMobileHeaderHeight = 30;
const double kEmojiPickerMobileHorizontalPadding = 4.5;
const double kEmojiPickerMobileUnicodeSize = 30;
const double kEmojiPickerMobileCustomSize = 33;

const Duration kEmojiPickerScrollSettleDelay = Duration(milliseconds: 120);

double emojiPickerCacheExtent({
  required double rowHeight,
  int overscanRows = kEmojiPickerOverscanRows,
}) => rowHeight * overscanRows;

int emojiPickerMaxAnimatedEmojis({
  required int columns,
  required double viewportHeight,
  double cellSize = kEmojiPickerCellSize,
}) => columns * ((viewportHeight / cellSize).ceil() + 1);

bool emojiPickerUsesHoverTracking({required bool isMobile}) => !isMobile;

bool emojiPickerShouldBuildUpsell({
  required bool isPremium,
  required bool hasSearchQuery,
  required bool isFirstFrameSettled,
}) => !isPremium && !hasSearchQuery && isFirstFrameSettled;

bool emojiPickerPrefetchAnimatedUrls({required bool isMobile}) => isMobile;
