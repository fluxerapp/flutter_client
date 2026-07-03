import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum DiscoveryJoinError {
  communityFull,
  maxGuilds,
  banned,
  notAvailable,
  rateLimited,
  generic,
}

DiscoveryJoinError discoveryJoinErrorFromApiCode(String? code) {
  return switch (code) {
    'MAX_GUILD_MEMBERS' => DiscoveryJoinError.communityFull,
    'MAX_GUILDS' => DiscoveryJoinError.maxGuilds,
    'USER_BANNED_FROM_GUILD' ||
    'USER_IP_BANNED_FROM_GUILD' => DiscoveryJoinError.banned,
    'DISCOVERY_NOT_DISCOVERABLE' ||
    'DISCOVERY_DISABLED' ||
    'INVITES_DISABLED' => DiscoveryJoinError.notAvailable,
    'RATE_LIMITED' => DiscoveryJoinError.rateLimited,
    _ => DiscoveryJoinError.generic,
  };
}

extension DiscoveryJoinErrorL10n on DiscoveryJoinError {
  String title(FluxerLocalizations l10n) {
    return switch (this) {
      DiscoveryJoinError.communityFull => l10n.discoveryJoinErrorFullTitle,
      DiscoveryJoinError.maxGuilds => l10n.discoveryJoinErrorMaxGuildsTitle,
      DiscoveryJoinError.banned => l10n.discoveryJoinErrorBannedTitle,
      DiscoveryJoinError.notAvailable =>
        l10n.discoveryJoinErrorNotAvailableTitle,
      DiscoveryJoinError.rateLimited => l10n.discoveryJoinErrorRateLimitTitle,
      DiscoveryJoinError.generic => l10n.discoveryJoinErrorGenericTitle,
    };
  }

  String message(FluxerLocalizations l10n) {
    return switch (this) {
      DiscoveryJoinError.communityFull => l10n.discoveryJoinErrorFullMessage,
      DiscoveryJoinError.maxGuilds => l10n.discoveryJoinErrorMaxGuildsMessage,
      DiscoveryJoinError.banned => l10n.discoveryJoinErrorBannedMessage,
      DiscoveryJoinError.notAvailable =>
        l10n.discoveryJoinErrorNotAvailableMessage,
      DiscoveryJoinError.rateLimited => l10n.discoveryJoinErrorRateLimitMessage,
      DiscoveryJoinError.generic => l10n.discoveryJoinErrorGenericMessage,
    };
  }
}
