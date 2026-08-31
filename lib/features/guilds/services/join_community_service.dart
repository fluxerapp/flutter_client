import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

enum JoinCommunityFailureKind { invalidInvite, apiError, unsupported }

class JoinCommunityException implements Exception {
  const JoinCommunityException({required this.kind, required this.message});

  final JoinCommunityFailureKind kind;
  final String message;

  @override
  String toString() => message;
}

Future<void> joinCommunityViaInvite({
  required WidgetRef ref,
  required String rawInput,
  required FluxerLocalizations l10n,
}) async {
  final client = ref.read(fluxerClientProvider);
  await ref.read(wellKnownProvider.future);
  final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
  final String? parsedCode = parseInviteCode(
    rawInput,
    inviteUrlBases: <String>[inviteBase],
  );
  if (parsedCode == null || parsedCode.isEmpty) {
    throw JoinCommunityException(
      kind: JoinCommunityFailureKind.invalidInvite,
      message: l10n.addGuildInviteInvalid,
    );
  }
  try {
    final InviteResponseSchema schema = await client.invites.getInvite(
      inviteCode: parsedCode,
    );
    switch (schema) {
      case InviteResponseSchema0():
        await _joinGuildInvite(
          ref: ref,
          invite: GuildInviteResponse.fromJson(schema.toJson()),
          code: parsedCode,
          l10n: l10n,
        );
      case InviteResponseSchema1():
        await _joinGroupDmInvite(
          ref: ref,
          invite: GroupDmInviteResponse.fromJson(schema.toJson()),
          code: parsedCode,
        );
      default:
        throw JoinCommunityException(
          kind: JoinCommunityFailureKind.unsupported,
          message: l10n.addGuildJoinFailed,
        );
    }
  } on JoinCommunityException {
    rethrow;
  } on DioException catch (e) {
    throw JoinCommunityException(
      kind: e.response?.statusCode == 404
          ? JoinCommunityFailureKind.invalidInvite
          : JoinCommunityFailureKind.apiError,
      message: userFacingErrorMessage(e, l10n.addGuildJoinFailed),
    );
  }
}

Future<void> _joinGuildInvite({
  required WidgetRef ref,
  required GuildInviteResponse invite,
  required String code,
  required FluxerLocalizations l10n,
}) async {
  final String guildId = invite.guild.id;
  final String channelId = invite.channel.id;
  final Guild? existingGuild = await ref.read(
    guildByIdProvider(guildId).future,
  );
  if (existingGuild == null) {
    final client = ref.read(fluxerClientProvider);
    await client.invites.acceptInvite(inviteCode: code);
    await ref.read(guildRepositoryProvider).stageGuildJoinFromInvite(invite);
    ref.invalidate(guildByIdProvider(guildId));
    final Guild? stagedGuild = await ref.read(
      guildByIdProvider(guildId).future,
    );
    if (stagedGuild != null) {
      ref
          .read(channelListViewModelProvider.notifier)
          .loadChannels(guildId, guild: stagedGuild);
    }
  }
  _navigateToContent(ref, RoutePaths.guildChannel(guildId, channelId));
}

Future<void> _joinGroupDmInvite({
  required WidgetRef ref,
  required GroupDmInviteResponse invite,
  required String code,
}) async {
  final client = ref.read(fluxerClientProvider);
  await client.invites.acceptInvite(inviteCode: code);
  _navigateToContent(ref, RoutePaths.dmChannel(invite.channel.id));
}

void _navigateToContent(WidgetRef ref, String path) {
  navigateToContentVia(ref, path);
}
