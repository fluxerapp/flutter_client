import 'dart:async';
import 'dart:ui' show lerpDouble;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/add_account_screen.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kGridAvatarSize = 72;
const double _kTileWidth = 104;
const double _kTileSpacing = 20;
const Duration _kEnterDuration = Duration(milliseconds: 420);
const Duration _kExitDuration = Duration(milliseconds: 240);
const Duration _kSwitchExitDuration = Duration(milliseconds: 400);
const double _kBackdropOpacity = 0.88;
const double _kAvatarBorderWidth = 2;
const double _kAvatarInnerPadding = 2;
const double _kCurrentAccountBadgeSize = 20;
const double _kCurrentAccountBadgeBorderWidth = 2;

Color _pickerAvatarBorderColor(
  FluxerColorTheme colors, {
  bool isCurrent = false,
}) {
  if (isCurrent) {
    return colors.textPositive;
  }
  return colors.textPrimaryMuted.withValues(alpha: 0.55);
}

Offset _globalWidgetCenter(GlobalKey key, Offset fallback) {
  final BuildContext? context = key.currentContext;
  if (context == null) {
    return fallback;
  }
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null || !box.hasSize) {
    return fallback;
  }
  return box.localToGlobal(box.size.center(Offset.zero));
}

class AccountPickerOverlay {
  AccountPickerOverlay._();

  static Future<T?> show<T>(BuildContext context) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return showGeneralDialog<T>(
      context: context,
      barrierLabel: l10n.uiClose,
      barrierColor: Colors.transparent,
      transitionDuration: Duration.zero,
      pageBuilder: (dialogContext, _, _) {
        return _AccountPickerOverlayBody(
          onClose: () => Navigator.of(dialogContext).pop(),
        );
      },
    ).whenComplete(() {
      container.read(obscuringOverlayTrackerProvider.notifier).pop();
    });
  }
}

class _AccountPickerOverlayBody extends ConsumerStatefulWidget {
  const _AccountPickerOverlayBody({required this.onClose});

  final VoidCallback onClose;

  @override
  ConsumerState<_AccountPickerOverlayBody> createState() =>
      _AccountPickerOverlayBodyState();
}

class _AccountPickerOverlayBodyState
    extends ConsumerState<_AccountPickerOverlayBody>
    with TickerProviderStateMixin {
  late AnimationController _enterController;
  late AnimationController _exitController;
  late AnimationController _switchExitController;
  late Animation<double> _backdropEnter;

  StoredAccount? _switchAccount;
  Offset? _switchStartCenter;
  final Map<String, GlobalKey> _avatarMeasureKeys = {};
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
      vsync: this,
      duration: _kEnterDuration,
    );
    _exitController = AnimationController(
      vsync: this,
      duration: _kExitDuration,
    );
    _switchExitController = AnimationController(
      vsync: this,
      duration: _kSwitchExitDuration,
    );

    _backdropEnter = CurvedAnimation(
      parent: _enterController,
      curve: const Interval(0, 0.4, curve: Curves.easeOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_isClosing) {
        _enterController.forward();
      }
    });
  }

  @override
  void dispose() {
    _enterController.dispose();
    _exitController.dispose();
    _switchExitController.dispose();
    super.dispose();
  }

  Future<void> _requestClose() async {
    if (_isClosing) {
      return;
    }
    _isClosing = true;
    await _exitController.forward();
    if (mounted) {
      widget.onClose();
    }
  }

  double _visibility() {
    if (_switchAccount != null) {
      return 1 - Curves.easeOutCubic.transform(_switchExitController.value);
    }
    return 1 - Curves.easeInCubic.transform(_exitController.value);
  }

  GlobalKey _avatarMeasureKeyFor(String userId) {
    return _avatarMeasureKeys.putIfAbsent(userId, GlobalKey.new);
  }

  Future<void> _requestCloseForSwitch(
    StoredAccount account,
    Offset avatarCenter,
  ) async {
    if (_isClosing) {
      return;
    }
    _isClosing = true;
    setState(() {
      _switchAccount = account;
      _switchStartCenter = avatarCenter;
    });

    final Future<void> switchFuture = ref
        .read(accountManagerProvider.notifier)
        .switchToAccount(account.userId);

    await _switchExitController.forward(from: 0);
    if (mounted) {
      widget.onClose();
    }

    try {
      await switchFuture;
    } on SessionExpiredFailure {
      final BuildContext? rootContext = rootNavigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        return;
      }
      await Navigator.of(rootContext, rootNavigator: true).push<void>(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (_) => AddAccountScreen(prefillEmail: account.identifier),
        ),
      );
    } on Object catch (_) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).accountSwitchFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Widget _buildSwitchingAvatar(double visibility) {
    final StoredAccount? account = _switchAccount;
    final Offset? startCenter = _switchStartCenter;
    if (account == null || startCenter == null || visibility <= 0) {
      return const SizedBox.shrink();
    }
    final Size screen = MediaQuery.sizeOf(context);
    final Offset endCenter = Offset(screen.width / 2, screen.height / 2);
    final double moveT = Curves.easeInOutCubic.transform(
      _switchExitController.value,
    );
    final Offset center = Offset.lerp(startCenter, endCenter, moveT)!;
    final double scale =
        lerpDouble(1, 1.12, Curves.easeOut.transform(1 - moveT)) ?? 1;
    final double layoutSize = _kGridAvatarSize * scale;

    return Positioned(
      left: center.dx - layoutSize / 2,
      top: center.dy - layoutSize / 2,
      width: layoutSize,
      height: layoutSize,
      child: IgnorePointer(
        child: Opacity(
          opacity: visibility,
          child: FittedBox(
            fit: BoxFit.cover,
            child: _SwitchingAvatarBadge(
              userId: account.userId,
              displayName: account.displayName,
              avatarHash: account.avatar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<StoredAccount> accounts = ref
        .watch(accountManagerProvider)
        .accounts;

    final double maxPanelHeight = MediaQuery.sizeOf(context).height * 0.55;

    return wrapFluxerOverlayBackHandler(
      canDismiss: !_isClosing,
      onBack: null,
      onDismiss: () => unawaited(_requestClose()),
      child: AnimatedBuilder(
        animation: Listenable.merge(<Listenable>[
          _enterController,
          _exitController,
          _switchExitController,
        ]),
        builder: (BuildContext context, Widget? child) {
          final FluxerColorTheme colors = context.colors;
          final double visibility = _visibility();
          final bool switching = _switchAccount != null;
          final double switchT = switching ? _switchExitController.value : 0;
          final double panelOffset = switching ? 0 : 28 * (1 - visibility);
          final Color backdropColor = Color.lerp(
            Colors.black.withValues(alpha: _kBackdropOpacity),
            colors.backgroundPrimary,
            Curves.easeIn.transform(switchT),
          )!;

          return Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: switching ? 1 : _backdropEnter.value * visibility,
                child: FluxerGestureDetector(
                  onTap: switching ? null : () => unawaited(_requestClose()),
                  child: ColoredBox(
                    color: backdropColor,
                    child: const SizedBox.expand(),
                  ),
                ),
              ),
              if (!switching)
                Transform.translate(
                  offset: Offset(0, panelOffset),
                  child: Opacity(
                    opacity: visibility,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Material(
                            color: Colors.transparent,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: maxPanelHeight,
                              ),
                              child: _AccountPickerPanel(
                                accounts: accounts,
                                avatarMeasureKeyFor: _avatarMeasureKeyFor,
                                enterController: _enterController,
                                onRequestClose: _requestClose,
                                onSelectAccount: _requestCloseForSwitch,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (switching) _buildSwitchingAvatar(visibility),
            ],
          );
        },
      ),
    );
  }
}

class _AccountPickerPanel extends ConsumerWidget {
  const _AccountPickerPanel({
    required this.accounts,
    required this.avatarMeasureKeyFor,
    required this.enterController,
    required this.onRequestClose,
    required this.onSelectAccount,
  });

  final List<StoredAccount> accounts;
  final GlobalKey Function(String userId) avatarMeasureKeyFor;
  final AnimationController enterController;
  final Future<void> Function() onRequestClose;
  final Future<void> Function(StoredAccount account, Offset avatarCenter)
  onSelectAccount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final layout = context.layout;

    if (accounts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: _kTileSpacing,
              runSpacing: _kTileSpacing,
              children: [
                for (var i = 0; i < accounts.length; i++)
                  _StaggeredPickerTile(
                    index: i,
                    controller: enterController,
                    child: _AccountAvatarTile(
                      account: accounts[i],
                      isCurrent: accounts[i].userId == currentUserId,
                      measureKey: avatarMeasureKeyFor(accounts[i].userId),
                      onTap: () => _handleSelectAccount(
                        context,
                        ref,
                        accounts[i],
                        l10n,
                        avatarMeasureKeyFor(accounts[i].userId),
                        onSelectAccount,
                        onRequestClose,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: layout.s4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FluxerButton.mediaOverlay(
                icon: PhosphorIconsBold.gear,
                label: l10n.accountManageTitle,
                size: FluxerButtonSize.compact,
                fitContent: true,
                onPressedAsync: () async {
                  await onRequestClose();
                  if (context.mounted) {
                    unawaited(AccountSwitcherSheet.show(context));
                  }
                },
              ),
              SizedBox(width: layout.s3),
              FluxerButton.mediaOverlay(
                icon: PhosphorIconsBold.smiley,
                label: l10n.statusChangeSheetTitle,
                size: FluxerButtonSize.compact,
                fitContent: true,
                onPressedAsync: () async {
                  await onRequestClose();
                  if (context.mounted) {
                    unawaited(StatusChangeSheet.show(context));
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _handleSelectAccount(
    BuildContext context,
    WidgetRef ref,
    StoredAccount account,
    FluxerLocalizations l10n,
    GlobalKey avatarMeasureKey,
    Future<void> Function(StoredAccount account, Offset avatarCenter)
    onSelectAccount,
    Future<void> Function() onRequestClose,
  ) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (account.userId == currentUserId) {
      return;
    }

    if (!account.isValid) {
      await onRequestClose();
      final BuildContext? rootContext = rootNavigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        return;
      }
      await Navigator.of(rootContext, rootNavigator: true).push<void>(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (_) => AddAccountScreen(prefillEmail: account.identifier),
        ),
      );
      return;
    }

    final Size screen = MediaQuery.sizeOf(context);
    final Offset fallback = Offset(screen.width / 2, screen.height / 2);
    await onSelectAccount(
      account,
      _globalWidgetCenter(avatarMeasureKey, fallback),
    );
  }
}

class _StaggeredPickerTile extends StatelessWidget {
  const _StaggeredPickerTile({
    required this.index,
    required this.controller,
    required this.child,
  });

  final int index;
  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double start = (0.28 + index * 0.05).clamp(0.0, 0.6);
    final double end = (start + 0.3).clamp(0.0, 1.0);
    final Animation<double> opacity = CurvedAnimation(
      parent: controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
    return FadeTransition(
      opacity: opacity,
      child: SizedBox(width: _kTileWidth, child: child),
    );
  }
}

class _AccountAvatarTile extends StatelessWidget {
  const _AccountAvatarTile({
    required this.account,
    required this.isCurrent,
    required this.onTap,
    this.measureKey,
  });

  final StoredAccount account;
  final bool isCurrent;
  final GlobalKey? measureKey;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;

    return FluxerTappable(
      onTap: onTap,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              key: measureKey,
              width: _kGridAvatarSize,
              height: _kGridAvatarSize,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _pickerAvatarBorderColor(
                          colors,
                          isCurrent: isCurrent,
                        ),
                        width: _kAvatarBorderWidth,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(_kAvatarInnerPadding),
                      child: FluxerAvatar.user(
                        userId: account.userId,
                        imageUrl: FluxerMediaUrl.userAvatar(
                          userId: account.userId,
                          hash: account.avatar,
                          size: MediaProxySizes.avatarProfile,
                        ),
                        fallbackText: account.displayName,
                        showStatus: false,
                        size:
                            _kGridAvatarSize -
                            2 * (_kAvatarBorderWidth + _kAvatarInnerPadding),
                      ),
                    ),
                  ),
                  if (isCurrent)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.textPositive,
                          border: Border.all(
                            color: colors.backgroundPrimary,
                            width: _kCurrentAccountBadgeBorderWidth,
                          ),
                        ),
                        child: SizedBox(
                          width: _kCurrentAccountBadgeSize,
                          height: _kCurrentAccountBadgeSize,
                          child: Center(
                            child: PhosphorIcon(
                              PhosphorIconsBold.check,
                              size: 11,
                              color: colors.brandPrimaryFill,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              account.displayName,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InstanceDomainIcon(
                  isOfficial: account.isOfficialInstance,
                  size: 10,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    account.instanceDomain,
                    style: context.textStyles.timestamp.copyWith(
                      color: colors.textTertiary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            if (!account.isValid) ...[
              const SizedBox(height: 2),
              Text(
                FluxerLocalizations.of(context).accountExpired,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textDanger,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        );
      },
    );
  }
}

class _SwitchingAvatarBadge extends StatelessWidget {
  const _SwitchingAvatarBadge({
    required this.userId,
    required this.displayName,
    required this.avatarHash,
  });

  final String userId;
  final String displayName;
  final String? avatarHash;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _pickerAvatarBorderColor(colors),
          width: _kAvatarBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(_kAvatarInnerPadding),
        child: FluxerAvatar.user(
          userId: userId,
          imageUrl: FluxerMediaUrl.userAvatar(
            userId: userId,
            hash: avatarHash,
            size: MediaProxySizes.avatarProfile,
          ),
          fallbackText: displayName,
          showStatus: false,
          size:
              _kGridAvatarSize -
              2 * (_kAvatarBorderWidth + _kAvatarInnerPadding),
        ),
      ),
    );
  }
}
