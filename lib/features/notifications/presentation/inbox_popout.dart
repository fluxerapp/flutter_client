import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_mentions_body.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_unreads_body.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum InboxTab { unreads, bookmarks, mentions }

typedef InboxPopoutAnchorBuilder =
    Widget Function(BuildContext context, bool isOpen, VoidCallback toggle);

class InboxPopoutButton extends StatefulWidget {
  const InboxPopoutButton({required this.anchorBuilder, super.key});

  final InboxPopoutAnchorBuilder anchorBuilder;

  @override
  State<InboxPopoutButton> createState() => _InboxPopoutButtonState();
}

class _InboxPopoutButtonState extends State<InboxPopoutButton>
    with SingleTickerProviderStateMixin {
  static const double _kMaxHeight = 900;
  static const double _kMaxWidth = 600;
  static const double _kBlockGap = 48;
  static const double _kInlineGap = 24;

  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  bool _openUpward = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_overlayController.isShowing) {
      _close();
      return;
    }
    _computeDirection();
    _overlayController.show();
    unawaited(_animationController.forward());
  }

  void _close() {
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
      }),
    );
  }

  void _computeDirection() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) {
      _openUpward = false;
      return;
    }
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double anchorBottom = renderBox
        .localToGlobal(Offset(0, renderBox.size.height))
        .dy;
    final double popoutHeight = _popoutHeight(context);
    _openUpward = screenHeight - anchorBottom < popoutHeight + 8;
  }

  double _popoutHeight(BuildContext context) {
    final double viewportHeight = MediaQuery.sizeOf(context).height;
    return math.min(_kMaxHeight, viewportHeight - _kBlockGap);
  }

  double _popoutWidth(BuildContext context) {
    final Size viewport = MediaQuery.sizeOf(context);
    final double proportional = math.max(0, viewport.height * 0.666667 - 32);
    return math.min(
      _kMaxWidth,
      math.min(proportional, viewport.width - _kInlineGap),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLayoutTheme layout = context.layout;
    final double width = _popoutWidth(context);
    final double height = _popoutHeight(context);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
            onTap: _close,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: _openUpward
                ? Alignment.topRight
                : Alignment.bottomRight,
            followerAnchor: _openUpward
                ? Alignment.bottomRight
                : Alignment.topRight,
            offset: Offset(0, _openUpward ? -4 : 4),
            child: Align(
              alignment: _openUpward
                  ? Alignment.bottomRight
                  : Alignment.topRight,
              child: SizedBox(
                width: width,
                height: height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary,
                    borderRadius: layout.radiusLg,
                    border: Border.all(color: colors.backgroundModifierAccent),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: layout.radiusLg,
                    child: InboxPopout(onClose: _close),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isOpen = _overlayController.isShowing;
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.anchorBuilder(context, isOpen, _toggle),
      ),
    );
  }
}

class InboxPopout extends ConsumerStatefulWidget {
  const InboxPopout({this.onClose, super.key});

  final VoidCallback? onClose;

  @override
  ConsumerState<InboxPopout> createState() => _InboxPopoutState();
}

class _InboxPopoutState extends ConsumerState<InboxPopout> {
  static const double _kSidebarWidth = 46;

  InboxTab _activeTab = InboxTab.unreads;
  NotificationsMentionsOpenFilterInvoker? _mentionsFilterInvoker;

  void _onMentionsOpenFilterInvokerChanged(
    NotificationsMentionsOpenFilterInvoker? invoker,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() => _mentionsFilterInvoker = invoker);
    });
  }

  Future<void> _markAllAsRead() async {
    final List<UnreadInboxEntry> entries = await ref.read(
      unreadInboxChannelListProvider.future,
    );
    if (entries.isEmpty || !mounted) {
      return;
    }
    final NotificationsRepository repo = ref.read(
      notificationsRepositoryProvider,
    );
    await repo.markAllInboxChannelsAsRead(entries);
    ref.invalidate(unreadInboxChannelListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<List<UnreadInboxEntry>> unreadAsync = ref.watch(
      unreadInboxChannelListProvider,
    );
    final bool canMarkAllRead = unreadAsync.maybeWhen(
      data: (List<UnreadInboxEntry> list) => list.isNotEmpty,
      orElse: () => false,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            border: Border(
              right: BorderSide(color: colors.backgroundModifierAccent),
            ),
          ),
          child: SizedBox(
            width: _kSidebarWidth,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                _InboxSidebarTab(
                  tooltip: l10n.notificationsFilterUnreads,
                  icon: PhosphorIconsFill.bell,
                  isActive: _activeTab == InboxTab.unreads,
                  onTap: () => setState(() => _activeTab = InboxTab.unreads),
                ),
                const SizedBox(height: 8),
                _InboxSidebarTab(
                  tooltip: l10n.notificationsBookmarksTooltip,
                  icon: PhosphorIconsRegular.bookmarkSimple,
                  isActive: _activeTab == InboxTab.bookmarks,
                  onTap: () => setState(() => _activeTab = InboxTab.bookmarks),
                ),
                const SizedBox(height: 8),
                _InboxSidebarTab(
                  tooltip: l10n.notificationsFilterMentions,
                  icon: PhosphorIconsFill.at,
                  isActive: _activeTab == InboxTab.mentions,
                  onTap: () => setState(() => _activeTab = InboxTab.mentions),
                ),
                const Spacer(),
                if (_activeTab == InboxTab.mentions &&
                    _mentionsFilterInvoker != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FluxerTooltip(
                      message: l10n.notificationsMentionFilterTooltip,
                      position: FluxerTooltipPosition.right,
                      child: _InboxSidebarActionButton(
                        icon: PhosphorIconsRegular.funnel,
                        tooltip: l10n.notificationsMentionFilterTooltip,
                        onPressed: () => unawaited(_mentionsFilterInvoker!()),
                      ),
                    ),
                  ),
                if (_activeTab == InboxTab.unreads)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FluxerTooltip(
                      message: l10n.notificationsMarkAsRead,
                      position: FluxerTooltipPosition.right,
                      child: _InboxSidebarActionButton(
                        icon: PhosphorIconsBold.check,
                        tooltip: l10n.notificationsMarkAsRead,
                        onPressed: canMarkAllRead
                            ? () => unawaited(_markAllAsRead())
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child: switch (_activeTab) {
            InboxTab.unreads => const NotificationsUnreadsBody(),
            InboxTab.bookmarks => const SavedMessagesBody(),
            InboxTab.mentions => NotificationsMentionsBody(
              onOpenFilterInvokerChanged: _onMentionsOpenFilterInvokerChanged,
            ),
          },
        ),
      ],
    );
  }
}

class _InboxSidebarTab extends StatelessWidget {
  const _InboxSidebarTab({
    required this.tooltip,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final String tooltip;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    return FluxerTooltip(
      message: tooltip,
      position: FluxerTooltipPosition.right,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          hoverColor: colors.backgroundModifierHover,
          onTap: onTap,
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActive
                  ? colors.backgroundModifierSelected
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: PhosphorIcon(
              icon,
              size: 16,
              color: isActive ? colors.textPrimary : colors.textPrimaryMuted,
            ),
          ),
        ),
      ),
    );
  }
}

class _InboxSidebarActionButton extends StatelessWidget {
  const _InboxSidebarActionButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final bool enabled = onPressed != null;
    return Semantics(
      button: true,
      label: tooltip,
      enabled: enabled,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          hoverColor: enabled ? colors.backgroundModifierHover : null,
          onTap: onPressed,
          child: Opacity(
            opacity: enabled ? 1 : 0.5,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: PhosphorIcon(
                icon,
                size: 16,
                color: colors.textPrimaryMuted,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
