// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/preferences.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'accessibility.pb.dart' as $0;
import 'pickers.pb.dart' as $1;
import 'preferences.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'preferences.pbenum.dart';

class SyncedPreferences extends $pb.GeneratedMessage {
  factory SyncedPreferences({
    $0.AccessibilitySettings? accessibility,
    $0.AccessibilityOverrides? accessibilityOverrides,
    TextualPreviewSettings? textualPreview,
    $1.EmojiPickerState? emojiPicker,
    $1.StickerPickerState? stickerPicker,
    $1.MemesPickerState? memesPicker,
    $1.EmojiState? emoji,
    $1.EmojiStickerLayoutSettings? emojiStickerLayout,
    $1.FavoriteGifSettings? favoriteGifs,
    FavoritesState? favorites,
    RecentMentionsSettings? recentMentions,
    SidebarPreferences? sidebar,
    MemberListState? memberList,
    UnreadChannelsState? unreadChannels,
    MentionFrecencyState? mentionFrecency,
    NagbarDismissals? nagbars,
    DismissedUpsells? dismissedUpsells,
    GuildNsfwAgreements? guildNsfwAgreements,
    WhatsNewState? whatsNew,
    PrivacyPreferences? privacy,
    LocalUserSpamOverrides? localSpamOverrides,
    $core.bool? sanitizeUrls,
    $1.SoundSettings? sound,
    SpellcheckSettings? spellcheck,
    SearchEngineSettings? searchEngines,
    PermissionLayoutSettings? permissionLayout,
    GuildMemberLayoutSettings? guildMemberLayout,
    GuildFolderExpandedState? guildFolders,
    HiddenGuildListButtons? hiddenGuildButtons,
    KeyboardModeIntroState? keyboardModeIntro,
    InputMonitoringPromptsState? inputMonitoring,
    VoicePromptsState? voicePrompts,
    SudoPromptState? sudoPrompt,
    KeybindSettings? keybinds,
    ChatInputSettings? chatInput,
  }) {
    final result = create();
    if (accessibility != null) result.accessibility = accessibility;
    if (accessibilityOverrides != null)
      result.accessibilityOverrides = accessibilityOverrides;
    if (textualPreview != null) result.textualPreview = textualPreview;
    if (emojiPicker != null) result.emojiPicker = emojiPicker;
    if (stickerPicker != null) result.stickerPicker = stickerPicker;
    if (memesPicker != null) result.memesPicker = memesPicker;
    if (emoji != null) result.emoji = emoji;
    if (emojiStickerLayout != null)
      result.emojiStickerLayout = emojiStickerLayout;
    if (favoriteGifs != null) result.favoriteGifs = favoriteGifs;
    if (favorites != null) result.favorites = favorites;
    if (recentMentions != null) result.recentMentions = recentMentions;
    if (sidebar != null) result.sidebar = sidebar;
    if (memberList != null) result.memberList = memberList;
    if (unreadChannels != null) result.unreadChannels = unreadChannels;
    if (mentionFrecency != null) result.mentionFrecency = mentionFrecency;
    if (nagbars != null) result.nagbars = nagbars;
    if (dismissedUpsells != null) result.dismissedUpsells = dismissedUpsells;
    if (guildNsfwAgreements != null)
      result.guildNsfwAgreements = guildNsfwAgreements;
    if (whatsNew != null) result.whatsNew = whatsNew;
    if (privacy != null) result.privacy = privacy;
    if (localSpamOverrides != null)
      result.localSpamOverrides = localSpamOverrides;
    if (sanitizeUrls != null) result.sanitizeUrls = sanitizeUrls;
    if (sound != null) result.sound = sound;
    if (spellcheck != null) result.spellcheck = spellcheck;
    if (searchEngines != null) result.searchEngines = searchEngines;
    if (permissionLayout != null) result.permissionLayout = permissionLayout;
    if (guildMemberLayout != null) result.guildMemberLayout = guildMemberLayout;
    if (guildFolders != null) result.guildFolders = guildFolders;
    if (hiddenGuildButtons != null)
      result.hiddenGuildButtons = hiddenGuildButtons;
    if (keyboardModeIntro != null) result.keyboardModeIntro = keyboardModeIntro;
    if (inputMonitoring != null) result.inputMonitoring = inputMonitoring;
    if (voicePrompts != null) result.voicePrompts = voicePrompts;
    if (sudoPrompt != null) result.sudoPrompt = sudoPrompt;
    if (keybinds != null) result.keybinds = keybinds;
    if (chatInput != null) result.chatInput = chatInput;
    return result;
  }

  SyncedPreferences._();

  factory SyncedPreferences.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncedPreferences.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncedPreferences',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOM<$0.AccessibilitySettings>(1, _omitFieldNames ? '' : 'accessibility',
        subBuilder: $0.AccessibilitySettings.create)
    ..aOM<$0.AccessibilityOverrides>(
        2, _omitFieldNames ? '' : 'accessibilityOverrides',
        subBuilder: $0.AccessibilityOverrides.create)
    ..aOM<TextualPreviewSettings>(3, _omitFieldNames ? '' : 'textualPreview',
        subBuilder: TextualPreviewSettings.create)
    ..aOM<$1.EmojiPickerState>(20, _omitFieldNames ? '' : 'emojiPicker',
        subBuilder: $1.EmojiPickerState.create)
    ..aOM<$1.StickerPickerState>(21, _omitFieldNames ? '' : 'stickerPicker',
        subBuilder: $1.StickerPickerState.create)
    ..aOM<$1.MemesPickerState>(22, _omitFieldNames ? '' : 'memesPicker',
        subBuilder: $1.MemesPickerState.create)
    ..aOM<$1.EmojiState>(23, _omitFieldNames ? '' : 'emoji',
        subBuilder: $1.EmojiState.create)
    ..aOM<$1.EmojiStickerLayoutSettings>(
        24, _omitFieldNames ? '' : 'emojiStickerLayout',
        subBuilder: $1.EmojiStickerLayoutSettings.create)
    ..aOM<$1.FavoriteGifSettings>(25, _omitFieldNames ? '' : 'favoriteGifs',
        subBuilder: $1.FavoriteGifSettings.create)
    ..aOM<FavoritesState>(40, _omitFieldNames ? '' : 'favorites',
        subBuilder: FavoritesState.create)
    ..aOM<RecentMentionsSettings>(41, _omitFieldNames ? '' : 'recentMentions',
        subBuilder: RecentMentionsSettings.create)
    ..aOM<SidebarPreferences>(42, _omitFieldNames ? '' : 'sidebar',
        subBuilder: SidebarPreferences.create)
    ..aOM<MemberListState>(43, _omitFieldNames ? '' : 'memberList',
        subBuilder: MemberListState.create)
    ..aOM<UnreadChannelsState>(44, _omitFieldNames ? '' : 'unreadChannels',
        subBuilder: UnreadChannelsState.create)
    ..aOM<MentionFrecencyState>(45, _omitFieldNames ? '' : 'mentionFrecency',
        subBuilder: MentionFrecencyState.create)
    ..aOM<NagbarDismissals>(60, _omitFieldNames ? '' : 'nagbars',
        subBuilder: NagbarDismissals.create)
    ..aOM<DismissedUpsells>(61, _omitFieldNames ? '' : 'dismissedUpsells',
        subBuilder: DismissedUpsells.create)
    ..aOM<GuildNsfwAgreements>(62, _omitFieldNames ? '' : 'guildNsfwAgreements',
        subBuilder: GuildNsfwAgreements.create)
    ..aOM<WhatsNewState>(63, _omitFieldNames ? '' : 'whatsNew',
        subBuilder: WhatsNewState.create)
    ..aOM<PrivacyPreferences>(80, _omitFieldNames ? '' : 'privacy',
        subBuilder: PrivacyPreferences.create)
    ..aOM<LocalUserSpamOverrides>(
        81, _omitFieldNames ? '' : 'localSpamOverrides',
        subBuilder: LocalUserSpamOverrides.create)
    ..aOB(82, _omitFieldNames ? '' : 'sanitizeUrls')
    ..aOM<$1.SoundSettings>(100, _omitFieldNames ? '' : 'sound',
        subBuilder: $1.SoundSettings.create)
    ..aOM<SpellcheckSettings>(101, _omitFieldNames ? '' : 'spellcheck',
        subBuilder: SpellcheckSettings.create)
    ..aOM<SearchEngineSettings>(102, _omitFieldNames ? '' : 'searchEngines',
        subBuilder: SearchEngineSettings.create)
    ..aOM<PermissionLayoutSettings>(
        103, _omitFieldNames ? '' : 'permissionLayout',
        subBuilder: PermissionLayoutSettings.create)
    ..aOM<GuildMemberLayoutSettings>(
        104, _omitFieldNames ? '' : 'guildMemberLayout',
        subBuilder: GuildMemberLayoutSettings.create)
    ..aOM<GuildFolderExpandedState>(105, _omitFieldNames ? '' : 'guildFolders',
        subBuilder: GuildFolderExpandedState.create)
    ..aOM<HiddenGuildListButtons>(
        106, _omitFieldNames ? '' : 'hiddenGuildButtons',
        subBuilder: HiddenGuildListButtons.create)
    ..aOM<KeyboardModeIntroState>(
        107, _omitFieldNames ? '' : 'keyboardModeIntro',
        subBuilder: KeyboardModeIntroState.create)
    ..aOM<InputMonitoringPromptsState>(
        108, _omitFieldNames ? '' : 'inputMonitoring',
        subBuilder: InputMonitoringPromptsState.create)
    ..aOM<VoicePromptsState>(109, _omitFieldNames ? '' : 'voicePrompts',
        subBuilder: VoicePromptsState.create)
    ..aOM<SudoPromptState>(110, _omitFieldNames ? '' : 'sudoPrompt',
        subBuilder: SudoPromptState.create)
    ..aOM<KeybindSettings>(111, _omitFieldNames ? '' : 'keybinds',
        subBuilder: KeybindSettings.create)
    ..aOM<ChatInputSettings>(112, _omitFieldNames ? '' : 'chatInput',
        subBuilder: ChatInputSettings.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncedPreferences clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncedPreferences copyWith(void Function(SyncedPreferences) updates) =>
      super.copyWith((message) => updates(message as SyncedPreferences))
          as SyncedPreferences;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncedPreferences create() => SyncedPreferences._();
  @$core.override
  SyncedPreferences createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncedPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncedPreferences>(create);
  static SyncedPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AccessibilitySettings get accessibility => $_getN(0);
  @$pb.TagNumber(1)
  set accessibility($0.AccessibilitySettings value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAccessibility() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessibility() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.AccessibilitySettings ensureAccessibility() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.AccessibilityOverrides get accessibilityOverrides => $_getN(1);
  @$pb.TagNumber(2)
  set accessibilityOverrides($0.AccessibilityOverrides value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAccessibilityOverrides() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccessibilityOverrides() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.AccessibilityOverrides ensureAccessibilityOverrides() => $_ensure(1);

  @$pb.TagNumber(3)
  TextualPreviewSettings get textualPreview => $_getN(2);
  @$pb.TagNumber(3)
  set textualPreview(TextualPreviewSettings value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTextualPreview() => $_has(2);
  @$pb.TagNumber(3)
  void clearTextualPreview() => $_clearField(3);
  @$pb.TagNumber(3)
  TextualPreviewSettings ensureTextualPreview() => $_ensure(2);

  @$pb.TagNumber(20)
  $1.EmojiPickerState get emojiPicker => $_getN(3);
  @$pb.TagNumber(20)
  set emojiPicker($1.EmojiPickerState value) => $_setField(20, value);
  @$pb.TagNumber(20)
  $core.bool hasEmojiPicker() => $_has(3);
  @$pb.TagNumber(20)
  void clearEmojiPicker() => $_clearField(20);
  @$pb.TagNumber(20)
  $1.EmojiPickerState ensureEmojiPicker() => $_ensure(3);

  @$pb.TagNumber(21)
  $1.StickerPickerState get stickerPicker => $_getN(4);
  @$pb.TagNumber(21)
  set stickerPicker($1.StickerPickerState value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasStickerPicker() => $_has(4);
  @$pb.TagNumber(21)
  void clearStickerPicker() => $_clearField(21);
  @$pb.TagNumber(21)
  $1.StickerPickerState ensureStickerPicker() => $_ensure(4);

  @$pb.TagNumber(22)
  $1.MemesPickerState get memesPicker => $_getN(5);
  @$pb.TagNumber(22)
  set memesPicker($1.MemesPickerState value) => $_setField(22, value);
  @$pb.TagNumber(22)
  $core.bool hasMemesPicker() => $_has(5);
  @$pb.TagNumber(22)
  void clearMemesPicker() => $_clearField(22);
  @$pb.TagNumber(22)
  $1.MemesPickerState ensureMemesPicker() => $_ensure(5);

  @$pb.TagNumber(23)
  $1.EmojiState get emoji => $_getN(6);
  @$pb.TagNumber(23)
  set emoji($1.EmojiState value) => $_setField(23, value);
  @$pb.TagNumber(23)
  $core.bool hasEmoji() => $_has(6);
  @$pb.TagNumber(23)
  void clearEmoji() => $_clearField(23);
  @$pb.TagNumber(23)
  $1.EmojiState ensureEmoji() => $_ensure(6);

  @$pb.TagNumber(24)
  $1.EmojiStickerLayoutSettings get emojiStickerLayout => $_getN(7);
  @$pb.TagNumber(24)
  set emojiStickerLayout($1.EmojiStickerLayoutSettings value) =>
      $_setField(24, value);
  @$pb.TagNumber(24)
  $core.bool hasEmojiStickerLayout() => $_has(7);
  @$pb.TagNumber(24)
  void clearEmojiStickerLayout() => $_clearField(24);
  @$pb.TagNumber(24)
  $1.EmojiStickerLayoutSettings ensureEmojiStickerLayout() => $_ensure(7);

  @$pb.TagNumber(25)
  $1.FavoriteGifSettings get favoriteGifs => $_getN(8);
  @$pb.TagNumber(25)
  set favoriteGifs($1.FavoriteGifSettings value) => $_setField(25, value);
  @$pb.TagNumber(25)
  $core.bool hasFavoriteGifs() => $_has(8);
  @$pb.TagNumber(25)
  void clearFavoriteGifs() => $_clearField(25);
  @$pb.TagNumber(25)
  $1.FavoriteGifSettings ensureFavoriteGifs() => $_ensure(8);

  @$pb.TagNumber(40)
  FavoritesState get favorites => $_getN(9);
  @$pb.TagNumber(40)
  set favorites(FavoritesState value) => $_setField(40, value);
  @$pb.TagNumber(40)
  $core.bool hasFavorites() => $_has(9);
  @$pb.TagNumber(40)
  void clearFavorites() => $_clearField(40);
  @$pb.TagNumber(40)
  FavoritesState ensureFavorites() => $_ensure(9);

  @$pb.TagNumber(41)
  RecentMentionsSettings get recentMentions => $_getN(10);
  @$pb.TagNumber(41)
  set recentMentions(RecentMentionsSettings value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasRecentMentions() => $_has(10);
  @$pb.TagNumber(41)
  void clearRecentMentions() => $_clearField(41);
  @$pb.TagNumber(41)
  RecentMentionsSettings ensureRecentMentions() => $_ensure(10);

  @$pb.TagNumber(42)
  SidebarPreferences get sidebar => $_getN(11);
  @$pb.TagNumber(42)
  set sidebar(SidebarPreferences value) => $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasSidebar() => $_has(11);
  @$pb.TagNumber(42)
  void clearSidebar() => $_clearField(42);
  @$pb.TagNumber(42)
  SidebarPreferences ensureSidebar() => $_ensure(11);

  @$pb.TagNumber(43)
  MemberListState get memberList => $_getN(12);
  @$pb.TagNumber(43)
  set memberList(MemberListState value) => $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasMemberList() => $_has(12);
  @$pb.TagNumber(43)
  void clearMemberList() => $_clearField(43);
  @$pb.TagNumber(43)
  MemberListState ensureMemberList() => $_ensure(12);

  @$pb.TagNumber(44)
  UnreadChannelsState get unreadChannels => $_getN(13);
  @$pb.TagNumber(44)
  set unreadChannels(UnreadChannelsState value) => $_setField(44, value);
  @$pb.TagNumber(44)
  $core.bool hasUnreadChannels() => $_has(13);
  @$pb.TagNumber(44)
  void clearUnreadChannels() => $_clearField(44);
  @$pb.TagNumber(44)
  UnreadChannelsState ensureUnreadChannels() => $_ensure(13);

  @$pb.TagNumber(45)
  MentionFrecencyState get mentionFrecency => $_getN(14);
  @$pb.TagNumber(45)
  set mentionFrecency(MentionFrecencyState value) => $_setField(45, value);
  @$pb.TagNumber(45)
  $core.bool hasMentionFrecency() => $_has(14);
  @$pb.TagNumber(45)
  void clearMentionFrecency() => $_clearField(45);
  @$pb.TagNumber(45)
  MentionFrecencyState ensureMentionFrecency() => $_ensure(14);

  @$pb.TagNumber(60)
  NagbarDismissals get nagbars => $_getN(15);
  @$pb.TagNumber(60)
  set nagbars(NagbarDismissals value) => $_setField(60, value);
  @$pb.TagNumber(60)
  $core.bool hasNagbars() => $_has(15);
  @$pb.TagNumber(60)
  void clearNagbars() => $_clearField(60);
  @$pb.TagNumber(60)
  NagbarDismissals ensureNagbars() => $_ensure(15);

  @$pb.TagNumber(61)
  DismissedUpsells get dismissedUpsells => $_getN(16);
  @$pb.TagNumber(61)
  set dismissedUpsells(DismissedUpsells value) => $_setField(61, value);
  @$pb.TagNumber(61)
  $core.bool hasDismissedUpsells() => $_has(16);
  @$pb.TagNumber(61)
  void clearDismissedUpsells() => $_clearField(61);
  @$pb.TagNumber(61)
  DismissedUpsells ensureDismissedUpsells() => $_ensure(16);

  @$pb.TagNumber(62)
  GuildNsfwAgreements get guildNsfwAgreements => $_getN(17);
  @$pb.TagNumber(62)
  set guildNsfwAgreements(GuildNsfwAgreements value) => $_setField(62, value);
  @$pb.TagNumber(62)
  $core.bool hasGuildNsfwAgreements() => $_has(17);
  @$pb.TagNumber(62)
  void clearGuildNsfwAgreements() => $_clearField(62);
  @$pb.TagNumber(62)
  GuildNsfwAgreements ensureGuildNsfwAgreements() => $_ensure(17);

  @$pb.TagNumber(63)
  WhatsNewState get whatsNew => $_getN(18);
  @$pb.TagNumber(63)
  set whatsNew(WhatsNewState value) => $_setField(63, value);
  @$pb.TagNumber(63)
  $core.bool hasWhatsNew() => $_has(18);
  @$pb.TagNumber(63)
  void clearWhatsNew() => $_clearField(63);
  @$pb.TagNumber(63)
  WhatsNewState ensureWhatsNew() => $_ensure(18);

  @$pb.TagNumber(80)
  PrivacyPreferences get privacy => $_getN(19);
  @$pb.TagNumber(80)
  set privacy(PrivacyPreferences value) => $_setField(80, value);
  @$pb.TagNumber(80)
  $core.bool hasPrivacy() => $_has(19);
  @$pb.TagNumber(80)
  void clearPrivacy() => $_clearField(80);
  @$pb.TagNumber(80)
  PrivacyPreferences ensurePrivacy() => $_ensure(19);

  @$pb.TagNumber(81)
  LocalUserSpamOverrides get localSpamOverrides => $_getN(20);
  @$pb.TagNumber(81)
  set localSpamOverrides(LocalUserSpamOverrides value) => $_setField(81, value);
  @$pb.TagNumber(81)
  $core.bool hasLocalSpamOverrides() => $_has(20);
  @$pb.TagNumber(81)
  void clearLocalSpamOverrides() => $_clearField(81);
  @$pb.TagNumber(81)
  LocalUserSpamOverrides ensureLocalSpamOverrides() => $_ensure(20);

  @$pb.TagNumber(82)
  $core.bool get sanitizeUrls => $_getBF(21);
  @$pb.TagNumber(82)
  set sanitizeUrls($core.bool value) => $_setBool(21, value);
  @$pb.TagNumber(82)
  $core.bool hasSanitizeUrls() => $_has(21);
  @$pb.TagNumber(82)
  void clearSanitizeUrls() => $_clearField(82);

  @$pb.TagNumber(100)
  $1.SoundSettings get sound => $_getN(22);
  @$pb.TagNumber(100)
  set sound($1.SoundSettings value) => $_setField(100, value);
  @$pb.TagNumber(100)
  $core.bool hasSound() => $_has(22);
  @$pb.TagNumber(100)
  void clearSound() => $_clearField(100);
  @$pb.TagNumber(100)
  $1.SoundSettings ensureSound() => $_ensure(22);

  @$pb.TagNumber(101)
  SpellcheckSettings get spellcheck => $_getN(23);
  @$pb.TagNumber(101)
  set spellcheck(SpellcheckSettings value) => $_setField(101, value);
  @$pb.TagNumber(101)
  $core.bool hasSpellcheck() => $_has(23);
  @$pb.TagNumber(101)
  void clearSpellcheck() => $_clearField(101);
  @$pb.TagNumber(101)
  SpellcheckSettings ensureSpellcheck() => $_ensure(23);

  @$pb.TagNumber(102)
  SearchEngineSettings get searchEngines => $_getN(24);
  @$pb.TagNumber(102)
  set searchEngines(SearchEngineSettings value) => $_setField(102, value);
  @$pb.TagNumber(102)
  $core.bool hasSearchEngines() => $_has(24);
  @$pb.TagNumber(102)
  void clearSearchEngines() => $_clearField(102);
  @$pb.TagNumber(102)
  SearchEngineSettings ensureSearchEngines() => $_ensure(24);

  @$pb.TagNumber(103)
  PermissionLayoutSettings get permissionLayout => $_getN(25);
  @$pb.TagNumber(103)
  set permissionLayout(PermissionLayoutSettings value) =>
      $_setField(103, value);
  @$pb.TagNumber(103)
  $core.bool hasPermissionLayout() => $_has(25);
  @$pb.TagNumber(103)
  void clearPermissionLayout() => $_clearField(103);
  @$pb.TagNumber(103)
  PermissionLayoutSettings ensurePermissionLayout() => $_ensure(25);

  @$pb.TagNumber(104)
  GuildMemberLayoutSettings get guildMemberLayout => $_getN(26);
  @$pb.TagNumber(104)
  set guildMemberLayout(GuildMemberLayoutSettings value) =>
      $_setField(104, value);
  @$pb.TagNumber(104)
  $core.bool hasGuildMemberLayout() => $_has(26);
  @$pb.TagNumber(104)
  void clearGuildMemberLayout() => $_clearField(104);
  @$pb.TagNumber(104)
  GuildMemberLayoutSettings ensureGuildMemberLayout() => $_ensure(26);

  @$pb.TagNumber(105)
  GuildFolderExpandedState get guildFolders => $_getN(27);
  @$pb.TagNumber(105)
  set guildFolders(GuildFolderExpandedState value) => $_setField(105, value);
  @$pb.TagNumber(105)
  $core.bool hasGuildFolders() => $_has(27);
  @$pb.TagNumber(105)
  void clearGuildFolders() => $_clearField(105);
  @$pb.TagNumber(105)
  GuildFolderExpandedState ensureGuildFolders() => $_ensure(27);

  @$pb.TagNumber(106)
  HiddenGuildListButtons get hiddenGuildButtons => $_getN(28);
  @$pb.TagNumber(106)
  set hiddenGuildButtons(HiddenGuildListButtons value) =>
      $_setField(106, value);
  @$pb.TagNumber(106)
  $core.bool hasHiddenGuildButtons() => $_has(28);
  @$pb.TagNumber(106)
  void clearHiddenGuildButtons() => $_clearField(106);
  @$pb.TagNumber(106)
  HiddenGuildListButtons ensureHiddenGuildButtons() => $_ensure(28);

  @$pb.TagNumber(107)
  KeyboardModeIntroState get keyboardModeIntro => $_getN(29);
  @$pb.TagNumber(107)
  set keyboardModeIntro(KeyboardModeIntroState value) => $_setField(107, value);
  @$pb.TagNumber(107)
  $core.bool hasKeyboardModeIntro() => $_has(29);
  @$pb.TagNumber(107)
  void clearKeyboardModeIntro() => $_clearField(107);
  @$pb.TagNumber(107)
  KeyboardModeIntroState ensureKeyboardModeIntro() => $_ensure(29);

  @$pb.TagNumber(108)
  InputMonitoringPromptsState get inputMonitoring => $_getN(30);
  @$pb.TagNumber(108)
  set inputMonitoring(InputMonitoringPromptsState value) =>
      $_setField(108, value);
  @$pb.TagNumber(108)
  $core.bool hasInputMonitoring() => $_has(30);
  @$pb.TagNumber(108)
  void clearInputMonitoring() => $_clearField(108);
  @$pb.TagNumber(108)
  InputMonitoringPromptsState ensureInputMonitoring() => $_ensure(30);

  @$pb.TagNumber(109)
  VoicePromptsState get voicePrompts => $_getN(31);
  @$pb.TagNumber(109)
  set voicePrompts(VoicePromptsState value) => $_setField(109, value);
  @$pb.TagNumber(109)
  $core.bool hasVoicePrompts() => $_has(31);
  @$pb.TagNumber(109)
  void clearVoicePrompts() => $_clearField(109);
  @$pb.TagNumber(109)
  VoicePromptsState ensureVoicePrompts() => $_ensure(31);

  @$pb.TagNumber(110)
  SudoPromptState get sudoPrompt => $_getN(32);
  @$pb.TagNumber(110)
  set sudoPrompt(SudoPromptState value) => $_setField(110, value);
  @$pb.TagNumber(110)
  $core.bool hasSudoPrompt() => $_has(32);
  @$pb.TagNumber(110)
  void clearSudoPrompt() => $_clearField(110);
  @$pb.TagNumber(110)
  SudoPromptState ensureSudoPrompt() => $_ensure(32);

  @$pb.TagNumber(111)
  KeybindSettings get keybinds => $_getN(33);
  @$pb.TagNumber(111)
  set keybinds(KeybindSettings value) => $_setField(111, value);
  @$pb.TagNumber(111)
  $core.bool hasKeybinds() => $_has(33);
  @$pb.TagNumber(111)
  void clearKeybinds() => $_clearField(111);
  @$pb.TagNumber(111)
  KeybindSettings ensureKeybinds() => $_ensure(33);

  @$pb.TagNumber(112)
  ChatInputSettings get chatInput => $_getN(34);
  @$pb.TagNumber(112)
  set chatInput(ChatInputSettings value) => $_setField(112, value);
  @$pb.TagNumber(112)
  $core.bool hasChatInput() => $_has(34);
  @$pb.TagNumber(112)
  void clearChatInput() => $_clearField(112);
  @$pb.TagNumber(112)
  ChatInputSettings ensureChatInput() => $_ensure(34);
}

class SpellcheckSettings extends $pb.GeneratedMessage {
  factory SpellcheckSettings({
    $core.bool? enabled,
    $core.Iterable<$core.String>? languages,
    $core.Iterable<$core.String>? personalDictionary,
    $core.bool? autoDetect,
    $core.String? engine,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (languages != null) result.languages.addAll(languages);
    if (personalDictionary != null)
      result.personalDictionary.addAll(personalDictionary);
    if (autoDetect != null) result.autoDetect = autoDetect;
    if (engine != null) result.engine = engine;
    return result;
  }

  SpellcheckSettings._();

  factory SpellcheckSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SpellcheckSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SpellcheckSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..pPS(2, _omitFieldNames ? '' : 'languages')
    ..pPS(3, _omitFieldNames ? '' : 'personalDictionary')
    ..aOB(4, _omitFieldNames ? '' : 'autoDetect')
    ..aOS(5, _omitFieldNames ? '' : 'engine')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpellcheckSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SpellcheckSettings copyWith(void Function(SpellcheckSettings) updates) =>
      super.copyWith((message) => updates(message as SpellcheckSettings))
          as SpellcheckSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SpellcheckSettings create() => SpellcheckSettings._();
  @$core.override
  SpellcheckSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SpellcheckSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpellcheckSettings>(create);
  static SpellcheckSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get languages => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get personalDictionary => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get autoDetect => $_getBF(3);
  @$pb.TagNumber(4)
  set autoDetect($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAutoDetect() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoDetect() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get engine => $_getSZ(4);
  @$pb.TagNumber(5)
  set engine($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEngine() => $_has(4);
  @$pb.TagNumber(5)
  void clearEngine() => $_clearField(5);
}

class SearchEngineSettings extends $pb.GeneratedMessage {
  factory SearchEngineSettings({
    $core.String? textSearchEngineId,
    $core.String? reverseImageSearchEngineId,
    $core.String? translationProviderId,
  }) {
    final result = create();
    if (textSearchEngineId != null)
      result.textSearchEngineId = textSearchEngineId;
    if (reverseImageSearchEngineId != null)
      result.reverseImageSearchEngineId = reverseImageSearchEngineId;
    if (translationProviderId != null)
      result.translationProviderId = translationProviderId;
    return result;
  }

  SearchEngineSettings._();

  factory SearchEngineSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchEngineSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchEngineSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'textSearchEngineId')
    ..aOS(2, _omitFieldNames ? '' : 'reverseImageSearchEngineId')
    ..aOS(3, _omitFieldNames ? '' : 'translationProviderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchEngineSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchEngineSettings copyWith(void Function(SearchEngineSettings) updates) =>
      super.copyWith((message) => updates(message as SearchEngineSettings))
          as SearchEngineSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchEngineSettings create() => SearchEngineSettings._();
  @$core.override
  SearchEngineSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchEngineSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchEngineSettings>(create);
  static SearchEngineSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get textSearchEngineId => $_getSZ(0);
  @$pb.TagNumber(1)
  set textSearchEngineId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTextSearchEngineId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextSearchEngineId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reverseImageSearchEngineId => $_getSZ(1);
  @$pb.TagNumber(2)
  set reverseImageSearchEngineId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReverseImageSearchEngineId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReverseImageSearchEngineId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get translationProviderId => $_getSZ(2);
  @$pb.TagNumber(3)
  set translationProviderId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTranslationProviderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTranslationProviderId() => $_clearField(3);
}

class PrivacyPreferences extends $pb.GeneratedMessage {
  factory PrivacyPreferences({
    $core.bool? disableStreamPreviews,
    $core.bool? showActiveNow,
    $core.bool? preuploadMessageAttachments,
  }) {
    final result = create();
    if (disableStreamPreviews != null)
      result.disableStreamPreviews = disableStreamPreviews;
    if (showActiveNow != null) result.showActiveNow = showActiveNow;
    if (preuploadMessageAttachments != null)
      result.preuploadMessageAttachments = preuploadMessageAttachments;
    return result;
  }

  PrivacyPreferences._();

  factory PrivacyPreferences.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PrivacyPreferences.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PrivacyPreferences',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'disableStreamPreviews')
    ..aOB(2, _omitFieldNames ? '' : 'showActiveNow')
    ..aOB(3, _omitFieldNames ? '' : 'preuploadMessageAttachments')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrivacyPreferences clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PrivacyPreferences copyWith(void Function(PrivacyPreferences) updates) =>
      super.copyWith((message) => updates(message as PrivacyPreferences))
          as PrivacyPreferences;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PrivacyPreferences create() => PrivacyPreferences._();
  @$core.override
  PrivacyPreferences createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PrivacyPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PrivacyPreferences>(create);
  static PrivacyPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get disableStreamPreviews => $_getBF(0);
  @$pb.TagNumber(1)
  set disableStreamPreviews($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDisableStreamPreviews() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisableStreamPreviews() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showActiveNow => $_getBF(1);
  @$pb.TagNumber(2)
  set showActiveNow($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShowActiveNow() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowActiveNow() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get preuploadMessageAttachments => $_getBF(2);
  @$pb.TagNumber(3)
  set preuploadMessageAttachments($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreuploadMessageAttachments() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreuploadMessageAttachments() => $_clearField(3);
}

class LocalUserSpamOverrides extends $pb.GeneratedMessage {
  factory LocalUserSpamOverrides({
    $core.Iterable<$core.String>? spammerUserIds,
    $core.Iterable<$core.String>? notSpammerUserIds,
  }) {
    final result = create();
    if (spammerUserIds != null) result.spammerUserIds.addAll(spammerUserIds);
    if (notSpammerUserIds != null)
      result.notSpammerUserIds.addAll(notSpammerUserIds);
    return result;
  }

  LocalUserSpamOverrides._();

  factory LocalUserSpamOverrides.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocalUserSpamOverrides.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocalUserSpamOverrides',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'spammerUserIds')
    ..pPS(2, _omitFieldNames ? '' : 'notSpammerUserIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalUserSpamOverrides clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalUserSpamOverrides copyWith(
          void Function(LocalUserSpamOverrides) updates) =>
      super.copyWith((message) => updates(message as LocalUserSpamOverrides))
          as LocalUserSpamOverrides;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalUserSpamOverrides create() => LocalUserSpamOverrides._();
  @$core.override
  LocalUserSpamOverrides createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocalUserSpamOverrides getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocalUserSpamOverrides>(create);
  static LocalUserSpamOverrides? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get spammerUserIds => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get notSpammerUserIds => $_getList(1);
}

class TextualPreviewSettings extends $pb.GeneratedMessage {
  factory TextualPreviewSettings({
    $core.bool? wrapText,
  }) {
    final result = create();
    if (wrapText != null) result.wrapText = wrapText;
    return result;
  }

  TextualPreviewSettings._();

  factory TextualPreviewSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextualPreviewSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextualPreviewSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'wrapText')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextualPreviewSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextualPreviewSettings copyWith(
          void Function(TextualPreviewSettings) updates) =>
      super.copyWith((message) => updates(message as TextualPreviewSettings))
          as TextualPreviewSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextualPreviewSettings create() => TextualPreviewSettings._();
  @$core.override
  TextualPreviewSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextualPreviewSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextualPreviewSettings>(create);
  static TextualPreviewSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get wrapText => $_getBF(0);
  @$pb.TagNumber(1)
  set wrapText($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWrapText() => $_has(0);
  @$pb.TagNumber(1)
  void clearWrapText() => $_clearField(1);
}

class SidebarPreferences extends $pb.GeneratedMessage {
  factory SidebarPreferences({
    $core.bool? inlineDmsCollapsed,
    $core.bool? showCollapsedUnreadDmsBadge,
    $core.bool? showIncomingFriendRequestBadge,
  }) {
    final result = create();
    if (inlineDmsCollapsed != null)
      result.inlineDmsCollapsed = inlineDmsCollapsed;
    if (showCollapsedUnreadDmsBadge != null)
      result.showCollapsedUnreadDmsBadge = showCollapsedUnreadDmsBadge;
    if (showIncomingFriendRequestBadge != null)
      result.showIncomingFriendRequestBadge = showIncomingFriendRequestBadge;
    return result;
  }

  SidebarPreferences._();

  factory SidebarPreferences.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SidebarPreferences.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SidebarPreferences',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'inlineDmsCollapsed')
    ..aOB(2, _omitFieldNames ? '' : 'showCollapsedUnreadDmsBadge')
    ..aOB(3, _omitFieldNames ? '' : 'showIncomingFriendRequestBadge')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SidebarPreferences clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SidebarPreferences copyWith(void Function(SidebarPreferences) updates) =>
      super.copyWith((message) => updates(message as SidebarPreferences))
          as SidebarPreferences;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SidebarPreferences create() => SidebarPreferences._();
  @$core.override
  SidebarPreferences createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SidebarPreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SidebarPreferences>(create);
  static SidebarPreferences? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inlineDmsCollapsed => $_getBF(0);
  @$pb.TagNumber(1)
  set inlineDmsCollapsed($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInlineDmsCollapsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearInlineDmsCollapsed() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showCollapsedUnreadDmsBadge => $_getBF(1);
  @$pb.TagNumber(2)
  set showCollapsedUnreadDmsBadge($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShowCollapsedUnreadDmsBadge() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowCollapsedUnreadDmsBadge() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showIncomingFriendRequestBadge => $_getBF(2);
  @$pb.TagNumber(3)
  set showIncomingFriendRequestBadge($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasShowIncomingFriendRequestBadge() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowIncomingFriendRequestBadge() => $_clearField(3);
}

class MemberListState extends $pb.GeneratedMessage {
  factory MemberListState({
    $core.bool? membersOpen,
  }) {
    final result = create();
    if (membersOpen != null) result.membersOpen = membersOpen;
    return result;
  }

  MemberListState._();

  factory MemberListState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MemberListState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MemberListState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'membersOpen')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberListState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemberListState copyWith(void Function(MemberListState) updates) =>
      super.copyWith((message) => updates(message as MemberListState))
          as MemberListState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberListState create() => MemberListState._();
  @$core.override
  MemberListState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MemberListState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemberListState>(create);
  static MemberListState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get membersOpen => $_getBF(0);
  @$pb.TagNumber(1)
  set membersOpen($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMembersOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearMembersOpen() => $_clearField(1);
}

class UnreadChannelsState extends $pb.GeneratedMessage {
  factory UnreadChannelsState({
    $core.Iterable<$core.String>? collapsedChannelIds,
  }) {
    final result = create();
    if (collapsedChannelIds != null)
      result.collapsedChannelIds.addAll(collapsedChannelIds);
    return result;
  }

  UnreadChannelsState._();

  factory UnreadChannelsState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnreadChannelsState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnreadChannelsState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'collapsedChannelIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnreadChannelsState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnreadChannelsState copyWith(void Function(UnreadChannelsState) updates) =>
      super.copyWith((message) => updates(message as UnreadChannelsState))
          as UnreadChannelsState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnreadChannelsState create() => UnreadChannelsState._();
  @$core.override
  UnreadChannelsState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnreadChannelsState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnreadChannelsState>(create);
  static UnreadChannelsState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get collapsedChannelIds => $_getList(0);
}

class RecentMentionsSettings extends $pb.GeneratedMessage {
  factory RecentMentionsSettings({
    $core.bool? includeEveryone,
    $core.bool? includeRoles,
    $core.bool? includeGuilds,
  }) {
    final result = create();
    if (includeEveryone != null) result.includeEveryone = includeEveryone;
    if (includeRoles != null) result.includeRoles = includeRoles;
    if (includeGuilds != null) result.includeGuilds = includeGuilds;
    return result;
  }

  RecentMentionsSettings._();

  factory RecentMentionsSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RecentMentionsSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RecentMentionsSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'includeEveryone')
    ..aOB(2, _omitFieldNames ? '' : 'includeRoles')
    ..aOB(3, _omitFieldNames ? '' : 'includeGuilds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecentMentionsSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RecentMentionsSettings copyWith(
          void Function(RecentMentionsSettings) updates) =>
      super.copyWith((message) => updates(message as RecentMentionsSettings))
          as RecentMentionsSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecentMentionsSettings create() => RecentMentionsSettings._();
  @$core.override
  RecentMentionsSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RecentMentionsSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecentMentionsSettings>(create);
  static RecentMentionsSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get includeEveryone => $_getBF(0);
  @$pb.TagNumber(1)
  set includeEveryone($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIncludeEveryone() => $_has(0);
  @$pb.TagNumber(1)
  void clearIncludeEveryone() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get includeRoles => $_getBF(1);
  @$pb.TagNumber(2)
  set includeRoles($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIncludeRoles() => $_has(1);
  @$pb.TagNumber(2)
  void clearIncludeRoles() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get includeGuilds => $_getBF(2);
  @$pb.TagNumber(3)
  set includeGuilds($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIncludeGuilds() => $_has(2);
  @$pb.TagNumber(3)
  void clearIncludeGuilds() => $_clearField(3);
}

class MentionFrecencyState_Entry extends $pb.GeneratedMessage {
  factory MentionFrecencyState_Entry({
    $core.String? userId,
    $core.int? count,
    $fixnum.Int64? lastAtMs,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (count != null) result.count = count;
    if (lastAtMs != null) result.lastAtMs = lastAtMs;
    return result;
  }

  MentionFrecencyState_Entry._();

  factory MentionFrecencyState_Entry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentionFrecencyState_Entry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentionFrecencyState.Entry',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aI(2, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(3, _omitFieldNames ? '' : 'lastAtMs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState_Entry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState_Entry copyWith(
          void Function(MentionFrecencyState_Entry) updates) =>
      super.copyWith(
              (message) => updates(message as MentionFrecencyState_Entry))
          as MentionFrecencyState_Entry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState_Entry create() => MentionFrecencyState_Entry._();
  @$core.override
  MentionFrecencyState_Entry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState_Entry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentionFrecencyState_Entry>(create);
  static MentionFrecencyState_Entry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastAtMs => $_getI64(2);
  @$pb.TagNumber(3)
  set lastAtMs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLastAtMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastAtMs() => $_clearField(3);
}

class MentionFrecencyState_Scope extends $pb.GeneratedMessage {
  factory MentionFrecencyState_Scope({
    $core.String? guildId,
    $core.Iterable<MentionFrecencyState_Entry>? entries,
  }) {
    final result = create();
    if (guildId != null) result.guildId = guildId;
    if (entries != null) result.entries.addAll(entries);
    return result;
  }

  MentionFrecencyState_Scope._();

  factory MentionFrecencyState_Scope.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentionFrecencyState_Scope.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentionFrecencyState.Scope',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'guildId')
    ..pPM<MentionFrecencyState_Entry>(2, _omitFieldNames ? '' : 'entries',
        subBuilder: MentionFrecencyState_Entry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState_Scope clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState_Scope copyWith(
          void Function(MentionFrecencyState_Scope) updates) =>
      super.copyWith(
              (message) => updates(message as MentionFrecencyState_Scope))
          as MentionFrecencyState_Scope;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState_Scope create() => MentionFrecencyState_Scope._();
  @$core.override
  MentionFrecencyState_Scope createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState_Scope getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentionFrecencyState_Scope>(create);
  static MentionFrecencyState_Scope? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get guildId => $_getSZ(0);
  @$pb.TagNumber(1)
  set guildId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGuildId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGuildId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<MentionFrecencyState_Entry> get entries => $_getList(1);
}

class MentionFrecencyState extends $pb.GeneratedMessage {
  factory MentionFrecencyState({
    $core.Iterable<MentionFrecencyState_Scope>? scopes,
  }) {
    final result = create();
    if (scopes != null) result.scopes.addAll(scopes);
    return result;
  }

  MentionFrecencyState._();

  factory MentionFrecencyState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MentionFrecencyState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MentionFrecencyState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPM<MentionFrecencyState_Scope>(1, _omitFieldNames ? '' : 'scopes',
        subBuilder: MentionFrecencyState_Scope.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MentionFrecencyState copyWith(void Function(MentionFrecencyState) updates) =>
      super.copyWith((message) => updates(message as MentionFrecencyState))
          as MentionFrecencyState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState create() => MentionFrecencyState._();
  @$core.override
  MentionFrecencyState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MentionFrecencyState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MentionFrecencyState>(create);
  static MentionFrecencyState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MentionFrecencyState_Scope> get scopes => $_getList(0);
}

class FavoritesState extends $pb.GeneratedMessage {
  factory FavoritesState({
    $core.Iterable<FavoriteChannel>? channels,
    $core.Iterable<FavoriteCategory>? categories,
    $core.Iterable<$core.String>? collapsedCategoryIds,
    $core.bool? hideMutedChannels,
    $core.bool? muted,
  }) {
    final result = create();
    if (channels != null) result.channels.addAll(channels);
    if (categories != null) result.categories.addAll(categories);
    if (collapsedCategoryIds != null)
      result.collapsedCategoryIds.addAll(collapsedCategoryIds);
    if (hideMutedChannels != null) result.hideMutedChannels = hideMutedChannels;
    if (muted != null) result.muted = muted;
    return result;
  }

  FavoritesState._();

  factory FavoritesState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoritesState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoritesState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPM<FavoriteChannel>(1, _omitFieldNames ? '' : 'channels',
        subBuilder: FavoriteChannel.create)
    ..pPM<FavoriteCategory>(2, _omitFieldNames ? '' : 'categories',
        subBuilder: FavoriteCategory.create)
    ..pPS(3, _omitFieldNames ? '' : 'collapsedCategoryIds')
    ..aOB(4, _omitFieldNames ? '' : 'hideMutedChannels')
    ..aOB(5, _omitFieldNames ? '' : 'muted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoritesState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoritesState copyWith(void Function(FavoritesState) updates) =>
      super.copyWith((message) => updates(message as FavoritesState))
          as FavoritesState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoritesState create() => FavoritesState._();
  @$core.override
  FavoritesState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoritesState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoritesState>(create);
  static FavoritesState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FavoriteChannel> get channels => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<FavoriteCategory> get categories => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get collapsedCategoryIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hideMutedChannels => $_getBF(3);
  @$pb.TagNumber(4)
  set hideMutedChannels($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHideMutedChannels() => $_has(3);
  @$pb.TagNumber(4)
  void clearHideMutedChannels() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get muted => $_getBF(4);
  @$pb.TagNumber(5)
  set muted($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMuted() => $_has(4);
  @$pb.TagNumber(5)
  void clearMuted() => $_clearField(5);
}

class FavoriteChannel extends $pb.GeneratedMessage {
  factory FavoriteChannel({
    $core.String? channelId,
    $core.String? guildId,
    $core.String? parentId,
    $core.int? position,
    $core.String? nickname,
  }) {
    final result = create();
    if (channelId != null) result.channelId = channelId;
    if (guildId != null) result.guildId = guildId;
    if (parentId != null) result.parentId = parentId;
    if (position != null) result.position = position;
    if (nickname != null) result.nickname = nickname;
    return result;
  }

  FavoriteChannel._();

  factory FavoriteChannel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteChannel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteChannel',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'channelId')
    ..aOS(2, _omitFieldNames ? '' : 'guildId')
    ..aOS(3, _omitFieldNames ? '' : 'parentId')
    ..aI(4, _omitFieldNames ? '' : 'position')
    ..aOS(5, _omitFieldNames ? '' : 'nickname')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteChannel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteChannel copyWith(void Function(FavoriteChannel) updates) =>
      super.copyWith((message) => updates(message as FavoriteChannel))
          as FavoriteChannel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteChannel create() => FavoriteChannel._();
  @$core.override
  FavoriteChannel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoriteChannel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteChannel>(create);
  static FavoriteChannel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get channelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set channelId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChannelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get guildId => $_getSZ(1);
  @$pb.TagNumber(2)
  set guildId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGuildId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuildId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get parentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set parentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasParentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nickname => $_getSZ(4);
  @$pb.TagNumber(5)
  set nickname($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNickname() => $_has(4);
  @$pb.TagNumber(5)
  void clearNickname() => $_clearField(5);
}

class FavoriteCategory extends $pb.GeneratedMessage {
  factory FavoriteCategory({
    $core.String? id,
    $core.String? name,
    $core.int? position,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (position != null) result.position = position;
    return result;
  }

  FavoriteCategory._();

  factory FavoriteCategory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteCategory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteCategory',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'position')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteCategory clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteCategory copyWith(void Function(FavoriteCategory) updates) =>
      super.copyWith((message) => updates(message as FavoriteCategory))
          as FavoriteCategory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteCategory create() => FavoriteCategory._();
  @$core.override
  FavoriteCategory createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoriteCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteCategory>(create);
  static FavoriteCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get position => $_getIZ(2);
  @$pb.TagNumber(3)
  set position($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => $_clearField(3);
}

class NagbarDismissals extends $pb.GeneratedMessage {
  factory NagbarDismissals({
    $core.bool? iosInstall,
    $core.bool? pwaInstall,
    $core.bool? pushNotification,
    $core.bool? desktopNotification,
    $core.bool? premiumGracePeriod,
    $core.bool? premiumExpired,
    $core.bool? premiumOnboarding,
    $core.bool? premiumTrialExpiring,
    $core.bool? giftInventory,
    $core.bool? desktopDownload,
    $core.bool? guildMembershipCta,
    $core.bool? visionaryMfa,
    $core.bool? legacyPhoneUnlink,
    $core.Iterable<$core.MapEntry<$core.String, $core.bool>>?
        pendingBulkDeletion,
    $core.Iterable<$core.MapEntry<$core.String, $core.bool>>? invitesDisabled,
    $core.Iterable<$core.MapEntry<$core.String, $core.bool>>?
        guildMfaRequirement,
  }) {
    final result = create();
    if (iosInstall != null) result.iosInstall = iosInstall;
    if (pwaInstall != null) result.pwaInstall = pwaInstall;
    if (pushNotification != null) result.pushNotification = pushNotification;
    if (desktopNotification != null)
      result.desktopNotification = desktopNotification;
    if (premiumGracePeriod != null)
      result.premiumGracePeriod = premiumGracePeriod;
    if (premiumExpired != null) result.premiumExpired = premiumExpired;
    if (premiumOnboarding != null) result.premiumOnboarding = premiumOnboarding;
    if (premiumTrialExpiring != null)
      result.premiumTrialExpiring = premiumTrialExpiring;
    if (giftInventory != null) result.giftInventory = giftInventory;
    if (desktopDownload != null) result.desktopDownload = desktopDownload;
    if (guildMembershipCta != null)
      result.guildMembershipCta = guildMembershipCta;
    if (visionaryMfa != null) result.visionaryMfa = visionaryMfa;
    if (legacyPhoneUnlink != null) result.legacyPhoneUnlink = legacyPhoneUnlink;
    if (pendingBulkDeletion != null)
      result.pendingBulkDeletion.addEntries(pendingBulkDeletion);
    if (invitesDisabled != null)
      result.invitesDisabled.addEntries(invitesDisabled);
    if (guildMfaRequirement != null)
      result.guildMfaRequirement.addEntries(guildMfaRequirement);
    return result;
  }

  NagbarDismissals._();

  factory NagbarDismissals.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NagbarDismissals.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NagbarDismissals',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'iosInstall')
    ..aOB(2, _omitFieldNames ? '' : 'pwaInstall')
    ..aOB(3, _omitFieldNames ? '' : 'pushNotification')
    ..aOB(4, _omitFieldNames ? '' : 'desktopNotification')
    ..aOB(5, _omitFieldNames ? '' : 'premiumGracePeriod')
    ..aOB(6, _omitFieldNames ? '' : 'premiumExpired')
    ..aOB(7, _omitFieldNames ? '' : 'premiumOnboarding')
    ..aOB(8, _omitFieldNames ? '' : 'premiumTrialExpiring')
    ..aOB(9, _omitFieldNames ? '' : 'giftInventory')
    ..aOB(10, _omitFieldNames ? '' : 'desktopDownload')
    ..aOB(11, _omitFieldNames ? '' : 'guildMembershipCta')
    ..aOB(12, _omitFieldNames ? '' : 'visionaryMfa')
    ..aOB(14, _omitFieldNames ? '' : 'legacyPhoneUnlink')
    ..m<$core.String, $core.bool>(
        15, _omitFieldNames ? '' : 'pendingBulkDeletion',
        entryClassName: 'NagbarDismissals.PendingBulkDeletionEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OB,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..m<$core.String, $core.bool>(16, _omitFieldNames ? '' : 'invitesDisabled',
        entryClassName: 'NagbarDismissals.InvitesDisabledEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OB,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..m<$core.String, $core.bool>(
        17, _omitFieldNames ? '' : 'guildMfaRequirement',
        entryClassName: 'NagbarDismissals.GuildMfaRequirementEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OB,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NagbarDismissals clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NagbarDismissals copyWith(void Function(NagbarDismissals) updates) =>
      super.copyWith((message) => updates(message as NagbarDismissals))
          as NagbarDismissals;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NagbarDismissals create() => NagbarDismissals._();
  @$core.override
  NagbarDismissals createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NagbarDismissals getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NagbarDismissals>(create);
  static NagbarDismissals? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get iosInstall => $_getBF(0);
  @$pb.TagNumber(1)
  set iosInstall($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIosInstall() => $_has(0);
  @$pb.TagNumber(1)
  void clearIosInstall() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get pwaInstall => $_getBF(1);
  @$pb.TagNumber(2)
  set pwaInstall($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPwaInstall() => $_has(1);
  @$pb.TagNumber(2)
  void clearPwaInstall() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get pushNotification => $_getBF(2);
  @$pb.TagNumber(3)
  set pushNotification($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPushNotification() => $_has(2);
  @$pb.TagNumber(3)
  void clearPushNotification() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get desktopNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set desktopNotification($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDesktopNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesktopNotification() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get premiumGracePeriod => $_getBF(4);
  @$pb.TagNumber(5)
  set premiumGracePeriod($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPremiumGracePeriod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPremiumGracePeriod() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get premiumExpired => $_getBF(5);
  @$pb.TagNumber(6)
  set premiumExpired($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPremiumExpired() => $_has(5);
  @$pb.TagNumber(6)
  void clearPremiumExpired() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get premiumOnboarding => $_getBF(6);
  @$pb.TagNumber(7)
  set premiumOnboarding($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPremiumOnboarding() => $_has(6);
  @$pb.TagNumber(7)
  void clearPremiumOnboarding() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get premiumTrialExpiring => $_getBF(7);
  @$pb.TagNumber(8)
  set premiumTrialExpiring($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPremiumTrialExpiring() => $_has(7);
  @$pb.TagNumber(8)
  void clearPremiumTrialExpiring() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get giftInventory => $_getBF(8);
  @$pb.TagNumber(9)
  set giftInventory($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasGiftInventory() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftInventory() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get desktopDownload => $_getBF(9);
  @$pb.TagNumber(10)
  set desktopDownload($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDesktopDownload() => $_has(9);
  @$pb.TagNumber(10)
  void clearDesktopDownload() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get guildMembershipCta => $_getBF(10);
  @$pb.TagNumber(11)
  set guildMembershipCta($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasGuildMembershipCta() => $_has(10);
  @$pb.TagNumber(11)
  void clearGuildMembershipCta() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.bool get visionaryMfa => $_getBF(11);
  @$pb.TagNumber(12)
  set visionaryMfa($core.bool value) => $_setBool(11, value);
  @$pb.TagNumber(12)
  $core.bool hasVisionaryMfa() => $_has(11);
  @$pb.TagNumber(12)
  void clearVisionaryMfa() => $_clearField(12);

  @$pb.TagNumber(14)
  $core.bool get legacyPhoneUnlink => $_getBF(12);
  @$pb.TagNumber(14)
  set legacyPhoneUnlink($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(14)
  $core.bool hasLegacyPhoneUnlink() => $_has(12);
  @$pb.TagNumber(14)
  void clearLegacyPhoneUnlink() => $_clearField(14);

  @$pb.TagNumber(15)
  $pb.PbMap<$core.String, $core.bool> get pendingBulkDeletion => $_getMap(13);

  @$pb.TagNumber(16)
  $pb.PbMap<$core.String, $core.bool> get invitesDisabled => $_getMap(14);

  @$pb.TagNumber(17)
  $pb.PbMap<$core.String, $core.bool> get guildMfaRequirement => $_getMap(15);
}

class DismissedUpsells extends $pb.GeneratedMessage {
  factory DismissedUpsells({
    $core.bool? pickerPremium,
  }) {
    final result = create();
    if (pickerPremium != null) result.pickerPremium = pickerPremium;
    return result;
  }

  DismissedUpsells._();

  factory DismissedUpsells.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DismissedUpsells.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DismissedUpsells',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'pickerPremium')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DismissedUpsells clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DismissedUpsells copyWith(void Function(DismissedUpsells) updates) =>
      super.copyWith((message) => updates(message as DismissedUpsells))
          as DismissedUpsells;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DismissedUpsells create() => DismissedUpsells._();
  @$core.override
  DismissedUpsells createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DismissedUpsells getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DismissedUpsells>(create);
  static DismissedUpsells? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get pickerPremium => $_getBF(0);
  @$pb.TagNumber(1)
  set pickerPremium($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPickerPremium() => $_has(0);
  @$pb.TagNumber(1)
  void clearPickerPremium() => $_clearField(1);
}

class GuildNsfwAgreements extends $pb.GeneratedMessage {
  factory GuildNsfwAgreements({
    $core.Iterable<$core.String>? agreedChannelIds,
    $core.Iterable<$core.String>? agreedGuildIds,
    $core.Iterable<$core.String>? agreedCategoryIds,
  }) {
    final result = create();
    if (agreedChannelIds != null)
      result.agreedChannelIds.addAll(agreedChannelIds);
    if (agreedGuildIds != null) result.agreedGuildIds.addAll(agreedGuildIds);
    if (agreedCategoryIds != null)
      result.agreedCategoryIds.addAll(agreedCategoryIds);
    return result;
  }

  GuildNsfwAgreements._();

  factory GuildNsfwAgreements.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuildNsfwAgreements.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuildNsfwAgreements',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'agreedChannelIds')
    ..pPS(2, _omitFieldNames ? '' : 'agreedGuildIds')
    ..pPS(3, _omitFieldNames ? '' : 'agreedCategoryIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildNsfwAgreements clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildNsfwAgreements copyWith(void Function(GuildNsfwAgreements) updates) =>
      super.copyWith((message) => updates(message as GuildNsfwAgreements))
          as GuildNsfwAgreements;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuildNsfwAgreements create() => GuildNsfwAgreements._();
  @$core.override
  GuildNsfwAgreements createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuildNsfwAgreements getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuildNsfwAgreements>(create);
  static GuildNsfwAgreements? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get agreedChannelIds => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get agreedGuildIds => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get agreedCategoryIds => $_getList(2);
}

class WhatsNewState extends $pb.GeneratedMessage {
  factory WhatsNewState({
    $core.String? lastDismissedEntryId,
  }) {
    final result = create();
    if (lastDismissedEntryId != null)
      result.lastDismissedEntryId = lastDismissedEntryId;
    return result;
  }

  WhatsNewState._();

  factory WhatsNewState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WhatsNewState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WhatsNewState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lastDismissedEntryId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhatsNewState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WhatsNewState copyWith(void Function(WhatsNewState) updates) =>
      super.copyWith((message) => updates(message as WhatsNewState))
          as WhatsNewState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WhatsNewState create() => WhatsNewState._();
  @$core.override
  WhatsNewState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WhatsNewState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WhatsNewState>(create);
  static WhatsNewState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lastDismissedEntryId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastDismissedEntryId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLastDismissedEntryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastDismissedEntryId() => $_clearField(1);
}

class PermissionLayoutSettings extends $pb.GeneratedMessage {
  factory PermissionLayoutSettings({
    PermissionLayoutMode? layout,
    PermissionGridMode? grid,
  }) {
    final result = create();
    if (layout != null) result.layout = layout;
    if (grid != null) result.grid = grid;
    return result;
  }

  PermissionLayoutSettings._();

  factory PermissionLayoutSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PermissionLayoutSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PermissionLayoutSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aE<PermissionLayoutMode>(1, _omitFieldNames ? '' : 'layout',
        enumValues: PermissionLayoutMode.values)
    ..aE<PermissionGridMode>(2, _omitFieldNames ? '' : 'grid',
        enumValues: PermissionGridMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionLayoutSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionLayoutSettings copyWith(
          void Function(PermissionLayoutSettings) updates) =>
      super.copyWith((message) => updates(message as PermissionLayoutSettings))
          as PermissionLayoutSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionLayoutSettings create() => PermissionLayoutSettings._();
  @$core.override
  PermissionLayoutSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PermissionLayoutSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PermissionLayoutSettings>(create);
  static PermissionLayoutSettings? _defaultInstance;

  @$pb.TagNumber(1)
  PermissionLayoutMode get layout => $_getN(0);
  @$pb.TagNumber(1)
  set layout(PermissionLayoutMode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLayout() => $_has(0);
  @$pb.TagNumber(1)
  void clearLayout() => $_clearField(1);

  @$pb.TagNumber(2)
  PermissionGridMode get grid => $_getN(1);
  @$pb.TagNumber(2)
  set grid(PermissionGridMode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGrid() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrid() => $_clearField(2);
}

class GuildMemberLayoutSettings extends $pb.GeneratedMessage {
  factory GuildMemberLayoutSettings({
    GuildMemberViewMode? mode,
  }) {
    final result = create();
    if (mode != null) result.mode = mode;
    return result;
  }

  GuildMemberLayoutSettings._();

  factory GuildMemberLayoutSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuildMemberLayoutSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuildMemberLayoutSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aE<GuildMemberViewMode>(1, _omitFieldNames ? '' : 'mode',
        enumValues: GuildMemberViewMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildMemberLayoutSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildMemberLayoutSettings copyWith(
          void Function(GuildMemberLayoutSettings) updates) =>
      super.copyWith((message) => updates(message as GuildMemberLayoutSettings))
          as GuildMemberLayoutSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuildMemberLayoutSettings create() => GuildMemberLayoutSettings._();
  @$core.override
  GuildMemberLayoutSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuildMemberLayoutSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuildMemberLayoutSettings>(create);
  static GuildMemberLayoutSettings? _defaultInstance;

  @$pb.TagNumber(1)
  GuildMemberViewMode get mode => $_getN(0);
  @$pb.TagNumber(1)
  set mode(GuildMemberViewMode value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearMode() => $_clearField(1);
}

class GuildFolderExpandedState extends $pb.GeneratedMessage {
  factory GuildFolderExpandedState({
    $core.Iterable<$fixnum.Int64>? expandedFolderIds,
  }) {
    final result = create();
    if (expandedFolderIds != null)
      result.expandedFolderIds.addAll(expandedFolderIds);
    return result;
  }

  GuildFolderExpandedState._();

  factory GuildFolderExpandedState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GuildFolderExpandedState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GuildFolderExpandedState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'expandedFolderIds', $pb.PbFieldType.KF6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildFolderExpandedState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GuildFolderExpandedState copyWith(
          void Function(GuildFolderExpandedState) updates) =>
      super.copyWith((message) => updates(message as GuildFolderExpandedState))
          as GuildFolderExpandedState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuildFolderExpandedState create() => GuildFolderExpandedState._();
  @$core.override
  GuildFolderExpandedState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GuildFolderExpandedState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuildFolderExpandedState>(create);
  static GuildFolderExpandedState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get expandedFolderIds => $_getList(0);
}

class HiddenGuildListButtons extends $pb.GeneratedMessage {
  factory HiddenGuildListButtons({
    $core.bool? downloadButton,
    $core.bool? helpButton,
  }) {
    final result = create();
    if (downloadButton != null) result.downloadButton = downloadButton;
    if (helpButton != null) result.helpButton = helpButton;
    return result;
  }

  HiddenGuildListButtons._();

  factory HiddenGuildListButtons.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HiddenGuildListButtons.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HiddenGuildListButtons',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'downloadButton')
    ..aOB(2, _omitFieldNames ? '' : 'helpButton')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HiddenGuildListButtons clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HiddenGuildListButtons copyWith(
          void Function(HiddenGuildListButtons) updates) =>
      super.copyWith((message) => updates(message as HiddenGuildListButtons))
          as HiddenGuildListButtons;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HiddenGuildListButtons create() => HiddenGuildListButtons._();
  @$core.override
  HiddenGuildListButtons createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HiddenGuildListButtons getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HiddenGuildListButtons>(create);
  static HiddenGuildListButtons? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get downloadButton => $_getBF(0);
  @$pb.TagNumber(1)
  set downloadButton($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDownloadButton() => $_has(0);
  @$pb.TagNumber(1)
  void clearDownloadButton() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get helpButton => $_getBF(1);
  @$pb.TagNumber(2)
  set helpButton($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHelpButton() => $_has(1);
  @$pb.TagNumber(2)
  void clearHelpButton() => $_clearField(2);
}

class KeyboardModeIntroState extends $pb.GeneratedMessage {
  factory KeyboardModeIntroState({
    $core.bool? seen,
  }) {
    final result = create();
    if (seen != null) result.seen = seen;
    return result;
  }

  KeyboardModeIntroState._();

  factory KeyboardModeIntroState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeyboardModeIntroState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeyboardModeIntroState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'seen')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyboardModeIntroState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeyboardModeIntroState copyWith(
          void Function(KeyboardModeIntroState) updates) =>
      super.copyWith((message) => updates(message as KeyboardModeIntroState))
          as KeyboardModeIntroState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyboardModeIntroState create() => KeyboardModeIntroState._();
  @$core.override
  KeyboardModeIntroState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeyboardModeIntroState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeyboardModeIntroState>(create);
  static KeyboardModeIntroState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get seen => $_getBF(0);
  @$pb.TagNumber(1)
  set seen($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeen() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeen() => $_clearField(1);
}

class InputMonitoringPromptsState extends $pb.GeneratedMessage {
  factory InputMonitoringPromptsState({
    $core.bool? seenCta,
  }) {
    final result = create();
    if (seenCta != null) result.seenCta = seenCta;
    return result;
  }

  InputMonitoringPromptsState._();

  factory InputMonitoringPromptsState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InputMonitoringPromptsState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InputMonitoringPromptsState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'seenCta')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputMonitoringPromptsState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InputMonitoringPromptsState copyWith(
          void Function(InputMonitoringPromptsState) updates) =>
      super.copyWith(
              (message) => updates(message as InputMonitoringPromptsState))
          as InputMonitoringPromptsState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputMonitoringPromptsState create() =>
      InputMonitoringPromptsState._();
  @$core.override
  InputMonitoringPromptsState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InputMonitoringPromptsState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InputMonitoringPromptsState>(create);
  static InputMonitoringPromptsState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get seenCta => $_getBF(0);
  @$pb.TagNumber(1)
  set seenCta($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSeenCta() => $_has(0);
  @$pb.TagNumber(1)
  void clearSeenCta() => $_clearField(1);
}

class VoicePromptsState extends $pb.GeneratedMessage {
  factory VoicePromptsState({
    $core.bool? skipHideOwnCameraConfirm,
    $core.bool? skipHideOwnScreenshareConfirm,
  }) {
    final result = create();
    if (skipHideOwnCameraConfirm != null)
      result.skipHideOwnCameraConfirm = skipHideOwnCameraConfirm;
    if (skipHideOwnScreenshareConfirm != null)
      result.skipHideOwnScreenshareConfirm = skipHideOwnScreenshareConfirm;
    return result;
  }

  VoicePromptsState._();

  factory VoicePromptsState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoicePromptsState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoicePromptsState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'skipHideOwnCameraConfirm')
    ..aOB(2, _omitFieldNames ? '' : 'skipHideOwnScreenshareConfirm')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoicePromptsState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoicePromptsState copyWith(void Function(VoicePromptsState) updates) =>
      super.copyWith((message) => updates(message as VoicePromptsState))
          as VoicePromptsState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoicePromptsState create() => VoicePromptsState._();
  @$core.override
  VoicePromptsState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VoicePromptsState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoicePromptsState>(create);
  static VoicePromptsState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get skipHideOwnCameraConfirm => $_getBF(0);
  @$pb.TagNumber(1)
  set skipHideOwnCameraConfirm($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSkipHideOwnCameraConfirm() => $_has(0);
  @$pb.TagNumber(1)
  void clearSkipHideOwnCameraConfirm() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get skipHideOwnScreenshareConfirm => $_getBF(1);
  @$pb.TagNumber(2)
  set skipHideOwnScreenshareConfirm($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSkipHideOwnScreenshareConfirm() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkipHideOwnScreenshareConfirm() => $_clearField(2);
}

class SudoPromptState extends $pb.GeneratedMessage {
  factory SudoPromptState({
    MfaMethod? lastUsedMfaMethod,
  }) {
    final result = create();
    if (lastUsedMfaMethod != null) result.lastUsedMfaMethod = lastUsedMfaMethod;
    return result;
  }

  SudoPromptState._();

  factory SudoPromptState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SudoPromptState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SudoPromptState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aE<MfaMethod>(1, _omitFieldNames ? '' : 'lastUsedMfaMethod',
        enumValues: MfaMethod.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudoPromptState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SudoPromptState copyWith(void Function(SudoPromptState) updates) =>
      super.copyWith((message) => updates(message as SudoPromptState))
          as SudoPromptState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SudoPromptState create() => SudoPromptState._();
  @$core.override
  SudoPromptState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SudoPromptState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SudoPromptState>(create);
  static SudoPromptState? _defaultInstance;

  @$pb.TagNumber(1)
  MfaMethod get lastUsedMfaMethod => $_getN(0);
  @$pb.TagNumber(1)
  set lastUsedMfaMethod(MfaMethod value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLastUsedMfaMethod() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastUsedMfaMethod() => $_clearField(1);
}

class KeybindSettings extends $pb.GeneratedMessage {
  factory KeybindSettings({
    $core.Iterable<CustomKeybind>? customKeybinds,
    $core.String? transmitMode,
    $core.int? pushToTalkReleaseDelayMs,
  }) {
    final result = create();
    if (customKeybinds != null) result.customKeybinds.addAll(customKeybinds);
    if (transmitMode != null) result.transmitMode = transmitMode;
    if (pushToTalkReleaseDelayMs != null)
      result.pushToTalkReleaseDelayMs = pushToTalkReleaseDelayMs;
    return result;
  }

  KeybindSettings._();

  factory KeybindSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeybindSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeybindSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPM<CustomKeybind>(1, _omitFieldNames ? '' : 'customKeybinds',
        subBuilder: CustomKeybind.create)
    ..aOS(2, _omitFieldNames ? '' : 'transmitMode')
    ..aI(3, _omitFieldNames ? '' : 'pushToTalkReleaseDelayMs',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeybindSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeybindSettings copyWith(void Function(KeybindSettings) updates) =>
      super.copyWith((message) => updates(message as KeybindSettings))
          as KeybindSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeybindSettings create() => KeybindSettings._();
  @$core.override
  KeybindSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeybindSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeybindSettings>(create);
  static KeybindSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CustomKeybind> get customKeybinds => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get transmitMode => $_getSZ(1);
  @$pb.TagNumber(2)
  set transmitMode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTransmitMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransmitMode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pushToTalkReleaseDelayMs => $_getIZ(2);
  @$pb.TagNumber(3)
  set pushToTalkReleaseDelayMs($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPushToTalkReleaseDelayMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearPushToTalkReleaseDelayMs() => $_clearField(3);
}

class CustomKeybind extends $pb.GeneratedMessage {
  factory CustomKeybind({
    $core.String? id,
    $core.String? action,
    KeybindCombo? combo,
    $core.bool? enabled,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (action != null) result.action = action;
    if (combo != null) result.combo = combo;
    if (enabled != null) result.enabled = enabled;
    return result;
  }

  CustomKeybind._();

  factory CustomKeybind.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomKeybind.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomKeybind',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'action')
    ..aOM<KeybindCombo>(3, _omitFieldNames ? '' : 'combo',
        subBuilder: KeybindCombo.create)
    ..aOB(4, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomKeybind clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomKeybind copyWith(void Function(CustomKeybind) updates) =>
      super.copyWith((message) => updates(message as CustomKeybind))
          as CustomKeybind;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomKeybind create() => CustomKeybind._();
  @$core.override
  CustomKeybind createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CustomKeybind getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomKeybind>(create);
  static CustomKeybind? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get action => $_getSZ(1);
  @$pb.TagNumber(2)
  set action($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => $_clearField(2);

  @$pb.TagNumber(3)
  KeybindCombo get combo => $_getN(2);
  @$pb.TagNumber(3)
  set combo(KeybindCombo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCombo() => $_has(2);
  @$pb.TagNumber(3)
  void clearCombo() => $_clearField(3);
  @$pb.TagNumber(3)
  KeybindCombo ensureCombo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get enabled => $_getBF(3);
  @$pb.TagNumber(4)
  set enabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnabled() => $_clearField(4);
}

class KeybindCombo extends $pb.GeneratedMessage {
  factory KeybindCombo({
    $core.String? key,
    $core.String? code,
    $core.bool? ctrlOrMeta,
    $core.bool? ctrl,
    $core.bool? alt,
    $core.bool? shift,
    $core.bool? meta,
    $core.bool? global,
    $core.bool? enabled,
    $core.bool? modifierOnly,
    $core.bool? bothSides,
    $core.int? mouseButton,
    $core.int? gamepadButton,
  }) {
    final result = create();
    if (key != null) result.key = key;
    if (code != null) result.code = code;
    if (ctrlOrMeta != null) result.ctrlOrMeta = ctrlOrMeta;
    if (ctrl != null) result.ctrl = ctrl;
    if (alt != null) result.alt = alt;
    if (shift != null) result.shift = shift;
    if (meta != null) result.meta = meta;
    if (global != null) result.global = global;
    if (enabled != null) result.enabled = enabled;
    if (modifierOnly != null) result.modifierOnly = modifierOnly;
    if (bothSides != null) result.bothSides = bothSides;
    if (mouseButton != null) result.mouseButton = mouseButton;
    if (gamepadButton != null) result.gamepadButton = gamepadButton;
    return result;
  }

  KeybindCombo._();

  factory KeybindCombo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory KeybindCombo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'KeybindCombo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'key')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOB(3, _omitFieldNames ? '' : 'ctrlOrMeta')
    ..aOB(4, _omitFieldNames ? '' : 'ctrl')
    ..aOB(5, _omitFieldNames ? '' : 'alt')
    ..aOB(6, _omitFieldNames ? '' : 'shift')
    ..aOB(7, _omitFieldNames ? '' : 'meta')
    ..aOB(8, _omitFieldNames ? '' : 'global')
    ..aOB(9, _omitFieldNames ? '' : 'enabled')
    ..aOB(10, _omitFieldNames ? '' : 'modifierOnly')
    ..aOB(11, _omitFieldNames ? '' : 'bothSides')
    ..aI(12, _omitFieldNames ? '' : 'mouseButton',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(13, _omitFieldNames ? '' : 'gamepadButton',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeybindCombo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  KeybindCombo copyWith(void Function(KeybindCombo) updates) =>
      super.copyWith((message) => updates(message as KeybindCombo))
          as KeybindCombo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeybindCombo create() => KeybindCombo._();
  @$core.override
  KeybindCombo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static KeybindCombo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KeybindCombo>(create);
  static KeybindCombo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get ctrlOrMeta => $_getBF(2);
  @$pb.TagNumber(3)
  set ctrlOrMeta($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCtrlOrMeta() => $_has(2);
  @$pb.TagNumber(3)
  void clearCtrlOrMeta() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get ctrl => $_getBF(3);
  @$pb.TagNumber(4)
  set ctrl($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCtrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCtrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get alt => $_getBF(4);
  @$pb.TagNumber(5)
  set alt($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAlt() => $_has(4);
  @$pb.TagNumber(5)
  void clearAlt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get shift => $_getBF(5);
  @$pb.TagNumber(6)
  set shift($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasShift() => $_has(5);
  @$pb.TagNumber(6)
  void clearShift() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get meta => $_getBF(6);
  @$pb.TagNumber(7)
  set meta($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMeta() => $_has(6);
  @$pb.TagNumber(7)
  void clearMeta() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get global => $_getBF(7);
  @$pb.TagNumber(8)
  set global($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGlobal() => $_has(7);
  @$pb.TagNumber(8)
  void clearGlobal() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get enabled => $_getBF(8);
  @$pb.TagNumber(9)
  set enabled($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEnabled() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnabled() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get modifierOnly => $_getBF(9);
  @$pb.TagNumber(10)
  set modifierOnly($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasModifierOnly() => $_has(9);
  @$pb.TagNumber(10)
  void clearModifierOnly() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.bool get bothSides => $_getBF(10);
  @$pb.TagNumber(11)
  set bothSides($core.bool value) => $_setBool(10, value);
  @$pb.TagNumber(11)
  $core.bool hasBothSides() => $_has(10);
  @$pb.TagNumber(11)
  void clearBothSides() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get mouseButton => $_getIZ(11);
  @$pb.TagNumber(12)
  set mouseButton($core.int value) => $_setUnsignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMouseButton() => $_has(11);
  @$pb.TagNumber(12)
  void clearMouseButton() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get gamepadButton => $_getIZ(12);
  @$pb.TagNumber(13)
  set gamepadButton($core.int value) => $_setUnsignedInt32(12, value);
  @$pb.TagNumber(13)
  $core.bool hasGamepadButton() => $_has(12);
  @$pb.TagNumber(13)
  void clearGamepadButton() => $_clearField(13);
}

class ChatInputSettings extends $pb.GeneratedMessage {
  factory ChatInputSettings({
    $core.bool? convertEmoticons,
    $core.bool? saveCameraCapturesToDevice,
  }) {
    final result = create();
    if (convertEmoticons != null) result.convertEmoticons = convertEmoticons;
    if (saveCameraCapturesToDevice != null)
      result.saveCameraCapturesToDevice = saveCameraCapturesToDevice;
    return result;
  }

  ChatInputSettings._();

  factory ChatInputSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChatInputSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatInputSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'convertEmoticons')
    ..aOB(2, _omitFieldNames ? '' : 'saveCameraCapturesToDevice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatInputSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChatInputSettings copyWith(void Function(ChatInputSettings) updates) =>
      super.copyWith((message) => updates(message as ChatInputSettings))
          as ChatInputSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatInputSettings create() => ChatInputSettings._();
  @$core.override
  ChatInputSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ChatInputSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatInputSettings>(create);
  static ChatInputSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get convertEmoticons => $_getBF(0);
  @$pb.TagNumber(1)
  set convertEmoticons($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConvertEmoticons() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvertEmoticons() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get saveCameraCapturesToDevice => $_getBF(1);
  @$pb.TagNumber(2)
  set saveCameraCapturesToDevice($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSaveCameraCapturesToDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearSaveCameraCapturesToDevice() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
