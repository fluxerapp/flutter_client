import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_access_icon_flags.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
const String _kAssetAnnouncement =
    'assets/images/icons/channels/announcement.svg';
const String _kAssetAnnouncementLocked =
    'assets/images/icons/channels/announcement_locked.svg';
const String _kAssetAnnouncementNsfw =
    'assets/images/icons/channels/announcement_nsfw.svg';

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
  if (type == ChannelType.guildAnnouncement) {
    return switch (overlay) {
      ChannelIconAccessOverlay.nsfw => _kAssetAnnouncementNsfw,
      ChannelIconAccessOverlay.lock => _kAssetAnnouncementLocked,
      ChannelIconAccessOverlay.noConnect => _kAssetAnnouncement,
      ChannelIconAccessOverlay.none => _kAssetAnnouncement,
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
      return SvgPicture.asset(
        asset,
        width: size,
        height: size,
        theme: SvgTheme(currentColor: resolvedColor),
      );
    }
    return PhosphorIcon(
      iconDataFor(displayType),
      size: size,
      color: resolvedColor,
    );
  }

  static PhosphorIconData iconDataFor(ChannelType type) {
    switch (type) {
      case ChannelType.guildText:
        return PhosphorIconsBold.hash;
      case ChannelType.guildAnnouncement:
        return PhosphorIconsBold.megaphone;
      case ChannelType.guildVoice:
        return PhosphorIconsFill.speakerHigh;
      case ChannelType.guildCategory:
        return PhosphorIconsFill.folder;
      case ChannelType.guildLink:
        return PhosphorIconsBold.link;
      case ChannelType.unknown:
        return PhosphorIconsBold.question;
      case ChannelType.announcementThread:
      case ChannelType.publicThread:
      case ChannelType.privateThread:
        return PhosphorIconsFill.chats;
      case ChannelType.guildForum:
        return PhosphorIconsFill.chatsCircle;
      case ChannelType.guildMedia:
        return PhosphorIconsFill.images;
      case ChannelType.dm:
      case ChannelType.groupDm:
      case ChannelType.dmPersonalNotes:
        return PhosphorIconsBold.hash;
    }
  }
}

const List<String> _kSidebarChannelAssets = <String>[
  _kAssetText,
  _kAssetTextLocked,
  _kAssetTextNsfw,
  _kAssetVoice,
  _kAssetVoiceLocked,
  _kAssetVoiceNsfw,
  _kAssetVoiceNoConnect,
  _kAssetVoiceE2ee,
  _kAssetLink,
  _kAssetLinkLocked,
  _kAssetLinkNsfw,
  _kAssetAnnouncement,
  _kAssetAnnouncementLocked,
  _kAssetAnnouncementNsfw,
];

class ChannelIconPrewarm extends StatelessWidget {
  const ChannelIconPrewarm({super.key});

  @override
  Widget build(BuildContext context) {
    final Color highlight = context.colors.textPrimary;
    final Color idle = context.colors.textTertiaryMuted;
    final List<Color> colors = <Color>[
      highlight,
      idle,
      highlight.withValues(alpha: highlight.a * 0.5),
      idle.withValues(alpha: idle.a * 0.5),
    ];
    return Offstage(
      child: Wrap(
        children: <Widget>[
          for (final Color color in colors)
            for (final String asset in _kSidebarChannelAssets)
              SvgPicture.asset(
                asset,
                width: 1,
                height: 1,
                theme: SvgTheme(currentColor: color),
              ),
        ],
      ),
    );
  }
}
