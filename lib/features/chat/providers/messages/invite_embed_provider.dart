import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invite_embed_provider.g.dart';

sealed class InviteEmbedState {}

class InviteEmbedLoading extends InviteEmbedState {}

class InviteEmbedNotFound extends InviteEmbedState {}

class InviteEmbedGuild extends InviteEmbedState {
  InviteEmbedGuild(this.invite);
  final InviteResponseSchemaGuildInviteResponse invite;
}

class InviteEmbedGroupDm extends InviteEmbedState {
  InviteEmbedGroupDm(this.invite);
  final InviteResponseSchemaGroupDmInviteResponse invite;
}

// Fetches invite data by code
@riverpod
Future<InviteEmbedState> inviteEmbed(Ref ref, String code) async {
  final client = ref.watch(fluxerClientProvider);
  try {
    final schema = await client.invites.getInvite(inviteCode: code);
    final raw = schema.toJson();
    final typeVal = raw['type'] as int?;
    return switch (typeVal) {
      0 => InviteEmbedGuild(schema.toGuildInviteResponse()),
      1 => InviteEmbedGroupDm(schema.toGroupDmInviteResponse()),
      _ => InviteEmbedNotFound(),
    };
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      return InviteEmbedNotFound();
    }
    rethrow;
  }
}

// Accepts the invite and jumps to the guild channe/l
Future<void> acceptInvite({
  required String code,
  required String guildId,
  required String channelId,
  required Ref ref,
}) async {
  final client = ref.read(fluxerClientProvider);
  await client.invites.acceptInvite(inviteCode: code);
  navigateToContentViaRef(ref, RoutePaths.guildChannel(guildId, channelId));
}
