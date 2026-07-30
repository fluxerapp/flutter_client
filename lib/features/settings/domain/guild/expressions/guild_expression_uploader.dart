import 'package:fluxer_dart/export.dart';

class GuildExpressionUploader {
  const GuildExpressionUploader({
    required this.id,
    required this.username,
    this.globalName,
    this.avatar,
    this.avatarColor,
  });

  final String id;
  final String username;
  final String? globalName;
  final String? avatar;
  final int? avatarColor;

  factory GuildExpressionUploader.fromResponse(UserPartialResponse user) {
    return GuildExpressionUploader(
      id: user.id,
      username: user.username,
      globalName: user.globalName,
      avatar: user.avatar,
      avatarColor: user.avatarColor,
    );
  }
}
