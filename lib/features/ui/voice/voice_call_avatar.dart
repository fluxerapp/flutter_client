import 'dart:math' as math;

import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_snap.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

class VoiceCallAvatar extends StatelessWidget {
  const VoiceCallAvatar({
    required this.background,
    required this.userId,
    this.user,
    this.userDisplay,
    this.fallbackText,
    super.key,
  });

  final Color background;
  final String userId;
  final database.User? user;
  final GuildUserDisplay? userDisplay;
  final String? fallbackText;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double shortest = math.min(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          final double size = voiceTileAvatarSize(shortest);
          return Center(child: _avatar(size));
        },
      ),
    );
  }

  Widget _avatar(double size) {
    final GuildUserDisplay? display = userDisplay;
    if (display != null) {
      return FluxerAvatar.user(
        userId: userId,
        fallbackText: display.displayName,
        imageUrl: display.avatarUrl,
        avatarColor: display.avatarColor,
        size: size,
        showStatus: false,
      );
    }
    if (user != null) {
      return FluxerAvatar.fromUserRow(user!, size: size, showStatus: false);
    }
    return FluxerAvatar.user(
      userId: userId,
      fallbackText: fallbackText,
      size: size,
      showStatus: false,
    );
  }
}
