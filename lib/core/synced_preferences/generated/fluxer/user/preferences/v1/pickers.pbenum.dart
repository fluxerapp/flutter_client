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

import 'package:protobuf/protobuf.dart' as $pb;

class EmojiPickerLayout extends $pb.ProtobufEnum {
  static const EmojiPickerLayout EMOJI_PICKER_LAYOUT_UNSPECIFIED =
      EmojiPickerLayout._(
          0, _omitEnumNames ? '' : 'EMOJI_PICKER_LAYOUT_UNSPECIFIED');
  static const EmojiPickerLayout EMOJI_PICKER_LAYOUT_LIST =
      EmojiPickerLayout._(1, _omitEnumNames ? '' : 'EMOJI_PICKER_LAYOUT_LIST');
  static const EmojiPickerLayout EMOJI_PICKER_LAYOUT_GRID =
      EmojiPickerLayout._(2, _omitEnumNames ? '' : 'EMOJI_PICKER_LAYOUT_GRID');

  static const $core.List<EmojiPickerLayout> values = <EmojiPickerLayout>[
    EMOJI_PICKER_LAYOUT_UNSPECIFIED,
    EMOJI_PICKER_LAYOUT_LIST,
    EMOJI_PICKER_LAYOUT_GRID,
  ];

  static final $core.List<EmojiPickerLayout?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static EmojiPickerLayout? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const EmojiPickerLayout._(super.value, super.name);
}

class StickerPickerViewMode extends $pb.ProtobufEnum {
  static const StickerPickerViewMode STICKER_PICKER_VIEW_MODE_UNSPECIFIED =
      StickerPickerViewMode._(
          0, _omitEnumNames ? '' : 'STICKER_PICKER_VIEW_MODE_UNSPECIFIED');
  static const StickerPickerViewMode STICKER_PICKER_VIEW_MODE_COZY =
      StickerPickerViewMode._(
          1, _omitEnumNames ? '' : 'STICKER_PICKER_VIEW_MODE_COZY');
  static const StickerPickerViewMode STICKER_PICKER_VIEW_MODE_COMPACT =
      StickerPickerViewMode._(
          2, _omitEnumNames ? '' : 'STICKER_PICKER_VIEW_MODE_COMPACT');

  static const $core.List<StickerPickerViewMode> values =
      <StickerPickerViewMode>[
    STICKER_PICKER_VIEW_MODE_UNSPECIFIED,
    STICKER_PICKER_VIEW_MODE_COZY,
    STICKER_PICKER_VIEW_MODE_COMPACT,
  ];

  static final $core.List<StickerPickerViewMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static StickerPickerViewMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StickerPickerViewMode._(super.value, super.name);
}

class SoundType extends $pb.ProtobufEnum {
  static const SoundType SOUND_TYPE_UNSPECIFIED =
      SoundType._(0, _omitEnumNames ? '' : 'SOUND_TYPE_UNSPECIFIED');
  static const SoundType SOUND_TYPE_DEAF =
      SoundType._(1, _omitEnumNames ? '' : 'SOUND_TYPE_DEAF');
  static const SoundType SOUND_TYPE_UNDEAF =
      SoundType._(2, _omitEnumNames ? '' : 'SOUND_TYPE_UNDEAF');
  static const SoundType SOUND_TYPE_MUTE =
      SoundType._(3, _omitEnumNames ? '' : 'SOUND_TYPE_MUTE');
  static const SoundType SOUND_TYPE_UNMUTE =
      SoundType._(4, _omitEnumNames ? '' : 'SOUND_TYPE_UNMUTE');
  static const SoundType SOUND_TYPE_MESSAGE =
      SoundType._(5, _omitEnumNames ? '' : 'SOUND_TYPE_MESSAGE');
  static const SoundType SOUND_TYPE_INCOMING_RING =
      SoundType._(6, _omitEnumNames ? '' : 'SOUND_TYPE_INCOMING_RING');
  static const SoundType SOUND_TYPE_USER_JOIN =
      SoundType._(7, _omitEnumNames ? '' : 'SOUND_TYPE_USER_JOIN');
  static const SoundType SOUND_TYPE_USER_LEAVE =
      SoundType._(8, _omitEnumNames ? '' : 'SOUND_TYPE_USER_LEAVE');
  static const SoundType SOUND_TYPE_USER_MOVE =
      SoundType._(9, _omitEnumNames ? '' : 'SOUND_TYPE_USER_MOVE');
  static const SoundType SOUND_TYPE_VIEWER_JOIN =
      SoundType._(10, _omitEnumNames ? '' : 'SOUND_TYPE_VIEWER_JOIN');
  static const SoundType SOUND_TYPE_VIEWER_LEAVE =
      SoundType._(11, _omitEnumNames ? '' : 'SOUND_TYPE_VIEWER_LEAVE');
  static const SoundType SOUND_TYPE_VOICE_DISCONNECT =
      SoundType._(12, _omitEnumNames ? '' : 'SOUND_TYPE_VOICE_DISCONNECT');
  static const SoundType SOUND_TYPE_CAMERA_ON =
      SoundType._(13, _omitEnumNames ? '' : 'SOUND_TYPE_CAMERA_ON');
  static const SoundType SOUND_TYPE_CAMERA_OFF =
      SoundType._(14, _omitEnumNames ? '' : 'SOUND_TYPE_CAMERA_OFF');
  static const SoundType SOUND_TYPE_SCREEN_SHARE_START =
      SoundType._(15, _omitEnumNames ? '' : 'SOUND_TYPE_SCREEN_SHARE_START');
  static const SoundType SOUND_TYPE_SCREEN_SHARE_STOP =
      SoundType._(16, _omitEnumNames ? '' : 'SOUND_TYPE_SCREEN_SHARE_STOP');

  static const $core.List<SoundType> values = <SoundType>[
    SOUND_TYPE_UNSPECIFIED,
    SOUND_TYPE_DEAF,
    SOUND_TYPE_UNDEAF,
    SOUND_TYPE_MUTE,
    SOUND_TYPE_UNMUTE,
    SOUND_TYPE_MESSAGE,
    SOUND_TYPE_INCOMING_RING,
    SOUND_TYPE_USER_JOIN,
    SOUND_TYPE_USER_LEAVE,
    SOUND_TYPE_USER_MOVE,
    SOUND_TYPE_VIEWER_JOIN,
    SOUND_TYPE_VIEWER_LEAVE,
    SOUND_TYPE_VOICE_DISCONNECT,
    SOUND_TYPE_CAMERA_ON,
    SOUND_TYPE_CAMERA_OFF,
    SOUND_TYPE_SCREEN_SHARE_START,
    SOUND_TYPE_SCREEN_SHARE_STOP,
  ];

  static final $core.List<SoundType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 16);
  static SoundType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SoundType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
