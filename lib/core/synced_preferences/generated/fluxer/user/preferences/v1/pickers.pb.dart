// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/pickers.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'pickers.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'pickers.pbenum.dart';

class UsageStat extends $pb.GeneratedMessage {
  factory UsageStat({
    $core.int? count,
    $fixnum.Int64? lastUsedMs,
  }) {
    final result = create();
    if (count != null) result.count = count;
    if (lastUsedMs != null) result.lastUsedMs = lastUsedMs;
    return result;
  }

  UsageStat._();

  factory UsageStat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UsageStat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UsageStat',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'count', fieldType: $pb.PbFieldType.OU3)
    ..aInt64(2, _omitFieldNames ? '' : 'lastUsedMs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsageStat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UsageStat copyWith(void Function(UsageStat) updates) =>
      super.copyWith((message) => updates(message as UsageStat)) as UsageStat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UsageStat create() => UsageStat._();
  @$core.override
  UsageStat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UsageStat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UsageStat>(create);
  static UsageStat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastUsedMs => $_getI64(1);
  @$pb.TagNumber(2)
  set lastUsedMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastUsedMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUsedMs() => $_clearField(2);
}

class EmojiPickerState extends $pb.GeneratedMessage {
  factory EmojiPickerState({
    $core.Iterable<$core.MapEntry<$core.String, UsageStat>>? usage,
    $core.Iterable<$core.String>? favoriteEmojiIds,
    $core.Iterable<$core.String>? collapsedCategoryIds,
  }) {
    final result = create();
    if (usage != null) result.usage.addEntries(usage);
    if (favoriteEmojiIds != null)
      result.favoriteEmojiIds.addAll(favoriteEmojiIds);
    if (collapsedCategoryIds != null)
      result.collapsedCategoryIds.addAll(collapsedCategoryIds);
    return result;
  }

  EmojiPickerState._();

  factory EmojiPickerState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmojiPickerState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmojiPickerState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..m<$core.String, UsageStat>(1, _omitFieldNames ? '' : 'usage',
        entryClassName: 'EmojiPickerState.UsageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: UsageStat.create,
        valueDefaultOrMaker: UsageStat.getDefault,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..pPS(2, _omitFieldNames ? '' : 'favoriteEmojiIds')
    ..pPS(3, _omitFieldNames ? '' : 'collapsedCategoryIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiPickerState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiPickerState copyWith(void Function(EmojiPickerState) updates) =>
      super.copyWith((message) => updates(message as EmojiPickerState))
          as EmojiPickerState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmojiPickerState create() => EmojiPickerState._();
  @$core.override
  EmojiPickerState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmojiPickerState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmojiPickerState>(create);
  static EmojiPickerState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, UsageStat> get usage => $_getMap(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get favoriteEmojiIds => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get collapsedCategoryIds => $_getList(2);
}

class StickerPickerState extends $pb.GeneratedMessage {
  factory StickerPickerState({
    $core.Iterable<$core.MapEntry<$core.String, UsageStat>>? usage,
    $core.Iterable<$core.String>? favoriteStickerIds,
    $core.Iterable<$core.String>? collapsedCategoryIds,
  }) {
    final result = create();
    if (usage != null) result.usage.addEntries(usage);
    if (favoriteStickerIds != null)
      result.favoriteStickerIds.addAll(favoriteStickerIds);
    if (collapsedCategoryIds != null)
      result.collapsedCategoryIds.addAll(collapsedCategoryIds);
    return result;
  }

  StickerPickerState._();

  factory StickerPickerState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StickerPickerState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StickerPickerState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..m<$core.String, UsageStat>(1, _omitFieldNames ? '' : 'usage',
        entryClassName: 'StickerPickerState.UsageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: UsageStat.create,
        valueDefaultOrMaker: UsageStat.getDefault,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..pPS(2, _omitFieldNames ? '' : 'favoriteStickerIds')
    ..pPS(3, _omitFieldNames ? '' : 'collapsedCategoryIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StickerPickerState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StickerPickerState copyWith(void Function(StickerPickerState) updates) =>
      super.copyWith((message) => updates(message as StickerPickerState))
          as StickerPickerState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StickerPickerState create() => StickerPickerState._();
  @$core.override
  StickerPickerState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StickerPickerState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StickerPickerState>(create);
  static StickerPickerState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, UsageStat> get usage => $_getMap(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get favoriteStickerIds => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get collapsedCategoryIds => $_getList(2);
}

class MemesPickerState extends $pb.GeneratedMessage {
  factory MemesPickerState({
    $core.Iterable<$core.MapEntry<$core.String, UsageStat>>? usage,
    $core.Iterable<$core.String>? favoriteMemeIds,
    $core.Iterable<$core.String>? collapsedCategoryIds,
  }) {
    final result = create();
    if (usage != null) result.usage.addEntries(usage);
    if (favoriteMemeIds != null) result.favoriteMemeIds.addAll(favoriteMemeIds);
    if (collapsedCategoryIds != null)
      result.collapsedCategoryIds.addAll(collapsedCategoryIds);
    return result;
  }

  MemesPickerState._();

  factory MemesPickerState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MemesPickerState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MemesPickerState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..m<$core.String, UsageStat>(1, _omitFieldNames ? '' : 'usage',
        entryClassName: 'MemesPickerState.UsageEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: UsageStat.create,
        valueDefaultOrMaker: UsageStat.getDefault,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..pPS(2, _omitFieldNames ? '' : 'favoriteMemeIds')
    ..pPS(3, _omitFieldNames ? '' : 'collapsedCategoryIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemesPickerState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MemesPickerState copyWith(void Function(MemesPickerState) updates) =>
      super.copyWith((message) => updates(message as MemesPickerState))
          as MemesPickerState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemesPickerState create() => MemesPickerState._();
  @$core.override
  MemesPickerState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MemesPickerState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MemesPickerState>(create);
  static MemesPickerState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, UsageStat> get usage => $_getMap(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get favoriteMemeIds => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get collapsedCategoryIds => $_getList(2);
}

class EmojiState extends $pb.GeneratedMessage {
  factory EmojiState({
    $core.String? skinTone,
  }) {
    final result = create();
    if (skinTone != null) result.skinTone = skinTone;
    return result;
  }

  EmojiState._();

  factory EmojiState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmojiState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmojiState',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'skinTone')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiState copyWith(void Function(EmojiState) updates) =>
      super.copyWith((message) => updates(message as EmojiState)) as EmojiState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmojiState create() => EmojiState._();
  @$core.override
  EmojiState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmojiState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmojiState>(create);
  static EmojiState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get skinTone => $_getSZ(0);
  @$pb.TagNumber(1)
  set skinTone($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSkinTone() => $_has(0);
  @$pb.TagNumber(1)
  void clearSkinTone() => $_clearField(1);
}

class EmojiStickerLayoutSettings extends $pb.GeneratedMessage {
  factory EmojiStickerLayoutSettings({
    EmojiPickerLayout? emojiLayout,
    StickerPickerViewMode? stickerViewMode,
  }) {
    final result = create();
    if (emojiLayout != null) result.emojiLayout = emojiLayout;
    if (stickerViewMode != null) result.stickerViewMode = stickerViewMode;
    return result;
  }

  EmojiStickerLayoutSettings._();

  factory EmojiStickerLayoutSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmojiStickerLayoutSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmojiStickerLayoutSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aE<EmojiPickerLayout>(1, _omitFieldNames ? '' : 'emojiLayout',
        enumValues: EmojiPickerLayout.values)
    ..aE<StickerPickerViewMode>(2, _omitFieldNames ? '' : 'stickerViewMode',
        enumValues: StickerPickerViewMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiStickerLayoutSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmojiStickerLayoutSettings copyWith(
          void Function(EmojiStickerLayoutSettings) updates) =>
      super.copyWith(
              (message) => updates(message as EmojiStickerLayoutSettings))
          as EmojiStickerLayoutSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmojiStickerLayoutSettings create() => EmojiStickerLayoutSettings._();
  @$core.override
  EmojiStickerLayoutSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmojiStickerLayoutSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmojiStickerLayoutSettings>(create);
  static EmojiStickerLayoutSettings? _defaultInstance;

  @$pb.TagNumber(1)
  EmojiPickerLayout get emojiLayout => $_getN(0);
  @$pb.TagNumber(1)
  set emojiLayout(EmojiPickerLayout value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasEmojiLayout() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmojiLayout() => $_clearField(1);

  @$pb.TagNumber(2)
  StickerPickerViewMode get stickerViewMode => $_getN(1);
  @$pb.TagNumber(2)
  set stickerViewMode(StickerPickerViewMode value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStickerViewMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStickerViewMode() => $_clearField(2);
}

class FavoriteGifSettings extends $pb.GeneratedMessage {
  factory FavoriteGifSettings({
    $core.Iterable<FavoriteGifEntry>? entries,
    $core.bool? saveAsSavedMedia,
    $core.bool? seenFirstTimePrompt,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (saveAsSavedMedia != null) result.saveAsSavedMedia = saveAsSavedMedia;
    if (seenFirstTimePrompt != null)
      result.seenFirstTimePrompt = seenFirstTimePrompt;
    return result;
  }

  FavoriteGifSettings._();

  factory FavoriteGifSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteGifSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteGifSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..pPM<FavoriteGifEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: FavoriteGifEntry.create)
    ..aOB(2, _omitFieldNames ? '' : 'saveAsSavedMedia')
    ..aOB(3, _omitFieldNames ? '' : 'seenFirstTimePrompt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifSettings copyWith(void Function(FavoriteGifSettings) updates) =>
      super.copyWith((message) => updates(message as FavoriteGifSettings))
          as FavoriteGifSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteGifSettings create() => FavoriteGifSettings._();
  @$core.override
  FavoriteGifSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoriteGifSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteGifSettings>(create);
  static FavoriteGifSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<FavoriteGifEntry> get entries => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get saveAsSavedMedia => $_getBF(1);
  @$pb.TagNumber(2)
  set saveAsSavedMedia($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSaveAsSavedMedia() => $_has(1);
  @$pb.TagNumber(2)
  void clearSaveAsSavedMedia() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get seenFirstTimePrompt => $_getBF(2);
  @$pb.TagNumber(3)
  set seenFirstTimePrompt($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSeenFirstTimePrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeenFirstTimePrompt() => $_clearField(3);
}

class FavoriteGifMediaFormat extends $pb.GeneratedMessage {
  factory FavoriteGifMediaFormat({
    $core.String? src,
    $core.String? proxySrc,
    $core.int? width,
    $core.int? height,
  }) {
    final result = create();
    if (src != null) result.src = src;
    if (proxySrc != null) result.proxySrc = proxySrc;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    return result;
  }

  FavoriteGifMediaFormat._();

  factory FavoriteGifMediaFormat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteGifMediaFormat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteGifMediaFormat',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'src')
    ..aOS(2, _omitFieldNames ? '' : 'proxySrc')
    ..aI(3, _omitFieldNames ? '' : 'width', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'height', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifMediaFormat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifMediaFormat copyWith(
          void Function(FavoriteGifMediaFormat) updates) =>
      super.copyWith((message) => updates(message as FavoriteGifMediaFormat))
          as FavoriteGifMediaFormat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteGifMediaFormat create() => FavoriteGifMediaFormat._();
  @$core.override
  FavoriteGifMediaFormat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoriteGifMediaFormat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteGifMediaFormat>(create);
  static FavoriteGifMediaFormat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get src => $_getSZ(0);
  @$pb.TagNumber(1)
  set src($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSrc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSrc() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get proxySrc => $_getSZ(1);
  @$pb.TagNumber(2)
  set proxySrc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProxySrc() => $_has(1);
  @$pb.TagNumber(2)
  void clearProxySrc() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);
}

class FavoriteGifEntry extends $pb.GeneratedMessage {
  factory FavoriteGifEntry({
    $core.String? url,
    $core.String? proxyUrl,
    $core.int? width,
    $core.int? height,
    $core.Iterable<$core.MapEntry<$core.String, FavoriteGifMediaFormat>>? media,
    $core.String? contentType,
    $core.String? placeholder,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (proxyUrl != null) result.proxyUrl = proxyUrl;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (media != null) result.media.addEntries(media);
    if (contentType != null) result.contentType = contentType;
    if (placeholder != null) result.placeholder = placeholder;
    return result;
  }

  FavoriteGifEntry._();

  factory FavoriteGifEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FavoriteGifEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FavoriteGifEntry',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'proxyUrl')
    ..aI(3, _omitFieldNames ? '' : 'width', fieldType: $pb.PbFieldType.OU3)
    ..aI(4, _omitFieldNames ? '' : 'height', fieldType: $pb.PbFieldType.OU3)
    ..m<$core.String, FavoriteGifMediaFormat>(5, _omitFieldNames ? '' : 'media',
        entryClassName: 'FavoriteGifEntry.MediaEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: FavoriteGifMediaFormat.create,
        valueDefaultOrMaker: FavoriteGifMediaFormat.getDefault,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..aOS(6, _omitFieldNames ? '' : 'contentType')
    ..aOS(7, _omitFieldNames ? '' : 'placeholder')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FavoriteGifEntry copyWith(void Function(FavoriteGifEntry) updates) =>
      super.copyWith((message) => updates(message as FavoriteGifEntry))
          as FavoriteGifEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FavoriteGifEntry create() => FavoriteGifEntry._();
  @$core.override
  FavoriteGifEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FavoriteGifEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FavoriteGifEntry>(create);
  static FavoriteGifEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get proxyUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set proxyUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProxyUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearProxyUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, FavoriteGifMediaFormat> get media => $_getMap(4);

  @$pb.TagNumber(6)
  $core.String get contentType => $_getSZ(5);
  @$pb.TagNumber(6)
  set contentType($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get placeholder => $_getSZ(6);
  @$pb.TagNumber(7)
  set placeholder($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPlaceholder() => $_has(6);
  @$pb.TagNumber(7)
  void clearPlaceholder() => $_clearField(7);
}

class SoundSettings extends $pb.GeneratedMessage {
  factory SoundSettings({
    $core.bool? allSoundsDisabled,
    $core.double? masterVolume,
    $core.Iterable<$core.MapEntry<$core.String, $core.bool>>? disabledSounds,
    $core.Iterable<$core.MapEntry<$core.String, $core.double>>? soundOverrides,
  }) {
    final result = create();
    if (allSoundsDisabled != null) result.allSoundsDisabled = allSoundsDisabled;
    if (masterVolume != null) result.masterVolume = masterVolume;
    if (disabledSounds != null)
      result.disabledSounds.addEntries(disabledSounds);
    if (soundOverrides != null)
      result.soundOverrides.addEntries(soundOverrides);
    return result;
  }

  SoundSettings._();

  factory SoundSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SoundSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SoundSettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allSoundsDisabled')
    ..aD(2, _omitFieldNames ? '' : 'masterVolume')
    ..m<$core.String, $core.bool>(3, _omitFieldNames ? '' : 'disabledSounds',
        entryClassName: 'SoundSettings.DisabledSoundsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OB,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..m<$core.String, $core.double>(4, _omitFieldNames ? '' : 'soundOverrides',
        entryClassName: 'SoundSettings.SoundOverridesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OD,
        packageName: const $pb.PackageName('fluxer.user.preferences.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoundSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SoundSettings copyWith(void Function(SoundSettings) updates) =>
      super.copyWith((message) => updates(message as SoundSettings))
          as SoundSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SoundSettings create() => SoundSettings._();
  @$core.override
  SoundSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SoundSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SoundSettings>(create);
  static SoundSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allSoundsDisabled => $_getBF(0);
  @$pb.TagNumber(1)
  set allSoundsDisabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAllSoundsDisabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllSoundsDisabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get masterVolume => $_getN(1);
  @$pb.TagNumber(2)
  set masterVolume($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMasterVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearMasterVolume() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.bool> get disabledSounds => $_getMap(2);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.double> get soundOverrides => $_getMap(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
