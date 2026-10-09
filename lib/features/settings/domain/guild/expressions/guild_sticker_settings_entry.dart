import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_dart/export.dart';

class GuildStickerSettingsEntry {
  const GuildStickerSettingsEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.uploader,
  });

  final String id;
  final String name;
  final String description;
  final List<String> tags;
  final GuildExpressionUploader uploader;

  factory GuildStickerSettingsEntry.fromResponse(
    GuildStickerWithUserResponse response,
  ) {
    return GuildStickerSettingsEntry(
      id: response.id,
      name: response.name,
      description: response.description,
      tags: List<String>.from(response.tags),
      uploader: GuildExpressionUploader.fromResponse(response.user),
    );
  }
}
