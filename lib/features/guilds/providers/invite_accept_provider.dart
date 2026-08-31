import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invite_accept_provider.g.dart';

sealed class InviteAcceptState {}

class InviteAcceptLoading extends InviteAcceptState {}

class InviteAcceptNotFound extends InviteAcceptState {}

class InviteAcceptGuild extends InviteAcceptState {
  InviteAcceptGuild(this.invite);
  final GuildInviteResponse invite;
}

class InviteAcceptGroupDm extends InviteAcceptState {
  InviteAcceptGroupDm(this.invite);
  final GroupDmInviteResponse invite;
}

@riverpod
Future<InviteAcceptState> inviteAccept(Ref ref, String code) async {
  final client = ref.watch(fluxerClientProvider);
  try {
    final InviteResponseSchema schema = await client.invites.getInvite(
      inviteCode: code,
    );
    return switch (schema) {
      InviteResponseSchema0() => InviteAcceptGuild(
        GuildInviteResponse.fromJson(schema.toJson()),
      ),
      InviteResponseSchema1() => InviteAcceptGroupDm(
        GroupDmInviteResponse.fromJson(schema.toJson()),
      ),
    };
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      return InviteAcceptNotFound();
    }
    rethrow;
  }
}
