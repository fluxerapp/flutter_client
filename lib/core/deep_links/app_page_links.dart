import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum AppPageId { discovery, favorites, directMessages }

class AppPageLinkAvailability {
  const AppPageLinkAvailability({
    this.singleCommunity = false,
    this.directMessagesDisabled = false,
  });

  final bool singleCommunity;
  final bool directMessagesDisabled;
}

String normalizeAppPagePath(String pathname) {
  String path = pathname;
  if (path.length > 1) {
    path = path.replaceAll(RegExp(r'/+$'), '');
  }
  try {
    return Uri.decodeComponent(path);
  } on FormatException {
    return path;
  }
}

AppPageId? appPageIdForPath(
  String path, {
  required AppPageLinkAvailability availability,
}) {
  final String normalized = normalizeAppPagePath(
    path.split(RegExp('[?#]')).first,
  );
  if (isDiscoverRoute(normalized) && !availability.singleCommunity) {
    return AppPageId.discovery;
  }
  if (normalized == RoutePaths.favoritesBase) {
    return AppPageId.favorites;
  }
  if (normalized == RoutePaths.me && !availability.directMessagesDisabled) {
    return AppPageId.directMessages;
  }
  return null;
}

AppPageId? parseAppPageLink(
  String rawUrl, {
  required AppPageLinkAvailability availability,
  String? instanceWebAppBase,
}) {
  if (rawUrl.startsWith('fluxer:')) {
    final Uri? parsed = parseFluxerAppLinkUri(rawUrl);
    if (parsed == null) {
      return null;
    }
    return appPageIdForPath(parsed.path, availability: availability);
  }

  final Uri? uri = Uri.tryParse(rawUrl);
  if (uri == null) {
    return null;
  }
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return null;
  }
  if (!isChannelJumpHost(uri.host, instanceWebAppBase: instanceWebAppBase)) {
    return null;
  }
  return appPageIdForPath(uri.path, availability: availability);
}

void navigateToAppPage(BuildContext context, AppPageId page) {
  final GoRouter router = GoRouter.of(context);
  switch (page) {
    case AppPageId.discovery:
      router.go(RoutePaths.discover);
    case AppPageId.favorites:
      router.go(RoutePaths.favoritesBase);
    case AppPageId.directMessages:
      router.go(RoutePaths.me);
  }
}

String appPageLabel(FluxerLocalizations l10n, AppPageId page) {
  switch (page) {
    case AppPageId.discovery:
      return l10n.guildMenuSettingsDiscovery;
    case AppPageId.favorites:
      return l10n.favoritesTitle;
    case AppPageId.directMessages:
      return l10n.guildNavbarDirectMessages;
  }
}

IconData appPageIcon(AppPageId page) {
  switch (page) {
    case AppPageId.discovery:
      return PhosphorIconsFill.compass;
    case AppPageId.favorites:
      return PhosphorIconsFill.star;
    case AppPageId.directMessages:
      return PhosphorIconsFill.chatsCircle;
  }
}
