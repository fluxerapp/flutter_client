import 'package:dio/dio.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';

enum DiscordTemplateFetchFailureKind { network, invalid }

class DiscordTemplateFetchException implements Exception {
  const DiscordTemplateFetchException(this.kind);

  final DiscordTemplateFetchFailureKind kind;
}

Dio _createDiscordTemplateDio() {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: const <String, dynamic>{'Accept': 'application/json'},
    ),
  );
}

Future<DiscordGuildTemplate> fetchDiscordGuildTemplate({
  required String code,
  Dio? dio,
}) async {
  final bool ownsClient = dio == null;
  final Dio client = dio ?? _createDiscordTemplateDio();
  try {
    final Response<Object?> response = await client.get<Object?>(
      discordTemplateApiUrl(code),
    );
    final DiscordGuildTemplate? parsed = parseDiscordGuildTemplate(
      response.data,
    );
    if (parsed == null) {
      throw const DiscordTemplateFetchException(
        DiscordTemplateFetchFailureKind.invalid,
      );
    }
    return parsed;
  } on DiscordTemplateFetchException {
    rethrow;
  } on Object {
    throw const DiscordTemplateFetchException(
      DiscordTemplateFetchFailureKind.network,
    );
  } finally {
    if (ownsClient) {
      client.close();
    }
  }
}
