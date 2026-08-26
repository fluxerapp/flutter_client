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

import 'package:protobuf/protobuf.dart' as $pb;

class PermissionLayoutMode extends $pb.ProtobufEnum {
  static const PermissionLayoutMode PERMISSION_LAYOUT_MODE_UNSPECIFIED =
      PermissionLayoutMode._(
          0, _omitEnumNames ? '' : 'PERMISSION_LAYOUT_MODE_UNSPECIFIED');
  static const PermissionLayoutMode PERMISSION_LAYOUT_MODE_COMFY =
      PermissionLayoutMode._(
          1, _omitEnumNames ? '' : 'PERMISSION_LAYOUT_MODE_COMFY');
  static const PermissionLayoutMode PERMISSION_LAYOUT_MODE_DENSE =
      PermissionLayoutMode._(
          2, _omitEnumNames ? '' : 'PERMISSION_LAYOUT_MODE_DENSE');

  static const $core.List<PermissionLayoutMode> values = <PermissionLayoutMode>[
    PERMISSION_LAYOUT_MODE_UNSPECIFIED,
    PERMISSION_LAYOUT_MODE_COMFY,
    PERMISSION_LAYOUT_MODE_DENSE,
  ];

  static final $core.List<PermissionLayoutMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PermissionLayoutMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PermissionLayoutMode._(super.value, super.name);
}

class PermissionGridMode extends $pb.ProtobufEnum {
  static const PermissionGridMode PERMISSION_GRID_MODE_UNSPECIFIED =
      PermissionGridMode._(
          0, _omitEnumNames ? '' : 'PERMISSION_GRID_MODE_UNSPECIFIED');
  static const PermissionGridMode PERMISSION_GRID_MODE_SINGLE =
      PermissionGridMode._(
          1, _omitEnumNames ? '' : 'PERMISSION_GRID_MODE_SINGLE');
  static const PermissionGridMode PERMISSION_GRID_MODE_GRID =
      PermissionGridMode._(
          2, _omitEnumNames ? '' : 'PERMISSION_GRID_MODE_GRID');

  static const $core.List<PermissionGridMode> values = <PermissionGridMode>[
    PERMISSION_GRID_MODE_UNSPECIFIED,
    PERMISSION_GRID_MODE_SINGLE,
    PERMISSION_GRID_MODE_GRID,
  ];

  static final $core.List<PermissionGridMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static PermissionGridMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PermissionGridMode._(super.value, super.name);
}

class GuildMemberViewMode extends $pb.ProtobufEnum {
  static const GuildMemberViewMode GUILD_MEMBER_VIEW_MODE_UNSPECIFIED =
      GuildMemberViewMode._(
          0, _omitEnumNames ? '' : 'GUILD_MEMBER_VIEW_MODE_UNSPECIFIED');
  static const GuildMemberViewMode GUILD_MEMBER_VIEW_MODE_TABLE =
      GuildMemberViewMode._(
          1, _omitEnumNames ? '' : 'GUILD_MEMBER_VIEW_MODE_TABLE');
  static const GuildMemberViewMode GUILD_MEMBER_VIEW_MODE_GRID =
      GuildMemberViewMode._(
          2, _omitEnumNames ? '' : 'GUILD_MEMBER_VIEW_MODE_GRID');

  static const $core.List<GuildMemberViewMode> values = <GuildMemberViewMode>[
    GUILD_MEMBER_VIEW_MODE_UNSPECIFIED,
    GUILD_MEMBER_VIEW_MODE_TABLE,
    GUILD_MEMBER_VIEW_MODE_GRID,
  ];

  static final $core.List<GuildMemberViewMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GuildMemberViewMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GuildMemberViewMode._(super.value, super.name);
}

class MfaMethod extends $pb.ProtobufEnum {
  static const MfaMethod MFA_METHOD_UNSPECIFIED =
      MfaMethod._(0, _omitEnumNames ? '' : 'MFA_METHOD_UNSPECIFIED');
  static const MfaMethod MFA_METHOD_TOTP =
      MfaMethod._(1, _omitEnumNames ? '' : 'MFA_METHOD_TOTP');
  static const MfaMethod MFA_METHOD_WEBAUTHN =
      MfaMethod._(3, _omitEnumNames ? '' : 'MFA_METHOD_WEBAUTHN');

  static const $core.List<MfaMethod> values = <MfaMethod>[
    MFA_METHOD_UNSPECIFIED,
    MFA_METHOD_TOTP,
    MFA_METHOD_WEBAUTHN,
  ];

  static final $core.List<MfaMethod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static MfaMethod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MfaMethod._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
