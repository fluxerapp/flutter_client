import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_selector.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_flow_content.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_viewport.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/forgot_password_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/register_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/reset_password_screen.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Widget _buildAuthContent(
    BuildContext context,
    WidgetRef ref, {
    required bool showBrowserLogin,
  }) {
    final vm = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);

    if (vm.resetToken != null) {
      return ResetPasswordScreen(
        token: vm.resetToken!,
        onBack: notifier.clearResetToken,
      );
    }

    if (vm.showForgotPassword) {
      return ForgotPasswordScreen(
        onBack: notifier.backFromForgotPassword,
        onRegister: notifier.showRegisterScreen,
      );
    }

    if (vm.showRegister) {
      return RegisterScreen(onBack: notifier.backFromRegister);
    }

    final accountState = ref.watch(accountManagerProvider);

    // Account selector when accounts exist and not adding new.
    if (vm.showAccountSelector && accountState.accounts.isNotEmpty) {
      return AccountSelector(
        currentUserId: ref.read(currentUserIdProvider) ?? '',
        onSelectAccount: (account) {
          if (account.isValid) {
            final l10n = FluxerLocalizations.of(context);
            unawaited(
              ref
                  .read(accountManagerProvider.notifier)
                  .switchToAccount(account.userId)
                  .catchError((Object e) {
                    if (e is SessionExpiredFailure) {
                      notifier.setError(
                        l10n.accountSessionExpired(account.identifier),
                      );
                    }
                  }),
            );
          } else {
            // Pre-fill email for expired account.
            notifier
              ..updateEmail(account.identifier)
              ..hideAccountSelector();
          }
        },
        onAddAccount: notifier.hideAccountSelector,
      );
    }

    return AuthFlowContent(showBrowserLogin: showBrowserLogin);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load stored accounts on first build.
    ref.listen(accountManagerProvider, (_, _) {});
    final accountManager = ref.read(accountManagerProvider);
    if (accountManager.accounts.isEmpty) {
      unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    }

    final isMobile = isMobileLayout(context);

    if (isMobile) {
      return _buildMobileLayout(context, ref);
    }
    return _buildDesktopLayout(context, ref);
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    final layout = context.layout;

    return Scaffold(
      backgroundColor: context.colors.brandPrimary,
      body: Stack(
        children: [
          const Positioned.fill(child: _TiledPatternBackground()),
          Center(
            child: Container(
              width: 800,
              margin: EdgeInsets.all(layout.s5),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: context.colors.backgroundSecondary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 8,
                    blurRadius: 24,
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: context.colors.backgroundSecondary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.fluxerLogoColor,
                              width: 128,
                              height: 128,
                            ),
                            SizedBox(height: layout.s4),
                            SvgPicture.asset(
                              Assets.fluxerLogoText,
                              height: 36,
                              theme: SvgTheme(
                                currentColor: context.colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: context.colors.borderColor,
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(layout.s8),
                        child: _buildAuthContent(
                          context,
                          ref,
                          showBrowserLogin: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, WidgetRef ref) {
    final layout = context.layout;

    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: AuthViewport(
        maxWidth: 448,
        padding: EdgeInsets.symmetric(
          horizontal: layout.s6,
          vertical: layout.s8,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.fluxerWordmarkMonochrome,
              height: 32,
              theme: SvgTheme(currentColor: context.colors.textPrimary),
            ),
            SizedBox(height: layout.s8),
            _buildAuthContent(context, ref, showBrowserLogin: false),
          ],
        ),
      ),
    );
  }
}

class _TiledPatternBackground extends StatefulWidget {
  const _TiledPatternBackground();

  @override
  State<_TiledPatternBackground> createState() =>
      _TiledPatternBackgroundState();
}

class _TiledPatternBackgroundState extends State<_TiledPatternBackground> {
  ui.Image? _tileImage;

  @override
  void initState() {
    super.initState();
    unawaited(_loadTile());
  }

  Future<void> _loadTile() async {
    const loader = SvgAssetLoader(Assets.patternLoginBackground);
    final pictureInfo = await vg.loadPicture(loader, null);
    final image = await pictureInfo.picture.toImage(260, 260);
    pictureInfo.picture.dispose();
    if (mounted) {
      setState(() => _tileImage = image);
    }
  }

  @override
  void dispose() {
    _tileImage?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tileImage == null) {
      return const SizedBox.expand();
    }
    return CustomPaint(
      painter: _TiledPatternPainter(_tileImage!),
      size: Size.infinite,
    );
  }
}

class _TiledPatternPainter extends CustomPainter {
  final ui.Image tile;

  _TiledPatternPainter(this.tile);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ImageShader(
        tile,
        TileMode.repeated,
        TileMode.repeated,
        Matrix4.identity().storage,
      )
      ..colorFilter = const ColorFilter.mode(
        Color(0x0DFFFFFF),
        BlendMode.srcIn,
      );
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(_TiledPatternPainter old) => old.tile != tile;
}
