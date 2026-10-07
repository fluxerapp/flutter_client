import 'package:fluxer_dart/export.dart';

class GuildExpressionUploader {
  const GuildExpressionUploader({
    required this.id,
    required this.username,
    this.globalName,
  });

  final String id;
  final String username;
  final String? globalName;

  factory GuildExpressionUploader.fromResponse(UserPartialResponse user) {
    return GuildExpressionUploader(
      id: user.id,
      username: user.username,
      globalName: user.globalName,
    );
  }
}
