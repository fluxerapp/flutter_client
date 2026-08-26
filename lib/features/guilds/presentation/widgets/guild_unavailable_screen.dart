import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_back_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_provider.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_handler.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildUnavailableScreen extends StatelessWidget {
  const GuildUnavailableScreen({
    required this.title,
    required this.description,
    this.icon = PhosphorIconsFill.networkSlash,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: context.colors.backgroundTertiary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: PhosphorIcon(
                  icon,
                  size: 36,
                  color: context.colors.textTertiaryMuted,
                ),
              ),
            ),
            SizedBox(height: layout.s4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.heading.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            SizedBox(height: layout.s2),
            Text(
              description,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiary,
                height: 1.4,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: layout.s6),
              SizedBox(
                width: double.infinity,
                child: FluxerButton.primary(
                  label: actionLabel,
                  onPressed: onAction,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class GuildUnavailableRouteShell extends ConsumerWidget {
  const GuildUnavailableRouteShell({
    required this.title,
    required this.description,
    this.icon = PhosphorIconsFill.networkSlash,
    this.actionLabel,
    this.onAction,
    this.channelIdForBackUnread,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;
  final String? channelIdForBackUnread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = isMobileLayout(context);
    final Color backgroundColor = isMobile
        ? context.colors.chatInputBackground
        : context.colors.backgroundSecondary;
    final Widget content = GuildUnavailableScreen(
      title: title,
      description: description,
      icon: icon,
      actionLabel: actionLabel,
      onAction: onAction,
    );

    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isMobile)
              _GuildUnavailableMobileHeader(
                title: title,
                channelId: channelIdForBackUnread,
              ),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}

class _GuildUnavailableMobileHeader extends ConsumerWidget {
  const _GuildUnavailableMobileHeader({required this.title, this.channelId});

  final String title;
  final String? channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int backButtonUnreadCount = channelId == null
        ? 0
        : ref.watch(chatBackButtonUnreadCountProvider(channelId!));
    return Container(
      constraints: const BoxConstraints(minHeight: kMobileChannelHeaderHeight),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: context.colors.chatInputBackground,
      child: Row(
        children: [
          ChatBackButton(
            unreadCount: backButtonUnreadCount,
            onPressed: () {
              applyShellBackAction(
                context: context,
                container: ref.container,
                action: resolveShellBackAction(
                  hasPopupOverlay: false,
                  hasManualGestureBlock: false,
                  hasExpressionPanelOpen: false,
                  revealSide: ref.read(currentRevealSideProvider),
                  shellLocation: ref.read(shellLocationProvider),
                ),
              );
            },
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              style: context.textStyles.channelName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class GuildOutageUnavailableScreen extends StatelessWidget {
  const GuildOutageUnavailableScreen({this.channelIdForBackUnread, super.key});

  final String? channelIdForBackUnread;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return GuildUnavailableRouteShell(
      title: l10n.communityTemporarilyUnavailable,
      description: l10n.guildUnavailableDescription,
      channelIdForBackUnread: channelIdForBackUnread,
    );
  }
}

class GuildNotFoundScreen extends StatelessWidget {
  const GuildNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return GuildUnavailableRouteShell(
      title: l10n.guildNotFoundTitle,
      description: l10n.guildNotFoundDescription,
      icon: PhosphorIconsFill.question,
      actionLabel: l10n.invalidDeepLinkGoHomeButton,
      onAction: () => context.go(RoutePaths.me),
    );
  }
}

class GuildRouteLoadingShell extends ConsumerWidget {
  const GuildRouteLoadingShell({this.channelIdForBackUnread, super.key});

  final String? channelIdForBackUnread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = isMobileLayout(context);
    final Color backgroundColor = isMobile
        ? context.colors.chatInputBackground
        : context.colors.backgroundSecondary;
    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isMobile)
              _GuildUnavailableMobileHeader(
                title: '',
                channelId: channelIdForBackUnread,
              ),
            Expanded(
              child: Center(
                child: ChatLoadingSpinner(
                  reason: ChatSpinnerReason.panelNotReady,
                  color: context.colors.brandPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
