// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/accessibility.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChannelTypingIndicatorMode extends $pb.ProtobufEnum {
  static const ChannelTypingIndicatorMode
      CHANNEL_TYPING_INDICATOR_MODE_UNSPECIFIED = ChannelTypingIndicatorMode._(
          0, _omitEnumNames ? '' : 'CHANNEL_TYPING_INDICATOR_MODE_UNSPECIFIED');
  static const ChannelTypingIndicatorMode
      CHANNEL_TYPING_INDICATOR_MODE_AVATARS = ChannelTypingIndicatorMode._(
          1, _omitEnumNames ? '' : 'CHANNEL_TYPING_INDICATOR_MODE_AVATARS');
  static const ChannelTypingIndicatorMode
      CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY =
      ChannelTypingIndicatorMode._(2,
          _omitEnumNames ? '' : 'CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY');
  static const ChannelTypingIndicatorMode CHANNEL_TYPING_INDICATOR_MODE_HIDDEN =
      ChannelTypingIndicatorMode._(
          3, _omitEnumNames ? '' : 'CHANNEL_TYPING_INDICATOR_MODE_HIDDEN');

  static const $core.List<ChannelTypingIndicatorMode> values =
      <ChannelTypingIndicatorMode>[
    CHANNEL_TYPING_INDICATOR_MODE_UNSPECIFIED,
    CHANNEL_TYPING_INDICATOR_MODE_AVATARS,
    CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY,
    CHANNEL_TYPING_INDICATOR_MODE_HIDDEN,
  ];

  static final $core.List<ChannelTypingIndicatorMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ChannelTypingIndicatorMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ChannelTypingIndicatorMode._(super.value, super.name);
}

class MediaDimensionSize extends $pb.ProtobufEnum {
  static const MediaDimensionSize MEDIA_DIMENSION_SIZE_UNSPECIFIED =
      MediaDimensionSize._(
          0, _omitEnumNames ? '' : 'MEDIA_DIMENSION_SIZE_UNSPECIFIED');
  static const MediaDimensionSize MEDIA_DIMENSION_SIZE_SMALL =
      MediaDimensionSize._(
          1, _omitEnumNames ? '' : 'MEDIA_DIMENSION_SIZE_SMALL');
  static const MediaDimensionSize MEDIA_DIMENSION_SIZE_LARGE =
      MediaDimensionSize._(
          2, _omitEnumNames ? '' : 'MEDIA_DIMENSION_SIZE_LARGE');

  static const $core.List<MediaDimensionSize> values = <MediaDimensionSize>[
    MEDIA_DIMENSION_SIZE_UNSPECIFIED,
    MEDIA_DIMENSION_SIZE_SMALL,
    MEDIA_DIMENSION_SIZE_LARGE,
  ];

  static final $core.List<MediaDimensionSize?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static MediaDimensionSize? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MediaDimensionSize._(super.value, super.name);
}

class DmMessagePreviewMode extends $pb.ProtobufEnum {
  static const DmMessagePreviewMode DM_MESSAGE_PREVIEW_MODE_UNSPECIFIED =
      DmMessagePreviewMode._(
          0, _omitEnumNames ? '' : 'DM_MESSAGE_PREVIEW_MODE_UNSPECIFIED');
  static const DmMessagePreviewMode DM_MESSAGE_PREVIEW_MODE_ALL =
      DmMessagePreviewMode._(
          1, _omitEnumNames ? '' : 'DM_MESSAGE_PREVIEW_MODE_ALL');
  static const DmMessagePreviewMode DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY =
      DmMessagePreviewMode._(
          2, _omitEnumNames ? '' : 'DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY');
  static const DmMessagePreviewMode DM_MESSAGE_PREVIEW_MODE_NONE =
      DmMessagePreviewMode._(
          3, _omitEnumNames ? '' : 'DM_MESSAGE_PREVIEW_MODE_NONE');

  static const $core.List<DmMessagePreviewMode> values = <DmMessagePreviewMode>[
    DM_MESSAGE_PREVIEW_MODE_UNSPECIFIED,
    DM_MESSAGE_PREVIEW_MODE_ALL,
    DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY,
    DM_MESSAGE_PREVIEW_MODE_NONE,
  ];

  static final $core.List<DmMessagePreviewMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static DmMessagePreviewMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DmMessagePreviewMode._(super.value, super.name);
}

class HdrDisplayMode extends $pb.ProtobufEnum {
  static const HdrDisplayMode HDR_DISPLAY_MODE_UNSPECIFIED =
      HdrDisplayMode._(0, _omitEnumNames ? '' : 'HDR_DISPLAY_MODE_UNSPECIFIED');
  static const HdrDisplayMode HDR_DISPLAY_MODE_FULL =
      HdrDisplayMode._(1, _omitEnumNames ? '' : 'HDR_DISPLAY_MODE_FULL');
  static const HdrDisplayMode HDR_DISPLAY_MODE_STANDARD =
      HdrDisplayMode._(2, _omitEnumNames ? '' : 'HDR_DISPLAY_MODE_STANDARD');

  static const $core.List<HdrDisplayMode> values = <HdrDisplayMode>[
    HDR_DISPLAY_MODE_UNSPECIFIED,
    HDR_DISPLAY_MODE_FULL,
    HDR_DISPLAY_MODE_STANDARD,
  ];

  static final $core.List<HdrDisplayMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static HdrDisplayMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const HdrDisplayMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
