enum SyncedPreferenceField {
  accessibility(1),
  accessibilityOverrides(2),
  textualPreview(3),
  emojiPicker(20),
  stickerPicker(21),
  memesPicker(22),
  emoji(23),
  emojiStickerLayout(24),
  favoriteGifs(25),
  favorites(40),
  recentMentions(41),
  sidebar(42),
  memberList(43),
  unreadChannels(44),
  mentionFrecency(45),
  nagbars(60),
  dismissedUpsells(61),
  guildNsfwAgreements(62),
  whatsNew(63),
  privacy(80),
  localSpamOverrides(81),
  sanitizeUrls(82),
  sound(100),
  spellcheck(101),
  searchEngines(102),
  permissionLayout(103),
  guildMemberLayout(104),
  guildFolders(105),
  hiddenGuildButtons(106),
  keyboardModeIntro(107),
  inputMonitoring(108),
  voicePrompts(109),
  sudoPrompt(110),
  keybinds(111),
  chatInput(112),
  doubleTapReaction(114);

  const SyncedPreferenceField(this.fieldNumber);

  final int fieldNumber;

  static SyncedPreferenceField? fromFieldNumber(int fieldNumber) {
    for (final field in SyncedPreferenceField.values) {
      if (field.fieldNumber == fieldNumber) {
        return field;
      }
    }
    return null;
  }

  static const List<SyncedPreferenceField> all = SyncedPreferenceField.values;
}
