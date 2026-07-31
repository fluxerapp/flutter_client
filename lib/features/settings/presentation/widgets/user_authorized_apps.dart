import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/authorized_apps_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserAuthorizedApps extends ConsumerStatefulWidget {
  const UserAuthorizedApps({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserAuthorizedApps> createState() => _UserAuthorizedAppsState();
}

class _UserAuthorizedAppsState extends ConsumerState<UserAuthorizedApps> {
  final _expandedIds = <String>{};

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authorizedAppsViewModelProvider);
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    final Widget body;
    if (state.isLoading) {
      body = const Center(child: FluxerLoadingSpinner());
    } else if (state.error != null) {
      body = Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.networkSlash,
              size: 48,
              color: colors.textPrimaryMuted,
            ),
            SizedBox(height: layout.s3),
            Text(
              l10n.authorizedAppsLoadError,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              label: l10n.retry,
              onPressedAsync: ref
                  .read(authorizedAppsViewModelProvider.notifier)
                  .load,
            ),
          ],
        ),
      );
    } else if (state.authorizations.isEmpty) {
      body = Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.appWindow,
              size: 48,
              color: colors.textPrimaryMuted,
            ),
            SizedBox(height: layout.s3),
            Text(
              l10n.authorizedAppsEmptyTitle,
              style: context.textStyles.heading.copyWith(
                color: colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s1),
            Text(
              l10n.authorizedAppsEmptyDescription,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else {
      body = Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FluxerSettingsSection(
              title: l10n.authorizedAppsTitle,
              description: l10n.authorizedAppsDescription,
              isFirst: true,
              children: [
                for (final authorization in state.authorizations)
                  _AuthorizedAppCard(
                    authorization: authorization,
                    isExpanded: _expandedIds.contains(
                      authorization.application.id,
                    ),
                    onToggle: () =>
                        _toggleExpanded(authorization.application.id),
                    onRevoke: () => _handleRevoke(authorization),
                  ),
              ],
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 1),
        child: body,
      ),
    );
  }

  void _toggleExpanded(String appId) {
    setState(() {
      if (_expandedIds.contains(appId)) {
        _expandedIds.remove(appId);
      } else {
        _expandedIds.add(appId);
      }
    });
  }

  Future<void> _handleRevoke(OAuth2AuthorizationResponse authorization) async {
    final appName = authorization.application.name;
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final notifier = ref.read(authorizedAppsViewModelProvider.notifier);

    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.authorizedAppsRevokeTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.authorizedAppsRevokeDescription(appName),
                style: sheetContext.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s4),
              FluxerButton.dangerPrimary(
                label: l10n.authorizedAppsRevoke,
                onPressedAsync: () async {
                  await notifier.deauthorize(authorization.application.id);
                  if (sheetContext.mounted) {
                    close();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// App card
// ---------------------------------------------------------------------------

class _AuthorizedAppCard extends StatelessWidget {
  const _AuthorizedAppCard({
    required this.authorization,
    required this.isExpanded,
    required this.onToggle,
    required this.onRevoke,
  });

  final OAuth2AuthorizationResponse authorization;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onRevoke;

  static const double _iconSize = 32;
  static const double _iconPlaceholderSize = 18;

  Widget _buildAppIcon(
    BuildContext context,
    FluxerColorTheme colors,
    String? iconUrl,
  ) {
    final placeholder = Center(
      child: PhosphorIcon(
        PhosphorIconsFill.appWindow,
        size: _iconPlaceholderSize,
        color: colors.textTertiary,
      ),
    );

    return Container(
      width: _iconSize,
      height: _iconSize,
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: iconUrl != null
          ? CachedNetworkImage(
              imageUrl: iconUrl,
              width: _iconSize,
              height: _iconSize,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => placeholder,
            )
          : placeholder,
    );
  }

  String _formatDate(String localeName) {
    final dt = DateTime.tryParse(authorization.authorizedAt);
    if (dt == null) {
      return authorization.authorizedAt;
    }
    return formatUserMediumDate(dt.toLocal(), localeName);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        border: Border.all(color: colors.borderColor),
        borderRadius: layout.radiusLg,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, colors, layout),
          if (isExpanded) _buildDetails(context, colors, layout),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final iconUrl = FluxerMediaUrl.userAvatar(
      userId: authorization.application.id,
      hash: authorization.application.icon,
    );
    final l10n = FluxerLocalizations.of(context);

    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layout.s3,
          vertical: layout.s3,
        ),
        child: Row(
          children: [
            _buildAppIcon(context, colors, iconUrl),
            SizedBox(width: layout.s2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorization.application.name,
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: layout.s1 / 2),
                  Text(
                    l10n.authorizedAppsAuthorizedOn(
                      _formatDate(l10n.localeName),
                    ),
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimaryMuted,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: layout.s2),
            AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: PhosphorIcon(
                PhosphorIconsBold.caretDown,
                size: 20,
                color: colors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(
    BuildContext context,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
  ) {
    final l10n = FluxerLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 1, thickness: 1, color: colors.borderColor),
        Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FluxerSubsectionLabel(l10n.authorizedAppsPermissionsGranted),
              SizedBox(height: layout.s2),
              for (int i = 0; i < authorization.scopes.length; i++) ...[
                _buildScopeTag(
                  context,
                  colors,
                  layout,
                  authorization.scopes[i],
                ),
                if (i < authorization.scopes.length - 1)
                  SizedBox(height: layout.s2),
              ],
              SizedBox(height: layout.s3),
              Align(
                alignment: Alignment.centerRight,
                child: FluxerButton.dangerPrimary(
                  label: l10n.authorizedAppsRevoke,
                  size: FluxerButtonSize.compact,
                  onPressed: onRevoke,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScopeTag(
    BuildContext context,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
    String scope,
  ) {
    final description = _scopeDescription(
      FluxerLocalizations.of(context),
      scope,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(layout.s2),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border.all(color: colors.borderColor),
        borderRadius: layout.radiusMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scope,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
              fontFamily: 'monospace',
              fontSize: 13,
            ),
          ),
          if (description != null) ...[
            SizedBox(height: layout.s1 / 2),
            Text(
              description,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }

  static String? _scopeDescription(FluxerLocalizations l10n, String scope) {
    switch (scope) {
      case 'identify':
        return l10n.authorizedAppsScopeIdentify;
      case 'email':
        return l10n.authorizedAppsScopeEmail;
      case 'guilds':
        return l10n.authorizedAppsScopeGuilds;
      case 'connections':
        return l10n.authorizedAppsScopeConnections;
      case 'bot':
        return l10n.authorizedAppsScopeBot;
      case 'admin':
        return l10n.authorizedAppsScopeAdmin;
      default:
        return null;
    }
  }
}
