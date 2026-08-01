import 'package:drift/drift.dart';

class UserPreferencesTable extends Table {
  TextColumn get userId => text()();
  TextColumn get theme => text().withDefault(const Constant('dark'))();
  RealColumn get scaleFactor => real().withDefault(const Constant(1))();
  BoolColumn get plutoniumUpsellDismissed =>
      boolean().withDefault(const Constant(false))();
  TextColumn get emojiSkinTone => text().withDefault(const Constant(''))();
  IntColumn get chatFontSize => integer().withDefault(const Constant(16))();
  BoolColumn get syncAcrossDevices =>
      boolean().withDefault(const Constant(true))();
  TextColumn get channelTypingIndicatorMode =>
      text().withDefault(const Constant('avatars'))();
  BoolColumn get showSelectedChannelTypingIndicator =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get collapseDMs => boolean().withDefault(const Constant(false))();
  BoolColumn get showFadedUnreadOnMutedChannels =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showActiveNow => boolean().withDefault(const Constant(true))();
  BoolColumn get showFavorites => boolean().withDefault(const Constant(true))();
  BoolColumn get showNeko => boolean().withDefault(const Constant(false))();
  BoolColumn get hideKeyboardHints =>
      boolean().withDefault(const Constant(false))();
  RealColumn get messageGroupSpacing =>
      real().withDefault(const Constant(16))();
  RealColumn get compactMessageGroupSpacing =>
      real().withDefault(const Constant(0))();
  TextColumn get embedMediaDimensionSize =>
      text().withDefault(const Constant('small'))();
  TextColumn get attachmentMediaDimensionSize =>
      text().withDefault(const Constant('large'))();
  BoolColumn get autoSendKlipyGifs =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showDefaultEmojisInExpressionAutocomplete =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showCustomEmojisInExpressionAutocomplete =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showStickersInExpressionAutocomplete =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMemesInExpressionAutocomplete =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get preserveEditDraft =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get sanitizeUrls => boolean().withDefault(const Constant(true))();
  BoolColumn get showMediaDeleteButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMediaDownloadButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMediaFavoriteButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showSuppressEmbedsButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get enableTextSelection =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get showVideoSeekPreviewThumbnails =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get voiceChannelJoinRequiresDoubleClick =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get confirmBeforeJoiningVoiceChannels =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get showGifIndicator =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showAttachmentExpiryIndicator =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMessageActionBar =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMessageActionBarQuickReactions =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMessageActionBarShiftExpand =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMessageActionBarOnlyMoreButton =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get showGifButton => boolean().withDefault(const Constant(true))();
  BoolColumn get showMemesButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showStickersButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showEmojiButton =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get showMessageSendButton =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get scrollToBottomOnMessageSend =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get sequentialFileSend =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get skipMarkAllAsReadConfirmation =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get preuploadMessageAttachments =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get disableStreamPreviews =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get saveGifFavoritesAsSavedMedia =>
      boolean().withDefault(const Constant(false))();
  TextColumn get searchEnginesJson => text().withDefault(const Constant(''))();
  TextColumn get favoriteEmojiKeysJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get favoriteStickerKeysJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get collapsedEmojiPickerCategoriesJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get collapsedStickerPickerCategoriesJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get matureContentAgreedChannelIdsJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get matureContentAgreedCategoryIdsJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get matureContentAgreedGuildIdsJson =>
      text().withDefault(const Constant('[]'))();
  TextColumn get voiceSettingsJson => text().withDefault(const Constant(''))();
  RealColumn get saturationFactor => real().withDefault(const Constant(1))();
  TextColumn get customThemeCss => text().withDefault(const Constant(''))();

  @override
  String get tableName => 'user_preferences';

  @override
  Set<Column> get primaryKey => {userId};
}
