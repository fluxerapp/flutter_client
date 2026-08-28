import 'dart:math' as math;

import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_snap.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallAvatar extends StatelessWidget {
  const VoiceCallAvatar({
    required this.background,
    required this.userId,
    this.user,
    this.fallbackText,
    super.key,
  });

  final Color background;
  final String userId;
  final database.User? user;
  final String? fallbackText;

  @override
  Widget build(BuildContext context) {
    final Widget avatar = user != null
        ? FluxerAvatar.fromUserRow(
            user!,
            size: kVoiceTileAvatarSize,
            showStatus: false,
          )
        : FluxerAvatar.user(
            userId: userId,
            fallbackText: fallbackText,
            size: kVoiceTileAvatarSize,
            showStatus: false,
          );
    return ColoredBox(
      color: background,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double shortest = math.min(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          final double display = voiceTileAvatarSize(shortest);
          return Center(
            child: Transform.scale(
              scale: display / kVoiceTileAvatarSize,
              child: avatar,
            ),
          );
        },
      ),
    );
  }
}
