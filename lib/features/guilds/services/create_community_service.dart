import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

enum CreateCommunityFailureKind { apiError, maxGuilds, singleCommunity }

class CreateCommunityException implements Exception {
  const CreateCommunityException({required this.kind, required this.message});

  final CreateCommunityFailureKind kind;
  final String message;

  @override
  String toString() => message;
}

Future<void> createCommunity({
  required BuildContext context,
  required WidgetRef ref,
  required String name,
  required FluxerLocalizations l10n,
  String? iconDataUri,
}) async {
  try {
    final GuildResponse guild = await ref
        .read(guildRepositoryProvider)
        .createGuild(name: name, iconDataUri: iconDataUri);
    await ref.read(channelRepositoryProvider).getChannels(guild.id);
    final Guild? localGuild = await ref.read(
      guildByIdProvider(guild.id).future,
    );
    if (localGuild != null) {
      ref
          .read(channelListViewModelProvider.notifier)
          .loadChannels(guild.id, guild: localGuild);
    }
    navigateToContentVia(ref, RoutePaths.guild(guild.id));
  } on CreateCommunityException {
    rethrow;
  } on DioException catch (e) {
    final String? code = apiErrorCodeFromDioException(e);
    switch (code) {
      case 'UNCLAIMED_ACCOUNT_CANNOT_CREATE_GUILDS':
        if (context.mounted) {
          await ClaimAccountSheet.show(context, ref);
        }
        throw CreateCommunityException(
          kind: CreateCommunityFailureKind.apiError,
          message: l10n.addGuildCreateClaimDescription,
        );
      case 'SINGLE_COMMUNITY_CANNOT_CREATE_GUILDS':
        throw CreateCommunityException(
          kind: CreateCommunityFailureKind.singleCommunity,
          message: l10n.addGuildCreateSingleCommunityBlocked,
        );
      case 'MAX_GUILDS_REACHED':
      case 'MAX_GUILDS':
        throw CreateCommunityException(
          kind: CreateCommunityFailureKind.maxGuilds,
          message: l10n.discoveryJoinErrorMaxGuildsMessage,
        );
      default:
        throw CreateCommunityException(
          kind: CreateCommunityFailureKind.apiError,
          message: dioExceptionMessage(e, l10n.addGuildCreateFailed),
        );
    }
  } on Object {
    throw CreateCommunityException(
      kind: CreateCommunityFailureKind.apiError,
      message: l10n.addGuildCreateFailed,
    );
  }
}

void showCreateCommunityFailureToast({
  required WidgetRef ref,
  required CreateCommunityException error,
  required FluxerLocalizations l10n,
}) {
  if (error.kind == CreateCommunityFailureKind.maxGuilds) {
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: error.message,
            variant: FluxerToastVariant.warning,
          ),
        );
    return;
  }
  ref
      .read(toastProvider.notifier)
      .show(
        FluxerToast(message: error.message, variant: FluxerToastVariant.danger),
      );
}
