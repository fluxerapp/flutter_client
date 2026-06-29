import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_access_icon_flags.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Might be good to look into creating a custom font with icons embedded
const String _kAssetText = 'assets/images/icons/channels/text.svg';
const String _kAssetTextLocked = 'assets/images/icons/channels/text_locked.svg';
const String _kAssetTextNsfw = 'assets/images/icons/channels/text_nsfw.svg';
const String _kAssetVoice = 'assets/images/icons/channels/voice.svg';
const String _kAssetVoiceLocked =
    'assets/images/icons/channels/voice_locked.svg';
const String _kAssetVoiceNsfw = 'assets/images/icons/channels/voice_nsfw.svg';
const String _kAssetVoiceNoConnect =
    'assets/images/icons/channels/voice_no_connect.svg';
const String _kAssetVoiceE2ee = 'assets/images/icons/channels/voice_e2ee.svg';
const String _kAssetLink = 'assets/images/icons/channels/link.svg';
const String _kAssetLinkLocked = 'assets/images/icons/channels/link_locked.svg';
const String _kAssetLinkNsfw = 'assets/images/icons/channels/link_nsfw.svg';

enum ChannelIconAccessOverlay { none, nsfw, lock, noConnect }

ChannelIconAccessOverlay resolveChannelIconAccessOverlay({
  required Channel channel,
  int? effectivePermissionBits,
  int? canConnectPermissionBits,
}) {
  if (channel.isCategory) {
    return ChannelIconAccessOverlay.none;
  }
  if (channel.nsfw) {
    return ChannelIconAccessOverlay.nsfw;
  }
  final bool isVoiceLike = channel.type == ChannelType.guildVoice;
  final int? connectBits = canConnectPermissionBits ?? effectivePermissionBits;
  if (isVoiceLike &&
      connectBits != null &&
      !hasPermission(connectBits, Permission.connect)) {
    return ChannelIconAccessOverlay.noConnect;
  }
  final bool skipEveryonePrivateLockForVoiceIcon =
      isVoiceLike &&
      (connectBits == null || hasPermission(connectBits, Permission.connect));
  if (!skipEveryonePrivateLockForVoiceIcon &&
      isChannelEveryonePrivateForIcon(
        type: channel.type,
        guildId: channel.guildId,
        permissionOverwritesJson: channel.permissionOverwritesJson,
      )) {
    return ChannelIconAccessOverlay.lock;
  }
  return ChannelIconAccessOverlay.none;
}

String? _svgAssetForChannelVisual({
  required ChannelType type,
  required ChannelIconAccessOverlay overlay,
  bool e2eeEncrypted = false,
}) {
  if (type == ChannelType.guildCategory) {
    return null;
  }
  if (type == ChannelType.guildText) {
    return switch (overlay) {
      ChannelIconAccessOverlay.nsfw => _kAssetTextNsfw,
      ChannelIconAccessOverlay.lock => _kAssetTextLocked,
      ChannelIconAccessOverlay.noConnect => _kAssetText,
      ChannelIconAccessOverlay.none => _kAssetText,
    };
  }
  if (type == ChannelType.guildVoice) {
    if (e2eeEncrypted) {
      return _kAssetVoiceE2ee;
    }
    return switch (overlay) {
      ChannelIconAccessOverlay.nsfw => _kAssetVoiceNsfw,
      ChannelIconAccessOverlay.noConnect => _kAssetVoiceNoConnect,
      ChannelIconAccessOverlay.lock => _kAssetVoiceLocked,
      ChannelIconAccessOverlay.none => _kAssetVoice,
    };
  }
  if (type == ChannelType.guildLink) {
    return switch (overlay) {
      ChannelIconAccessOverlay.nsfw => _kAssetLinkNsfw,
      ChannelIconAccessOverlay.lock => _kAssetLinkLocked,
      ChannelIconAccessOverlay.noConnect => _kAssetLink,
      ChannelIconAccessOverlay.none => _kAssetLink,
    };
  }
  return null;
}

class ChannelIcon extends StatelessWidget {
  final ChannelType type;
  final Channel? channel;
  final int? effectivePermissionBits;
  final int? canConnectPermissionBits;
  final double size;
  final Color? color;
  final bool e2eeEncrypted;

  const ChannelIcon({
    required this.type,
    this.channel,
    this.effectivePermissionBits,
    this.canConnectPermissionBits,
    this.size = 20,
    this.color,
    this.e2eeEncrypted = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color resolvedColor = color ?? context.colors.textTertiary;
    final ChannelType displayType = channel?.type ?? type;
    final ChannelIconAccessOverlay overlay = channel == null
        ? ChannelIconAccessOverlay.none
        : resolveChannelIconAccessOverlay(
            channel: channel!,
            effectivePermissionBits: effectivePermissionBits,
            canConnectPermissionBits: canConnectPermissionBits,
          );
    final String? asset = _svgAssetForChannelVisual(
      type: displayType,
      overlay: overlay,
      e2eeEncrypted: e2eeEncrypted,
    );
    if (asset != null) {
      // Channel SVGs all use fill="currentColor"; tint via SvgTheme so the
      // color is baked into the decoded picture at parse time. A runtime
      // colorFilter would instead force vector_graphics to saveLayer on every
      // icon paint (RenderPictureVectorGraphic.paint), which dominated raster
      // time while scrolling the channel list.
      return SvgPicture.asset(
        asset,
        width: size,
        height: size,
        theme: SvgTheme(currentColor: resolvedColor),
      );
    }
    // Backup Icon
    return PhosphorIcon(
      iconDataFor(displayType),
      size: size,
      color: resolvedColor,
    );
  }

  static PhosphorIconData iconDataFor(ChannelType type) {
    switch (type) {
      case ChannelType.guildText:
        return PhosphorIconsRegular.hash;
      case ChannelType.guildVoice:
        return PhosphorIconsFill.speakerHigh;
      case ChannelType.guildCategory:
        return PhosphorIconsFill.folder;
      case ChannelType.guildLink:
        return PhosphorIconsRegular.link;
      case ChannelType.dm:
      case ChannelType.groupDm:
      case ChannelType.dmPersonalNotes:
        return PhosphorIconsRegular.hash;
    }
  }
}
